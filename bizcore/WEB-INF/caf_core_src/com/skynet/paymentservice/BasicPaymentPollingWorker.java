package com.skynet.paymentservice;

import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingDeque;
import java.util.concurrent.atomic.AtomicLong;

import com.skynet.paymentservice.terms.OrderData;
import com.skynet.paymentservice.terms.PaymentInfomation;
import com.skynet.paymentservice.terms.PaymentServiceContext;
import com.terapico.utils.DateTimeUtil;

public class BasicPaymentPollingWorker {
	/**
	 * 是否用 外部定时调用 的方式来轮询需要处理的支付.
	 * 如果用外部调用, 那么是完全另外一套接口, 这里不涉及, 只是简单的关闭此类的一切行为.
	 */
	protected static final boolean POLLING_FROM_EXTERANAL = false;
	public static class Task{
		PaymentServiceContext ctx;
		OrderData order;
		PaymentInfomation payment;
		Date nextCheckTime;
	}
	
	protected static final long checkIntervalInMS = 1 * DateTimeUtil.MINUTE_IN_MS; // 间隔1分钟轮询一次
	
	protected static final int ACTION_SKIP = 0;
	protected static final int ACTION_CHECK = 1;
	protected static final int ACTION_REMOVE = 2;
	protected PaymentServiceContext paymentServiceContext;
	protected static long waitTimeInMS = 0l;
	
	protected PaymentService paymentService;
	protected BlockingQueue<Task> taskQueue;
	protected Thread thread;
	
	public PaymentService getPaymentService() {
		return paymentService;
	}
	public void setPaymentService(PaymentService paymentService) {
		this.paymentService = paymentService;
	}

	public BasicPaymentPollingWorker() {
		if (POLLING_FROM_EXTERANAL) {
			return;
		}
		taskQueue = new LinkedBlockingDeque<>(10000);  // 最多可以有1W个支付待确认. 生意兴隆
		waitTimeInMS = 100L;
		thread = new Thread() {
			public void run() {
				for(;;) {
					doPolling();
				}
			}
		};
	}
	
	
	protected void waitNotify() {
		synchronized (taskQueue) {
			try {
				taskQueue.wait(waitTimeInMS);
			} catch (InterruptedException e) {
			}
		}
	}
	
	public void startToRun() {
		if (POLLING_FROM_EXTERANAL) {
			return;
		}
		thread.start();
	}

	public void addTask(PaymentServiceContext ctx, OrderData order, PaymentInfomation payment, long dealy) {
		if (POLLING_FROM_EXTERANAL) {
			return;
		}
		Task task = new Task();
		task.ctx = ctx;
		task.order = order;
		task.payment = payment;
		task.nextCheckTime = DateTimeUtil.addMS(ctx.now(), dealy);
				
		taskQueue.add(task);
		paymentServiceContext = ctx;
	}

	public void onNewTaskAdded(PaymentServiceContext ctx) {
		if (POLLING_FROM_EXTERANAL) {
			return;
		}
		synchronized (taskQueue) {
			taskQueue.notifyAll();
		}
	}

	protected void doPolling() {
		if (POLLING_FROM_EXTERANAL) {
			return;
		}
		waitNotify();
		
		handleTaskInQueue();
		// 任务队列中的处理完了, 检查数据库里是不是还有遗留的
		Task lastTask = null;
		for(;;) {
			List<Task> taskFromDb = paymentService.getBusinessServiceProxy()
					.getPaymentPollingTasks(paymentServiceContext, 100, lastTask);
			if (taskFromDb == null || taskFromDb.isEmpty()) {
				break; // 数据库里的东西反正都漏掉了, 所以不需要'尽快'处理, 所以不更新 waitTimeInMS
			}
			for (Task task: taskFromDb) {
				lastTask = task;
				if (taskQueue.stream().anyMatch(it->it.order.getId().equals(task.order.getId()))) {
					// 已经存在了 , 跳过
					continue;
				}
				task.nextCheckTime = paymentServiceContext.now();
				taskQueue.add(task); // 新任务加入队列
			}
		}
	}
	private void handleTaskInQueue() {
		if (taskQueue == null || taskQueue.isEmpty()) {
			waitTimeInMS = checkIntervalInMS;
			return;
		}
		
		Iterator<Task> it = taskQueue.iterator();
		AtomicLong nextCheckTs = new AtomicLong(System.currentTimeMillis() + checkIntervalInMS);
		long lastHandledTs = System.currentTimeMillis();
		paymentService.getBusinessServiceProxy().beforeStartToCheckPaymentStatus(this.paymentServiceContext);
		while (it.hasNext()) {
			Task task = it.next();
			int taskAction = checkTaskActionsCanDo(task, nextCheckTs);
			switch (taskAction) {
			case ACTION_SKIP:
				// 什么也不做
				continue;
			case ACTION_REMOVE:
				it.remove();
				continue;
			case ACTION_CHECK:
			default:
				break;
			}
			
			try {
				paymentService.getBusinessServiceProxy().beforeCheckPaymentStatus(task.ctx, task.order,task.payment);
				PaymentRequestResponse result = paymentService.handleCheckPaymentStatusEvent(task.ctx, task.order,
						task.payment);
				lastHandledTs = task.ctx.now().getTime();
				switch (result.getResultCode()) {
				case NOT_START:
				case SURE_SUCCESS:
				case SURE_FAIL:
				case MANUAL_HANDLING:
					// 以上几种结果, 不用再查了
					it.remove();
					continue;
				case WAITING:
				case NO_CHANGE:
				case CONTINUE:
				default:
					// 以上情况, 等待下次查询
					task.nextCheckTime = DateTimeUtil.addMS(task.ctx.now(), checkIntervalInMS);
				}
			} catch (PaymentServiceException e) {
				e.printStackTrace();
				// 轮询的时候出任何异常, 只有忽略了.
			}
		}
		
		long waitTs = nextCheckTs.get() - lastHandledTs;
		waitTimeInMS = Math.max(waitTs, 100L); // 最少休眠100ms
	}
	private int checkTaskActionsCanDo(Task task, AtomicLong nextCheckTs) {
		if (POLLING_FROM_EXTERANAL) {
			return ACTION_REMOVE;
		}
		if (task == null) {
			return ACTION_REMOVE;
		}
		long shouldCheckAtTs = task.nextCheckTime.getTime();
		if (shouldCheckAtTs < task.ctx.now().getTime()) {
			return ACTION_CHECK;
		}
		if (shouldCheckAtTs < nextCheckTs.get()) {
			nextCheckTs.set(shouldCheckAtTs);
		}
		return ACTION_SKIP;
	}

}
