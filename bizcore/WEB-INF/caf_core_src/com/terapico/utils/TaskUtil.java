package com.terapico.utils;

import java.util.HashMap;
import java.util.Map;
import java.util.function.Supplier;

public class TaskUtil {
	protected static Map<String, Boolean> runningFlags = new HashMap<>();

	public static Object runSingletonTask(String taskName, Supplier<?> task) throws Exception {
		if (checkTaskRunning(taskName)) {
			throw new Exception("Task \"" + taskName + "\" is running now");
		}
		try {
			return task.get();
		} finally {
			markTaskFinished(taskName);
		}
	}
	
	public static void runSingletonTask(String taskName, Runnable task) throws Exception {
		if (checkTaskRunning(taskName)) {
			throw new Exception("Task \"" + taskName + "\" is already running");
		}
		try {
			task.run();
		} finally {
			markTaskFinished(taskName);
		}
	}

	protected static void markTaskFinished(String taskName) {
		synchronized(TaskUtil.class) {
			runningFlags.put(taskName, false);
		}
	}
	
	protected synchronized static boolean checkTaskRunning(String taskName) {
		synchronized(TaskUtil.class) {
			Boolean flag = runningFlags.get(taskName);
			runningFlags.put(taskName, true);
			if (flag == null) {
				return false;
			}
			return flag;
		}
	}
	
}
