-- BUILD WITH MODEL TIME 190712T2334





drop database  if exists retailscm;
create database retailscm;
-- alter  database retailscm  character set = utf8mb4  collate = utf8mb4_unicode_ci; -- 支持表情符号
use retailscm;

drop table  if exists retail_store_country_center_data;
create table retail_store_country_center_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(44)                              comment '名称',
	service_number                	varchar(36)                              comment '服务号码',
	founded                       	date                                     comment '成立',
	web_site                      	varchar(128)                             comment '网站',
	address                       	varchar(56)                              comment '地址',
	operated_by                   	varchar(16)                              comment '由',
	legal_representative          	varchar(12)                              comment '法定代表人',
	description                   	varchar(52)                              comment '描述',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "双链小超全国运营中心";

drop table  if exists catalog_data;
create table catalog_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(16)                              comment '名称',
	owner                         	varchar(48)                              comment '业主',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "目录";

drop table  if exists level_one_category_data;
create table level_one_category_data (
	id                            	varchar(48)          not null            comment '序号',
	catalog                       	varchar(48)                              comment '目录',
	name                          	varchar(16)                              comment '名称',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "一级分类";

drop table  if exists level_two_category_data;
create table level_two_category_data (
	id                            	varchar(48)          not null            comment '序号',
	parent_category               	varchar(48)                              comment '父类',
	name                          	varchar(16)                              comment '名称',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "二级分类";

drop table  if exists level_three_category_data;
create table level_three_category_data (
	id                            	varchar(48)          not null            comment '序号',
	parent_category               	varchar(48)                              comment '父类',
	name                          	varchar(16)                              comment '名称',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "三级分类";

drop table  if exists product_data;
create table product_data (
	id                            	varchar(48)          not null            comment 'ID',
	name                          	varchar(12)                              comment '名称',
	parent_category               	varchar(48)                              comment '父类',
	origin                        	varchar(8)                               comment '产地',
	remark                        	varchar(88)                              comment '备注',
	brand                         	varchar(92)                              comment '品牌',
	picture                       	varchar(512) CHARACTER SET ascii COLLATE ascii_general_ci                     comment '图片',
	last_update_time              	datetime                                 comment '最后更新时间',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "产品";

drop table  if exists sku_data;
create table sku_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(24)                              comment '名称',
	size                          	varchar(4)                               comment '大小',
	product                       	varchar(48)                              comment '产品',
	barcode                       	varchar(52)                              comment '条码',
	package_type                  	varchar(16)                              comment '包装类型',
	net_content                   	varchar(92)                              comment '净含量',
	price                         	numeric(8,2)                             comment '价格',
	picture                       	varchar(512) CHARACTER SET ascii COLLATE ascii_general_ci                     comment '图片',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "SKU";

drop table  if exists retail_store_province_center_data;
create table retail_store_province_center_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(44)                              comment '名称',
	founded                       	date                                     comment '成立',
	country                       	varchar(48)                              comment '国',
	last_update_time              	datetime                                 comment '最后更新时间',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "双链小超省中心";

drop table  if exists province_center_department_data;
create table province_center_department_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(20)                              comment '名称',
	founded                       	date                                     comment '成立',
	province_center               	varchar(48)                              comment '省中心',
	manager                       	varchar(12)                              comment '经理',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "省中心";

drop table  if exists province_center_employee_data;
create table province_center_employee_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(12)                              comment '名称',
	mobile                        	varchar(44)                              comment '手机',
	email                         	varchar(256)                             comment '电子邮件',
	founded                       	date                                     comment '成立',
	department                    	varchar(48)                              comment '部门',
	province_center               	varchar(48)                              comment '省中心',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "省中心员工";

drop table  if exists retail_store_city_service_center_data;
create table retail_store_city_service_center_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(36)                              comment '名称',
	founded                       	date                                     comment '成立',
	belongs_to                    	varchar(48)                              comment '属于',
	last_update_time              	datetime                                 comment '最后更新时间',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "双链小超城市服务中心";

drop table  if exists city_partner_data;
create table city_partner_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(12)                              comment '名称',
	mobile                        	varchar(44)                              comment '手机',
	city_service_center           	varchar(48)                              comment '城市服务中心',
	description                   	varchar(64)                              comment '描述',
	last_update_time              	datetime                                 comment '最后更新时间',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "城市合伙人";

drop table  if exists potential_customer_data;
create table potential_customer_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(12)                              comment '名称',
	mobile                        	varchar(44)                              comment '手机',
	city_service_center           	varchar(48)                              comment '城市服务中心',
	city_partner                  	varchar(48)                              comment '城市合伙人',
	description                   	varchar(64)                              comment '描述',
	last_update_time              	datetime                                 comment '最后更新时间',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "潜在的客户";

drop table  if exists potential_customer_contact_person_data;
create table potential_customer_contact_person_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(12)                              comment '名称',
	mobile                        	varchar(44)                              comment '手机',
	potential_customer            	varchar(48)                              comment '潜在的客户',
	description                   	varchar(96)                              comment '描述',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "潜在客户联络人";

drop table  if exists potential_customer_contact_data;
create table potential_customer_contact_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(40)                              comment '名称',
	contact_date                  	date                                     comment '接触日期',
	contact_method                	varchar(16)                              comment '接触法',
	potential_customer            	varchar(48)                              comment '潜在的客户',
	city_partner                  	varchar(48)                              comment '城市合伙人',
	contact_to                    	varchar(48)                              comment '接触',
	description                   	varchar(24)                              comment '描述',
	last_update_time              	datetime                                 comment '最后更新时间',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "潜在客户联系";

drop table  if exists city_event_data;
create table city_event_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(28)                              comment '名称',
	mobile                        	varchar(44)                              comment '手机',
	city_service_center           	varchar(48)                              comment '城市服务中心',
	description                   	varchar(48)                              comment '描述',
	last_update_time              	datetime                                 comment '最后更新时间',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "城市活动";

drop table  if exists event_attendance_data;
create table event_attendance_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(36)                              comment '名称',
	potential_customer            	varchar(48)                              comment '潜在的客户',
	city_event                    	varchar(48)                              comment '城市活动',
	description                   	varchar(36)                              comment '描述',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "活动的参与情况";

drop table  if exists retail_store_data;
create table retail_store_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(24)                              comment '名称',
	telephone                     	varchar(44)                              comment '电话',
	owner                         	varchar(8)                               comment '业主',
	retail_store_country_center   	varchar(48)                              comment '双链小超全国运营中心',
	city_service_center           	varchar(48)                              comment '城市服务中心',
	creation                      	varchar(48)                              comment '创建',
	investment_invitation         	varchar(48)                              comment '招商',
	franchising                   	varchar(48)                              comment '加盟',
	decoration                    	varchar(48)                              comment '装修',
	opening                       	varchar(48)                              comment '开业',
	closing                       	varchar(48)                              comment '关闭',
	founded                       	date                                     comment '成立',
	latitude                      	numeric(9,6)                             comment '纬度',
	longitude                     	numeric(10,6)                            comment '经度',
	description                   	varchar(84)                              comment '描述',
	last_update_time              	datetime                                 comment '最后更新时间',
	current_status                	varchar(72)                              comment '当前状态',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "双链小超";

drop table  if exists retail_store_creation_data;
create table retail_store_creation_data (
	id                            	varchar(48)          not null            comment '序号',
	comment                       	varchar(20)                              comment '评论',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "双链小超的创作";

drop table  if exists retail_store_investment_invitation_data;
create table retail_store_investment_invitation_data (
	id                            	varchar(48)          not null            comment '序号',
	comment                       	varchar(24)                              comment '评论',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "生超招商";

drop table  if exists retail_store_franchising_data;
create table retail_store_franchising_data (
	id                            	varchar(48)          not null            comment '序号',
	comment                       	varchar(16)                              comment '评论',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "生超的特许经营";

drop table  if exists retail_store_decoration_data;
create table retail_store_decoration_data (
	id                            	varchar(48)          not null            comment '序号',
	comment                       	varchar(8)                               comment '评论',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "生超装修";

drop table  if exists retail_store_opening_data;
create table retail_store_opening_data (
	id                            	varchar(48)          not null            comment '序号',
	comment                       	varchar(8)                               comment '评论',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "生超开业";

drop table  if exists retail_store_closing_data;
create table retail_store_closing_data (
	id                            	varchar(48)          not null            comment '序号',
	comment                       	varchar(8)                               comment '评论',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "商店关闭";

drop table  if exists retail_store_member_data;
create table retail_store_member_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(12)                              comment '名称',
	mobile_phone                  	varchar(44)                              comment '移动电话',
	owner                         	varchar(48)                              comment '业主',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "生超会员";

drop table  if exists consumer_order_data;
create table consumer_order_data (
	id                            	varchar(48)          not null            comment '序号',
	title                         	varchar(16)                              comment '头衔',
	consumer                      	varchar(48)                              comment '消费者',
	confirmation                  	varchar(48)                              comment '确认',
	approval                      	varchar(48)                              comment '验收',
	processing                    	varchar(48)                              comment '处理',
	shipment                      	varchar(48)                              comment '装运',
	delivery                      	varchar(48)                              comment '送货',
	store                         	varchar(48)                              comment '商场',
	last_update_time              	datetime                                 comment '最后更新时间',
	current_status                	varchar(36)                              comment '当前状态',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "消费者订单";

drop table  if exists consumer_order_confirmation_data;
create table consumer_order_confirmation_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(12)                              comment '谁',
	confirm_time                  	date                                     comment '确认时间',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "客户订单确认";

drop table  if exists consumer_order_approval_data;
create table consumer_order_approval_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(12)                              comment '谁',
	approve_time                  	date                                     comment '批准时间',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "消费者的订单审批";

drop table  if exists consumer_order_processing_data;
create table consumer_order_processing_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(12)                              comment '谁',
	process_time                  	date                                     comment '过程的时间',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "消费者的订单处理";

drop table  if exists consumer_order_shipment_data;
create table consumer_order_shipment_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(12)                              comment '谁',
	ship_time                     	date                                     comment '船的时间',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "消费者的订单发货";

drop table  if exists consumer_order_delivery_data;
create table consumer_order_delivery_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(12)                              comment '谁',
	delivery_time                 	date                                     comment '交货时间',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "消费者订单交货";

drop table  if exists consumer_order_line_item_data;
create table consumer_order_line_item_data (
	id                            	varchar(48)          not null            comment '序号',
	biz_order                     	varchar(48)                              comment '订单',
	sku_id                        	varchar(12)                              comment '产品ID',
	sku_name                      	varchar(16)                              comment '产品名称',
	price                         	numeric(5,2)                             comment '价格',
	quantity                      	numeric(7,2)                             comment '数量',
	amount                        	numeric(8,2)                             comment '金额',
	last_update_time              	datetime                                 comment '最后更新时间',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "消费者订单行项目";

drop table  if exists consumer_order_shipping_group_data;
create table consumer_order_shipping_group_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(24)                              comment '名称',
	biz_order                     	varchar(48)                              comment '订单',
	amount                        	numeric(7,2)                             comment '金额',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "消费订单送货分组";

drop table  if exists consumer_order_payment_group_data;
create table consumer_order_payment_group_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(16)                              comment '名称',
	biz_order                     	varchar(48)                              comment '订单',
	card_number                   	varchar(68)                              comment '卡号码',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "消费者订单付款组";

drop table  if exists consumer_order_price_adjustment_data;
create table consumer_order_price_adjustment_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(16)                              comment '名称',
	biz_order                     	varchar(48)                              comment '订单',
	amount                        	numeric(7,2)                             comment '金额',
	provider                      	varchar(16)                              comment '供应商',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "消费品价格调整";

drop table  if exists retail_store_member_coupon_data;
create table retail_store_member_coupon_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(12)                              comment '名称',
	owner                         	varchar(48)                              comment '业主',
	number                        	varchar(28)                              comment '数',
	last_update_time              	datetime                                 comment '最后更新时间',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "生超会员优惠券";

drop table  if exists member_wishlist_data;
create table member_wishlist_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(24)                              comment '名称',
	owner                         	varchar(48)                              comment '业主',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "会员收藏";

drop table  if exists member_reward_point_data;
create table member_reward_point_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(24)                              comment '名称',
	point                         	int                                      comment '点',
	owner                         	varchar(48)                              comment '业主',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "会员奖励点";

drop table  if exists member_reward_point_redemption_data;
create table member_reward_point_redemption_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(16)                              comment '名称',
	point                         	int                                      comment '点',
	owner                         	varchar(48)                              comment '业主',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "会员奖励点赎回";

drop table  if exists member_wishlist_product_data;
create table member_wishlist_product_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(20)                              comment '名称',
	owner                         	varchar(48)                              comment '业主',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "会员收藏产品";

drop table  if exists retail_store_member_address_data;
create table retail_store_member_address_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(24)                              comment '名称',
	owner                         	varchar(48)                              comment '业主',
	mobile_phone                  	varchar(44)                              comment '移动电话',
	address                       	varchar(56)                              comment '地址',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "零售店会员地址";

drop table  if exists retail_store_member_gift_card_data;
create table retail_store_member_gift_card_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(12)                              comment '名称',
	owner                         	varchar(48)                              comment '业主',
	number                        	varchar(28)                              comment '数',
	remain                        	numeric(7,2)                             comment '保持',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "零售店会员礼品卡";

drop table  if exists retail_store_member_gift_card_consume_record_data;
create table retail_store_member_gift_card_consume_record_data (
	id                            	varchar(48)          not null            comment '序号',
	occure_time                   	date                                     comment '发生时间',
	owner                         	varchar(48)                              comment '业主',
	biz_order                     	varchar(48)                              comment '订单',
	number                        	varchar(28)                              comment '数',
	amount                        	numeric(6,2)                             comment '金额',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "零售商店会员卡消费记录";

drop table  if exists goods_supplier_data;
create table goods_supplier_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(12)                              comment '名称',
	supply_product                	varchar(16)                              comment '供应产品',
	belong_to                     	varchar(48)                              comment '属于',
	contact_number                	varchar(44)                              comment '联系电话',
	description                   	varchar(72)                              comment '描述',
	last_update_time              	datetime                                 comment '最后更新时间',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "产品供应商";

drop table  if exists supplier_product_data;
create table supplier_product_data (
	id                            	varchar(48)          not null            comment '序号',
	product_name                  	varchar(16)                              comment '品名',
	product_description           	varchar(52)                              comment '产品描述',
	product_unit                  	varchar(8)                               comment '产品单元',
	supplier                      	varchar(48)                              comment '供应商',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "供应商的产品";

drop table  if exists product_supply_duration_data;
create table product_supply_duration_data (
	id                            	varchar(48)          not null            comment '序号',
	quantity                      	int                                      comment '数量',
	duration                      	varchar(8)                               comment '持续时间',
	price                         	numeric(8,2)                             comment '价格',
	product                       	varchar(48)                              comment '产品',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "产品供应时间";

drop table  if exists supply_order_data;
create table supply_order_data (
	id                            	varchar(48)          not null            comment '序号',
	buyer                         	varchar(48)                              comment '买方',
	seller                        	varchar(48)                              comment '卖方',
	title                         	varchar(40)                              comment '头衔',
	total_amount                  	numeric(14,2)                            comment '总金额',
	confirmation                  	varchar(48)                              comment '确认',
	approval                      	varchar(48)                              comment '验收',
	processing                    	varchar(48)                              comment '处理',
	picking                       	varchar(48)                              comment '捡货',
	shipment                      	varchar(48)                              comment '装运',
	delivery                      	varchar(48)                              comment '送货',
	last_update_time              	datetime                                 comment '最后更新时间',
	current_status                	varchar(36)                              comment '当前状态',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "供应订单";

drop table  if exists supply_order_confirmation_data;
create table supply_order_confirmation_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(12)                              comment '谁',
	confirm_time                  	date                                     comment '确认时间',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "供应订单确认";

drop table  if exists supply_order_approval_data;
create table supply_order_approval_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(12)                              comment '谁',
	approve_time                  	date                                     comment '批准时间',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "供应订单审批";

drop table  if exists supply_order_processing_data;
create table supply_order_processing_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(12)                              comment '谁',
	process_time                  	date                                     comment '过程的时间',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "供应订单处理";

drop table  if exists supply_order_picking_data;
create table supply_order_picking_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(12)                              comment '谁',
	process_time                  	date                                     comment '过程的时间',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "供应订单拣货";

drop table  if exists supply_order_shipment_data;
create table supply_order_shipment_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(12)                              comment '谁',
	ship_time                     	date                                     comment '船的时间',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "供应货";

drop table  if exists supply_order_delivery_data;
create table supply_order_delivery_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(12)                              comment '谁',
	delivery_time                 	date                                     comment '交货时间',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "供应订单交货";

drop table  if exists supply_order_line_item_data;
create table supply_order_line_item_data (
	id                            	varchar(48)          not null            comment '序号',
	biz_order                     	varchar(48)                              comment '订单',
	sku_id                        	varchar(12)                              comment '产品ID',
	sku_name                      	varchar(16)                              comment '产品名称',
	amount                        	numeric(5,2)                             comment '金额',
	quantity                      	int                                      comment '数量',
	unit_of_measurement           	varchar(8)                               comment '测量单位',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "供应订单行项目";

drop table  if exists supply_order_shipping_group_data;
create table supply_order_shipping_group_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(40)                              comment '名称',
	biz_order                     	varchar(48)                              comment '订单',
	amount                        	numeric(5,2)                             comment '金额',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "供应订单送货分组";

drop table  if exists supply_order_payment_group_data;
create table supply_order_payment_group_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(16)                              comment '名称',
	biz_order                     	varchar(48)                              comment '订单',
	card_number                   	varchar(68)                              comment '卡号码',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "供应订单付款组";

drop table  if exists retail_store_order_data;
create table retail_store_order_data (
	id                            	varchar(48)          not null            comment '序号',
	buyer                         	varchar(48)                              comment '买方',
	seller                        	varchar(48)                              comment '卖方',
	title                         	varchar(56)                              comment '头衔',
	total_amount                  	numeric(14,2)                            comment '总金额',
	confirmation                  	varchar(48)                              comment '确认',
	approval                      	varchar(48)                              comment '验收',
	processing                    	varchar(48)                              comment '处理',
	picking                       	varchar(48)                              comment '捡货',
	shipment                      	varchar(48)                              comment '装运',
	delivery                      	varchar(48)                              comment '送货',
	last_update_time              	datetime                                 comment '最后更新时间',
	current_status                	varchar(36)                              comment '当前状态',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "生超的订单";

drop table  if exists retail_store_order_confirmation_data;
create table retail_store_order_confirmation_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(12)                              comment '谁',
	confirm_time                  	date                                     comment '确认时间',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "生超订单确认";

drop table  if exists retail_store_order_approval_data;
create table retail_store_order_approval_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(12)                              comment '谁',
	approve_time                  	date                                     comment '批准时间',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "生超订单批准";

drop table  if exists retail_store_order_processing_data;
create table retail_store_order_processing_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(12)                              comment '谁',
	process_time                  	date                                     comment '过程的时间',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "生超订单处理";

drop table  if exists retail_store_order_picking_data;
create table retail_store_order_picking_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(12)                              comment '谁',
	process_time                  	date                                     comment '过程的时间',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "生超订单拣货";

drop table  if exists retail_store_order_shipment_data;
create table retail_store_order_shipment_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(12)                              comment '谁',
	ship_time                     	date                                     comment '船的时间',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "生超订单出货";

drop table  if exists retail_store_order_delivery_data;
create table retail_store_order_delivery_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(12)                              comment '谁',
	delivery_time                 	date                                     comment '交货时间',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "生超订单交付";

drop table  if exists retail_store_order_line_item_data;
create table retail_store_order_line_item_data (
	id                            	varchar(48)          not null            comment '序号',
	biz_order                     	varchar(48)                              comment '订单',
	sku_id                        	varchar(12)                              comment '产品ID',
	sku_name                      	varchar(16)                              comment '产品名称',
	amount                        	numeric(5,2)                             comment '金额',
	quantity                      	int                                      comment '数量',
	unit_of_measurement           	varchar(8)                               comment '测量单位',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "双链小超订单行项目";

drop table  if exists retail_store_order_shipping_group_data;
create table retail_store_order_shipping_group_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(40)                              comment '名称',
	biz_order                     	varchar(48)                              comment '订单',
	amount                        	numeric(5,2)                             comment '金额',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "生超订单送货分组";

drop table  if exists retail_store_order_payment_group_data;
create table retail_store_order_payment_group_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(16)                              comment '名称',
	biz_order                     	varchar(48)                              comment '订单',
	card_number                   	varchar(68)                              comment '卡号码',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "生超订单付款组";

drop table  if exists warehouse_data;
create table warehouse_data (
	id                            	varchar(48)          not null            comment '序号',
	location                      	varchar(44)                              comment '位置',
	contact_number                	varchar(44)                              comment '联系电话',
	total_area                    	varchar(36)                              comment '总面积',
	owner                         	varchar(48)                              comment '业主',
	latitude                      	numeric(9,6)                             comment '纬度',
	longitude                     	numeric(10,6)                            comment '经度',
	last_update_time              	datetime                                 comment '最后更新时间',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "仓库";

drop table  if exists storage_space_data;
create table storage_space_data (
	id                            	varchar(48)          not null            comment '序号',
	location                      	varchar(56)                              comment '位置',
	contact_number                	varchar(44)                              comment '联系电话',
	total_area                    	varchar(28)                              comment '总面积',
	warehouse                     	varchar(48)                              comment '仓库',
	latitude                      	numeric(9,6)                             comment '纬度',
	longitude                     	numeric(10,6)                            comment '经度',
	last_update_time              	datetime                                 comment '最后更新时间',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "存货区";

drop table  if exists smart_pallet_data;
create table smart_pallet_data (
	id                            	varchar(48)          not null            comment '序号',
	location                      	varchar(104)                             comment '位置',
	contact_number                	varchar(44)                              comment '联系电话',
	total_area                    	varchar(28)                              comment '总面积',
	latitude                      	numeric(9,6)                             comment '纬度',
	longitude                     	numeric(10,6)                            comment '经度',
	warehouse                     	varchar(48)                              comment '仓库',
	last_update_time              	datetime                                 comment '最后更新时间',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "智能托盘";

drop table  if exists goods_shelf_data;
create table goods_shelf_data (
	id                            	varchar(48)          not null            comment '序号',
	location                      	varchar(64)                              comment '位置',
	storage_space                 	varchar(48)                              comment '存货区',
	supplier_space                	varchar(48)                              comment '供应商的空间',
	damage_space                  	varchar(48)                              comment '残次货物存放区',
	last_update_time              	datetime                                 comment '最后更新时间',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "货架";

drop table  if exists goods_shelf_stock_count_data;
create table goods_shelf_stock_count_data (
	id                            	varchar(48)          not null            comment '序号',
	title                         	varchar(16)                              comment '头衔',
	count_time                    	date                                     comment '计数时间',
	summary                       	varchar(72)                              comment '概览',
	shelf                         	varchar(48)                              comment '架',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "货架库存盘点";

drop table  if exists stock_count_issue_track_data;
create table stock_count_issue_track_data (
	id                            	varchar(48)          not null            comment '序号',
	title                         	varchar(16)                              comment '头衔',
	count_time                    	date                                     comment '计数时间',
	summary                       	varchar(40)                              comment '概览',
	stock_count                   	varchar(48)                              comment '盘点',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "库存计数问题跟踪";

drop table  if exists goods_allocation_data;
create table goods_allocation_data (
	id                            	varchar(48)          not null            comment '序号',
	location                      	varchar(84)                              comment '位置',
	latitude                      	numeric(9,6)                             comment '纬度',
	longitude                     	numeric(10,6)                            comment '经度',
	goods_shelf                   	varchar(48)                              comment '货架',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "货位";

drop table  if exists goods_data;
create table goods_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(16)                              comment '名称',
	rfid                          	varchar(28)                              comment 'RFID',
	uom                           	varchar(4)                               comment '计量单位',
	max_package                   	int                                      comment '最大包装',
	expire_time                   	date                                     comment '到期时间',
	sku                           	varchar(48)                              comment 'SKU',
	receiving_space               	varchar(48)                              comment '收货区',
	goods_allocation              	varchar(48)                              comment '货位',
	smart_pallet                  	varchar(48)                              comment '智能托盘',
	shipping_space                	varchar(48)                              comment '发货区',
	transport_task                	varchar(48)                              comment '运输任务',
	retail_store                  	varchar(48)                              comment '双链小超',
	biz_order                     	varchar(48)                              comment '订单',
	retail_store_order            	varchar(48)                              comment '生超的订单',
	packaging                     	varchar(48)                              comment '包装',
	current_status                	varchar(24)                              comment '当前状态',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "货物";

drop table  if exists goods_packaging_data;
create table goods_packaging_data (
	id                            	varchar(48)          not null            comment '序号',
	package_name                  	varchar(12)                              comment '包的名字',
	rfid                          	varchar(28)                              comment 'RFID',
	package_time                  	date                                     comment '包的时间',
	description                   	varchar(36)                              comment '描述',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "货物包装";

drop table  if exists goods_movement_data;
create table goods_movement_data (
	id                            	varchar(48)          not null            comment '序号',
	move_time                     	datetime                                 comment '移动时间',
	facility                      	varchar(16)                              comment '设施',
	facility_id                   	varchar(16)                              comment '设备ID',
	from_ip                       	varchar(48)                              comment '从IP',
	user_agent                    	varchar(444)                             comment '用户代理',
	session_id                    	varchar(80)                              comment '会话ID',
	latitude                      	numeric(9,6)                             comment '纬度',
	longitude                     	numeric(10,6)                            comment '经度',
	goods                         	varchar(48)                              comment '货物',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "货物移动";

drop table  if exists supplier_space_data;
create table supplier_space_data (
	id                            	varchar(48)          not null            comment '序号',
	location                      	varchar(76)                              comment '位置',
	contact_number                	varchar(44)                              comment '联系电话',
	total_area                    	varchar(28)                              comment '总面积',
	warehouse                     	varchar(48)                              comment '仓库',
	latitude                      	numeric(9,6)                             comment '纬度',
	longitude                     	numeric(10,6)                            comment '经度',
	last_update_time              	datetime                                 comment '最后更新时间',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "供应商的空间";

drop table  if exists receiving_space_data;
create table receiving_space_data (
	id                            	varchar(48)          not null            comment '序号',
	location                      	varchar(64)                              comment '位置',
	contact_number                	varchar(44)                              comment '联系电话',
	description                   	varchar(52)                              comment '描述',
	total_area                    	varchar(28)                              comment '总面积',
	warehouse                     	varchar(48)                              comment '仓库',
	latitude                      	numeric(9,6)                             comment '纬度',
	longitude                     	numeric(10,6)                            comment '经度',
	last_update_time              	datetime                                 comment '最后更新时间',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "收货区";

drop table  if exists shipping_space_data;
create table shipping_space_data (
	id                            	varchar(48)          not null            comment '序号',
	location                      	varchar(56)                              comment '位置',
	contact_number                	varchar(44)                              comment '联系电话',
	total_area                    	varchar(28)                              comment '总面积',
	warehouse                     	varchar(48)                              comment '仓库',
	latitude                      	numeric(9,6)                             comment '纬度',
	longitude                     	numeric(10,6)                            comment '经度',
	description                   	varchar(52)                              comment '描述',
	last_update_time              	datetime                                 comment '最后更新时间',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "发货区";

drop table  if exists damage_space_data;
create table damage_space_data (
	id                            	varchar(48)          not null            comment '序号',
	location                      	varchar(80)                              comment '位置',
	contact_number                	varchar(44)                              comment '联系电话',
	total_area                    	varchar(28)                              comment '总面积',
	latitude                      	numeric(9,6)                             comment '纬度',
	longitude                     	numeric(10,6)                            comment '经度',
	warehouse                     	varchar(48)                              comment '仓库',
	last_update_time              	datetime                                 comment '最后更新时间',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "残次货物存放区";

drop table  if exists warehouse_asset_data;
create table warehouse_asset_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(20)                              comment '名称',
	position                      	varchar(40)                              comment '位置',
	owner                         	varchar(48)                              comment '业主',
	last_update_time              	datetime                                 comment '最后更新时间',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "仓库资产";

drop table  if exists transport_fleet_data;
create table transport_fleet_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(28)                              comment '名称',
	contact_number                	varchar(44)                              comment '联系电话',
	owner                         	varchar(48)                              comment '业主',
	last_update_time              	datetime                                 comment '最后更新时间',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "运输车队";

drop table  if exists transport_truck_data;
create table transport_truck_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(16)                              comment '名称',
	plate_number                  	varchar(16)                              comment '车牌号码',
	contact_number                	varchar(44)                              comment '联系电话',
	vehicle_license_number        	varchar(24)                              comment '汽车牌照号码',
	engine_number                 	varchar(28)                              comment '发动机号',
	make_date                     	date                                     comment '制造日期',
	mileage                       	varchar(24)                              comment '里程',
	body_color                    	varchar(8)                               comment '车身颜色',
	owner                         	varchar(48)                              comment '业主',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "运输车";

drop table  if exists truck_driver_data;
create table truck_driver_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(24)                              comment '名称',
	driver_license_number         	varchar(44)                              comment '驾驶执照号码',
	contact_number                	varchar(44)                              comment '联系电话',
	belongs_to                    	varchar(48)                              comment '属于',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "卡车司机";

drop table  if exists transport_task_data;
create table transport_task_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(16)                              comment '名称',
	start                         	varchar(20)                              comment '开始',
	begin_time                    	date                                     comment '开始时间',
	end                           	varchar(48)                              comment '结束',
	driver                        	varchar(48)                              comment '司机',
	truck                         	varchar(48)                              comment '卡车',
	belongs_to                    	varchar(48)                              comment '属于',
	latitude                      	numeric(9,6)                             comment '纬度',
	longitude                     	numeric(10,6)                            comment '经度',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "运输任务";

drop table  if exists transport_task_track_data;
create table transport_task_track_data (
	id                            	varchar(48)          not null            comment '序号',
	track_time                    	date                                     comment '跟踪时间',
	latitude                      	numeric(9,6)                             comment '纬度',
	longitude                     	numeric(10,6)                            comment '经度',
	movement                      	varchar(48)                              comment '运动',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "运输任务跟踪";

drop table  if exists account_set_data;
create table account_set_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(24)                              comment '名称',
	year_set                      	varchar(20)                              comment '年组',
	effective_date                	date                                     comment '生效日期',
	accounting_system             	varchar(28)                              comment '会计制度',
	domestic_currency_code        	varchar(12)                              comment '本币代码',
	domestic_currency_name        	varchar(12)                              comment '本币名称',
	opening_bank                  	varchar(16)                              comment '开户银行',
	account_number                	varchar(56)                              comment '帐户号码',
	country_center                	varchar(48)                              comment '全国运营中心',
	retail_store                  	varchar(48)                              comment '双链小超',
	goods_supplier                	varchar(48)                              comment '产品供应商',
	last_update_time              	datetime                                 comment '最后更新时间',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "账套";

drop table  if exists accounting_subject_data;
create table accounting_subject_data (
	id                            	varchar(48)          not null            comment '序号',
	accounting_subject_code       	varchar(24)                              comment '会计科目代码',
	accounting_subject_name       	varchar(16)                              comment '会计科目名称',
	accounting_subject_class_code 	int                                      comment '会计科目类别代码',
	accounting_subject_class_name 	varchar(24)                              comment '会计科目类别名称',
	account_set                   	varchar(48)                              comment '账套',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "会计科目";

drop table  if exists accounting_period_data;
create table accounting_period_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(32)                              comment '名称',
	start_date                    	date                                     comment '开始日期',
	end_date                      	date                                     comment '结束日期',
	account_set                   	varchar(48)                              comment '账套',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "会计期间";

drop table  if exists accounting_document_type_data;
create table accounting_document_type_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(16)                              comment '名称',
	description                   	varchar(280)                             comment '描述',
	accounting_period             	varchar(48)                              comment '会计期间',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "会计凭证类型";

drop table  if exists accounting_document_data;
create table accounting_document_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(16)                              comment '名称',
	accounting_document_date      	date                                     comment '会计凭证日期',
	accounting_period             	varchar(48)                              comment '会计期间',
	document_type                 	varchar(48)                              comment '文档类型',
	creation                      	varchar(48)                              comment '创建',
	confirmation                  	varchar(48)                              comment '确认',
	auditing                      	varchar(48)                              comment '审计',
	posting                       	varchar(48)                              comment '过账',
	current_status                	varchar(36)                              comment '当前状态',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "会计凭证";

drop table  if exists accounting_document_creation_data;
create table accounting_document_creation_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(16)                              comment '谁',
	comments                      	varchar(16)                              comment '评论',
	make_date                     	date                                     comment '制造日期',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "会计文件的创建";

drop table  if exists accounting_document_confirmation_data;
create table accounting_document_confirmation_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(16)                              comment '谁',
	comments                      	varchar(16)                              comment '评论',
	make_date                     	date                                     comment '制造日期',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "会计的确认文件";

drop table  if exists accounting_document_auditing_data;
create table accounting_document_auditing_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(16)                              comment '谁',
	comments                      	varchar(60)                              comment '评论',
	make_date                     	date                                     comment '制造日期',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "会计凭证的审核";

drop table  if exists accounting_document_posting_data;
create table accounting_document_posting_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(16)                              comment '谁',
	comments                      	varchar(60)                              comment '评论',
	make_date                     	date                                     comment '制造日期',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "会计凭证过帐";

drop table  if exists original_voucher_data;
create table original_voucher_data (
	id                            	varchar(48)          not null            comment '序号',
	title                         	varchar(28)                              comment '头衔',
	made_by                       	varchar(12)                              comment '由',
	received_by                   	varchar(12)                              comment '受',
	voucher_type                  	varchar(16)                              comment '凭证类型',
	voucher_image                 	varchar(512) CHARACTER SET ascii COLLATE ascii_general_ci                     comment '凭证图像',
	belongs_to                    	varchar(48)                              comment '属于',
	creation                      	varchar(48)                              comment '创建',
	confirmation                  	varchar(48)                              comment '确认',
	auditing                      	varchar(48)                              comment '审计',
	current_status                	varchar(36)                              comment '当前状态',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "原始凭证";

drop table  if exists original_voucher_creation_data;
create table original_voucher_creation_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(16)                              comment '谁',
	comments                      	varchar(16)                              comment '评论',
	make_date                     	date                                     comment '制造日期',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "原始凭证制作";

drop table  if exists original_voucher_confirmation_data;
create table original_voucher_confirmation_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(16)                              comment '谁',
	comments                      	varchar(16)                              comment '评论',
	make_date                     	date                                     comment '制造日期',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "原始凭证的确认";

drop table  if exists original_voucher_auditing_data;
create table original_voucher_auditing_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(16)                              comment '谁',
	comments                      	varchar(60)                              comment '评论',
	make_date                     	date                                     comment '制造日期',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "原始凭证的审核";

drop table  if exists accounting_document_line_data;
create table accounting_document_line_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(16)                              comment '名称',
	code                          	varchar(24)                              comment '代码',
	direct                        	varchar(4)                               comment '直接',
	amount                        	numeric(10,2)                            comment '金额',
	belongs_to                    	varchar(48)                              comment '属于',
	accounting_subject            	varchar(48)                              comment '会计科目',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "会计凭证行";

drop table  if exists level_one_department_data;
create table level_one_department_data (
	id                            	varchar(48)          not null            comment '序号',
	belongs_to                    	varchar(48)                              comment '属于',
	name                          	varchar(20)                              comment '名称',
	description                   	varchar(72)                              comment '描述',
	manager                       	varchar(12)                              comment '经理',
	founded                       	date                                     comment '成立',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "一级部门";

drop table  if exists level_two_department_data;
create table level_two_department_data (
	id                            	varchar(48)          not null            comment '序号',
	belongs_to                    	varchar(48)                              comment '属于',
	name                          	varchar(40)                              comment '名称',
	description                   	varchar(72)                              comment '描述',
	founded                       	date                                     comment '成立',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "二级部门";

drop table  if exists level_three_department_data;
create table level_three_department_data (
	id                            	varchar(48)          not null            comment '序号',
	belongs_to                    	varchar(48)                              comment '属于',
	name                          	varchar(52)                              comment '名称',
	description                   	varchar(72)                              comment '描述',
	founded                       	date                                     comment '成立',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "三级部门";

drop table  if exists skill_type_data;
create table skill_type_data (
	id                            	varchar(48)          not null            comment '序号',
	code                          	varchar(20)                              comment '代码',
	company                       	varchar(48)                              comment '公司',
	description                   	varchar(24)                              comment '描述',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "技能类型";

drop table  if exists responsibility_type_data;
create table responsibility_type_data (
	id                            	varchar(48)          not null            comment '序号',
	code                          	varchar(20)                              comment '代码',
	company                       	varchar(48)                              comment '公司',
	base_description              	varchar(16)                              comment '基本描述',
	detail_description            	varchar(116)                             comment '详细描述',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "责任类型";

drop table  if exists termination_reason_data;
create table termination_reason_data (
	id                            	varchar(48)          not null            comment '序号',
	code                          	varchar(28)                              comment '代码',
	company                       	varchar(48)                              comment '公司',
	description                   	varchar(36)                              comment '描述',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "雇佣终止的原因";

drop table  if exists termination_type_data;
create table termination_type_data (
	id                            	varchar(48)          not null            comment '序号',
	code                          	varchar(28)                              comment '代码',
	company                       	varchar(48)                              comment '公司',
	base_description              	varchar(16)                              comment '基本描述',
	detail_description            	varchar(248)                             comment '详细描述',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "雇佣终止类型";

drop table  if exists occupation_type_data;
create table occupation_type_data (
	id                            	varchar(48)          not null            comment '序号',
	code                          	varchar(24)                              comment '代码',
	company                       	varchar(48)                              comment '公司',
	description                   	varchar(28)                              comment '描述',
	detail_description            	varchar(244)                             comment '详细描述',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "职位类型";

drop table  if exists leave_type_data;
create table leave_type_data (
	id                            	varchar(48)          not null            comment '序号',
	code                          	varchar(24)                              comment '代码',
	company                       	varchar(48)                              comment '公司',
	description                   	varchar(16)                              comment '描述',
	detail_description            	varchar(244)                             comment '详细描述',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "请假类型";

drop table  if exists salary_grade_data;
create table salary_grade_data (
	id                            	varchar(48)          not null            comment '序号',
	code                          	varchar(24)                              comment '代码',
	company                       	varchar(48)                              comment '公司',
	name                          	varchar(16)                              comment '名称',
	detail_description            	varchar(244)                             comment '详细描述',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "工资等级";

drop table  if exists interview_type_data;
create table interview_type_data (
	id                            	varchar(48)          not null            comment '序号',
	code                          	varchar(32)                              comment '代码',
	company                       	varchar(48)                              comment '公司',
	description                   	varchar(24)                              comment '描述',
	detail_description            	varchar(244)                             comment '详细描述',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "面试类型";

drop table  if exists training_course_type_data;
create table training_course_type_data (
	id                            	varchar(48)          not null            comment '序号',
	code                          	varchar(16)                              comment '代码',
	company                       	varchar(48)                              comment '公司',
	name                          	varchar(16)                              comment '名称',
	description                   	varchar(64)                              comment '描述',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "培训课程类型";

drop table  if exists public_holiday_data;
create table public_holiday_data (
	id                            	varchar(48)          not null            comment '序号',
	code                          	varchar(16)                              comment '代码',
	company                       	varchar(48)                              comment '公司',
	name                          	varchar(12)                              comment '名称',
	description                   	varchar(40)                              comment '描述',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "公共假日";

drop table  if exists termination_data;
create table termination_data (
	id                            	varchar(48)          not null            comment '序号',
	reason                        	varchar(48)                              comment '原因',
	type                          	varchar(48)                              comment '类型',
	comment                       	varchar(16)                              comment '评论',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "雇佣终止";

drop table  if exists view_data;
create table view_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(12)                              comment '谁',
	assessment                    	varchar(40)                              comment '评估',
	interview_time                	date                                     comment '面试时间',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "观";

drop table  if exists employee_data;
create table employee_data (
	id                            	varchar(48)          not null            comment '序号',
	company                       	varchar(48)                              comment '公司',
	title                         	varchar(12)                              comment '头衔',
	department                    	varchar(48)                              comment '部门',
	family_name                   	varchar(4)                               comment '姓',
	given_name                    	varchar(8)                               comment '名',
	email                         	varchar(256)                             comment '电子邮件',
	city                          	varchar(8)                               comment '城市',
	address                       	varchar(28)                              comment '地址',
	cell_phone                    	varchar(44)                              comment '手机',
	occupation                    	varchar(48)                              comment '职业',
	responsible_for               	varchar(48)                              comment '负责',
	current_salary_grade          	varchar(48)                              comment '目前工资等级',
	salary_account                	varchar(60)                              comment '工资账户',
	job_application               	varchar(48)                              comment '工作申请',
	profession_interview          	varchar(48)                              comment '专业面试',
	hr_interview                  	varchar(48)                              comment '人力资源部面试',
	offer_approval                	varchar(48)                              comment '审批工作要约',
	offer_acceptance              	varchar(48)                              comment '接受工作要约',
	employee_boarding             	varchar(48)                              comment '员工入职',
	termination                   	varchar(48)                              comment '雇佣终止',
	last_update_time              	datetime                                 comment '最后更新时间',
	current_status                	varchar(88)                              comment '当前状态',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "员工";

drop table  if exists job_application_data;
create table job_application_data (
	id                            	varchar(48)          not null            comment '序号',
	application_time              	date                                     comment '申请时间',
	who                           	varchar(20)                              comment '谁',
	comments                      	varchar(124)                             comment '评论',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "工作申请";

drop table  if exists profession_interview_data;
create table profession_interview_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(12)                              comment '谁',
	interview_time                	date                                     comment '面试时间',
	comments                      	varchar(60)                              comment '评论',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "专业面试";

drop table  if exists hr_interview_data;
create table hr_interview_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(20)                              comment '谁',
	interview_time                	date                                     comment '面试时间',
	comments                      	varchar(52)                              comment '评论',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "人力资源部面试";

drop table  if exists offer_approval_data;
create table offer_approval_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(12)                              comment '谁',
	approve_time                  	date                                     comment '批准时间',
	comments                      	varchar(40)                              comment '评论',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "审批工作要约";

drop table  if exists offer_acceptance_data;
create table offer_acceptance_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(12)                              comment '谁',
	accept_time                   	date                                     comment '接受时间',
	comments                      	varchar(40)                              comment '评论',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "接受工作要约";

drop table  if exists employee_boarding_data;
create table employee_boarding_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(20)                              comment '谁',
	employ_time                   	date                                     comment '使用时间',
	comments                      	varchar(44)                              comment '评论',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "员工入职";

drop table  if exists instructor_data;
create table instructor_data (
	id                            	varchar(48)          not null            comment '序号',
	title                         	varchar(16)                              comment '头衔',
	family_name                   	varchar(4)                               comment '姓',
	given_name                    	varchar(8)                               comment '名',
	cell_phone                    	varchar(44)                              comment '手机',
	email                         	varchar(256)                             comment '电子邮件',
	company                       	varchar(48)                              comment '公司',
	introduction                  	varchar(60)                              comment '介绍',
	last_update_time              	datetime                                 comment '最后更新时间',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "讲师";

drop table  if exists company_training_data;
create table company_training_data (
	id                            	varchar(48)          not null            comment '序号',
	title                         	varchar(16)                              comment '头衔',
	company                       	varchar(48)                              comment '公司',
	instructor                    	varchar(48)                              comment '讲师',
	training_course_type          	varchar(48)                              comment '培训课程类型',
	time_start                    	date                                     comment '时间开始',
	duration_hours                	int                                      comment '持续时间',
	last_update_time              	datetime                                 comment '最后更新时间',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "公司培训";

drop table  if exists scoring_data;
create table scoring_data (
	id                            	varchar(48)          not null            comment '序号',
	scored_by                     	varchar(12)                              comment '由谁打分',
	score                         	int                                      comment '分数',
	comment                       	varchar(36)                              comment '评论',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "评分";

drop table  if exists employee_company_training_data;
create table employee_company_training_data (
	id                            	varchar(48)          not null            comment '序号',
	employee                      	varchar(48)                              comment '员工',
	training                      	varchar(48)                              comment '训练',
	scoring                       	varchar(48)                              comment '评分',
	current_status                	varchar(24)                              comment '当前状态',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "员工参与的公司培训";

drop table  if exists employee_skill_data;
create table employee_skill_data (
	id                            	varchar(48)          not null            comment '序号',
	employee                      	varchar(48)                              comment '员工',
	skill_type                    	varchar(48)                              comment '技能类型',
	description                   	varchar(28)                              comment '描述',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "员工技能";

drop table  if exists employee_performance_data;
create table employee_performance_data (
	id                            	varchar(48)          not null            comment '序号',
	employee                      	varchar(48)                              comment '员工',
	performance_comment           	varchar(28)                              comment '绩效评价',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "员工绩效";

drop table  if exists employee_work_experience_data;
create table employee_work_experience_data (
	id                            	varchar(48)          not null            comment '序号',
	employee                      	varchar(48)                              comment '员工',
	start                         	date                                     comment '开始',
	end                           	date                                     comment '结束',
	company                       	varchar(32)                              comment '公司',
	description                   	varchar(84)                              comment '描述',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "员工工作经验";

drop table  if exists employee_leave_data;
create table employee_leave_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(48)                              comment '谁',
	type                          	varchar(48)                              comment '类型',
	leave_duration_hour           	int                                      comment '请假时长',
	remark                        	varchar(44)                              comment '备注',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "请假记录";

drop table  if exists employee_interview_data;
create table employee_interview_data (
	id                            	varchar(48)          not null            comment '序号',
	employee                      	varchar(48)                              comment '员工',
	interview_type                	varchar(48)                              comment '面试类型',
	remark                        	varchar(40)                              comment '备注',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "员工面试";

drop table  if exists employee_attendance_data;
create table employee_attendance_data (
	id                            	varchar(48)          not null            comment '序号',
	employee                      	varchar(48)                              comment '员工',
	enter_time                    	date                                     comment '进入时间',
	leave_time                    	date                                     comment '离开的时候',
	duration_hours                	int                                      comment '持续时间',
	remark                        	varchar(28)                              comment '备注',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "员工考勤";

drop table  if exists employee_qualifier_data;
create table employee_qualifier_data (
	id                            	varchar(48)          not null            comment '序号',
	employee                      	varchar(48)                              comment '员工',
	qualified_time                	date                                     comment '合格的时间',
	type                          	varchar(20)                              comment '类型',
	level                         	varchar(8)                               comment '水平',
	remark                        	varchar(36)                              comment '备注',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "员工资质";

drop table  if exists employee_education_data;
create table employee_education_data (
	id                            	varchar(48)          not null            comment '序号',
	employee                      	varchar(48)                              comment '员工',
	complete_time                 	date                                     comment '完成时间',
	type                          	varchar(16)                              comment '类型',
	remark                        	varchar(36)                              comment '备注',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "员工教育";

drop table  if exists employee_award_data;
create table employee_award_data (
	id                            	varchar(48)          not null            comment '序号',
	employee                      	varchar(48)                              comment '员工',
	complete_time                 	date                                     comment '完成时间',
	type                          	varchar(20)                              comment '类型',
	remark                        	varchar(36)                              comment '备注',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "员工嘉奖";

drop table  if exists employee_salary_sheet_data;
create table employee_salary_sheet_data (
	id                            	varchar(48)          not null            comment '序号',
	employee                      	varchar(48)                              comment '员工',
	current_salary_grade          	varchar(48)                              comment '目前工资等级',
	base_salary                   	numeric(8,2)                             comment '基本工资',
	bonus                         	numeric(8,2)                             comment '奖金',
	reward                        	numeric(8,2)                             comment '奖励',
	personal_tax                  	numeric(7,2)                             comment '个人所得税',
	social_security               	numeric(8,2)                             comment '社会保险',
	housing_found                 	numeric(8,2)                             comment '住房公积金',
	job_insurance                 	numeric(5,2)                             comment '失业保险',
	paying_off                    	varchar(48)                              comment '工资支付',
	current_status                	varchar(32)                              comment '当前状态',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "工资单";

drop table  if exists paying_off_data;
create table paying_off_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(8)                               comment '谁',
	paid_for                      	varchar(48)                              comment '支付',
	paid_time                     	date                                     comment '支付时间',
	amount                        	numeric(8,2)                             comment '金额',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "工资支付";

drop table  if exists user_domain_data;
create table user_domain_data (
	id                            	varchar(48)          not null            comment 'ID',
	name                          	varchar(16)                              comment '名称',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "用户域";

drop table  if exists user_white_list_data;
create table user_white_list_data (
	id                            	varchar(48)          not null            comment 'ID',
	user_identity                 	varchar(40)                              comment '用户身份',
	user_special_functions        	varchar(200)                             comment '用户特殊功能',
	domain                        	varchar(48)                              comment '域',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "用户白名单";

drop table  if exists sec_user_data;
create table sec_user_data (
	id                            	varchar(48)          not null            comment 'ID',
	login                         	varchar(20)                              comment '登录',
	mobile                        	varchar(11)                              comment '手机号码',
	email                         	varchar(76)                              comment '电子邮件',
	pwd                           	varchar(64)                              comment '密码',
	weixin_openid                 	varchar(128)                             comment '微信openid',
	weixin_appid                  	varchar(128)                             comment '微信Appid',
	access_token                  	varchar(128)                             comment '访问令牌',
	verification_code             	int                                      comment '验证码',
	verification_code_expire      	datetime                                 comment '验证码过期',
	last_login_time               	datetime                                 comment '最后登录时间',
	domain                        	varchar(48)                              comment '域',
	blocking                      	varchar(48)                              comment '屏蔽',
	current_status                	varchar(28)                              comment '当前状态',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "安全用户";

drop table  if exists sec_user_blocking_data;
create table sec_user_blocking_data (
	id                            	varchar(48)          not null            comment 'ID',
	who                           	varchar(52)                              comment '谁',
	block_time                    	datetime                                 comment '块时间',
	comments                      	varchar(96)                              comment '评论',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "用户屏蔽";

drop table  if exists user_app_data;
create table user_app_data (
	id                            	varchar(48)          not null            comment 'ID',
	title                         	varchar(300)                             comment '标题',
	sec_user                      	varchar(48)                              comment '安全用户',
	app_icon                      	varchar(36)                              comment '应用程序图标',
	full_access                   	tinyint                                  comment '完全访问',
	permission                    	varchar(16)                              comment '许可',
	object_type                   	varchar(100)                             comment '访问对象类型',
	object_id                     	varchar(40)                              comment '对象ID',
	location                      	varchar(48)                              comment '位置',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "用户应用程序";

drop table  if exists quick_link_data;
create table quick_link_data (
	id                            	varchar(48)          not null            comment 'ID',
	name                          	varchar(200)                             comment '名称',
	icon                          	varchar(200)                             comment '图标',
	image_path                    	varchar(512) CHARACTER SET ascii COLLATE ascii_general_ci                     comment '图片路径',
	link_target                   	varchar(200)                             comment '链接的目标',
	create_time                   	datetime                                 comment '创建时间',
	app                           	varchar(48)                              comment '应用程序',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "快速链接";

drop table  if exists list_access_data;
create table list_access_data (
	id                            	varchar(48)          not null            comment 'ID',
	name                          	varchar(200)                             comment '名称',
	internal_name                 	varchar(200)                             comment '内部名称',
	read_permission               	tinyint                                  comment '读权限',
	create_permission             	tinyint                                  comment '创建权限',
	delete_permission             	tinyint                                  comment '删除权限',
	update_permission             	tinyint                                  comment '更新权限',
	execution_permission          	tinyint                                  comment '执行权限',
	app                           	varchar(48)                              comment '应用程序',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "访问列表";

drop table  if exists object_access_data;
create table object_access_data (
	id                            	varchar(48)          not null            comment 'ID',
	name                          	varchar(28)                              comment '名称',
	object_type                   	varchar(112)                             comment '访问对象类型',
	list1                         	varchar(80)                              comment '列表1',
	list2                         	varchar(80)                              comment '列表2',
	list3                         	varchar(80)                              comment '列表3',
	list4                         	varchar(80)                              comment '列表4',
	list5                         	varchar(80)                              comment '列表5',
	list6                         	varchar(80)                              comment '列表6',
	list7                         	varchar(80)                              comment '列表7',
	list8                         	varchar(80)                              comment '列表8',
	list9                         	varchar(80)                              comment '列表9',
	app                           	varchar(48)                              comment '应用程序',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "对象访问";

drop table  if exists login_history_data;
create table login_history_data (
	id                            	varchar(48)          not null            comment 'ID',
	login_time                    	datetime                                 comment '登录时间',
	from_ip                       	varchar(44)                              comment '来自IP',
	description                   	varchar(16)                              comment '描述',
	sec_user                      	varchar(48)                              comment '安全用户',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "登录历史";

drop table  if exists generic_form_data;
create table generic_form_data (
	id                            	varchar(48)          not null            comment 'ID',
	title                         	varchar(20)                              comment '标题',
	description                   	varchar(48)                              comment '描述',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "通用的形式";

drop table  if exists form_message_data;
create table form_message_data (
	id                            	varchar(48)          not null            comment 'ID',
	title                         	varchar(24)                              comment '标题',
	form                          	varchar(48)                              comment '形式',
	level                         	varchar(28)                              comment '水平',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "表单信息";

drop table  if exists form_field_message_data;
create table form_field_message_data (
	id                            	varchar(48)          not null            comment 'ID',
	title                         	varchar(16)                              comment '标题',
	parameter_name                	varchar(16)                              comment '参数名称',
	form                          	varchar(48)                              comment '形式',
	level                         	varchar(28)                              comment '水平',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "表单字段的信息";

drop table  if exists form_field_data;
create table form_field_data (
	id                            	varchar(48)          not null            comment 'ID',
	label                         	varchar(12)                              comment '标签',
	locale_key                    	varchar(44)                              comment '语言环境的关键',
	parameter_name                	varchar(16)                              comment '参数名称',
	type                          	varchar(36)                              comment '类型',
	form                          	varchar(48)                              comment '形式',
	placeholder                   	varchar(48)                              comment '占位符',
	default_value                 	varchar(12)                              comment '默认值',
	description                   	varchar(48)                              comment '描述',
	field_group                   	varchar(16)                              comment '字段组',
	minimum_value                 	varchar(60)                              comment '最小值',
	maximum_value                 	varchar(72)                              comment '最大值',
	required                      	tinyint                                  comment '要求',
	disabled                      	tinyint                                  comment '禁用',
	custom_rendering              	tinyint                                  comment '自定义渲染',
	candidate_values              	varchar(12)                              comment '候选人的价值观',
	suggest_values                	varchar(12)                              comment '建议值',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "表单字段";

drop table  if exists form_action_data;
create table form_action_data (
	id                            	varchar(48)          not null            comment 'ID',
	label                         	varchar(8)                               comment '标签',
	locale_key                    	varchar(16)                              comment '语言环境的关键',
	action_key                    	varchar(24)                              comment '行动的关键',
	level                         	varchar(28)                              comment '水平',
	url                           	varchar(168)                             comment 'url',
	form                          	varchar(48)                              comment '形式',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "表单动作";

drop table  if exists candidate_container_data;
create table candidate_container_data (
	id                            	varchar(48)          not null            comment 'ID',
	name                          	varchar(28)                              comment '名称',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "候选人容器";

drop table  if exists candidate_element_data;
create table candidate_element_data (
	id                            	varchar(48)          not null            comment 'ID',
	name                          	varchar(200)                             comment '名称',
	type                          	varchar(200)                             comment '类型',
	image                         	varchar(512) CHARACTER SET ascii COLLATE ascii_general_ci                     comment '图片',
	container                     	varchar(48)                              comment '容器',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "候选人元素";




insert into retail_store_country_center_data values
	('RSCC000001','双链小超中国国运营中心','4000-800-','2016-09-17','https://www.doublechaintech.com/','四川省成都市天府新区双链大厦','双链集团','张喜来','中国中心正式成立，恭喜恭喜','1');

insert into catalog_data values
	('C000001','水果蔬菜','RSCC000001','1'),
	('C000002','肉禽蛋奶','RSCC000001','1');

insert into level_one_category_data values
	('LOC000001','C000001','水果蔬菜','1'),
	('LOC000002','C000001','肉禽蛋奶','1'),
	('LOC000003','C000002','冷热速食','1'),
	('LOC000004','C000002','休闲食品','1');

insert into level_two_category_data values
	('LTC000001','LOC000001','水果蔬菜','1'),
	('LTC000002','LOC000001','肉禽蛋奶','1'),
	('LTC000003','LOC000002','冷热速食','1'),
	('LTC000004','LOC000002','休闲食品','1'),
	('LTC000005','LOC000003','酒水饮料','1'),
	('LTC000006','LOC000003','粮油调味','1'),
	('LTC000007','LOC000004','清洁日化','1'),
	('LTC000008','LOC000004','家居用品','1');

insert into level_three_category_data values
	('LTC000001','LTC000001','水果蔬菜','1'),
	('LTC000002','LTC000001','肉禽蛋奶','1'),
	('LTC000003','LTC000002','冷热速食','1'),
	('LTC000004','LTC000002','休闲食品','1'),
	('LTC000005','LTC000003','酒水饮料','1'),
	('LTC000006','LTC000003','粮油调味','1'),
	('LTC000007','LTC000004','清洁日化','1'),
	('LTC000008','LTC000004','家居用品','1'),
	('LTC000009','LTC000005','鲜花蛋糕','1'),
	('LTC000010','LTC000005','医药健康','1'),
	('LTC000011','LTC000006','水果蔬菜','1'),
	('LTC000012','LTC000006','肉禽蛋奶','1'),
	('LTC000013','LTC000007','冷热速食','1'),
	('LTC000014','LTC000007','休闲食品','1'),
	('LTC000015','LTC000008','酒水饮料','1'),
	('LTC000016','LTC000008','粮油调味','1');

insert into product_data values
	('P000001','啤酒','LTC000001','四川','可口可乐，销售百年的糖水，获得了全世界额青睐','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-08-31 19:32:45','1'),
	('P000002','可乐','LTC000001','广东','可口可乐，销售百年的糖水，获得了全世界额青睐0002','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0002','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-09-05 15:07:55','1'),
	('P000003','久久鸭','LTC000002','江苏','可口可乐，销售百年的糖水，获得了全世界额青睐0003','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0003','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-09-06 23:59:30','1'),
	('P000004','啤酒','LTC000002','安徽','可口可乐，销售百年的糖水，获得了全世界额青睐0004','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0004','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-08-27 22:13:00','1'),
	('P000005','可乐','LTC000003','日本','可口可乐，销售百年的糖水，获得了全世界额青睐0005','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0005','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-08-31 17:56:10','1'),
	('P000006','久久鸭','LTC000003','法国','可口可乐，销售百年的糖水，获得了全世界额青睐0006','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0006','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-08-29 10:47:09','1'),
	('P000007','啤酒','LTC000004','四川','可口可乐，销售百年的糖水，获得了全世界额青睐0007','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0007','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-09-13 01:51:07','1'),
	('P000008','可乐','LTC000004','广东','可口可乐，销售百年的糖水，获得了全世界额青睐0008','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0008','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-09-01 11:24:55','1'),
	('P000009','久久鸭','LTC000005','江苏','可口可乐，销售百年的糖水，获得了全世界额青睐0009','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0009','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-09-03 20:18:39','1'),
	('P000010','啤酒','LTC000005','安徽','可口可乐，销售百年的糖水，获得了全世界额青睐0010','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0010','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-08-28 22:58:57','1'),
	('P000011','可乐','LTC000006','日本','可口可乐，销售百年的糖水，获得了全世界额青睐0011','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0011','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-09-07 20:27:09','1'),
	('P000012','久久鸭','LTC000006','法国','可口可乐，销售百年的糖水，获得了全世界额青睐0012','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0012','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-08-24 06:19:49','1'),
	('P000013','啤酒','LTC000007','四川','可口可乐，销售百年的糖水，获得了全世界额青睐0013','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0013','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-09-13 15:48:26','1'),
	('P000014','可乐','LTC000007','广东','可口可乐，销售百年的糖水，获得了全世界额青睐0014','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0014','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-08-29 02:55:19','1'),
	('P000015','久久鸭','LTC000008','江苏','可口可乐，销售百年的糖水，获得了全世界额青睐0015','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0015','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-09-04 19:45:44','1'),
	('P000016','啤酒','LTC000008','安徽','可口可乐，销售百年的糖水，获得了全世界额青睐0016','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0016','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-08-28 05:37:09','1'),
	('P000017','可乐','LTC000009','日本','可口可乐，销售百年的糖水，获得了全世界额青睐0017','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0017','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-09-07 23:02:07','1'),
	('P000018','久久鸭','LTC000009','法国','可口可乐，销售百年的糖水，获得了全世界额青睐0018','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0018','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-09-14 21:22:09','1'),
	('P000019','啤酒','LTC000010','四川','可口可乐，销售百年的糖水，获得了全世界额青睐0019','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0019','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-09-09 05:28:48','1'),
	('P000020','可乐','LTC000010','广东','可口可乐，销售百年的糖水，获得了全世界额青睐0020','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0020','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-08-30 03:18:54','1'),
	('P000021','久久鸭','LTC000011','江苏','可口可乐，销售百年的糖水，获得了全世界额青睐0021','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0021','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-08-26 11:10:47','1'),
	('P000022','啤酒','LTC000011','安徽','可口可乐，销售百年的糖水，获得了全世界额青睐0022','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0022','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-09-09 14:56:04','1'),
	('P000023','可乐','LTC000012','日本','可口可乐，销售百年的糖水，获得了全世界额青睐0023','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0023','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-09-12 00:00:36','1'),
	('P000024','久久鸭','LTC000012','法国','可口可乐，销售百年的糖水，获得了全世界额青睐0024','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0024','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-09-08 05:14:17','1'),
	('P000025','啤酒','LTC000013','四川','可口可乐，销售百年的糖水，获得了全世界额青睐0025','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0025','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-09-08 09:27:34','1'),
	('P000026','可乐','LTC000013','广东','可口可乐，销售百年的糖水，获得了全世界额青睐0026','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0026','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-08-27 23:07:01','1'),
	('P000027','久久鸭','LTC000014','江苏','可口可乐，销售百年的糖水，获得了全世界额青睐0027','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0027','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-08-24 07:40:02','1'),
	('P000028','啤酒','LTC000014','安徽','可口可乐，销售百年的糖水，获得了全世界额青睐0028','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0028','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-08-27 00:04:40','1'),
	('P000029','可乐','LTC000015','日本','可口可乐，销售百年的糖水，获得了全世界额青睐0029','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0029','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-09-07 21:57:35','1'),
	('P000030','久久鸭','LTC000015','法国','可口可乐，销售百年的糖水，获得了全世界额青睐0030','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0030','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-09-14 06:28:39','1'),
	('P000031','啤酒','LTC000016','四川','可口可乐，销售百年的糖水，获得了全世界额青睐0031','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0031','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-09-07 22:26:50','1'),
	('P000032','可乐','LTC000016','广东','可口可乐，销售百年的糖水，获得了全世界额青睐0032','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0032','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-09-10 03:55:43','1');

insert into sku_data values
	('S000001','可乐-大罐的','大','P000001','TM00000000001','包装类型','包装数量等信息,包装数量等信息,包装数量等信息','1025.66','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000002','可乐-大罐的0002','中','P000001','TM000000000010002','包装类型0002','包装数量等信息,包装数量等信息,包装数量等信息0002','1169.55','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000003','可乐-大罐的0003','小','P000002','TM000000000010003','包装类型0003','包装数量等信息,包装数量等信息,包装数量等信息0003','1063.44','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000004','可乐-大罐的0004','大','P000002','TM000000000010004','包装类型0004','包装数量等信息,包装数量等信息,包装数量等信息0004','1075.46','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000005','可乐-大罐的0005','中','P000003','TM000000000010005','包装类型0005','包装数量等信息,包装数量等信息,包装数量等信息0005','1315.80','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000006','可乐-大罐的0006','小','P000003','TM000000000010006','包装类型0006','包装数量等信息,包装数量等信息,包装数量等信息0006','1235.94','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000007','可乐-大罐的0007','大','P000004','TM000000000010007','包装类型0007','包装数量等信息,包装数量等信息,包装数量等信息0007','1059.32','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000008','可乐-大罐的0008','中','P000004','TM000000000010008','包装类型0008','包装数量等信息,包装数量等信息,包装数量等信息0008','1157.75','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000009','可乐-大罐的0009','小','P000005','TM000000000010009','包装类型0009','包装数量等信息,包装数量等信息,包装数量等信息0009','1209.64','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000010','可乐-大罐的0010','大','P000005','TM000000000010010','包装类型0010','包装数量等信息,包装数量等信息,包装数量等信息0010','1253.20','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000011','可乐-大罐的0011','中','P000006','TM000000000010011','包装类型0011','包装数量等信息,包装数量等信息,包装数量等信息0011','1127.20','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000012','可乐-大罐的0012','小','P000006','TM000000000010012','包装类型0012','包装数量等信息,包装数量等信息,包装数量等信息0012','1069.27','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000013','可乐-大罐的0013','大','P000007','TM000000000010013','包装类型0013','包装数量等信息,包装数量等信息,包装数量等信息0013','1222.66','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000014','可乐-大罐的0014','中','P000007','TM000000000010014','包装类型0014','包装数量等信息,包装数量等信息,包装数量等信息0014','1041.29','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000015','可乐-大罐的0015','小','P000008','TM000000000010015','包装类型0015','包装数量等信息,包装数量等信息,包装数量等信息0015','1322.84','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000016','可乐-大罐的0016','大','P000008','TM000000000010016','包装类型0016','包装数量等信息,包装数量等信息,包装数量等信息0016','949.55','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000017','可乐-大罐的0017','中','P000009','TM000000000010017','包装类型0017','包装数量等信息,包装数量等信息,包装数量等信息0017','1253.13','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000018','可乐-大罐的0018','小','P000009','TM000000000010018','包装类型0018','包装数量等信息,包装数量等信息,包装数量等信息0018','1254.83','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000019','可乐-大罐的0019','大','P000010','TM000000000010019','包装类型0019','包装数量等信息,包装数量等信息,包装数量等信息0019','1171.52','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000020','可乐-大罐的0020','中','P000010','TM000000000010020','包装类型0020','包装数量等信息,包装数量等信息,包装数量等信息0020','951.03','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000021','可乐-大罐的0021','小','P000011','TM000000000010021','包装类型0021','包装数量等信息,包装数量等信息,包装数量等信息0021','986.12','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000022','可乐-大罐的0022','大','P000011','TM000000000010022','包装类型0022','包装数量等信息,包装数量等信息,包装数量等信息0022','1037.89','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000023','可乐-大罐的0023','中','P000012','TM000000000010023','包装类型0023','包装数量等信息,包装数量等信息,包装数量等信息0023','1030.18','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000024','可乐-大罐的0024','小','P000012','TM000000000010024','包装类型0024','包装数量等信息,包装数量等信息,包装数量等信息0024','1014.02','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000025','可乐-大罐的0025','大','P000013','TM000000000010025','包装类型0025','包装数量等信息,包装数量等信息,包装数量等信息0025','1317.80','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000026','可乐-大罐的0026','中','P000013','TM000000000010026','包装类型0026','包装数量等信息,包装数量等信息,包装数量等信息0026','1313.29','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000027','可乐-大罐的0027','小','P000014','TM000000000010027','包装类型0027','包装数量等信息,包装数量等信息,包装数量等信息0027','1270.33','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000028','可乐-大罐的0028','大','P000014','TM000000000010028','包装类型0028','包装数量等信息,包装数量等信息,包装数量等信息0028','1306.35','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000029','可乐-大罐的0029','中','P000015','TM000000000010029','包装类型0029','包装数量等信息,包装数量等信息,包装数量等信息0029','1084.08','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000030','可乐-大罐的0030','小','P000015','TM000000000010030','包装类型0030','包装数量等信息,包装数量等信息,包装数量等信息0030','997.11','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000031','可乐-大罐的0031','大','P000016','TM000000000010031','包装类型0031','包装数量等信息,包装数量等信息,包装数量等信息0031','1319.99','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000032','可乐-大罐的0032','中','P000016','TM000000000010032','包装类型0032','包装数量等信息,包装数量等信息,包装数量等信息0032','1131.04','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000033','可乐-大罐的0033','小','P000017','TM000000000010033','包装类型0033','包装数量等信息,包装数量等信息,包装数量等信息0033','1115.86','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000034','可乐-大罐的0034','大','P000017','TM000000000010034','包装类型0034','包装数量等信息,包装数量等信息,包装数量等信息0034','1125.47','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000035','可乐-大罐的0035','中','P000018','TM000000000010035','包装类型0035','包装数量等信息,包装数量等信息,包装数量等信息0035','1312.49','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000036','可乐-大罐的0036','小','P000018','TM000000000010036','包装类型0036','包装数量等信息,包装数量等信息,包装数量等信息0036','952.82','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000037','可乐-大罐的0037','大','P000019','TM000000000010037','包装类型0037','包装数量等信息,包装数量等信息,包装数量等信息0037','1300.37','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000038','可乐-大罐的0038','中','P000019','TM000000000010038','包装类型0038','包装数量等信息,包装数量等信息,包装数量等信息0038','1106.91','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000039','可乐-大罐的0039','小','P000020','TM000000000010039','包装类型0039','包装数量等信息,包装数量等信息,包装数量等信息0039','1252.17','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000040','可乐-大罐的0040','大','P000020','TM000000000010040','包装类型0040','包装数量等信息,包装数量等信息,包装数量等信息0040','1264.54','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000041','可乐-大罐的0041','中','P000021','TM000000000010041','包装类型0041','包装数量等信息,包装数量等信息,包装数量等信息0041','1187.45','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000042','可乐-大罐的0042','小','P000021','TM000000000010042','包装类型0042','包装数量等信息,包装数量等信息,包装数量等信息0042','1168.63','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000043','可乐-大罐的0043','大','P000022','TM000000000010043','包装类型0043','包装数量等信息,包装数量等信息,包装数量等信息0043','1231.89','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000044','可乐-大罐的0044','中','P000022','TM000000000010044','包装类型0044','包装数量等信息,包装数量等信息,包装数量等信息0044','1020.73','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000045','可乐-大罐的0045','小','P000023','TM000000000010045','包装类型0045','包装数量等信息,包装数量等信息,包装数量等信息0045','1016.20','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000046','可乐-大罐的0046','大','P000023','TM000000000010046','包装类型0046','包装数量等信息,包装数量等信息,包装数量等信息0046','1213.61','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000047','可乐-大罐的0047','中','P000024','TM000000000010047','包装类型0047','包装数量等信息,包装数量等信息,包装数量等信息0047','1153.57','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000048','可乐-大罐的0048','小','P000024','TM000000000010048','包装类型0048','包装数量等信息,包装数量等信息,包装数量等信息0048','1106.79','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000049','可乐-大罐的0049','大','P000025','TM000000000010049','包装类型0049','包装数量等信息,包装数量等信息,包装数量等信息0049','1051.86','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000050','可乐-大罐的0050','中','P000025','TM000000000010050','包装类型0050','包装数量等信息,包装数量等信息,包装数量等信息0050','1248.50','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000051','可乐-大罐的0051','小','P000026','TM000000000010051','包装类型0051','包装数量等信息,包装数量等信息,包装数量等信息0051','1048.07','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000052','可乐-大罐的0052','大','P000026','TM000000000010052','包装类型0052','包装数量等信息,包装数量等信息,包装数量等信息0052','1291.24','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000053','可乐-大罐的0053','中','P000027','TM000000000010053','包装类型0053','包装数量等信息,包装数量等信息,包装数量等信息0053','1299.75','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000054','可乐-大罐的0054','小','P000027','TM000000000010054','包装类型0054','包装数量等信息,包装数量等信息,包装数量等信息0054','1141.54','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000055','可乐-大罐的0055','大','P000028','TM000000000010055','包装类型0055','包装数量等信息,包装数量等信息,包装数量等信息0055','1158.26','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000056','可乐-大罐的0056','中','P000028','TM000000000010056','包装类型0056','包装数量等信息,包装数量等信息,包装数量等信息0056','1078.55','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000057','可乐-大罐的0057','小','P000029','TM000000000010057','包装类型0057','包装数量等信息,包装数量等信息,包装数量等信息0057','1079.23','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000058','可乐-大罐的0058','大','P000029','TM000000000010058','包装类型0058','包装数量等信息,包装数量等信息,包装数量等信息0058','1073.30','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000059','可乐-大罐的0059','中','P000030','TM000000000010059','包装类型0059','包装数量等信息,包装数量等信息,包装数量等信息0059','1187.30','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000060','可乐-大罐的0060','小','P000030','TM000000000010060','包装类型0060','包装数量等信息,包装数量等信息,包装数量等信息0060','1208.90','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000061','可乐-大罐的0061','大','P000031','TM000000000010061','包装类型0061','包装数量等信息,包装数量等信息,包装数量等信息0061','1299.37','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000062','可乐-大罐的0062','中','P000031','TM000000000010062','包装类型0062','包装数量等信息,包装数量等信息,包装数量等信息0062','1183.09','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000063','可乐-大罐的0063','小','P000032','TM000000000010063','包装类型0063','包装数量等信息,包装数量等信息,包装数量等信息0063','1317.91','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000064','可乐-大罐的0064','大','P000032','TM000000000010064','包装类型0064','包装数量等信息,包装数量等信息,包装数量等信息0064','1272.45','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1');

insert into retail_store_province_center_data values
	('RSPC000001','双链小超四川省运营中心','2019-08-21','RSCC000001','2019-09-05 07:48:00','1'),
	('RSPC000002','双链小超北京运营中心','2018-08-06','RSCC000001','2019-08-30 07:04:44','1');

insert into province_center_department_data values
	('PCD000001','供应链部','2017-09-02','RSPC000001','刘强','1'),
	('PCD000002','采购部','2019-06-16','RSPC000001','王德宏','1'),
	('PCD000003','管理部','2017-06-24','RSPC000002','刘强','1'),
	('PCD000004','财务部','2018-07-18','RSPC000002','王德宏','1');

insert into province_center_employee_data values
	('PCE000001','刘强','13999998888','wangdehong@yatang.cn','2017-04-14','PCD000001','RSPC000001','1'),
	('PCE000002','王德宏','13900000002','liuqiang@yatang.cn','2018-12-02','PCD000001','RSPC000001','1'),
	('PCE000003','刘强','13900000003','wangdehong@yatang.cn','2018-12-31','PCD000002','RSPC000001','1'),
	('PCE000004','王德宏','13900000004','liuqiang@yatang.cn','2018-03-31','PCD000002','RSPC000001','1'),
	('PCE000005','刘强','13900000005','wangdehong@yatang.cn','2017-04-30','PCD000003','RSPC000002','1'),
	('PCE000006','王德宏','13900000006','liuqiang@yatang.cn','2018-05-20','PCD000003','RSPC000002','1'),
	('PCE000007','刘强','13900000007','wangdehong@yatang.cn','2019-09-03','PCD000004','RSPC000002','1'),
	('PCE000008','王德宏','13900000008','liuqiang@yatang.cn','2019-07-08','PCD000004','RSPC000002','1');

insert into retail_store_city_service_center_data values
	('RSCSC000001','双链小超成都办事处','2018-01-26','RSPC000001','2019-09-06 03:45:07','1'),
	('RSCSC000002','双链小超绵阳办事处','2017-03-25','RSPC000001','2019-09-14 14:33:29','1'),
	('RSCSC000003','双链小超巴中办事处','2019-02-19','RSPC000002','2019-09-11 07:31:36','1'),
	('RSCSC000004','双链小超成都办事处','2019-04-14','RSPC000002','2019-08-26 02:23:11','1');

insert into city_partner_data values
	('CP000001','曾倩','13677778888','RSCSC000001','负责开拓市场，具有极强的开拓能力','2019-08-25 16:32:24','1'),
	('CP000002','黄风格','13900000002','RSCSC000001','负责开拓市场，具有极强的开拓能力0002','2019-09-13 03:12:30','1'),
	('CP000003','郭超','13900000003','RSCSC000002','负责开拓市场，具有极强的开拓能力0003','2019-08-25 04:15:02','1'),
	('CP000004','曾倩','13900000004','RSCSC000002','负责开拓市场，具有极强的开拓能力0004','2019-09-09 22:38:30','1'),
	('CP000005','黄风格','13900000005','RSCSC000003','负责开拓市场，具有极强的开拓能力0005','2019-08-28 23:19:17','1'),
	('CP000006','郭超','13900000006','RSCSC000003','负责开拓市场，具有极强的开拓能力0006','2019-08-31 00:27:21','1'),
	('CP000007','曾倩','13900000007','RSCSC000004','负责开拓市场，具有极强的开拓能力0007','2019-09-07 10:21:50','1'),
	('CP000008','黄风格','13900000008','RSCSC000004','负责开拓市场，具有极强的开拓能力0008','2019-08-24 22:34:17','1');

insert into potential_customer_data values
	('PC000001','曾倩','13677778888','RSCSC000001','CP000001','负责开拓市场，具有极强的开拓能力','2019-09-13 16:46:12','1'),
	('PC000002','黄风格','13900000002','RSCSC000001','CP000001','负责开拓市场，具有极强的开拓能力0002','2019-08-25 09:19:32','1'),
	('PC000003','郭超','13900000003','RSCSC000001','CP000002','负责开拓市场，具有极强的开拓能力0003','2019-09-14 09:41:12','1'),
	('PC000004','曾倩','13900000004','RSCSC000001','CP000002','负责开拓市场，具有极强的开拓能力0004','2019-08-29 10:54:46','1'),
	('PC000005','黄风格','13900000005','RSCSC000002','CP000003','负责开拓市场，具有极强的开拓能力0005','2019-08-30 10:27:54','1'),
	('PC000006','郭超','13900000006','RSCSC000002','CP000003','负责开拓市场，具有极强的开拓能力0006','2019-08-30 09:49:11','1'),
	('PC000007','曾倩','13900000007','RSCSC000002','CP000004','负责开拓市场，具有极强的开拓能力0007','2019-08-26 05:28:06','1'),
	('PC000008','黄风格','13900000008','RSCSC000002','CP000004','负责开拓市场，具有极强的开拓能力0008','2019-09-09 20:38:54','1'),
	('PC000009','郭超','13900000009','RSCSC000003','CP000005','负责开拓市场，具有极强的开拓能力0009','2019-09-02 23:45:16','1'),
	('PC000010','曾倩','13900000010','RSCSC000003','CP000005','负责开拓市场，具有极强的开拓能力0010','2019-08-29 16:28:38','1'),
	('PC000011','黄风格','13900000011','RSCSC000003','CP000006','负责开拓市场，具有极强的开拓能力0011','2019-08-25 02:53:08','1'),
	('PC000012','郭超','13900000012','RSCSC000003','CP000006','负责开拓市场，具有极强的开拓能力0012','2019-08-24 16:27:35','1'),
	('PC000013','曾倩','13900000013','RSCSC000004','CP000007','负责开拓市场，具有极强的开拓能力0013','2019-08-29 22:39:48','1'),
	('PC000014','黄风格','13900000014','RSCSC000004','CP000007','负责开拓市场，具有极强的开拓能力0014','2019-09-12 09:03:06','1'),
	('PC000015','郭超','13900000015','RSCSC000004','CP000008','负责开拓市场，具有极强的开拓能力0015','2019-09-07 01:25:10','1'),
	('PC000016','曾倩','13900000016','RSCSC000004','CP000008','负责开拓市场，具有极强的开拓能力0016','2019-09-10 22:41:24','1');

insert into potential_customer_contact_person_data values
	('PCCP000001','赵先生','13677778888','PC000001','这人在决策中战友较大的权重，密切观察中.....','1'),
	('PCCP000002','赵先生0002','13900000002','PC000001','这人在决策中战友较大的权重，密切观察中.....0002','1'),
	('PCCP000003','赵先生0003','13900000003','PC000002','这人在决策中战友较大的权重，密切观察中.....0003','1'),
	('PCCP000004','赵先生0004','13900000004','PC000002','这人在决策中战友较大的权重，密切观察中.....0004','1'),
	('PCCP000005','赵先生0005','13900000005','PC000003','这人在决策中战友较大的权重，密切观察中.....0005','1'),
	('PCCP000006','赵先生0006','13900000006','PC000003','这人在决策中战友较大的权重，密切观察中.....0006','1'),
	('PCCP000007','赵先生0007','13900000007','PC000004','这人在决策中战友较大的权重，密切观察中.....0007','1'),
	('PCCP000008','赵先生0008','13900000008','PC000004','这人在决策中战友较大的权重，密切观察中.....0008','1'),
	('PCCP000009','赵先生0009','13900000009','PC000005','这人在决策中战友较大的权重，密切观察中.....0009','1'),
	('PCCP000010','赵先生0010','13900000010','PC000005','这人在决策中战友较大的权重，密切观察中.....0010','1'),
	('PCCP000011','赵先生0011','13900000011','PC000006','这人在决策中战友较大的权重，密切观察中.....0011','1'),
	('PCCP000012','赵先生0012','13900000012','PC000006','这人在决策中战友较大的权重，密切观察中.....0012','1'),
	('PCCP000013','赵先生0013','13900000013','PC000007','这人在决策中战友较大的权重，密切观察中.....0013','1'),
	('PCCP000014','赵先生0014','13900000014','PC000007','这人在决策中战友较大的权重，密切观察中.....0014','1'),
	('PCCP000015','赵先生0015','13900000015','PC000008','这人在决策中战友较大的权重，密切观察中.....0015','1'),
	('PCCP000016','赵先生0016','13900000016','PC000008','这人在决策中战友较大的权重，密切观察中.....0016','1'),
	('PCCP000017','赵先生0017','13900000017','PC000009','这人在决策中战友较大的权重，密切观察中.....0017','1'),
	('PCCP000018','赵先生0018','13900000018','PC000009','这人在决策中战友较大的权重，密切观察中.....0018','1'),
	('PCCP000019','赵先生0019','13900000019','PC000010','这人在决策中战友较大的权重，密切观察中.....0019','1'),
	('PCCP000020','赵先生0020','13900000020','PC000010','这人在决策中战友较大的权重，密切观察中.....0020','1'),
	('PCCP000021','赵先生0021','13900000021','PC000011','这人在决策中战友较大的权重，密切观察中.....0021','1'),
	('PCCP000022','赵先生0022','13900000022','PC000011','这人在决策中战友较大的权重，密切观察中.....0022','1'),
	('PCCP000023','赵先生0023','13900000023','PC000012','这人在决策中战友较大的权重，密切观察中.....0023','1'),
	('PCCP000024','赵先生0024','13900000024','PC000012','这人在决策中战友较大的权重，密切观察中.....0024','1'),
	('PCCP000025','赵先生0025','13900000025','PC000013','这人在决策中战友较大的权重，密切观察中.....0025','1'),
	('PCCP000026','赵先生0026','13900000026','PC000013','这人在决策中战友较大的权重，密切观察中.....0026','1'),
	('PCCP000027','赵先生0027','13900000027','PC000014','这人在决策中战友较大的权重，密切观察中.....0027','1'),
	('PCCP000028','赵先生0028','13900000028','PC000014','这人在决策中战友较大的权重，密切观察中.....0028','1'),
	('PCCP000029','赵先生0029','13900000029','PC000015','这人在决策中战友较大的权重，密切观察中.....0029','1'),
	('PCCP000030','赵先生0030','13900000030','PC000015','这人在决策中战友较大的权重，密切观察中.....0030','1'),
	('PCCP000031','赵先生0031','13900000031','PC000016','这人在决策中战友较大的权重，密切观察中.....0031','1'),
	('PCCP000032','赵先生0032','13900000032','PC000016','这人在决策中战友较大的权重，密切观察中.....0032','1');

insert into potential_customer_contact_data values
	('PCC000001','和连载客户的联系记录','2017-07-08','电话','PC000001','CP000001','PCCP000001','转化希望很大','2019-09-13 00:30:44','1'),
	('PCC000002','和连载客户的联系记录0002','2019-08-18','短信','PC000001','CP000001','PCCP000001','转化希望很大0002','2019-08-29 14:02:25','1'),
	('PCC000003','和连载客户的联系记录0003','2019-07-15','登门拜访','PC000001','CP000001','PCCP000002','转化希望很大0003','2019-09-11 04:50:06','1'),
	('PCC000004','和连载客户的联系记录0004','2019-03-14','活动聊天','PC000001','CP000001','PCCP000002','转化希望很大0004','2019-09-13 21:51:53','1'),
	('PCC000005','和连载客户的联系记录0005','2019-02-16','电话','PC000002','CP000001','PCCP000003','转化希望很大0005','2019-08-26 06:54:08','1'),
	('PCC000006','和连载客户的联系记录0006','2016-09-28','短信','PC000002','CP000001','PCCP000003','转化希望很大0006','2019-09-11 10:11:09','1'),
	('PCC000007','和连载客户的联系记录0007','2017-03-28','登门拜访','PC000002','CP000001','PCCP000004','转化希望很大0007','2019-08-25 08:30:03','1'),
	('PCC000008','和连载客户的联系记录0008','2017-09-20','活动聊天','PC000002','CP000001','PCCP000004','转化希望很大0008','2019-09-10 03:27:06','1'),
	('PCC000009','和连载客户的联系记录0009','2017-08-23','电话','PC000003','CP000002','PCCP000005','转化希望很大0009','2019-09-07 10:18:47','1'),
	('PCC000010','和连载客户的联系记录0010','2018-12-30','短信','PC000003','CP000002','PCCP000005','转化希望很大0010','2019-09-09 08:57:25','1'),
	('PCC000011','和连载客户的联系记录0011','2019-06-02','登门拜访','PC000003','CP000002','PCCP000006','转化希望很大0011','2019-09-07 23:31:13','1'),
	('PCC000012','和连载客户的联系记录0012','2018-08-18','活动聊天','PC000003','CP000002','PCCP000006','转化希望很大0012','2019-09-02 13:11:46','1'),
	('PCC000013','和连载客户的联系记录0013','2019-06-27','电话','PC000004','CP000002','PCCP000007','转化希望很大0013','2019-09-03 14:59:07','1'),
	('PCC000014','和连载客户的联系记录0014','2017-05-23','短信','PC000004','CP000002','PCCP000007','转化希望很大0014','2019-09-02 04:46:52','1'),
	('PCC000015','和连载客户的联系记录0015','2016-11-28','登门拜访','PC000004','CP000002','PCCP000008','转化希望很大0015','2019-08-26 22:33:55','1'),
	('PCC000016','和连载客户的联系记录0016','2016-10-03','活动聊天','PC000004','CP000002','PCCP000008','转化希望很大0016','2019-09-07 12:32:07','1'),
	('PCC000017','和连载客户的联系记录0017','2017-02-07','电话','PC000005','CP000003','PCCP000009','转化希望很大0017','2019-08-25 05:29:43','1'),
	('PCC000018','和连载客户的联系记录0018','2018-07-02','短信','PC000005','CP000003','PCCP000009','转化希望很大0018','2019-09-13 03:36:03','1'),
	('PCC000019','和连载客户的联系记录0019','2016-11-11','登门拜访','PC000005','CP000003','PCCP000010','转化希望很大0019','2019-09-04 19:01:03','1'),
	('PCC000020','和连载客户的联系记录0020','2017-11-12','活动聊天','PC000005','CP000003','PCCP000010','转化希望很大0020','2019-09-13 05:13:28','1'),
	('PCC000021','和连载客户的联系记录0021','2017-11-14','电话','PC000006','CP000003','PCCP000011','转化希望很大0021','2019-08-28 16:52:48','1'),
	('PCC000022','和连载客户的联系记录0022','2018-08-27','短信','PC000006','CP000003','PCCP000011','转化希望很大0022','2019-09-02 20:09:26','1'),
	('PCC000023','和连载客户的联系记录0023','2018-03-27','登门拜访','PC000006','CP000003','PCCP000012','转化希望很大0023','2019-09-05 08:24:05','1'),
	('PCC000024','和连载客户的联系记录0024','2016-10-02','活动聊天','PC000006','CP000003','PCCP000012','转化希望很大0024','2019-08-31 07:17:13','1'),
	('PCC000025','和连载客户的联系记录0025','2019-07-09','电话','PC000007','CP000004','PCCP000013','转化希望很大0025','2019-09-08 11:42:05','1'),
	('PCC000026','和连载客户的联系记录0026','2019-02-03','短信','PC000007','CP000004','PCCP000013','转化希望很大0026','2019-08-29 08:14:25','1'),
	('PCC000027','和连载客户的联系记录0027','2018-11-11','登门拜访','PC000007','CP000004','PCCP000014','转化希望很大0027','2019-08-30 13:01:26','1'),
	('PCC000028','和连载客户的联系记录0028','2017-06-08','活动聊天','PC000007','CP000004','PCCP000014','转化希望很大0028','2019-09-05 10:01:20','1'),
	('PCC000029','和连载客户的联系记录0029','2016-11-13','电话','PC000008','CP000004','PCCP000015','转化希望很大0029','2019-08-26 07:01:39','1'),
	('PCC000030','和连载客户的联系记录0030','2017-01-11','短信','PC000008','CP000004','PCCP000015','转化希望很大0030','2019-08-25 08:56:04','1'),
	('PCC000031','和连载客户的联系记录0031','2019-03-25','登门拜访','PC000008','CP000004','PCCP000016','转化希望很大0031','2019-09-13 16:05:41','1'),
	('PCC000032','和连载客户的联系记录0032','2018-10-08','活动聊天','PC000008','CP000004','PCCP000016','转化希望很大0032','2019-08-25 01:11:34','1'),
	('PCC000033','和连载客户的联系记录0033','2017-05-16','电话','PC000009','CP000005','PCCP000017','转化希望很大0033','2019-08-24 12:54:45','1'),
	('PCC000034','和连载客户的联系记录0034','2019-05-05','短信','PC000009','CP000005','PCCP000017','转化希望很大0034','2019-09-09 04:28:57','1'),
	('PCC000035','和连载客户的联系记录0035','2018-11-08','登门拜访','PC000009','CP000005','PCCP000018','转化希望很大0035','2019-08-31 17:24:21','1'),
	('PCC000036','和连载客户的联系记录0036','2018-07-29','活动聊天','PC000009','CP000005','PCCP000018','转化希望很大0036','2019-08-24 22:31:35','1'),
	('PCC000037','和连载客户的联系记录0037','2016-09-28','电话','PC000010','CP000005','PCCP000019','转化希望很大0037','2019-09-10 17:44:49','1'),
	('PCC000038','和连载客户的联系记录0038','2018-04-29','短信','PC000010','CP000005','PCCP000019','转化希望很大0038','2019-09-04 11:12:14','1'),
	('PCC000039','和连载客户的联系记录0039','2016-11-20','登门拜访','PC000010','CP000005','PCCP000020','转化希望很大0039','2019-09-08 10:03:06','1'),
	('PCC000040','和连载客户的联系记录0040','2018-01-26','活动聊天','PC000010','CP000005','PCCP000020','转化希望很大0040','2019-09-03 20:15:12','1'),
	('PCC000041','和连载客户的联系记录0041','2018-08-18','电话','PC000011','CP000006','PCCP000021','转化希望很大0041','2019-08-25 17:39:51','1'),
	('PCC000042','和连载客户的联系记录0042','2016-09-22','短信','PC000011','CP000006','PCCP000021','转化希望很大0042','2019-08-28 01:05:15','1'),
	('PCC000043','和连载客户的联系记录0043','2017-05-11','登门拜访','PC000011','CP000006','PCCP000022','转化希望很大0043','2019-09-11 10:39:50','1'),
	('PCC000044','和连载客户的联系记录0044','2018-03-23','活动聊天','PC000011','CP000006','PCCP000022','转化希望很大0044','2019-09-08 08:00:51','1'),
	('PCC000045','和连载客户的联系记录0045','2018-03-14','电话','PC000012','CP000006','PCCP000023','转化希望很大0045','2019-09-10 14:34:32','1'),
	('PCC000046','和连载客户的联系记录0046','2018-12-17','短信','PC000012','CP000006','PCCP000023','转化希望很大0046','2019-08-26 01:53:33','1'),
	('PCC000047','和连载客户的联系记录0047','2019-02-25','登门拜访','PC000012','CP000006','PCCP000024','转化希望很大0047','2019-08-25 13:26:30','1'),
	('PCC000048','和连载客户的联系记录0048','2018-04-23','活动聊天','PC000012','CP000006','PCCP000024','转化希望很大0048','2019-08-27 16:51:41','1'),
	('PCC000049','和连载客户的联系记录0049','2017-01-05','电话','PC000013','CP000007','PCCP000025','转化希望很大0049','2019-09-11 02:48:53','1'),
	('PCC000050','和连载客户的联系记录0050','2017-04-19','短信','PC000013','CP000007','PCCP000025','转化希望很大0050','2019-09-09 21:47:01','1'),
	('PCC000051','和连载客户的联系记录0051','2019-08-30','登门拜访','PC000013','CP000007','PCCP000026','转化希望很大0051','2019-09-02 13:39:16','1'),
	('PCC000052','和连载客户的联系记录0052','2018-10-08','活动聊天','PC000013','CP000007','PCCP000026','转化希望很大0052','2019-08-30 02:29:01','1'),
	('PCC000053','和连载客户的联系记录0053','2017-07-27','电话','PC000014','CP000007','PCCP000027','转化希望很大0053','2019-09-14 11:46:02','1'),
	('PCC000054','和连载客户的联系记录0054','2017-05-12','短信','PC000014','CP000007','PCCP000027','转化希望很大0054','2019-09-06 03:07:44','1'),
	('PCC000055','和连载客户的联系记录0055','2019-09-10','登门拜访','PC000014','CP000007','PCCP000028','转化希望很大0055','2019-09-10 03:17:41','1'),
	('PCC000056','和连载客户的联系记录0056','2019-03-10','活动聊天','PC000014','CP000007','PCCP000028','转化希望很大0056','2019-09-05 03:59:02','1'),
	('PCC000057','和连载客户的联系记录0057','2018-06-16','电话','PC000015','CP000008','PCCP000029','转化希望很大0057','2019-08-28 16:52:04','1'),
	('PCC000058','和连载客户的联系记录0058','2019-03-18','短信','PC000015','CP000008','PCCP000029','转化希望很大0058','2019-09-08 07:05:15','1'),
	('PCC000059','和连载客户的联系记录0059','2018-01-19','登门拜访','PC000015','CP000008','PCCP000030','转化希望很大0059','2019-08-26 11:21:41','1'),
	('PCC000060','和连载客户的联系记录0060','2017-12-27','活动聊天','PC000015','CP000008','PCCP000030','转化希望很大0060','2019-09-08 03:08:07','1'),
	('PCC000061','和连载客户的联系记录0061','2016-11-24','电话','PC000016','CP000008','PCCP000031','转化希望很大0061','2019-09-01 13:08:18','1'),
	('PCC000062','和连载客户的联系记录0062','2017-12-16','短信','PC000016','CP000008','PCCP000031','转化希望很大0062','2019-08-27 18:49:01','1'),
	('PCC000063','和连载客户的联系记录0063','2017-12-12','登门拜访','PC000016','CP000008','PCCP000032','转化希望很大0063','2019-08-25 03:50:56','1'),
	('PCC000064','和连载客户的联系记录0064','2018-02-06','活动聊天','PC000016','CP000008','PCCP000032','转化希望很大0064','2019-09-06 22:02:43','1');

insert into city_event_data values
	('CE000001','小超见面会','13677778888','RSCSC000001','给大家讲解小超的发展蓝图','2019-08-27 22:45:58','1'),
	('CE000002','双链小超说明会','13900000002','RSCSC000001','给大家讲解小超的发展蓝图0002','2019-09-07 12:02:52','1'),
	('CE000003','小超见面会','13900000003','RSCSC000002','给大家讲解小超的发展蓝图0003','2019-09-14 01:21:15','1'),
	('CE000004','双链小超说明会','13900000004','RSCSC000002','给大家讲解小超的发展蓝图0004','2019-08-28 10:31:35','1'),
	('CE000005','小超见面会','13900000005','RSCSC000003','给大家讲解小超的发展蓝图0005','2019-08-26 19:46:04','1'),
	('CE000006','双链小超说明会','13900000006','RSCSC000003','给大家讲解小超的发展蓝图0006','2019-09-02 12:19:20','1'),
	('CE000007','小超见面会','13900000007','RSCSC000004','给大家讲解小超的发展蓝图0007','2019-08-24 15:40:14','1'),
	('CE000008','双链小超说明会','13900000008','RSCSC000004','给大家讲解小超的发展蓝图0008','2019-09-01 02:57:28','1');

insert into event_attendance_data values
	('EA000001','小超见面会参加信息','PC000001','CE000001','体会不错，考虑加盟','1'),
	('EA000002','小超见面会参加信息0002','PC000001','CE000001','体会不错，考虑加盟0002','1'),
	('EA000003','小超见面会参加信息0003','PC000002','CE000001','体会不错，考虑加盟0003','1'),
	('EA000004','小超见面会参加信息0004','PC000002','CE000001','体会不错，考虑加盟0004','1'),
	('EA000005','小超见面会参加信息0005','PC000003','CE000002','体会不错，考虑加盟0005','1'),
	('EA000006','小超见面会参加信息0006','PC000003','CE000002','体会不错，考虑加盟0006','1'),
	('EA000007','小超见面会参加信息0007','PC000004','CE000002','体会不错，考虑加盟0007','1'),
	('EA000008','小超见面会参加信息0008','PC000004','CE000002','体会不错，考虑加盟0008','1'),
	('EA000009','小超见面会参加信息0009','PC000005','CE000003','体会不错，考虑加盟0009','1'),
	('EA000010','小超见面会参加信息0010','PC000005','CE000003','体会不错，考虑加盟0010','1'),
	('EA000011','小超见面会参加信息0011','PC000006','CE000003','体会不错，考虑加盟0011','1'),
	('EA000012','小超见面会参加信息0012','PC000006','CE000003','体会不错，考虑加盟0012','1'),
	('EA000013','小超见面会参加信息0013','PC000007','CE000004','体会不错，考虑加盟0013','1'),
	('EA000014','小超见面会参加信息0014','PC000007','CE000004','体会不错，考虑加盟0014','1'),
	('EA000015','小超见面会参加信息0015','PC000008','CE000004','体会不错，考虑加盟0015','1'),
	('EA000016','小超见面会参加信息0016','PC000008','CE000004','体会不错，考虑加盟0016','1'),
	('EA000017','小超见面会参加信息0017','PC000009','CE000005','体会不错，考虑加盟0017','1'),
	('EA000018','小超见面会参加信息0018','PC000009','CE000005','体会不错，考虑加盟0018','1'),
	('EA000019','小超见面会参加信息0019','PC000010','CE000005','体会不错，考虑加盟0019','1'),
	('EA000020','小超见面会参加信息0020','PC000010','CE000005','体会不错，考虑加盟0020','1'),
	('EA000021','小超见面会参加信息0021','PC000011','CE000006','体会不错，考虑加盟0021','1'),
	('EA000022','小超见面会参加信息0022','PC000011','CE000006','体会不错，考虑加盟0022','1'),
	('EA000023','小超见面会参加信息0023','PC000012','CE000006','体会不错，考虑加盟0023','1'),
	('EA000024','小超见面会参加信息0024','PC000012','CE000006','体会不错，考虑加盟0024','1'),
	('EA000025','小超见面会参加信息0025','PC000013','CE000007','体会不错，考虑加盟0025','1'),
	('EA000026','小超见面会参加信息0026','PC000013','CE000007','体会不错，考虑加盟0026','1'),
	('EA000027','小超见面会参加信息0027','PC000014','CE000007','体会不错，考虑加盟0027','1'),
	('EA000028','小超见面会参加信息0028','PC000014','CE000007','体会不错，考虑加盟0028','1'),
	('EA000029','小超见面会参加信息0029','PC000015','CE000008','体会不错，考虑加盟0029','1'),
	('EA000030','小超见面会参加信息0030','PC000015','CE000008','体会不错，考虑加盟0030','1'),
	('EA000031','小超见面会参加信息0031','PC000016','CE000008','体会不错，考虑加盟0031','1'),
	('EA000032','小超见面会参加信息0032','PC000016','CE000008','体会不错，考虑加盟0032','1');

insert into retail_store_data values
	('RS000001','中和社区小超','02887654321','吕刚','RSCC000001','RSCSC000001',NULL,NULL,NULL,NULL,NULL,NULL,'2017-06-19','41.535184302921884','129.88577001897468','啤酒饮料矿泉水，香肠瓜子方便面, 请让一让','2019-09-08 11:00:27','CREATED','1'),
	('RS000002','华阳社区小超','028876543210002','吕刚0002','RSCC000001','RSCSC000001',NULL,NULL,NULL,NULL,NULL,NULL,'2016-12-30','40.644107342589734','130.82032342619146','啤酒饮料矿泉水，香肠瓜子方便面, 请让一让0002','2019-08-28 11:42:55','INVESTMENT_INVITED','1'),
	('RS000003','大源社区小超','028876543210003','吕刚0003','RSCC000001','RSCSC000002',NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-11','41.03550451818947','131.72654837680153','啤酒饮料矿泉水，香肠瓜子方便面, 请让一让0003','2019-09-04 20:51:50','FRANCHISED','1'),
	('RS000004','中和社区小超','028876543210004','吕刚0004','RSCC000001','RSCSC000002',NULL,NULL,NULL,NULL,NULL,NULL,'2019-05-04','42.27169345994073','131.58362313157738','啤酒饮料矿泉水，香肠瓜子方便面, 请让一让0004','2019-09-08 02:37:03','DECORATED','1'),
	('RS000005','华阳社区小超','028876543210005','吕刚0005','RSCC000001','RSCSC000003',NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-20','40.23494350316628','131.40286067551727','啤酒饮料矿泉水，香肠瓜子方便面, 请让一让0005','2019-09-03 12:52:38','OPENNED','1'),
	('RS000006','大源社区小超','028876543210006','吕刚0006','RSCC000001','RSCSC000003',NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-14','40.06519938965363','130.32457383901635','啤酒饮料矿泉水，香肠瓜子方便面, 请让一让0006','2019-09-04 04:11:54','CLOSED','1'),
	('RS000007','中和社区小超','028876543210007','吕刚0007','RSCC000001','RSCSC000004',NULL,NULL,NULL,NULL,NULL,NULL,'2017-10-25','40.7973930925174','130.1164862717431','啤酒饮料矿泉水，香肠瓜子方便面, 请让一让0007','2019-09-01 23:31:41','CREATED','1'),
	('RS000008','华阳社区小超','028876543210008','吕刚0008','RSCC000001','RSCSC000004',NULL,NULL,NULL,NULL,NULL,NULL,'2018-06-03','41.045358982854715','131.86967870294913','啤酒饮料矿泉水，香肠瓜子方便面, 请让一让0008','2019-09-13 12:51:03','INVESTMENT_INVITED','1');

insert into retail_store_creation_data values
	('RSC000001','已经建好了','1');

insert into retail_store_investment_invitation_data values
	('RSII000001','欢迎前来咨询','1');

insert into retail_store_franchising_data values
	('RSF000001','谢谢加盟','1');

insert into retail_store_decoration_data values
	('RSD000001','装修','1');

insert into retail_store_opening_data values
	('RSO000001','装修','1');

insert into retail_store_closing_data values
	('RSC000001','关闭','1');

insert into retail_store_member_data values
	('RSM000001','李亚青','18099887766','RSCC000001','1'),
	('RSM000002','李亚青0002','13900000002','RSCC000001','1');

insert into consumer_order_data values
	('CO000001','消费订单','RSM000001',NULL,NULL,NULL,NULL,NULL,'RS000001','2019-09-07 03:03:59','CONFIRMED','1'),
	('CO000002','消费订单0002','RSM000001',NULL,NULL,NULL,NULL,NULL,'RS000001','2019-09-10 02:51:47','APPROVED','1'),
	('CO000003','消费订单0003','RSM000001',NULL,NULL,NULL,NULL,NULL,'RS000002','2019-08-30 11:21:11','PROCESSED','1'),
	('CO000004','消费订单0004','RSM000001',NULL,NULL,NULL,NULL,NULL,'RS000002','2019-09-03 21:54:28','SHIPPED','1'),
	('CO000005','消费订单0005','RSM000001',NULL,NULL,NULL,NULL,NULL,'RS000003','2019-08-31 01:18:47','DELIVERED','1'),
	('CO000006','消费订单0006','RSM000001',NULL,NULL,NULL,NULL,NULL,'RS000003','2019-09-14 04:28:08','CONFIRMED','1'),
	('CO000007','消费订单0007','RSM000001',NULL,NULL,NULL,NULL,NULL,'RS000004','2019-08-27 23:36:26','APPROVED','1'),
	('CO000008','消费订单0008','RSM000001',NULL,NULL,NULL,NULL,NULL,'RS000004','2019-09-08 08:37:46','PROCESSED','1'),
	('CO000009','消费订单0009','RSM000002',NULL,NULL,NULL,NULL,NULL,'RS000005','2019-08-28 01:54:50','SHIPPED','1'),
	('CO000010','消费订单0010','RSM000002',NULL,NULL,NULL,NULL,NULL,'RS000005','2019-09-03 02:39:52','DELIVERED','1'),
	('CO000011','消费订单0011','RSM000002',NULL,NULL,NULL,NULL,NULL,'RS000006','2019-09-02 14:59:14','CONFIRMED','1'),
	('CO000012','消费订单0012','RSM000002',NULL,NULL,NULL,NULL,NULL,'RS000006','2019-08-30 12:02:38','APPROVED','1'),
	('CO000013','消费订单0013','RSM000002',NULL,NULL,NULL,NULL,NULL,'RS000007','2019-09-04 03:33:57','PROCESSED','1'),
	('CO000014','消费订单0014','RSM000002',NULL,NULL,NULL,NULL,NULL,'RS000007','2019-09-09 19:38:50','SHIPPED','1'),
	('CO000015','消费订单0015','RSM000002',NULL,NULL,NULL,NULL,NULL,'RS000008','2019-09-08 05:25:31','DELIVERED','1'),
	('CO000016','消费订单0016','RSM000002',NULL,NULL,NULL,NULL,NULL,'RS000008','2019-09-01 02:57:29','CONFIRMED','1');

insert into consumer_order_confirmation_data values
	('COC000001','确认者','2018-06-01','1');

insert into consumer_order_approval_data values
	('COA000001','批准者','2018-03-30','1');

insert into consumer_order_processing_data values
	('COP000001','处理者','2019-08-30','1');

insert into consumer_order_shipment_data values
	('COS000001','运货者','2019-08-29','1');

insert into consumer_order_delivery_data values
	('COD000001','送货者','2019-05-14','1');

insert into consumer_order_line_item_data values
	('COLI000001','CO000001','SKU','大瓶可乐','5.51','937.15','8224.01','2019-08-27 00:25:04','1'),
	('COLI000002','CO000001','SKU0002','大瓶可乐0002','4.18','993.24','9154.94','2019-08-28 23:34:42','1'),
	('COLI000003','CO000002','SKU0003','大瓶可乐0003','5.69','997.95','7541.17','2019-09-01 10:27:40','1'),
	('COLI000004','CO000002','SKU0004','大瓶可乐0004','4.75','982.30','8093.63','2019-09-05 09:33:50','1'),
	('COLI000005','CO000003','SKU0005','大瓶可乐0005','5.97','985.83','9167.88','2019-08-29 15:00:52','1'),
	('COLI000006','CO000003','SKU0006','大瓶可乐0006','5.45','943.38','7577.55','2019-08-28 14:47:52','1'),
	('COLI000007','CO000004','SKU0007','大瓶可乐0007','4.20','819.31','8799.67','2019-08-31 08:09:32','1'),
	('COLI000008','CO000004','SKU0008','大瓶可乐0008','4.46','995.74','7095.74','2019-09-06 06:58:23','1'),
	('COLI000009','CO000005','SKU0009','大瓶可乐0009','4.53','804.41','7037.52','2019-09-05 22:39:20','1'),
	('COLI000010','CO000005','SKU0010','大瓶可乐0010','4.22','715.95','7549.39','2019-09-11 21:46:32','1'),
	('COLI000011','CO000006','SKU0011','大瓶可乐0011','5.09','764.70','7856.92','2019-09-01 16:21:11','1'),
	('COLI000012','CO000006','SKU0012','大瓶可乐0012','5.16','792.51','8666.02','2019-09-09 15:40:12','1'),
	('COLI000013','CO000007','SKU0013','大瓶可乐0013','4.80','840.63','7487.88','2019-09-10 17:17:24','1'),
	('COLI000014','CO000007','SKU0014','大瓶可乐0014','5.62','705.43','7271.99','2019-09-01 05:28:51','1'),
	('COLI000015','CO000008','SKU0015','大瓶可乐0015','4.97','900.51','9412.83','2019-09-01 10:32:46','1'),
	('COLI000016','CO000008','SKU0016','大瓶可乐0016','4.86','735.63','7755.23','2019-09-08 12:19:33','1'),
	('COLI000017','CO000009','SKU0017','大瓶可乐0017','4.39','830.94','7439.66','2019-08-24 11:41:28','1'),
	('COLI000018','CO000009','SKU0018','大瓶可乐0018','5.88','934.38','7300.18','2019-09-13 08:26:50','1'),
	('COLI000019','CO000010','SKU0019','大瓶可乐0019','5.79','899.01','7056.67','2019-09-05 19:53:26','1'),
	('COLI000020','CO000010','SKU0020','大瓶可乐0020','5.10','707.82','7727.11','2019-08-27 00:06:00','1'),
	('COLI000021','CO000011','SKU0021','大瓶可乐0021','4.28','704.06','7526.72','2019-08-31 03:54:53','1'),
	('COLI000022','CO000011','SKU0022','大瓶可乐0022','5.89','796.55','9017.79','2019-09-09 09:26:58','1'),
	('COLI000023','CO000012','SKU0023','大瓶可乐0023','5.45','861.54','7427.37','2019-08-31 11:18:38','1'),
	('COLI000024','CO000012','SKU0024','大瓶可乐0024','4.58','955.54','7859.45','2019-09-12 17:49:43','1'),
	('COLI000025','CO000013','SKU0025','大瓶可乐0025','5.24','986.40','8594.25','2019-09-05 12:47:04','1'),
	('COLI000026','CO000013','SKU0026','大瓶可乐0026','4.50','964.32','8789.22','2019-09-03 23:18:35','1'),
	('COLI000027','CO000014','SKU0027','大瓶可乐0027','5.14','968.77','7674.58','2019-08-26 14:51:05','1'),
	('COLI000028','CO000014','SKU0028','大瓶可乐0028','4.32','822.47','9771.01','2019-09-10 04:56:43','1'),
	('COLI000029','CO000015','SKU0029','大瓶可乐0029','4.67','759.46','8747.80','2019-09-11 13:12:16','1'),
	('COLI000030','CO000015','SKU0030','大瓶可乐0030','4.45','710.71','7286.74','2019-09-04 22:13:42','1'),
	('COLI000031','CO000016','SKU0031','大瓶可乐0031','4.42','707.76','8720.58','2019-09-05 01:51:20','1'),
	('COLI000032','CO000016','SKU0032','大瓶可乐0032','5.36','922.42','8274.24','2019-08-31 22:31:38','1');

insert into consumer_order_shipping_group_data values
	('COSG000001','送货到刘强家','CO000001','558.00','1'),
	('COSG000002','送货到刘强家0002','CO000001','491.54','1'),
	('COSG000003','送货到刘强家0003','CO000002','507.17','1'),
	('COSG000004','送货到刘强家0004','CO000002','566.74','1'),
	('COSG000005','送货到刘强家0005','CO000003','523.56','1'),
	('COSG000006','送货到刘强家0006','CO000003','597.48','1'),
	('COSG000007','送货到刘强家0007','CO000004','509.60','1'),
	('COSG000008','送货到刘强家0008','CO000004','507.24','1'),
	('COSG000009','送货到刘强家0009','CO000005','590.40','1'),
	('COSG000010','送货到刘强家0010','CO000005','495.65','1'),
	('COSG000011','送货到刘强家0011','CO000006','529.37','1'),
	('COSG000012','送货到刘强家0012','CO000006','432.27','1'),
	('COSG000013','送货到刘强家0013','CO000007','533.74','1'),
	('COSG000014','送货到刘强家0014','CO000007','481.06','1'),
	('COSG000015','送货到刘强家0015','CO000008','429.22','1'),
	('COSG000016','送货到刘强家0016','CO000008','520.45','1'),
	('COSG000017','送货到刘强家0017','CO000009','430.65','1'),
	('COSG000018','送货到刘强家0018','CO000009','472.52','1'),
	('COSG000019','送货到刘强家0019','CO000010','431.15','1'),
	('COSG000020','送货到刘强家0020','CO000010','594.79','1'),
	('COSG000021','送货到刘强家0021','CO000011','492.78','1'),
	('COSG000022','送货到刘强家0022','CO000011','520.55','1'),
	('COSG000023','送货到刘强家0023','CO000012','592.94','1'),
	('COSG000024','送货到刘强家0024','CO000012','455.67','1'),
	('COSG000025','送货到刘强家0025','CO000013','569.42','1'),
	('COSG000026','送货到刘强家0026','CO000013','577.76','1'),
	('COSG000027','送货到刘强家0027','CO000014','536.26','1'),
	('COSG000028','送货到刘强家0028','CO000014','467.68','1'),
	('COSG000029','送货到刘强家0029','CO000015','550.96','1'),
	('COSG000030','送货到刘强家0030','CO000015','564.79','1'),
	('COSG000031','送货到刘强家0031','CO000016','442.22','1'),
	('COSG000032','送货到刘强家0032','CO000016','481.71','1');

insert into consumer_order_payment_group_data values
	('COPG000001','信用卡','CO000001','4111 1111 1111 - ','1'),
	('COPG000002','支付宝','CO000001','4111 1111 1111 - 0002','1'),
	('COPG000003','微信支付','CO000002','4111 1111 1111 - 0003','1'),
	('COPG000004','信用卡','CO000002','4111 1111 1111 - 0004','1'),
	('COPG000005','支付宝','CO000003','4111 1111 1111 - 0005','1'),
	('COPG000006','微信支付','CO000003','4111 1111 1111 - 0006','1'),
	('COPG000007','信用卡','CO000004','4111 1111 1111 - 0007','1'),
	('COPG000008','支付宝','CO000004','4111 1111 1111 - 0008','1'),
	('COPG000009','微信支付','CO000005','4111 1111 1111 - 0009','1'),
	('COPG000010','信用卡','CO000005','4111 1111 1111 - 0010','1'),
	('COPG000011','支付宝','CO000006','4111 1111 1111 - 0011','1'),
	('COPG000012','微信支付','CO000006','4111 1111 1111 - 0012','1'),
	('COPG000013','信用卡','CO000007','4111 1111 1111 - 0013','1'),
	('COPG000014','支付宝','CO000007','4111 1111 1111 - 0014','1'),
	('COPG000015','微信支付','CO000008','4111 1111 1111 - 0015','1'),
	('COPG000016','信用卡','CO000008','4111 1111 1111 - 0016','1'),
	('COPG000017','支付宝','CO000009','4111 1111 1111 - 0017','1'),
	('COPG000018','微信支付','CO000009','4111 1111 1111 - 0018','1'),
	('COPG000019','信用卡','CO000010','4111 1111 1111 - 0019','1'),
	('COPG000020','支付宝','CO000010','4111 1111 1111 - 0020','1'),
	('COPG000021','微信支付','CO000011','4111 1111 1111 - 0021','1'),
	('COPG000022','信用卡','CO000011','4111 1111 1111 - 0022','1'),
	('COPG000023','支付宝','CO000012','4111 1111 1111 - 0023','1'),
	('COPG000024','微信支付','CO000012','4111 1111 1111 - 0024','1'),
	('COPG000025','信用卡','CO000013','4111 1111 1111 - 0025','1'),
	('COPG000026','支付宝','CO000013','4111 1111 1111 - 0026','1'),
	('COPG000027','微信支付','CO000014','4111 1111 1111 - 0027','1'),
	('COPG000028','信用卡','CO000014','4111 1111 1111 - 0028','1'),
	('COPG000029','支付宝','CO000015','4111 1111 1111 - 0029','1'),
	('COPG000030','微信支付','CO000015','4111 1111 1111 - 0030','1'),
	('COPG000031','信用卡','CO000016','4111 1111 1111 - 0031','1'),
	('COPG000032','支付宝','CO000016','4111 1111 1111 - 0032','1');

insert into consumer_order_price_adjustment_data values
	('COPA000001','端午促销','CO000001','504.00','供货商','1'),
	('COPA000002','端午促销0002','CO000001','495.13','小超老板','1'),
	('COPA000003','端午促销0003','CO000002','488.10','广告赞助','1'),
	('COPA000004','端午促销0004','CO000002','448.43','供货商','1'),
	('COPA000005','端午促销0005','CO000003','519.30','小超老板','1'),
	('COPA000006','端午促销0006','CO000003','496.38','广告赞助','1'),
	('COPA000007','端午促销0007','CO000004','556.27','供货商','1'),
	('COPA000008','端午促销0008','CO000004','548.14','小超老板','1'),
	('COPA000009','端午促销0009','CO000005','453.33','广告赞助','1'),
	('COPA000010','端午促销0010','CO000005','544.22','供货商','1'),
	('COPA000011','端午促销0011','CO000006','443.06','小超老板','1'),
	('COPA000012','端午促销0012','CO000006','505.87','广告赞助','1'),
	('COPA000013','端午促销0013','CO000007','433.00','供货商','1'),
	('COPA000014','端午促销0014','CO000007','508.52','小超老板','1'),
	('COPA000015','端午促销0015','CO000008','491.50','广告赞助','1'),
	('COPA000016','端午促销0016','CO000008','497.65','供货商','1'),
	('COPA000017','端午促销0017','CO000009','571.47','小超老板','1'),
	('COPA000018','端午促销0018','CO000009','538.47','广告赞助','1'),
	('COPA000019','端午促销0019','CO000010','507.15','供货商','1'),
	('COPA000020','端午促销0020','CO000010','506.91','小超老板','1'),
	('COPA000021','端午促销0021','CO000011','550.66','广告赞助','1'),
	('COPA000022','端午促销0022','CO000011','425.51','供货商','1'),
	('COPA000023','端午促销0023','CO000012','531.11','小超老板','1'),
	('COPA000024','端午促销0024','CO000012','595.76','广告赞助','1'),
	('COPA000025','端午促销0025','CO000013','442.85','供货商','1'),
	('COPA000026','端午促销0026','CO000013','498.96','小超老板','1'),
	('COPA000027','端午促销0027','CO000014','558.58','广告赞助','1'),
	('COPA000028','端午促销0028','CO000014','437.23','供货商','1'),
	('COPA000029','端午促销0029','CO000015','490.40','小超老板','1'),
	('COPA000030','端午促销0030','CO000015','529.99','广告赞助','1'),
	('COPA000031','端午促销0031','CO000016','464.85','供货商','1'),
	('COPA000032','端午促销0032','CO000016','429.80','小超老板','1');

insert into retail_store_member_coupon_data values
	('RSMC000001','优惠券','RSM000001','CP00001','2019-09-03 02:53:52','1'),
	('RSMC000002','优惠券0002','RSM000001','CP000010002','2019-09-12 02:12:37','1'),
	('RSMC000003','优惠券0003','RSM000002','CP000010003','2019-08-27 09:40:39','1'),
	('RSMC000004','优惠券0004','RSM000002','CP000010004','2019-09-14 10:51:16','1');

insert into member_wishlist_data values
	('MW000001','每周购买清单','RSM000001','1'),
	('MW000002','每月购买清单','RSM000001','1'),
	('MW000003','每周购买清单','RSM000002','1'),
	('MW000004','每月购买清单','RSM000002','1');

insert into member_reward_point_data values
	('MRP000001','购买积分','20','RSM000001','1'),
	('MRP000002','每月购买清单','19','RSM000001','1'),
	('MRP000003','购买积分','18','RSM000002','1'),
	('MRP000004','每月购买清单','19','RSM000002','1');

insert into member_reward_point_redemption_data values
	('MRPR000001','积分换锅','15','RSM000001','1'),
	('MRPR000002','积分换刀','20','RSM000001','1'),
	('MRPR000003','积分换锅','15','RSM000002','1'),
	('MRPR000004','积分换刀','15','RSM000002','1');

insert into member_wishlist_product_data values
	('MWP000001','农夫山泉','MW000001','1'),
	('MWP000002','利箭口香糖','MW000001','1'),
	('MWP000003','农夫山泉','MW000002','1'),
	('MWP000004','利箭口香糖','MW000002','1'),
	('MWP000005','农夫山泉','MW000003','1'),
	('MWP000006','利箭口香糖','MW000003','1'),
	('MWP000007','农夫山泉','MW000004','1'),
	('MWP000008','利箭口香糖','MW000004','1');

insert into retail_store_member_address_data values
	('RSMA000001','家里','RSM000001','18099887766','四川省成都市科学城北路33号','1'),
	('RSMA000002','办公室','RSM000001','13900000002','四川省成都市科学城北路33号0002','1'),
	('RSMA000003','出差临时地址','RSM000002','13900000003','四川省成都市科学城北路33号0003','1'),
	('RSMA000004','家里','RSM000002','13900000004','四川省成都市科学城北路33号0004','1');

insert into retail_store_member_gift_card_data values
	('RSMGC000001','礼品卡','RSM000001','CP00001','187.39','1'),
	('RSMGC000002','礼品卡0002','RSM000001','CP000010002','168.68','1'),
	('RSMGC000003','礼品卡0003','RSM000002','CP000010003','160.73','1'),
	('RSMGC000004','礼品卡0004','RSM000002','CP000010004','175.15','1');

insert into retail_store_member_gift_card_consume_record_data values
	('RSMGCCR000001','2017-09-13','RSMGC000001','CO000001','GF00001','20.63','1'),
	('RSMGCCR000002','2016-09-18','RSMGC000001','CO000001','GF000010002','18.02','1'),
	('RSMGCCR000003','2017-04-18','RSMGC000001','CO000002','GF000010003','19.34','1'),
	('RSMGCCR000004','2019-01-22','RSMGC000001','CO000002','GF000010004','14.75','1'),
	('RSMGCCR000005','2017-07-13','RSMGC000001','CO000003','GF000010005','16.50','1'),
	('RSMGCCR000006','2018-12-26','RSMGC000001','CO000003','GF000010006','18.10','1'),
	('RSMGCCR000007','2019-02-28','RSMGC000001','CO000004','GF000010007','15.50','1'),
	('RSMGCCR000008','2019-07-01','RSMGC000001','CO000004','GF000010008','18.74','1'),
	('RSMGCCR000009','2016-10-03','RSMGC000002','CO000005','GF000010009','15.99','1'),
	('RSMGCCR000010','2017-05-22','RSMGC000002','CO000005','GF000010010','19.85','1'),
	('RSMGCCR000011','2018-11-11','RSMGC000002','CO000006','GF000010011','14.81','1'),
	('RSMGCCR000012','2017-11-07','RSMGC000002','CO000006','GF000010012','16.46','1'),
	('RSMGCCR000013','2018-01-15','RSMGC000002','CO000007','GF000010013','16.31','1'),
	('RSMGCCR000014','2018-09-02','RSMGC000002','CO000007','GF000010014','20.88','1'),
	('RSMGCCR000015','2019-04-10','RSMGC000002','CO000008','GF000010015','18.78','1'),
	('RSMGCCR000016','2017-01-22','RSMGC000002','CO000008','GF000010016','17.55','1'),
	('RSMGCCR000017','2019-03-19','RSMGC000003','CO000009','GF000010017','14.74','1'),
	('RSMGCCR000018','2017-02-16','RSMGC000003','CO000009','GF000010018','18.28','1'),
	('RSMGCCR000019','2018-05-13','RSMGC000003','CO000010','GF000010019','16.38','1'),
	('RSMGCCR000020','2018-03-05','RSMGC000003','CO000010','GF000010020','15.30','1'),
	('RSMGCCR000021','2017-11-14','RSMGC000003','CO000011','GF000010021','18.44','1'),
	('RSMGCCR000022','2019-09-06','RSMGC000003','CO000011','GF000010022','17.17','1'),
	('RSMGCCR000023','2017-12-25','RSMGC000003','CO000012','GF000010023','16.64','1'),
	('RSMGCCR000024','2016-09-23','RSMGC000003','CO000012','GF000010024','16.61','1'),
	('RSMGCCR000025','2017-07-03','RSMGC000004','CO000013','GF000010025','18.61','1'),
	('RSMGCCR000026','2016-11-23','RSMGC000004','CO000013','GF000010026','19.68','1'),
	('RSMGCCR000027','2017-08-03','RSMGC000004','CO000014','GF000010027','19.89','1'),
	('RSMGCCR000028','2019-05-08','RSMGC000004','CO000014','GF000010028','17.08','1'),
	('RSMGCCR000029','2017-03-20','RSMGC000004','CO000015','GF000010029','18.99','1'),
	('RSMGCCR000030','2018-09-24','RSMGC000004','CO000015','GF000010030','20.99','1'),
	('RSMGCCR000031','2017-06-01','RSMGC000004','CO000016','GF000010031','17.20','1'),
	('RSMGCCR000032','2016-10-27','RSMGC000004','CO000016','GF000010032','16.36','1');

insert into goods_supplier_data values
	('GS000001','宝洁','洗护用品','RSCC000001','18677889999','啤酒饮料矿泉水，香肠瓜子方便面都提供','2019-09-09 05:58:46','1'),
	('GS000002','中粮','食品','RSCC000001','13900000002','啤酒饮料矿泉水，香肠瓜子方便面都提供0002','2019-09-01 12:53:01','1');

insert into supplier_product_data values
	('SP000001','黑人牙膏','最好的黑人牙膏，只卖3块喽','件','GS000001','1'),
	('SP000002','黑人牙膏0002','最好的黑人牙膏，只卖3块喽0002','公斤','GS000001','1'),
	('SP000003','黑人牙膏0003','最好的黑人牙膏，只卖3块喽0003','米','GS000002','1'),
	('SP000004','黑人牙膏0004','最好的黑人牙膏，只卖3块喽0004','件','GS000002','1');

insert into product_supply_duration_data values
	('PSD000001','100','现货','7085.26','SP000001','1'),
	('PSD000002','200','两天','8868.58','SP000001','1'),
	('PSD000003','500','三天','9371.33','SP000002','1'),
	('PSD000004','100','一周','8247.52','SP000002','1'),
	('PSD000005','200','现货','8248.70','SP000003','1'),
	('PSD000006','500','两天','7792.62','SP000003','1'),
	('PSD000007','100','三天','9186.59','SP000004','1'),
	('PSD000008','200','一周','7791.88','SP000004','1');

insert into supply_order_data values
	('SO000001','RSCC000001','GS000001','双链给供货商下的订单','2282789632.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-08-24 06:35:17','CONFIRMED','1'),
	('SO000002','RSCC000001','GS000001','双链给供货商下的订单0002','2214044416.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-05 09:57:49','APPROVED','1'),
	('SO000003','RSCC000001','GS000002','双链给供货商下的订单0003','2155442432.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-08-31 20:52:57','PROCESSED','1'),
	('SO000004','RSCC000001','GS000002','双链给供货商下的订单0004','2398494464.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-08 21:58:04','PICKED','1');

insert into supply_order_confirmation_data values
	('SOC000001','确认者','2018-01-28','1');

insert into supply_order_approval_data values
	('SOA000001','批准者','2017-01-20','1');

insert into supply_order_processing_data values
	('SOP000001','处理者','2018-05-15','1');

insert into supply_order_picking_data values
	('SOP000001','处理者','2019-06-18','1');

insert into supply_order_shipment_data values
	('SOS000001','运货者','2017-01-21','1');

insert into supply_order_delivery_data values
	('SOD000001','送货者','2018-02-17','1');

insert into supply_order_line_item_data values
	('SOLI000001','SO000001','SKU','大瓶可乐','5.16','8092','件','1'),
	('SOLI000002','SO000001','SKU0002','大瓶可乐0002','4.27','9406','公斤','1'),
	('SOLI000003','SO000002','SKU0003','大瓶可乐0003','5.09','8641','米','1'),
	('SOLI000004','SO000002','SKU0004','大瓶可乐0004','4.40','7279','件','1'),
	('SOLI000005','SO000003','SKU0005','大瓶可乐0005','5.42','9654','公斤','1'),
	('SOLI000006','SO000003','SKU0006','大瓶可乐0006','5.06','9777','米','1'),
	('SOLI000007','SO000004','SKU0007','大瓶可乐0007','4.59','9514','件','1'),
	('SOLI000008','SO000004','SKU0008','大瓶可乐0008','4.73','7473','公斤','1');

insert into supply_order_shipping_group_data values
	('SOSG000001','送货到双链成都2号仓','SO000001','4.87','1'),
	('SOSG000002','送货到双链成都2号仓0002','SO000001','5.61','1'),
	('SOSG000003','送货到双链成都2号仓0003','SO000002','4.93','1'),
	('SOSG000004','送货到双链成都2号仓0004','SO000002','4.84','1'),
	('SOSG000005','送货到双链成都2号仓0005','SO000003','4.83','1'),
	('SOSG000006','送货到双链成都2号仓0006','SO000003','4.62','1'),
	('SOSG000007','送货到双链成都2号仓0007','SO000004','4.54','1'),
	('SOSG000008','送货到双链成都2号仓0008','SO000004','5.13','1');

insert into supply_order_payment_group_data values
	('SOPG000001','付款办法','SO000001','4111 1111 1111 - ','1'),
	('SOPG000002','付款办法0002','SO000001','4111 1111 1111 - 0002','1'),
	('SOPG000003','付款办法0003','SO000002','4111 1111 1111 - 0003','1'),
	('SOPG000004','付款办法0004','SO000002','4111 1111 1111 - 0004','1'),
	('SOPG000005','付款办法0005','SO000003','4111 1111 1111 - 0005','1'),
	('SOPG000006','付款办法0006','SO000003','4111 1111 1111 - 0006','1'),
	('SOPG000007','付款办法0007','SO000004','4111 1111 1111 - 0007','1'),
	('SOPG000008','付款办法0008','SO000004','4111 1111 1111 - 0008','1');

insert into retail_store_order_data values
	('RSO000001','RS000001','RSCC000001','双链小超给双链供应链下的订单','2313548800.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-08 13:05:44','CONFIRMED','1'),
	('RSO000002','RS000001','RSCC000001','双链小超给双链供应链下的订单0002','2454572032.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-09 19:12:37','APPROVED','1'),
	('RSO000003','RS000002','RSCC000001','双链小超给双链供应链下的订单0003','2933021952.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-03 06:25:39','PROCESSED','1'),
	('RSO000004','RS000002','RSCC000001','双链小超给双链供应链下的订单0004','2261172736.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-01 16:07:01','PICKED','1'),
	('RSO000005','RS000003','RSCC000001','双链小超给双链供应链下的订单0005','2799236864.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-08-30 07:25:02','SHIPPED','1'),
	('RSO000006','RS000003','RSCC000001','双链小超给双链供应链下的订单0006','2988574208.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-08-25 09:37:12','DELIVERED','1'),
	('RSO000007','RS000004','RSCC000001','双链小超给双链供应链下的订单0007','2330001664.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-10 04:33:09','CONFIRMED','1'),
	('RSO000008','RS000004','RSCC000001','双链小超给双链供应链下的订单0008','2538270976.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-03 21:42:58','APPROVED','1'),
	('RSO000009','RS000005','RSCC000001','双链小超给双链供应链下的订单0009','2253729024.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-05 10:33:57','PROCESSED','1'),
	('RSO000010','RS000005','RSCC000001','双链小超给双链供应链下的订单0010','2421752576.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-07 04:36:25','PICKED','1'),
	('RSO000011','RS000006','RSCC000001','双链小超给双链供应链下的订单0011','2197929472.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-05 01:07:31','SHIPPED','1'),
	('RSO000012','RS000006','RSCC000001','双链小超给双链供应链下的订单0012','2176296960.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-11 04:25:00','DELIVERED','1'),
	('RSO000013','RS000007','RSCC000001','双链小超给双链供应链下的订单0013','2454264832.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-08-26 13:35:54','CONFIRMED','1'),
	('RSO000014','RS000007','RSCC000001','双链小超给双链供应链下的订单0014','2712167168.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-14 17:20:07','APPROVED','1'),
	('RSO000015','RS000008','RSCC000001','双链小超给双链供应链下的订单0015','2429629952.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-08-31 09:22:23','PROCESSED','1'),
	('RSO000016','RS000008','RSCC000001','双链小超给双链供应链下的订单0016','2252976896.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-02 09:33:20','PICKED','1');

insert into retail_store_order_confirmation_data values
	('RSOC000001','确认者','2016-11-19','1');

insert into retail_store_order_approval_data values
	('RSOA000001','批准者','2019-07-08','1');

insert into retail_store_order_processing_data values
	('RSOP000001','处理者','2017-02-19','1');

insert into retail_store_order_picking_data values
	('RSOP000001','处理者','2018-02-20','1');

insert into retail_store_order_shipment_data values
	('RSOS000001','运货者','2018-11-06','1');

insert into retail_store_order_delivery_data values
	('RSOD000001','送货者','2019-06-17','1');

insert into retail_store_order_line_item_data values
	('RSOLI000001','RSO000001','SKU','大瓶可乐','3.64','7062','件','1'),
	('RSOLI000002','RSO000001','SKU0002','大瓶可乐0002','2.88','9589','公斤','1'),
	('RSOLI000003','RSO000002','SKU0003','大瓶可乐0003','3.94','8767','米','1'),
	('RSOLI000004','RSO000002','SKU0004','大瓶可乐0004','3.01','8206','件','1'),
	('RSOLI000005','RSO000003','SKU0005','大瓶可乐0005','3.29','9547','公斤','1'),
	('RSOLI000006','RSO000003','SKU0006','大瓶可乐0006','3.27','8151','米','1'),
	('RSOLI000007','RSO000004','SKU0007','大瓶可乐0007','3.59','8869','件','1'),
	('RSOLI000008','RSO000004','SKU0008','大瓶可乐0008','3.01','8869','公斤','1'),
	('RSOLI000009','RSO000005','SKU0009','大瓶可乐0009','3.91','8119','米','1'),
	('RSOLI000010','RSO000005','SKU0010','大瓶可乐0010','2.83','9655','件','1'),
	('RSOLI000011','RSO000006','SKU0011','大瓶可乐0011','3.16','8892','公斤','1'),
	('RSOLI000012','RSO000006','SKU0012','大瓶可乐0012','3.07','8751','米','1'),
	('RSOLI000013','RSO000007','SKU0013','大瓶可乐0013','3.23','8893','件','1'),
	('RSOLI000014','RSO000007','SKU0014','大瓶可乐0014','3.74','7160','公斤','1'),
	('RSOLI000015','RSO000008','SKU0015','大瓶可乐0015','3.46','9827','米','1'),
	('RSOLI000016','RSO000008','SKU0016','大瓶可乐0016','3.60','9239','件','1'),
	('RSOLI000017','RSO000009','SKU0017','大瓶可乐0017','3.22','8131','公斤','1'),
	('RSOLI000018','RSO000009','SKU0018','大瓶可乐0018','3.21','9532','米','1'),
	('RSOLI000019','RSO000010','SKU0019','大瓶可乐0019','3.86','9971','件','1'),
	('RSOLI000020','RSO000010','SKU0020','大瓶可乐0020','2.87','8111','公斤','1'),
	('RSOLI000021','RSO000011','SKU0021','大瓶可乐0021','3.05','8213','米','1'),
	('RSOLI000022','RSO000011','SKU0022','大瓶可乐0022','3.79','9892','件','1'),
	('RSOLI000023','RSO000012','SKU0023','大瓶可乐0023','2.85','7439','公斤','1'),
	('RSOLI000024','RSO000012','SKU0024','大瓶可乐0024','3.76','7022','米','1'),
	('RSOLI000025','RSO000013','SKU0025','大瓶可乐0025','2.78','7234','件','1'),
	('RSOLI000026','RSO000013','SKU0026','大瓶可乐0026','3.61','9423','公斤','1'),
	('RSOLI000027','RSO000014','SKU0027','大瓶可乐0027','3.26','8064','米','1'),
	('RSOLI000028','RSO000014','SKU0028','大瓶可乐0028','2.99','7045','件','1'),
	('RSOLI000029','RSO000015','SKU0029','大瓶可乐0029','3.15','9098','公斤','1'),
	('RSOLI000030','RSO000015','SKU0030','大瓶可乐0030','3.61','8195','米','1'),
	('RSOLI000031','RSO000016','SKU0031','大瓶可乐0031','3.88','7207','件','1'),
	('RSOLI000032','RSO000016','SKU0032','大瓶可乐0032','3.28','8526','公斤','1');

insert into retail_store_order_shipping_group_data values
	('RSOSG000001','送货到双链中和社区店','RSO000001','5.12','1'),
	('RSOSG000002','送货到双链中和社区店0002','RSO000001','4.32','1'),
	('RSOSG000003','送货到双链中和社区店0003','RSO000002','4.78','1'),
	('RSOSG000004','送货到双链中和社区店0004','RSO000002','5.37','1'),
	('RSOSG000005','送货到双链中和社区店0005','RSO000003','4.38','1'),
	('RSOSG000006','送货到双链中和社区店0006','RSO000003','5.50','1'),
	('RSOSG000007','送货到双链中和社区店0007','RSO000004','4.64','1'),
	('RSOSG000008','送货到双链中和社区店0008','RSO000004','5.89','1'),
	('RSOSG000009','送货到双链中和社区店0009','RSO000005','4.90','1'),
	('RSOSG000010','送货到双链中和社区店0010','RSO000005','4.88','1'),
	('RSOSG000011','送货到双链中和社区店0011','RSO000006','4.35','1'),
	('RSOSG000012','送货到双链中和社区店0012','RSO000006','4.22','1'),
	('RSOSG000013','送货到双链中和社区店0013','RSO000007','5.90','1'),
	('RSOSG000014','送货到双链中和社区店0014','RSO000007','5.58','1'),
	('RSOSG000015','送货到双链中和社区店0015','RSO000008','5.80','1'),
	('RSOSG000016','送货到双链中和社区店0016','RSO000008','4.68','1'),
	('RSOSG000017','送货到双链中和社区店0017','RSO000009','5.08','1'),
	('RSOSG000018','送货到双链中和社区店0018','RSO000009','4.74','1'),
	('RSOSG000019','送货到双链中和社区店0019','RSO000010','4.65','1'),
	('RSOSG000020','送货到双链中和社区店0020','RSO000010','4.71','1'),
	('RSOSG000021','送货到双链中和社区店0021','RSO000011','4.26','1'),
	('RSOSG000022','送货到双链中和社区店0022','RSO000011','5.88','1'),
	('RSOSG000023','送货到双链中和社区店0023','RSO000012','4.80','1'),
	('RSOSG000024','送货到双链中和社区店0024','RSO000012','4.73','1'),
	('RSOSG000025','送货到双链中和社区店0025','RSO000013','5.62','1'),
	('RSOSG000026','送货到双链中和社区店0026','RSO000013','5.73','1'),
	('RSOSG000027','送货到双链中和社区店0027','RSO000014','4.69','1'),
	('RSOSG000028','送货到双链中和社区店0028','RSO000014','4.53','1'),
	('RSOSG000029','送货到双链中和社区店0029','RSO000015','4.62','1'),
	('RSOSG000030','送货到双链中和社区店0030','RSO000015','4.85','1'),
	('RSOSG000031','送货到双链中和社区店0031','RSO000016','5.36','1'),
	('RSOSG000032','送货到双链中和社区店0032','RSO000016','5.65','1');

insert into retail_store_order_payment_group_data values
	('RSOPG000001','付款办法','RSO000001','4111 1111 1111 - ','1'),
	('RSOPG000002','付款办法0002','RSO000001','4111 1111 1111 - 0002','1'),
	('RSOPG000003','付款办法0003','RSO000002','4111 1111 1111 - 0003','1'),
	('RSOPG000004','付款办法0004','RSO000002','4111 1111 1111 - 0004','1'),
	('RSOPG000005','付款办法0005','RSO000003','4111 1111 1111 - 0005','1'),
	('RSOPG000006','付款办法0006','RSO000003','4111 1111 1111 - 0006','1'),
	('RSOPG000007','付款办法0007','RSO000004','4111 1111 1111 - 0007','1'),
	('RSOPG000008','付款办法0008','RSO000004','4111 1111 1111 - 0008','1'),
	('RSOPG000009','付款办法0009','RSO000005','4111 1111 1111 - 0009','1'),
	('RSOPG000010','付款办法0010','RSO000005','4111 1111 1111 - 0010','1'),
	('RSOPG000011','付款办法0011','RSO000006','4111 1111 1111 - 0011','1'),
	('RSOPG000012','付款办法0012','RSO000006','4111 1111 1111 - 0012','1'),
	('RSOPG000013','付款办法0013','RSO000007','4111 1111 1111 - 0013','1'),
	('RSOPG000014','付款办法0014','RSO000007','4111 1111 1111 - 0014','1'),
	('RSOPG000015','付款办法0015','RSO000008','4111 1111 1111 - 0015','1'),
	('RSOPG000016','付款办法0016','RSO000008','4111 1111 1111 - 0016','1'),
	('RSOPG000017','付款办法0017','RSO000009','4111 1111 1111 - 0017','1'),
	('RSOPG000018','付款办法0018','RSO000009','4111 1111 1111 - 0018','1'),
	('RSOPG000019','付款办法0019','RSO000010','4111 1111 1111 - 0019','1'),
	('RSOPG000020','付款办法0020','RSO000010','4111 1111 1111 - 0020','1'),
	('RSOPG000021','付款办法0021','RSO000011','4111 1111 1111 - 0021','1'),
	('RSOPG000022','付款办法0022','RSO000011','4111 1111 1111 - 0022','1'),
	('RSOPG000023','付款办法0023','RSO000012','4111 1111 1111 - 0023','1'),
	('RSOPG000024','付款办法0024','RSO000012','4111 1111 1111 - 0024','1'),
	('RSOPG000025','付款办法0025','RSO000013','4111 1111 1111 - 0025','1'),
	('RSOPG000026','付款办法0026','RSO000013','4111 1111 1111 - 0026','1'),
	('RSOPG000027','付款办法0027','RSO000014','4111 1111 1111 - 0027','1'),
	('RSOPG000028','付款办法0028','RSO000014','4111 1111 1111 - 0028','1'),
	('RSOPG000029','付款办法0029','RSO000015','4111 1111 1111 - 0029','1'),
	('RSOPG000030','付款办法0030','RSO000015','4111 1111 1111 - 0030','1'),
	('RSOPG000031','付款办法0031','RSO000016','4111 1111 1111 - 0031','1'),
	('RSOPG000032','付款办法0032','RSO000016','4111 1111 1111 - 0032','1');

insert into warehouse_data values
	('W000001','成都龙泉驿飞鹤路20号','02887654321','187672平方米','RSCC000001','41.89095996681704','130.71563187817284','2019-08-28 01:33:27','1'),
	('W000002','成都龙泉驿飞鹤路20号0002','028876543210002','187672平方米0002','RSCC000001','39.87550318767398','130.8424349329592','2019-08-31 01:07:17','1');

insert into storage_space_data values
	('SS000001','成都龙泉驿飞鹤路20号存货区','02887654321','1876平方米','W000001','41.649167168593024','130.94703917568054','2019-08-28 07:44:43','1'),
	('SS000002','成都龙泉驿飞鹤路20号存货区0002','028876543210002','1876平方米0002','W000001','40.92595152703634','131.81982349624818','2019-09-11 18:14:10','1'),
	('SS000003','成都龙泉驿飞鹤路20号存货区0003','028876543210003','1876平方米0003','W000002','40.422441945053016','131.79692387217503','2019-09-03 06:20:55','1'),
	('SS000004','成都龙泉驿飞鹤路20号存货区0004','028876543210004','1876平方米0004','W000002','41.41578743661397','129.4933665321585','2019-08-26 22:36:03','1');

insert into smart_pallet_data values
	('SP000001','成都龙泉驿飞鹤路20号移动区域，比如过道，货运通道等','02887654321','1876平方米','41.9435599473044','131.73556853636484','W000001','2019-09-06 04:30:12','1'),
	('SP000002','成都龙泉驿飞鹤路20号移动区域，比如过道，货运通道等0002','028876543210002','1876平方米0002','41.00334082357977','130.68791833532342','W000001','2019-08-26 00:22:05','1'),
	('SP000003','成都龙泉驿飞鹤路20号移动区域，比如过道，货运通道等0003','028876543210003','1876平方米0003','39.845882760219276','129.90238610664068','W000002','2019-09-11 13:14:36','1'),
	('SP000004','成都龙泉驿飞鹤路20号移动区域，比如过道，货运通道等0004','028876543210004','1876平方米0004','41.17765579861611','130.07156945481216','W000002','2019-09-04 03:09:56','1');

insert into goods_shelf_data values
	('GS000001','成都龙泉驿飞鹤路20号存货区货架','SS000001','SS000001','DS000001','2019-09-13 19:36:07','1'),
	('GS000002','成都龙泉驿飞鹤路20号存货区货架0002','SS000001','SS000001','DS000001','2019-08-27 16:32:40','1'),
	('GS000003','成都龙泉驿飞鹤路20号存货区货架0003','SS000002','SS000002','DS000002','2019-09-03 17:54:10','1'),
	('GS000004','成都龙泉驿飞鹤路20号存货区货架0004','SS000002','SS000002','DS000002','2019-09-11 03:16:42','1'),
	('GS000005','成都龙泉驿飞鹤路20号存货区货架0005','SS000003','SS000003','DS000003','2019-08-27 00:26:06','1'),
	('GS000006','成都龙泉驿飞鹤路20号存货区货架0006','SS000003','SS000003','DS000003','2019-08-31 19:40:10','1'),
	('GS000007','成都龙泉驿飞鹤路20号存货区货架0007','SS000004','SS000004','DS000004','2019-09-06 00:35:21','1'),
	('GS000008','成都龙泉驿飞鹤路20号存货区货架0008','SS000004','SS000004','DS000004','2019-08-28 15:17:23','1');

insert into goods_shelf_stock_count_data values
	('GSSC000001','每日盘点','2016-10-08','使用先进的rfid技术，没有任何错误','GS000001','1'),
	('GSSC000002','每周盘点','2018-07-12','使用先进的rfid技术，没有任何错误0002','GS000001','1'),
	('GSSC000003','每月盘点','2017-12-03','使用先进的rfid技术，没有任何错误0003','GS000002','1'),
	('GSSC000004','年终盘点','2016-09-20','使用先进的rfid技术，没有任何错误0004','GS000002','1'),
	('GSSC000005','每日盘点','2018-05-13','使用先进的rfid技术，没有任何错误0005','GS000003','1'),
	('GSSC000006','每周盘点','2017-08-24','使用先进的rfid技术，没有任何错误0006','GS000003','1'),
	('GSSC000007','每月盘点','2017-05-18','使用先进的rfid技术，没有任何错误0007','GS000004','1'),
	('GSSC000008','年终盘点','2016-10-07','使用先进的rfid技术，没有任何错误0008','GS000004','1'),
	('GSSC000009','每日盘点','2018-01-14','使用先进的rfid技术，没有任何错误0009','GS000005','1'),
	('GSSC000010','每周盘点','2019-04-01','使用先进的rfid技术，没有任何错误0010','GS000005','1'),
	('GSSC000011','每月盘点','2017-03-22','使用先进的rfid技术，没有任何错误0011','GS000006','1'),
	('GSSC000012','年终盘点','2018-09-27','使用先进的rfid技术，没有任何错误0012','GS000006','1'),
	('GSSC000013','每日盘点','2016-12-01','使用先进的rfid技术，没有任何错误0013','GS000007','1'),
	('GSSC000014','每周盘点','2016-12-12','使用先进的rfid技术，没有任何错误0014','GS000007','1'),
	('GSSC000015','每月盘点','2018-02-24','使用先进的rfid技术，没有任何错误0015','GS000008','1'),
	('GSSC000016','年终盘点','2017-12-17','使用先进的rfid技术，没有任何错误0016','GS000008','1');

insert into stock_count_issue_track_data values
	('SCIT000001','盘点差错','2018-01-30','发现错误已经修正完成','GSSC000001','1'),
	('SCIT000002','盘点差错0002','2019-07-05','发现错误已经修正完成0002','GSSC000001','1'),
	('SCIT000003','盘点差错0003','2019-06-03','发现错误已经修正完成0003','GSSC000002','1'),
	('SCIT000004','盘点差错0004','2019-03-31','发现错误已经修正完成0004','GSSC000002','1'),
	('SCIT000005','盘点差错0005','2017-06-24','发现错误已经修正完成0005','GSSC000003','1'),
	('SCIT000006','盘点差错0006','2018-07-23','发现错误已经修正完成0006','GSSC000003','1'),
	('SCIT000007','盘点差错0007','2018-11-27','发现错误已经修正完成0007','GSSC000004','1'),
	('SCIT000008','盘点差错0008','2018-08-12','发现错误已经修正完成0008','GSSC000004','1'),
	('SCIT000009','盘点差错0009','2019-04-23','发现错误已经修正完成0009','GSSC000005','1'),
	('SCIT000010','盘点差错0010','2018-01-04','发现错误已经修正完成0010','GSSC000005','1'),
	('SCIT000011','盘点差错0011','2018-09-23','发现错误已经修正完成0011','GSSC000006','1'),
	('SCIT000012','盘点差错0012','2018-10-02','发现错误已经修正完成0012','GSSC000006','1'),
	('SCIT000013','盘点差错0013','2018-05-19','发现错误已经修正完成0013','GSSC000007','1'),
	('SCIT000014','盘点差错0014','2019-09-10','发现错误已经修正完成0014','GSSC000007','1'),
	('SCIT000015','盘点差错0015','2018-05-29','发现错误已经修正完成0015','GSSC000008','1'),
	('SCIT000016','盘点差错0016','2018-03-04','发现错误已经修正完成0016','GSSC000008','1'),
	('SCIT000017','盘点差错0017','2017-09-15','发现错误已经修正完成0017','GSSC000009','1'),
	('SCIT000018','盘点差错0018','2019-09-02','发现错误已经修正完成0018','GSSC000009','1'),
	('SCIT000019','盘点差错0019','2017-07-31','发现错误已经修正完成0019','GSSC000010','1'),
	('SCIT000020','盘点差错0020','2017-08-25','发现错误已经修正完成0020','GSSC000010','1'),
	('SCIT000021','盘点差错0021','2018-03-14','发现错误已经修正完成0021','GSSC000011','1'),
	('SCIT000022','盘点差错0022','2018-09-11','发现错误已经修正完成0022','GSSC000011','1'),
	('SCIT000023','盘点差错0023','2018-02-28','发现错误已经修正完成0023','GSSC000012','1'),
	('SCIT000024','盘点差错0024','2017-04-04','发现错误已经修正完成0024','GSSC000012','1'),
	('SCIT000025','盘点差错0025','2017-10-29','发现错误已经修正完成0025','GSSC000013','1'),
	('SCIT000026','盘点差错0026','2018-07-01','发现错误已经修正完成0026','GSSC000013','1'),
	('SCIT000027','盘点差错0027','2018-10-03','发现错误已经修正完成0027','GSSC000014','1'),
	('SCIT000028','盘点差错0028','2018-02-17','发现错误已经修正完成0028','GSSC000014','1'),
	('SCIT000029','盘点差错0029','2017-10-29','发现错误已经修正完成0029','GSSC000015','1'),
	('SCIT000030','盘点差错0030','2017-09-14','发现错误已经修正完成0030','GSSC000015','1'),
	('SCIT000031','盘点差错0031','2017-06-16','发现错误已经修正完成0031','GSSC000016','1'),
	('SCIT000032','盘点差错0032','2017-11-22','发现错误已经修正完成0032','GSSC000016','1');

insert into goods_allocation_data values
	('GA000001','成都龙泉驿飞鹤路20号存货区货架20号货位','41.856657548138365','132.19309541484043','GS000001','1'),
	('GA000002','成都龙泉驿飞鹤路20号存货区货架20号货位0002','39.967511622161865','130.42334156149997','GS000001','1'),
	('GA000003','成都龙泉驿飞鹤路20号存货区货架20号货位0003','40.396611707047064','132.0406882630943','GS000002','1'),
	('GA000004','成都龙泉驿飞鹤路20号存货区货架20号货位0004','40.51385334179989','129.58484662292895','GS000002','1'),
	('GA000005','成都龙泉驿飞鹤路20号存货区货架20号货位0005','42.078158065626006','130.74332131071094','GS000003','1'),
	('GA000006','成都龙泉驿飞鹤路20号存货区货架20号货位0006','40.86781252018436','130.72242283757467','GS000003','1'),
	('GA000007','成都龙泉驿飞鹤路20号存货区货架20号货位0007','42.77219162278647','129.98943322585635','GS000004','1'),
	('GA000008','成都龙泉驿飞鹤路20号存货区货架20号货位0008','41.04140087484862','132.1488193438475','GS000004','1'),
	('GA000009','成都龙泉驿飞鹤路20号存货区货架20号货位0009','42.30230876996303','131.02939200016266','GS000005','1'),
	('GA000010','成都龙泉驿飞鹤路20号存货区货架20号货位0010','41.777576917778745','132.04293458697242','GS000005','1'),
	('GA000011','成都龙泉驿飞鹤路20号存货区货架20号货位0011','41.50093659618896','130.32005533396756','GS000006','1'),
	('GA000012','成都龙泉驿飞鹤路20号存货区货架20号货位0012','41.86628260819452','129.74972806935796','GS000006','1'),
	('GA000013','成都龙泉驿飞鹤路20号存货区货架20号货位0013','42.03621540254997','131.23091079699373','GS000007','1'),
	('GA000014','成都龙泉驿飞鹤路20号存货区货架20号货位0014','41.57039205575881','131.9953950788851','GS000007','1'),
	('GA000015','成都龙泉驿飞鹤路20号存货区货架20号货位0015','41.415246126983455','131.76012910623137','GS000008','1'),
	('GA000016','成都龙泉驿飞鹤路20号存货区货架20号货位0016','42.470989153067194','129.61604048429217','GS000008','1');

insert into goods_data values
	('G000001','可口可乐','RF99192','件','10','2018-12-18','S000001','RS000001','GA000001','SP000001','SS000001','TT000001','RS000001','SO000001','RSO000001',NULL,'PACKED','1'),
	('G000002','可口可乐0002','RF991920002','箱','8','2017-07-29','S000001','RS000001','GA000001','SP000001','SS000001','TT000001','RS000001','SO000001','RSO000001',NULL,'PACKED0002','1'),
	('G000003','可口可乐0003','RF991920003','件','10','2017-09-11','S000002','RS000001','GA000001','SP000001','SS000001','TT000001','RS000001','SO000001','RSO000001',NULL,'PACKED0003','1'),
	('G000004','可口可乐0004','RF991920004','箱','9','2017-11-10','S000002','RS000001','GA000001','SP000001','SS000001','TT000001','RS000001','SO000001','RSO000001',NULL,'PACKED0004','1'),
	('G000005','可口可乐0005','RF991920005','件','9','2018-11-03','S000003','RS000001','GA000001','SP000001','SS000001','TT000001','RS000001','SO000001','RSO000001',NULL,'PACKED0005','1'),
	('G000006','可口可乐0006','RF991920006','箱','8','2016-11-08','S000003','RS000001','GA000001','SP000001','SS000001','TT000001','RS000001','SO000001','RSO000001',NULL,'PACKED0006','1'),
	('G000007','可口可乐0007','RF991920007','件','10','2017-03-08','S000004','RS000001','GA000001','SP000001','SS000001','TT000001','RS000001','SO000001','RSO000001',NULL,'PACKED0007','1'),
	('G000008','可口可乐0008','RF991920008','箱','9','2018-09-04','S000004','RS000001','GA000001','SP000001','SS000001','TT000001','RS000001','SO000001','RSO000001',NULL,'PACKED0008','1'),
	('G000009','可口可乐0009','RF991920009','件','8','2017-12-10','S000005','RS000001','GA000002','SP000001','SS000001','TT000002','RS000001','SO000001','RSO000002',NULL,'PACKED0009','1'),
	('G000010','可口可乐0010','RF991920010','箱','10','2018-04-04','S000005','RS000001','GA000002','SP000001','SS000001','TT000002','RS000001','SO000001','RSO000002',NULL,'PACKED0010','1'),
	('G000011','可口可乐0011','RF991920011','件','8','2019-02-11','S000006','RS000001','GA000002','SP000001','SS000001','TT000002','RS000001','SO000001','RSO000002',NULL,'PACKED0011','1'),
	('G000012','可口可乐0012','RF991920012','箱','8','2018-12-24','S000006','RS000001','GA000002','SP000001','SS000001','TT000002','RS000001','SO000001','RSO000002',NULL,'PACKED0012','1'),
	('G000013','可口可乐0013','RF991920013','件','9','2017-10-12','S000007','RS000001','GA000002','SP000001','SS000001','TT000002','RS000001','SO000001','RSO000002',NULL,'PACKED0013','1'),
	('G000014','可口可乐0014','RF991920014','箱','8','2018-03-05','S000007','RS000001','GA000002','SP000001','SS000001','TT000002','RS000001','SO000001','RSO000002',NULL,'PACKED0014','1'),
	('G000015','可口可乐0015','RF991920015','件','8','2018-07-10','S000008','RS000001','GA000002','SP000001','SS000001','TT000002','RS000001','SO000001','RSO000002',NULL,'PACKED0015','1'),
	('G000016','可口可乐0016','RF991920016','箱','8','2019-08-01','S000008','RS000001','GA000002','SP000001','SS000001','TT000002','RS000001','SO000001','RSO000002',NULL,'PACKED0016','1'),
	('G000017','可口可乐0017','RF991920017','件','9','2019-03-01','S000009','RS000001','GA000003','SP000001','SS000001','TT000003','RS000002','SO000001','RSO000003',NULL,'PACKED0017','1'),
	('G000018','可口可乐0018','RF991920018','箱','10','2018-07-09','S000009','RS000001','GA000003','SP000001','SS000001','TT000003','RS000002','SO000001','RSO000003',NULL,'PACKED0018','1'),
	('G000019','可口可乐0019','RF991920019','件','8','2016-10-10','S000010','RS000001','GA000003','SP000001','SS000001','TT000003','RS000002','SO000001','RSO000003',NULL,'PACKED0019','1'),
	('G000020','可口可乐0020','RF991920020','箱','9','2016-12-16','S000010','RS000001','GA000003','SP000001','SS000001','TT000003','RS000002','SO000001','RSO000003',NULL,'PACKED0020','1'),
	('G000021','可口可乐0021','RF991920021','件','8','2017-01-22','S000011','RS000001','GA000003','SP000001','SS000001','TT000003','RS000002','SO000001','RSO000003',NULL,'PACKED0021','1'),
	('G000022','可口可乐0022','RF991920022','箱','8','2018-07-15','S000011','RS000001','GA000003','SP000001','SS000001','TT000003','RS000002','SO000001','RSO000003',NULL,'PACKED0022','1'),
	('G000023','可口可乐0023','RF991920023','件','10','2017-03-05','S000012','RS000001','GA000003','SP000001','SS000001','TT000003','RS000002','SO000001','RSO000003',NULL,'PACKED0023','1'),
	('G000024','可口可乐0024','RF991920024','箱','10','2017-03-06','S000012','RS000001','GA000003','SP000001','SS000001','TT000003','RS000002','SO000001','RSO000003',NULL,'PACKED0024','1'),
	('G000025','可口可乐0025','RF991920025','件','8','2019-05-25','S000013','RS000001','GA000004','SP000001','SS000001','TT000004','RS000002','SO000001','RSO000004',NULL,'PACKED0025','1'),
	('G000026','可口可乐0026','RF991920026','箱','9','2017-12-02','S000013','RS000001','GA000004','SP000001','SS000001','TT000004','RS000002','SO000001','RSO000004',NULL,'PACKED0026','1'),
	('G000027','可口可乐0027','RF991920027','件','9','2018-03-18','S000014','RS000001','GA000004','SP000001','SS000001','TT000004','RS000002','SO000001','RSO000004',NULL,'PACKED0027','1'),
	('G000028','可口可乐0028','RF991920028','箱','8','2018-07-20','S000014','RS000001','GA000004','SP000001','SS000001','TT000004','RS000002','SO000001','RSO000004',NULL,'PACKED0028','1'),
	('G000029','可口可乐0029','RF991920029','件','8','2017-11-26','S000015','RS000001','GA000004','SP000001','SS000001','TT000004','RS000002','SO000001','RSO000004',NULL,'PACKED0029','1'),
	('G000030','可口可乐0030','RF991920030','箱','10','2019-08-15','S000015','RS000001','GA000004','SP000001','SS000001','TT000004','RS000002','SO000001','RSO000004',NULL,'PACKED0030','1'),
	('G000031','可口可乐0031','RF991920031','件','10','2017-01-15','S000016','RS000001','GA000004','SP000001','SS000001','TT000004','RS000002','SO000001','RSO000004',NULL,'PACKED0031','1'),
	('G000032','可口可乐0032','RF991920032','箱','8','2017-08-29','S000016','RS000001','GA000004','SP000001','SS000001','TT000004','RS000002','SO000001','RSO000004',NULL,'PACKED0032','1'),
	('G000033','可口可乐0033','RF991920033','件','8','2017-01-19','S000017','RS000002','GA000005','SP000002','SS000002','TT000005','RS000003','SO000002','RSO000005',NULL,'PACKED0033','1'),
	('G000034','可口可乐0034','RF991920034','箱','9','2018-07-10','S000017','RS000002','GA000005','SP000002','SS000002','TT000005','RS000003','SO000002','RSO000005',NULL,'PACKED0034','1'),
	('G000035','可口可乐0035','RF991920035','件','10','2018-07-04','S000018','RS000002','GA000005','SP000002','SS000002','TT000005','RS000003','SO000002','RSO000005',NULL,'PACKED0035','1'),
	('G000036','可口可乐0036','RF991920036','箱','10','2019-05-09','S000018','RS000002','GA000005','SP000002','SS000002','TT000005','RS000003','SO000002','RSO000005',NULL,'PACKED0036','1'),
	('G000037','可口可乐0037','RF991920037','件','10','2017-09-12','S000019','RS000002','GA000005','SP000002','SS000002','TT000005','RS000003','SO000002','RSO000005',NULL,'PACKED0037','1'),
	('G000038','可口可乐0038','RF991920038','箱','9','2016-10-18','S000019','RS000002','GA000005','SP000002','SS000002','TT000005','RS000003','SO000002','RSO000005',NULL,'PACKED0038','1'),
	('G000039','可口可乐0039','RF991920039','件','10','2018-10-18','S000020','RS000002','GA000005','SP000002','SS000002','TT000005','RS000003','SO000002','RSO000005',NULL,'PACKED0039','1'),
	('G000040','可口可乐0040','RF991920040','箱','9','2016-12-01','S000020','RS000002','GA000005','SP000002','SS000002','TT000005','RS000003','SO000002','RSO000005',NULL,'PACKED0040','1'),
	('G000041','可口可乐0041','RF991920041','件','9','2017-12-10','S000021','RS000002','GA000006','SP000002','SS000002','TT000006','RS000003','SO000002','RSO000006',NULL,'PACKED0041','1'),
	('G000042','可口可乐0042','RF991920042','箱','10','2017-08-26','S000021','RS000002','GA000006','SP000002','SS000002','TT000006','RS000003','SO000002','RSO000006',NULL,'PACKED0042','1'),
	('G000043','可口可乐0043','RF991920043','件','9','2017-07-18','S000022','RS000002','GA000006','SP000002','SS000002','TT000006','RS000003','SO000002','RSO000006',NULL,'PACKED0043','1'),
	('G000044','可口可乐0044','RF991920044','箱','10','2017-06-25','S000022','RS000002','GA000006','SP000002','SS000002','TT000006','RS000003','SO000002','RSO000006',NULL,'PACKED0044','1'),
	('G000045','可口可乐0045','RF991920045','件','9','2019-05-14','S000023','RS000002','GA000006','SP000002','SS000002','TT000006','RS000003','SO000002','RSO000006',NULL,'PACKED0045','1'),
	('G000046','可口可乐0046','RF991920046','箱','8','2018-10-25','S000023','RS000002','GA000006','SP000002','SS000002','TT000006','RS000003','SO000002','RSO000006',NULL,'PACKED0046','1'),
	('G000047','可口可乐0047','RF991920047','件','8','2016-12-15','S000024','RS000002','GA000006','SP000002','SS000002','TT000006','RS000003','SO000002','RSO000006',NULL,'PACKED0047','1'),
	('G000048','可口可乐0048','RF991920048','箱','8','2017-05-13','S000024','RS000002','GA000006','SP000002','SS000002','TT000006','RS000003','SO000002','RSO000006',NULL,'PACKED0048','1'),
	('G000049','可口可乐0049','RF991920049','件','9','2018-08-17','S000025','RS000002','GA000007','SP000002','SS000002','TT000007','RS000004','SO000002','RSO000007',NULL,'PACKED0049','1'),
	('G000050','可口可乐0050','RF991920050','箱','9','2018-11-29','S000025','RS000002','GA000007','SP000002','SS000002','TT000007','RS000004','SO000002','RSO000007',NULL,'PACKED0050','1'),
	('G000051','可口可乐0051','RF991920051','件','8','2018-04-08','S000026','RS000002','GA000007','SP000002','SS000002','TT000007','RS000004','SO000002','RSO000007',NULL,'PACKED0051','1'),
	('G000052','可口可乐0052','RF991920052','箱','8','2018-12-04','S000026','RS000002','GA000007','SP000002','SS000002','TT000007','RS000004','SO000002','RSO000007',NULL,'PACKED0052','1'),
	('G000053','可口可乐0053','RF991920053','件','10','2019-01-28','S000027','RS000002','GA000007','SP000002','SS000002','TT000007','RS000004','SO000002','RSO000007',NULL,'PACKED0053','1'),
	('G000054','可口可乐0054','RF991920054','箱','8','2017-07-31','S000027','RS000002','GA000007','SP000002','SS000002','TT000007','RS000004','SO000002','RSO000007',NULL,'PACKED0054','1'),
	('G000055','可口可乐0055','RF991920055','件','10','2017-08-29','S000028','RS000002','GA000007','SP000002','SS000002','TT000007','RS000004','SO000002','RSO000007',NULL,'PACKED0055','1'),
	('G000056','可口可乐0056','RF991920056','箱','8','2019-02-28','S000028','RS000002','GA000007','SP000002','SS000002','TT000007','RS000004','SO000002','RSO000007',NULL,'PACKED0056','1'),
	('G000057','可口可乐0057','RF991920057','件','9','2016-11-18','S000029','RS000002','GA000008','SP000002','SS000002','TT000008','RS000004','SO000002','RSO000008',NULL,'PACKED0057','1'),
	('G000058','可口可乐0058','RF991920058','箱','9','2018-01-15','S000029','RS000002','GA000008','SP000002','SS000002','TT000008','RS000004','SO000002','RSO000008',NULL,'PACKED0058','1'),
	('G000059','可口可乐0059','RF991920059','件','8','2019-05-19','S000030','RS000002','GA000008','SP000002','SS000002','TT000008','RS000004','SO000002','RSO000008',NULL,'PACKED0059','1'),
	('G000060','可口可乐0060','RF991920060','箱','10','2018-01-16','S000030','RS000002','GA000008','SP000002','SS000002','TT000008','RS000004','SO000002','RSO000008',NULL,'PACKED0060','1'),
	('G000061','可口可乐0061','RF991920061','件','10','2018-10-30','S000031','RS000002','GA000008','SP000002','SS000002','TT000008','RS000004','SO000002','RSO000008',NULL,'PACKED0061','1'),
	('G000062','可口可乐0062','RF991920062','箱','8','2017-06-02','S000031','RS000002','GA000008','SP000002','SS000002','TT000008','RS000004','SO000002','RSO000008',NULL,'PACKED0062','1'),
	('G000063','可口可乐0063','RF991920063','件','8','2018-09-18','S000032','RS000002','GA000008','SP000002','SS000002','TT000008','RS000004','SO000002','RSO000008',NULL,'PACKED0063','1'),
	('G000064','可口可乐0064','RF991920064','箱','8','2017-05-24','S000032','RS000002','GA000008','SP000002','SS000002','TT000008','RS000004','SO000002','RSO000008',NULL,'PACKED0064','1'),
	('G000065','可口可乐0065','RF991920065','件','9','2017-10-07','S000033','RS000003','GA000009','SP000003','SS000003','TT000009','RS000005','SO000003','RSO000009',NULL,'PACKED0065','1'),
	('G000066','可口可乐0066','RF991920066','箱','9','2019-01-06','S000033','RS000003','GA000009','SP000003','SS000003','TT000009','RS000005','SO000003','RSO000009',NULL,'PACKED0066','1'),
	('G000067','可口可乐0067','RF991920067','件','8','2019-01-27','S000034','RS000003','GA000009','SP000003','SS000003','TT000009','RS000005','SO000003','RSO000009',NULL,'PACKED0067','1'),
	('G000068','可口可乐0068','RF991920068','箱','9','2017-10-06','S000034','RS000003','GA000009','SP000003','SS000003','TT000009','RS000005','SO000003','RSO000009',NULL,'PACKED0068','1'),
	('G000069','可口可乐0069','RF991920069','件','9','2017-05-22','S000035','RS000003','GA000009','SP000003','SS000003','TT000009','RS000005','SO000003','RSO000009',NULL,'PACKED0069','1'),
	('G000070','可口可乐0070','RF991920070','箱','9','2017-05-31','S000035','RS000003','GA000009','SP000003','SS000003','TT000009','RS000005','SO000003','RSO000009',NULL,'PACKED0070','1'),
	('G000071','可口可乐0071','RF991920071','件','10','2019-05-01','S000036','RS000003','GA000009','SP000003','SS000003','TT000009','RS000005','SO000003','RSO000009',NULL,'PACKED0071','1'),
	('G000072','可口可乐0072','RF991920072','箱','8','2018-08-22','S000036','RS000003','GA000009','SP000003','SS000003','TT000009','RS000005','SO000003','RSO000009',NULL,'PACKED0072','1'),
	('G000073','可口可乐0073','RF991920073','件','9','2018-10-18','S000037','RS000003','GA000010','SP000003','SS000003','TT000010','RS000005','SO000003','RSO000010',NULL,'PACKED0073','1'),
	('G000074','可口可乐0074','RF991920074','箱','8','2018-12-24','S000037','RS000003','GA000010','SP000003','SS000003','TT000010','RS000005','SO000003','RSO000010',NULL,'PACKED0074','1'),
	('G000075','可口可乐0075','RF991920075','件','9','2019-03-09','S000038','RS000003','GA000010','SP000003','SS000003','TT000010','RS000005','SO000003','RSO000010',NULL,'PACKED0075','1'),
	('G000076','可口可乐0076','RF991920076','箱','8','2018-12-02','S000038','RS000003','GA000010','SP000003','SS000003','TT000010','RS000005','SO000003','RSO000010',NULL,'PACKED0076','1'),
	('G000077','可口可乐0077','RF991920077','件','10','2017-01-23','S000039','RS000003','GA000010','SP000003','SS000003','TT000010','RS000005','SO000003','RSO000010',NULL,'PACKED0077','1'),
	('G000078','可口可乐0078','RF991920078','箱','9','2017-04-16','S000039','RS000003','GA000010','SP000003','SS000003','TT000010','RS000005','SO000003','RSO000010',NULL,'PACKED0078','1'),
	('G000079','可口可乐0079','RF991920079','件','10','2019-02-17','S000040','RS000003','GA000010','SP000003','SS000003','TT000010','RS000005','SO000003','RSO000010',NULL,'PACKED0079','1'),
	('G000080','可口可乐0080','RF991920080','箱','10','2018-06-22','S000040','RS000003','GA000010','SP000003','SS000003','TT000010','RS000005','SO000003','RSO000010',NULL,'PACKED0080','1'),
	('G000081','可口可乐0081','RF991920081','件','8','2017-09-18','S000041','RS000003','GA000011','SP000003','SS000003','TT000011','RS000006','SO000003','RSO000011',NULL,'PACKED0081','1'),
	('G000082','可口可乐0082','RF991920082','箱','10','2017-06-13','S000041','RS000003','GA000011','SP000003','SS000003','TT000011','RS000006','SO000003','RSO000011',NULL,'PACKED0082','1'),
	('G000083','可口可乐0083','RF991920083','件','8','2019-05-23','S000042','RS000003','GA000011','SP000003','SS000003','TT000011','RS000006','SO000003','RSO000011',NULL,'PACKED0083','1'),
	('G000084','可口可乐0084','RF991920084','箱','8','2019-04-10','S000042','RS000003','GA000011','SP000003','SS000003','TT000011','RS000006','SO000003','RSO000011',NULL,'PACKED0084','1'),
	('G000085','可口可乐0085','RF991920085','件','8','2017-11-10','S000043','RS000003','GA000011','SP000003','SS000003','TT000011','RS000006','SO000003','RSO000011',NULL,'PACKED0085','1'),
	('G000086','可口可乐0086','RF991920086','箱','8','2018-05-01','S000043','RS000003','GA000011','SP000003','SS000003','TT000011','RS000006','SO000003','RSO000011',NULL,'PACKED0086','1'),
	('G000087','可口可乐0087','RF991920087','件','9','2016-11-05','S000044','RS000003','GA000011','SP000003','SS000003','TT000011','RS000006','SO000003','RSO000011',NULL,'PACKED0087','1'),
	('G000088','可口可乐0088','RF991920088','箱','9','2019-05-14','S000044','RS000003','GA000011','SP000003','SS000003','TT000011','RS000006','SO000003','RSO000011',NULL,'PACKED0088','1'),
	('G000089','可口可乐0089','RF991920089','件','10','2017-05-22','S000045','RS000003','GA000012','SP000003','SS000003','TT000012','RS000006','SO000003','RSO000012',NULL,'PACKED0089','1'),
	('G000090','可口可乐0090','RF991920090','箱','9','2018-04-21','S000045','RS000003','GA000012','SP000003','SS000003','TT000012','RS000006','SO000003','RSO000012',NULL,'PACKED0090','1'),
	('G000091','可口可乐0091','RF991920091','件','8','2017-10-28','S000046','RS000003','GA000012','SP000003','SS000003','TT000012','RS000006','SO000003','RSO000012',NULL,'PACKED0091','1'),
	('G000092','可口可乐0092','RF991920092','箱','9','2017-09-12','S000046','RS000003','GA000012','SP000003','SS000003','TT000012','RS000006','SO000003','RSO000012',NULL,'PACKED0092','1'),
	('G000093','可口可乐0093','RF991920093','件','10','2018-06-23','S000047','RS000003','GA000012','SP000003','SS000003','TT000012','RS000006','SO000003','RSO000012',NULL,'PACKED0093','1'),
	('G000094','可口可乐0094','RF991920094','箱','9','2017-10-31','S000047','RS000003','GA000012','SP000003','SS000003','TT000012','RS000006','SO000003','RSO000012',NULL,'PACKED0094','1'),
	('G000095','可口可乐0095','RF991920095','件','10','2019-04-10','S000048','RS000003','GA000012','SP000003','SS000003','TT000012','RS000006','SO000003','RSO000012',NULL,'PACKED0095','1'),
	('G000096','可口可乐0096','RF991920096','箱','10','2018-07-14','S000048','RS000003','GA000012','SP000003','SS000003','TT000012','RS000006','SO000003','RSO000012',NULL,'PACKED0096','1'),
	('G000097','可口可乐0097','RF991920097','件','10','2017-04-17','S000049','RS000004','GA000013','SP000004','SS000004','TT000013','RS000007','SO000004','RSO000013',NULL,'PACKED0097','1'),
	('G000098','可口可乐0098','RF991920098','箱','10','2017-02-09','S000049','RS000004','GA000013','SP000004','SS000004','TT000013','RS000007','SO000004','RSO000013',NULL,'PACKED0098','1'),
	('G000099','可口可乐0099','RF991920099','件','8','2016-09-18','S000050','RS000004','GA000013','SP000004','SS000004','TT000013','RS000007','SO000004','RSO000013',NULL,'PACKED0099','1'),
	('G000100','可口可乐0100','RF991920100','箱','9','2019-01-12','S000050','RS000004','GA000013','SP000004','SS000004','TT000013','RS000007','SO000004','RSO000013',NULL,'PACKED0100','1'),
	('G000101','可口可乐0101','RF991920101','件','8','2019-08-29','S000051','RS000004','GA000013','SP000004','SS000004','TT000013','RS000007','SO000004','RSO000013',NULL,'PACKED0101','1'),
	('G000102','可口可乐0102','RF991920102','箱','8','2019-08-10','S000051','RS000004','GA000013','SP000004','SS000004','TT000013','RS000007','SO000004','RSO000013',NULL,'PACKED0102','1'),
	('G000103','可口可乐0103','RF991920103','件','10','2016-12-14','S000052','RS000004','GA000013','SP000004','SS000004','TT000013','RS000007','SO000004','RSO000013',NULL,'PACKED0103','1'),
	('G000104','可口可乐0104','RF991920104','箱','8','2018-03-04','S000052','RS000004','GA000013','SP000004','SS000004','TT000013','RS000007','SO000004','RSO000013',NULL,'PACKED0104','1'),
	('G000105','可口可乐0105','RF991920105','件','10','2017-02-03','S000053','RS000004','GA000014','SP000004','SS000004','TT000014','RS000007','SO000004','RSO000014',NULL,'PACKED0105','1'),
	('G000106','可口可乐0106','RF991920106','箱','8','2017-03-06','S000053','RS000004','GA000014','SP000004','SS000004','TT000014','RS000007','SO000004','RSO000014',NULL,'PACKED0106','1'),
	('G000107','可口可乐0107','RF991920107','件','10','2019-06-28','S000054','RS000004','GA000014','SP000004','SS000004','TT000014','RS000007','SO000004','RSO000014',NULL,'PACKED0107','1'),
	('G000108','可口可乐0108','RF991920108','箱','10','2017-02-07','S000054','RS000004','GA000014','SP000004','SS000004','TT000014','RS000007','SO000004','RSO000014',NULL,'PACKED0108','1'),
	('G000109','可口可乐0109','RF991920109','件','10','2019-05-30','S000055','RS000004','GA000014','SP000004','SS000004','TT000014','RS000007','SO000004','RSO000014',NULL,'PACKED0109','1'),
	('G000110','可口可乐0110','RF991920110','箱','8','2017-01-19','S000055','RS000004','GA000014','SP000004','SS000004','TT000014','RS000007','SO000004','RSO000014',NULL,'PACKED0110','1'),
	('G000111','可口可乐0111','RF991920111','件','8','2018-01-28','S000056','RS000004','GA000014','SP000004','SS000004','TT000014','RS000007','SO000004','RSO000014',NULL,'PACKED0111','1'),
	('G000112','可口可乐0112','RF991920112','箱','10','2017-08-20','S000056','RS000004','GA000014','SP000004','SS000004','TT000014','RS000007','SO000004','RSO000014',NULL,'PACKED0112','1'),
	('G000113','可口可乐0113','RF991920113','件','9','2018-11-14','S000057','RS000004','GA000015','SP000004','SS000004','TT000015','RS000008','SO000004','RSO000015',NULL,'PACKED0113','1'),
	('G000114','可口可乐0114','RF991920114','箱','9','2018-12-19','S000057','RS000004','GA000015','SP000004','SS000004','TT000015','RS000008','SO000004','RSO000015',NULL,'PACKED0114','1'),
	('G000115','可口可乐0115','RF991920115','件','10','2017-11-12','S000058','RS000004','GA000015','SP000004','SS000004','TT000015','RS000008','SO000004','RSO000015',NULL,'PACKED0115','1'),
	('G000116','可口可乐0116','RF991920116','箱','10','2017-05-31','S000058','RS000004','GA000015','SP000004','SS000004','TT000015','RS000008','SO000004','RSO000015',NULL,'PACKED0116','1'),
	('G000117','可口可乐0117','RF991920117','件','10','2019-07-22','S000059','RS000004','GA000015','SP000004','SS000004','TT000015','RS000008','SO000004','RSO000015',NULL,'PACKED0117','1'),
	('G000118','可口可乐0118','RF991920118','箱','9','2019-03-15','S000059','RS000004','GA000015','SP000004','SS000004','TT000015','RS000008','SO000004','RSO000015',NULL,'PACKED0118','1'),
	('G000119','可口可乐0119','RF991920119','件','10','2019-02-13','S000060','RS000004','GA000015','SP000004','SS000004','TT000015','RS000008','SO000004','RSO000015',NULL,'PACKED0119','1'),
	('G000120','可口可乐0120','RF991920120','箱','8','2019-01-05','S000060','RS000004','GA000015','SP000004','SS000004','TT000015','RS000008','SO000004','RSO000015',NULL,'PACKED0120','1'),
	('G000121','可口可乐0121','RF991920121','件','9','2017-05-28','S000061','RS000004','GA000016','SP000004','SS000004','TT000016','RS000008','SO000004','RSO000016',NULL,'PACKED0121','1'),
	('G000122','可口可乐0122','RF991920122','箱','8','2017-03-31','S000061','RS000004','GA000016','SP000004','SS000004','TT000016','RS000008','SO000004','RSO000016',NULL,'PACKED0122','1'),
	('G000123','可口可乐0123','RF991920123','件','9','2018-05-27','S000062','RS000004','GA000016','SP000004','SS000004','TT000016','RS000008','SO000004','RSO000016',NULL,'PACKED0123','1'),
	('G000124','可口可乐0124','RF991920124','箱','10','2016-12-29','S000062','RS000004','GA000016','SP000004','SS000004','TT000016','RS000008','SO000004','RSO000016',NULL,'PACKED0124','1'),
	('G000125','可口可乐0125','RF991920125','件','9','2018-02-28','S000063','RS000004','GA000016','SP000004','SS000004','TT000016','RS000008','SO000004','RSO000016',NULL,'PACKED0125','1'),
	('G000126','可口可乐0126','RF991920126','箱','10','2019-05-28','S000063','RS000004','GA000016','SP000004','SS000004','TT000016','RS000008','SO000004','RSO000016',NULL,'PACKED0126','1'),
	('G000127','可口可乐0127','RF991920127','件','10','2018-09-22','S000064','RS000004','GA000016','SP000004','SS000004','TT000016','RS000008','SO000004','RSO000016',NULL,'PACKED0127','1'),
	('G000128','可口可乐0128','RF991920128','箱','10','2017-08-23','S000064','RS000004','GA000016','SP000004','SS000004','TT000016','RS000008','SO000004','RSO000016',NULL,'PACKED0128','1');

insert into goods_packaging_data values
	('GP000001','王煜东','RF99192','2018-04-17','打包完成，准备起运','1');

insert into goods_movement_data values
	('GM000001','2019-09-10 15:46:38','仓库货位','仓库货位','192.168.20.1','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B405','FTYUIOLJYT^*(PLKJYT)','40.53243871436453','132.1374871435089','G000001','1'),
	('GM000002','2019-09-05 03:21:50','卡车','卡车','192.168.20.10002','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050002','FTYUIOLJYT^*(PLKJYT)0002','40.14203602708266','130.37945356382286','G000001','1'),
	('GM000003','2019-09-02 04:36:29','小超','小超','192.168.20.10003','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050003','FTYUIOLJYT^*(PLKJYT)0003','41.12488334324729','131.88855154684828','G000002','1'),
	('GM000004','2019-09-07 21:21:24','仓库货位','仓库货位','192.168.20.10004','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050004','FTYUIOLJYT^*(PLKJYT)0004','42.033537798754566','131.70342586261904','G000002','1'),
	('GM000005','2019-09-12 00:56:17','卡车','卡车','192.168.20.10005','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050005','FTYUIOLJYT^*(PLKJYT)0005','41.67586011453909','130.5873691982501','G000003','1'),
	('GM000006','2019-09-04 11:35:46','小超','小超','192.168.20.10006','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050006','FTYUIOLJYT^*(PLKJYT)0006','42.06180222440851','131.44512167131288','G000003','1'),
	('GM000007','2019-09-06 12:01:22','仓库货位','仓库货位','192.168.20.10007','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050007','FTYUIOLJYT^*(PLKJYT)0007','42.54739198371288','131.82187401806473','G000004','1'),
	('GM000008','2019-09-08 19:18:51','卡车','卡车','192.168.20.10008','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050008','FTYUIOLJYT^*(PLKJYT)0008','42.16329296295294','131.43508740831146','G000004','1'),
	('GM000009','2019-08-24 16:01:08','小超','小超','192.168.20.10009','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050009','FTYUIOLJYT^*(PLKJYT)0009','41.0511396233397','129.94058303011283','G000005','1'),
	('GM000010','2019-08-30 19:35:48','仓库货位','仓库货位','192.168.20.10010','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050010','FTYUIOLJYT^*(PLKJYT)0010','40.86540596270418','129.7590688021065','G000005','1'),
	('GM000011','2019-09-14 15:34:03','卡车','卡车','192.168.20.10011','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050011','FTYUIOLJYT^*(PLKJYT)0011','42.74692058218648','130.93965993567775','G000006','1'),
	('GM000012','2019-08-26 05:32:55','小超','小超','192.168.20.10012','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050012','FTYUIOLJYT^*(PLKJYT)0012','41.39138078728082','130.007896743449','G000006','1'),
	('GM000013','2019-08-24 16:29:25','仓库货位','仓库货位','192.168.20.10013','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050013','FTYUIOLJYT^*(PLKJYT)0013','41.912931688360096','129.97106265981384','G000007','1'),
	('GM000014','2019-08-28 05:20:49','卡车','卡车','192.168.20.10014','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050014','FTYUIOLJYT^*(PLKJYT)0014','41.971703777272154','129.61041711256883','G000007','1'),
	('GM000015','2019-09-06 20:56:37','小超','小超','192.168.20.10015','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050015','FTYUIOLJYT^*(PLKJYT)0015','39.899108724751194','129.9424499334086','G000008','1'),
	('GM000016','2019-08-29 20:47:00','仓库货位','仓库货位','192.168.20.10016','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050016','FTYUIOLJYT^*(PLKJYT)0016','42.36097162405625','132.00015094317024','G000008','1'),
	('GM000017','2019-09-06 10:44:54','卡车','卡车','192.168.20.10017','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050017','FTYUIOLJYT^*(PLKJYT)0017','41.51781738078062','130.6361677401735','G000009','1'),
	('GM000018','2019-08-26 03:57:31','小超','小超','192.168.20.10018','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050018','FTYUIOLJYT^*(PLKJYT)0018','42.45204866857953','129.84953785237843','G000009','1'),
	('GM000019','2019-08-29 17:45:07','仓库货位','仓库货位','192.168.20.10019','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050019','FTYUIOLJYT^*(PLKJYT)0019','41.430707330587445','130.1346636018578','G000010','1'),
	('GM000020','2019-09-11 16:25:45','卡车','卡车','192.168.20.10020','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050020','FTYUIOLJYT^*(PLKJYT)0020','41.86407170306547','130.8901119754597','G000010','1'),
	('GM000021','2019-09-10 16:29:21','小超','小超','192.168.20.10021','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050021','FTYUIOLJYT^*(PLKJYT)0021','40.27719434221483','131.7153896054627','G000011','1'),
	('GM000022','2019-08-28 21:51:44','仓库货位','仓库货位','192.168.20.10022','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050022','FTYUIOLJYT^*(PLKJYT)0022','42.11661714072514','129.63665260501108','G000011','1'),
	('GM000023','2019-09-13 11:33:25','卡车','卡车','192.168.20.10023','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050023','FTYUIOLJYT^*(PLKJYT)0023','40.44440411175198','131.77258547463674','G000012','1'),
	('GM000024','2019-09-08 08:15:52','小超','小超','192.168.20.10024','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050024','FTYUIOLJYT^*(PLKJYT)0024','40.78894712389328','130.62773727804841','G000012','1'),
	('GM000025','2019-09-12 05:34:14','仓库货位','仓库货位','192.168.20.10025','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050025','FTYUIOLJYT^*(PLKJYT)0025','41.80188513188674','131.87983083469032','G000013','1'),
	('GM000026','2019-09-14 10:42:09','卡车','卡车','192.168.20.10026','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050026','FTYUIOLJYT^*(PLKJYT)0026','42.59112538366163','129.57931527183638','G000013','1'),
	('GM000027','2019-09-05 21:52:25','小超','小超','192.168.20.10027','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050027','FTYUIOLJYT^*(PLKJYT)0027','42.58396753059746','131.86010684261095','G000014','1'),
	('GM000028','2019-08-30 18:31:53','仓库货位','仓库货位','192.168.20.10028','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050028','FTYUIOLJYT^*(PLKJYT)0028','41.37399262939708','130.8826597877268','G000014','1'),
	('GM000029','2019-09-07 21:34:36','卡车','卡车','192.168.20.10029','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050029','FTYUIOLJYT^*(PLKJYT)0029','42.080927184367795','129.3541104120336','G000015','1'),
	('GM000030','2019-09-04 22:09:52','小超','小超','192.168.20.10030','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050030','FTYUIOLJYT^*(PLKJYT)0030','40.499201300166526','129.43971431616657','G000015','1'),
	('GM000031','2019-09-02 04:36:51','仓库货位','仓库货位','192.168.20.10031','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050031','FTYUIOLJYT^*(PLKJYT)0031','41.845354359140615','130.9381542557478','G000016','1'),
	('GM000032','2019-09-07 17:02:53','卡车','卡车','192.168.20.10032','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050032','FTYUIOLJYT^*(PLKJYT)0032','40.04102501290669','130.4594151156166','G000016','1'),
	('GM000033','2019-09-05 16:39:36','小超','小超','192.168.20.10033','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050033','FTYUIOLJYT^*(PLKJYT)0033','41.19618499349806','129.54621314135625','G000017','1'),
	('GM000034','2019-08-30 04:27:55','仓库货位','仓库货位','192.168.20.10034','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050034','FTYUIOLJYT^*(PLKJYT)0034','41.75141730303176','131.09566161483139','G000017','1'),
	('GM000035','2019-08-30 06:37:35','卡车','卡车','192.168.20.10035','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050035','FTYUIOLJYT^*(PLKJYT)0035','42.639231685381475','129.89322414997437','G000018','1'),
	('GM000036','2019-09-09 11:27:58','小超','小超','192.168.20.10036','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050036','FTYUIOLJYT^*(PLKJYT)0036','42.482349275826365','130.01446718621435','G000018','1'),
	('GM000037','2019-08-27 01:28:05','仓库货位','仓库货位','192.168.20.10037','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050037','FTYUIOLJYT^*(PLKJYT)0037','42.16485721362946','129.51591873409723','G000019','1'),
	('GM000038','2019-08-25 22:37:12','卡车','卡车','192.168.20.10038','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050038','FTYUIOLJYT^*(PLKJYT)0038','41.60898466413856','130.97331826960075','G000019','1'),
	('GM000039','2019-09-04 07:55:20','小超','小超','192.168.20.10039','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050039','FTYUIOLJYT^*(PLKJYT)0039','42.7414182968457','131.07118790498058','G000020','1'),
	('GM000040','2019-09-03 12:13:35','仓库货位','仓库货位','192.168.20.10040','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050040','FTYUIOLJYT^*(PLKJYT)0040','41.358559187619285','131.38438960546566','G000020','1'),
	('GM000041','2019-09-01 10:51:55','卡车','卡车','192.168.20.10041','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050041','FTYUIOLJYT^*(PLKJYT)0041','41.72362930837242','130.9288144159566','G000021','1'),
	('GM000042','2019-09-02 12:37:59','小超','小超','192.168.20.10042','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050042','FTYUIOLJYT^*(PLKJYT)0042','41.63835036336775','131.7351337992596','G000021','1'),
	('GM000043','2019-09-09 12:26:33','仓库货位','仓库货位','192.168.20.10043','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050043','FTYUIOLJYT^*(PLKJYT)0043','41.63005543897006','130.02452278447134','G000022','1'),
	('GM000044','2019-08-26 04:14:42','卡车','卡车','192.168.20.10044','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050044','FTYUIOLJYT^*(PLKJYT)0044','41.927906564748305','131.5406137340084','G000022','1'),
	('GM000045','2019-09-07 15:32:54','小超','小超','192.168.20.10045','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050045','FTYUIOLJYT^*(PLKJYT)0045','41.121152259275554','132.20051172440327','G000023','1'),
	('GM000046','2019-09-01 06:30:32','仓库货位','仓库货位','192.168.20.10046','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050046','FTYUIOLJYT^*(PLKJYT)0046','41.902430042399914','129.6031564975871','G000023','1'),
	('GM000047','2019-09-12 12:19:15','卡车','卡车','192.168.20.10047','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050047','FTYUIOLJYT^*(PLKJYT)0047','42.10187076020576','130.04436601391956','G000024','1'),
	('GM000048','2019-08-24 22:56:02','小超','小超','192.168.20.10048','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050048','FTYUIOLJYT^*(PLKJYT)0048','42.173184994241474','130.42345998404497','G000024','1'),
	('GM000049','2019-09-13 23:30:21','仓库货位','仓库货位','192.168.20.10049','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050049','FTYUIOLJYT^*(PLKJYT)0049','42.26970913587917','129.87455353019106','G000025','1'),
	('GM000050','2019-08-27 12:45:18','卡车','卡车','192.168.20.10050','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050050','FTYUIOLJYT^*(PLKJYT)0050','40.74495286595735','129.3258020715353','G000025','1'),
	('GM000051','2019-09-06 11:12:30','小超','小超','192.168.20.10051','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050051','FTYUIOLJYT^*(PLKJYT)0051','41.98470633192536','130.23328247235753','G000026','1'),
	('GM000052','2019-08-26 23:59:30','仓库货位','仓库货位','192.168.20.10052','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050052','FTYUIOLJYT^*(PLKJYT)0052','40.51844591996348','129.67672261109152','G000026','1'),
	('GM000053','2019-09-10 09:12:17','卡车','卡车','192.168.20.10053','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050053','FTYUIOLJYT^*(PLKJYT)0053','40.9223585258286','130.89761782791132','G000027','1'),
	('GM000054','2019-08-29 13:08:51','小超','小超','192.168.20.10054','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050054','FTYUIOLJYT^*(PLKJYT)0054','41.3163865461848','131.45534787326574','G000027','1'),
	('GM000055','2019-09-07 02:04:59','仓库货位','仓库货位','192.168.20.10055','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050055','FTYUIOLJYT^*(PLKJYT)0055','41.219532045214756','132.26037744848398','G000028','1'),
	('GM000056','2019-09-13 19:18:49','卡车','卡车','192.168.20.10056','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050056','FTYUIOLJYT^*(PLKJYT)0056','41.03547795824528','131.6038834984557','G000028','1'),
	('GM000057','2019-08-26 15:11:56','小超','小超','192.168.20.10057','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050057','FTYUIOLJYT^*(PLKJYT)0057','39.88852551228176','131.35698901433545','G000029','1'),
	('GM000058','2019-09-08 04:51:51','仓库货位','仓库货位','192.168.20.10058','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050058','FTYUIOLJYT^*(PLKJYT)0058','41.563152466479096','131.2938484271783','G000029','1'),
	('GM000059','2019-09-01 22:07:19','卡车','卡车','192.168.20.10059','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050059','FTYUIOLJYT^*(PLKJYT)0059','42.572475576368326','130.1073793312219','G000030','1'),
	('GM000060','2019-09-03 04:33:53','小超','小超','192.168.20.10060','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050060','FTYUIOLJYT^*(PLKJYT)0060','40.12885135920404','131.49808579161422','G000030','1'),
	('GM000061','2019-09-10 16:07:43','仓库货位','仓库货位','192.168.20.10061','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050061','FTYUIOLJYT^*(PLKJYT)0061','42.678939689622084','130.42788616126415','G000031','1'),
	('GM000062','2019-09-04 17:43:26','卡车','卡车','192.168.20.10062','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050062','FTYUIOLJYT^*(PLKJYT)0062','41.75633344789135','129.58684917781594','G000031','1'),
	('GM000063','2019-09-08 06:49:31','小超','小超','192.168.20.10063','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050063','FTYUIOLJYT^*(PLKJYT)0063','42.75595016647914','130.06255823227008','G000032','1'),
	('GM000064','2019-09-12 19:24:59','仓库货位','仓库货位','192.168.20.10064','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050064','FTYUIOLJYT^*(PLKJYT)0064','41.05844352639432','130.86030082596548','G000032','1'),
	('GM000065','2019-09-11 14:50:43','卡车','卡车','192.168.20.10065','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050065','FTYUIOLJYT^*(PLKJYT)0065','40.379999695510186','130.7421049333138','G000033','1'),
	('GM000066','2019-09-12 07:34:09','小超','小超','192.168.20.10066','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050066','FTYUIOLJYT^*(PLKJYT)0066','42.771818803727605','131.79720421624629','G000033','1'),
	('GM000067','2019-09-06 21:40:41','仓库货位','仓库货位','192.168.20.10067','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050067','FTYUIOLJYT^*(PLKJYT)0067','40.787769648726595','131.94883935175773','G000034','1'),
	('GM000068','2019-09-06 02:23:15','卡车','卡车','192.168.20.10068','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050068','FTYUIOLJYT^*(PLKJYT)0068','40.30973029679171','130.91367929372464','G000034','1'),
	('GM000069','2019-08-24 09:01:16','小超','小超','192.168.20.10069','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050069','FTYUIOLJYT^*(PLKJYT)0069','39.998072851214474','130.13454565816085','G000035','1'),
	('GM000070','2019-09-06 11:12:24','仓库货位','仓库货位','192.168.20.10070','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050070','FTYUIOLJYT^*(PLKJYT)0070','42.25082314968216','129.5754830422257','G000035','1'),
	('GM000071','2019-08-30 00:36:45','卡车','卡车','192.168.20.10071','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050071','FTYUIOLJYT^*(PLKJYT)0071','41.99819195117932','131.08321220736826','G000036','1'),
	('GM000072','2019-08-27 10:14:41','小超','小超','192.168.20.10072','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050072','FTYUIOLJYT^*(PLKJYT)0072','40.75474514114471','132.24687986631588','G000036','1'),
	('GM000073','2019-08-25 10:30:48','仓库货位','仓库货位','192.168.20.10073','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050073','FTYUIOLJYT^*(PLKJYT)0073','41.98591924634861','130.7505694552111','G000037','1'),
	('GM000074','2019-08-31 04:10:06','卡车','卡车','192.168.20.10074','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050074','FTYUIOLJYT^*(PLKJYT)0074','41.467958184746934','129.8588824388458','G000037','1'),
	('GM000075','2019-08-28 13:33:47','小超','小超','192.168.20.10075','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050075','FTYUIOLJYT^*(PLKJYT)0075','41.20713981779566','129.75652816050396','G000038','1'),
	('GM000076','2019-09-13 03:00:20','仓库货位','仓库货位','192.168.20.10076','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050076','FTYUIOLJYT^*(PLKJYT)0076','41.76047470555012','130.37522469171182','G000038','1'),
	('GM000077','2019-09-06 20:32:15','卡车','卡车','192.168.20.10077','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050077','FTYUIOLJYT^*(PLKJYT)0077','41.166358223518266','131.8047394006465','G000039','1'),
	('GM000078','2019-08-29 02:41:01','小超','小超','192.168.20.10078','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050078','FTYUIOLJYT^*(PLKJYT)0078','41.21352867822011','129.87723829683208','G000039','1'),
	('GM000079','2019-09-06 17:20:28','仓库货位','仓库货位','192.168.20.10079','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050079','FTYUIOLJYT^*(PLKJYT)0079','42.237399371132184','132.09602176183657','G000040','1'),
	('GM000080','2019-09-08 20:08:54','卡车','卡车','192.168.20.10080','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050080','FTYUIOLJYT^*(PLKJYT)0080','40.89657610096154','129.4958345715519','G000040','1'),
	('GM000081','2019-09-02 16:33:07','小超','小超','192.168.20.10081','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050081','FTYUIOLJYT^*(PLKJYT)0081','40.80247546803493','129.87037178370065','G000041','1'),
	('GM000082','2019-09-13 18:03:14','仓库货位','仓库货位','192.168.20.10082','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050082','FTYUIOLJYT^*(PLKJYT)0082','41.257465816237946','130.22266105179278','G000041','1'),
	('GM000083','2019-09-05 16:26:41','卡车','卡车','192.168.20.10083','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050083','FTYUIOLJYT^*(PLKJYT)0083','40.10440442882428','131.02738348660833','G000042','1'),
	('GM000084','2019-09-02 16:28:30','小超','小超','192.168.20.10084','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050084','FTYUIOLJYT^*(PLKJYT)0084','40.670670354629884','129.73145349372473','G000042','1'),
	('GM000085','2019-09-06 20:30:11','仓库货位','仓库货位','192.168.20.10085','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050085','FTYUIOLJYT^*(PLKJYT)0085','40.12909868672576','130.44944041687782','G000043','1'),
	('GM000086','2019-09-14 11:29:38','卡车','卡车','192.168.20.10086','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050086','FTYUIOLJYT^*(PLKJYT)0086','42.00430310089149','131.04850050815395','G000043','1'),
	('GM000087','2019-09-02 20:28:56','小超','小超','192.168.20.10087','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050087','FTYUIOLJYT^*(PLKJYT)0087','39.92926707919225','129.68895328668208','G000044','1'),
	('GM000088','2019-09-03 16:46:59','仓库货位','仓库货位','192.168.20.10088','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050088','FTYUIOLJYT^*(PLKJYT)0088','39.77708134182356','131.70747370113997','G000044','1'),
	('GM000089','2019-09-09 05:28:08','卡车','卡车','192.168.20.10089','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050089','FTYUIOLJYT^*(PLKJYT)0089','41.25694894443914','130.72374291351906','G000045','1'),
	('GM000090','2019-09-05 20:51:37','小超','小超','192.168.20.10090','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050090','FTYUIOLJYT^*(PLKJYT)0090','41.77184322904913','129.40377330574614','G000045','1'),
	('GM000091','2019-08-26 05:26:42','仓库货位','仓库货位','192.168.20.10091','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050091','FTYUIOLJYT^*(PLKJYT)0091','39.85902092127816','131.0675963198043','G000046','1'),
	('GM000092','2019-09-05 16:41:34','卡车','卡车','192.168.20.10092','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050092','FTYUIOLJYT^*(PLKJYT)0092','40.6837584089125','131.3877302842497','G000046','1'),
	('GM000093','2019-08-29 02:02:19','小超','小超','192.168.20.10093','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050093','FTYUIOLJYT^*(PLKJYT)0093','39.988805352289226','130.82085519239558','G000047','1'),
	('GM000094','2019-08-29 12:42:28','仓库货位','仓库货位','192.168.20.10094','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050094','FTYUIOLJYT^*(PLKJYT)0094','40.73065549842861','131.68086682803073','G000047','1'),
	('GM000095','2019-09-07 05:28:30','卡车','卡车','192.168.20.10095','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050095','FTYUIOLJYT^*(PLKJYT)0095','40.04659779795733','129.82406543384295','G000048','1'),
	('GM000096','2019-09-03 21:50:23','小超','小超','192.168.20.10096','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050096','FTYUIOLJYT^*(PLKJYT)0096','41.00223662746921','129.70693712822842','G000048','1'),
	('GM000097','2019-09-01 04:30:35','仓库货位','仓库货位','192.168.20.10097','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050097','FTYUIOLJYT^*(PLKJYT)0097','40.74619930231407','130.64226876383665','G000049','1'),
	('GM000098','2019-09-05 17:01:04','卡车','卡车','192.168.20.10098','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050098','FTYUIOLJYT^*(PLKJYT)0098','39.92728542449197','132.15726270793496','G000049','1'),
	('GM000099','2019-09-02 05:40:19','小超','小超','192.168.20.10099','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050099','FTYUIOLJYT^*(PLKJYT)0099','40.04286336211748','131.25514657915656','G000050','1'),
	('GM000100','2019-08-31 20:46:39','仓库货位','仓库货位','192.168.20.10100','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050100','FTYUIOLJYT^*(PLKJYT)0100','40.986857710148634','130.68119094403554','G000050','1'),
	('GM000101','2019-09-10 11:01:27','卡车','卡车','192.168.20.10101','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050101','FTYUIOLJYT^*(PLKJYT)0101','41.49558546820281','131.2962214213326','G000051','1'),
	('GM000102','2019-09-08 02:55:10','小超','小超','192.168.20.10102','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050102','FTYUIOLJYT^*(PLKJYT)0102','41.981051582187845','129.6462036721972','G000051','1'),
	('GM000103','2019-08-31 22:50:59','仓库货位','仓库货位','192.168.20.10103','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050103','FTYUIOLJYT^*(PLKJYT)0103','39.784091459961125','131.10062463685648','G000052','1'),
	('GM000104','2019-08-24 14:45:19','卡车','卡车','192.168.20.10104','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050104','FTYUIOLJYT^*(PLKJYT)0104','41.6920897860899','131.35277554594205','G000052','1'),
	('GM000105','2019-08-28 05:52:04','小超','小超','192.168.20.10105','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050105','FTYUIOLJYT^*(PLKJYT)0105','42.28461533428847','129.45409915935204','G000053','1'),
	('GM000106','2019-09-01 09:22:18','仓库货位','仓库货位','192.168.20.10106','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050106','FTYUIOLJYT^*(PLKJYT)0106','40.99254550104892','130.3366561487592','G000053','1'),
	('GM000107','2019-09-13 10:00:16','卡车','卡车','192.168.20.10107','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050107','FTYUIOLJYT^*(PLKJYT)0107','42.72056236048382','131.44510100085145','G000054','1'),
	('GM000108','2019-09-10 11:12:46','小超','小超','192.168.20.10108','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050108','FTYUIOLJYT^*(PLKJYT)0108','40.78065236077272','130.1315523607391','G000054','1'),
	('GM000109','2019-08-30 20:44:28','仓库货位','仓库货位','192.168.20.10109','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050109','FTYUIOLJYT^*(PLKJYT)0109','41.75206905371307','131.50690573049812','G000055','1'),
	('GM000110','2019-08-31 23:54:22','卡车','卡车','192.168.20.10110','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050110','FTYUIOLJYT^*(PLKJYT)0110','40.931443702754','129.9996011074379','G000055','1'),
	('GM000111','2019-09-02 03:57:59','小超','小超','192.168.20.10111','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050111','FTYUIOLJYT^*(PLKJYT)0111','42.525524322635256','129.28793549631962','G000056','1'),
	('GM000112','2019-08-29 10:36:49','仓库货位','仓库货位','192.168.20.10112','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050112','FTYUIOLJYT^*(PLKJYT)0112','41.72027114574764','130.83252894203892','G000056','1'),
	('GM000113','2019-09-09 01:15:56','卡车','卡车','192.168.20.10113','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050113','FTYUIOLJYT^*(PLKJYT)0113','41.75918198807559','130.23716092338577','G000057','1'),
	('GM000114','2019-09-07 22:43:23','小超','小超','192.168.20.10114','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050114','FTYUIOLJYT^*(PLKJYT)0114','42.28198225134007','129.8656148213932','G000057','1'),
	('GM000115','2019-09-05 21:30:30','仓库货位','仓库货位','192.168.20.10115','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050115','FTYUIOLJYT^*(PLKJYT)0115','41.24856263154196','129.45907725409546','G000058','1'),
	('GM000116','2019-09-01 05:15:29','卡车','卡车','192.168.20.10116','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050116','FTYUIOLJYT^*(PLKJYT)0116','41.133251477686464','129.97774974181533','G000058','1'),
	('GM000117','2019-09-09 18:31:24','小超','小超','192.168.20.10117','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050117','FTYUIOLJYT^*(PLKJYT)0117','41.1055299922084','130.84170855096767','G000059','1'),
	('GM000118','2019-08-28 14:43:02','仓库货位','仓库货位','192.168.20.10118','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050118','FTYUIOLJYT^*(PLKJYT)0118','40.016437287595274','131.6378827550243','G000059','1'),
	('GM000119','2019-09-07 02:39:14','卡车','卡车','192.168.20.10119','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050119','FTYUIOLJYT^*(PLKJYT)0119','41.733474873644894','131.44429163176636','G000060','1'),
	('GM000120','2019-09-05 05:38:48','小超','小超','192.168.20.10120','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050120','FTYUIOLJYT^*(PLKJYT)0120','40.37067979552786','129.73046163542207','G000060','1'),
	('GM000121','2019-09-01 04:38:03','仓库货位','仓库货位','192.168.20.10121','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050121','FTYUIOLJYT^*(PLKJYT)0121','42.1393199785875','130.54228058680985','G000061','1'),
	('GM000122','2019-09-06 03:57:17','卡车','卡车','192.168.20.10122','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050122','FTYUIOLJYT^*(PLKJYT)0122','40.0401967221289','129.29521622680215','G000061','1'),
	('GM000123','2019-09-06 18:40:04','小超','小超','192.168.20.10123','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050123','FTYUIOLJYT^*(PLKJYT)0123','40.60805603649683','131.3502828651165','G000062','1'),
	('GM000124','2019-09-10 18:44:28','仓库货位','仓库货位','192.168.20.10124','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050124','FTYUIOLJYT^*(PLKJYT)0124','40.97192763685119','132.16055760764777','G000062','1'),
	('GM000125','2019-08-24 17:51:11','卡车','卡车','192.168.20.10125','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050125','FTYUIOLJYT^*(PLKJYT)0125','41.94985861861481','130.70328113251225','G000063','1'),
	('GM000126','2019-09-03 10:09:04','小超','小超','192.168.20.10126','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050126','FTYUIOLJYT^*(PLKJYT)0126','40.10649977319216','131.5613250225228','G000063','1'),
	('GM000127','2019-09-08 06:14:01','仓库货位','仓库货位','192.168.20.10127','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050127','FTYUIOLJYT^*(PLKJYT)0127','41.1717521463833','129.68845332801862','G000064','1'),
	('GM000128','2019-09-13 01:32:33','卡车','卡车','192.168.20.10128','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050128','FTYUIOLJYT^*(PLKJYT)0128','41.540250388364726','130.40260908637248','G000064','1'),
	('GM000129','2019-08-28 00:26:03','小超','小超','192.168.20.10129','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050129','FTYUIOLJYT^*(PLKJYT)0129','42.73915508722212','129.34012267485957','G000065','1'),
	('GM000130','2019-09-12 14:24:00','仓库货位','仓库货位','192.168.20.10130','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050130','FTYUIOLJYT^*(PLKJYT)0130','41.8346650824278','131.16952521692107','G000065','1'),
	('GM000131','2019-09-14 15:25:17','卡车','卡车','192.168.20.10131','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050131','FTYUIOLJYT^*(PLKJYT)0131','41.056944360702964','131.88553351712457','G000066','1'),
	('GM000132','2019-09-05 23:32:13','小超','小超','192.168.20.10132','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050132','FTYUIOLJYT^*(PLKJYT)0132','42.716639870153124','129.6613515822724','G000066','1'),
	('GM000133','2019-08-27 11:08:08','仓库货位','仓库货位','192.168.20.10133','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050133','FTYUIOLJYT^*(PLKJYT)0133','41.91004119477212','130.1465617190328','G000067','1'),
	('GM000134','2019-08-28 10:10:46','卡车','卡车','192.168.20.10134','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050134','FTYUIOLJYT^*(PLKJYT)0134','39.88261819764693','129.33624377877302','G000067','1'),
	('GM000135','2019-08-31 02:24:39','小超','小超','192.168.20.10135','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050135','FTYUIOLJYT^*(PLKJYT)0135','40.62068265773235','129.44005835994653','G000068','1'),
	('GM000136','2019-09-09 02:22:32','仓库货位','仓库货位','192.168.20.10136','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050136','FTYUIOLJYT^*(PLKJYT)0136','41.36670861011643','130.94429255291166','G000068','1'),
	('GM000137','2019-09-01 11:20:39','卡车','卡车','192.168.20.10137','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050137','FTYUIOLJYT^*(PLKJYT)0137','42.379872346219344','130.6958505732302','G000069','1'),
	('GM000138','2019-08-30 01:30:42','小超','小超','192.168.20.10138','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050138','FTYUIOLJYT^*(PLKJYT)0138','40.5227727866554','130.17211002826326','G000069','1'),
	('GM000139','2019-09-02 22:35:01','仓库货位','仓库货位','192.168.20.10139','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050139','FTYUIOLJYT^*(PLKJYT)0139','40.63598972394171','130.4356578533631','G000070','1'),
	('GM000140','2019-09-13 16:38:51','卡车','卡车','192.168.20.10140','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050140','FTYUIOLJYT^*(PLKJYT)0140','41.80924766832645','131.85716560682752','G000070','1'),
	('GM000141','2019-08-25 19:23:18','小超','小超','192.168.20.10141','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050141','FTYUIOLJYT^*(PLKJYT)0141','42.631803510283746','129.27813746730843','G000071','1'),
	('GM000142','2019-09-14 15:28:40','仓库货位','仓库货位','192.168.20.10142','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050142','FTYUIOLJYT^*(PLKJYT)0142','41.84981185447293','130.10610360287725','G000071','1'),
	('GM000143','2019-08-29 03:55:17','卡车','卡车','192.168.20.10143','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050143','FTYUIOLJYT^*(PLKJYT)0143','39.99541321955176','129.69537225663905','G000072','1'),
	('GM000144','2019-08-27 21:21:37','小超','小超','192.168.20.10144','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050144','FTYUIOLJYT^*(PLKJYT)0144','41.910220634324816','130.7852589732795','G000072','1'),
	('GM000145','2019-09-08 17:39:22','仓库货位','仓库货位','192.168.20.10145','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050145','FTYUIOLJYT^*(PLKJYT)0145','42.04981237351908','131.92541560022943','G000073','1'),
	('GM000146','2019-08-29 13:05:37','卡车','卡车','192.168.20.10146','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050146','FTYUIOLJYT^*(PLKJYT)0146','41.60965690851974','130.7761590905883','G000073','1'),
	('GM000147','2019-09-11 16:38:01','小超','小超','192.168.20.10147','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050147','FTYUIOLJYT^*(PLKJYT)0147','40.81430806942609','131.2156944910467','G000074','1'),
	('GM000148','2019-08-28 15:47:11','仓库货位','仓库货位','192.168.20.10148','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050148','FTYUIOLJYT^*(PLKJYT)0148','41.14232173963945','130.3022026095037','G000074','1'),
	('GM000149','2019-08-29 00:52:31','卡车','卡车','192.168.20.10149','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050149','FTYUIOLJYT^*(PLKJYT)0149','42.149073667038046','131.54543754025025','G000075','1'),
	('GM000150','2019-09-05 06:01:19','小超','小超','192.168.20.10150','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050150','FTYUIOLJYT^*(PLKJYT)0150','40.18090601710831','130.24880626913648','G000075','1'),
	('GM000151','2019-09-14 17:48:49','仓库货位','仓库货位','192.168.20.10151','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050151','FTYUIOLJYT^*(PLKJYT)0151','40.52738424903002','130.6547837854243','G000076','1'),
	('GM000152','2019-09-12 23:38:44','卡车','卡车','192.168.20.10152','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050152','FTYUIOLJYT^*(PLKJYT)0152','42.26784207208308','129.69760087288594','G000076','1'),
	('GM000153','2019-08-26 16:54:40','小超','小超','192.168.20.10153','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050153','FTYUIOLJYT^*(PLKJYT)0153','42.40996548070072','129.7373806828909','G000077','1'),
	('GM000154','2019-08-26 10:21:13','仓库货位','仓库货位','192.168.20.10154','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050154','FTYUIOLJYT^*(PLKJYT)0154','41.56326313014602','130.87085525580167','G000077','1'),
	('GM000155','2019-09-10 21:15:49','卡车','卡车','192.168.20.10155','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050155','FTYUIOLJYT^*(PLKJYT)0155','40.30936226215213','131.56628803804017','G000078','1'),
	('GM000156','2019-09-11 04:34:54','小超','小超','192.168.20.10156','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050156','FTYUIOLJYT^*(PLKJYT)0156','42.14145876043959','132.09595368180987','G000078','1'),
	('GM000157','2019-09-04 06:31:38','仓库货位','仓库货位','192.168.20.10157','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050157','FTYUIOLJYT^*(PLKJYT)0157','42.55192157546698','130.794663800507','G000079','1'),
	('GM000158','2019-09-12 13:30:41','卡车','卡车','192.168.20.10158','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050158','FTYUIOLJYT^*(PLKJYT)0158','41.331973559536486','130.52781491752793','G000079','1'),
	('GM000159','2019-09-05 22:27:11','小超','小超','192.168.20.10159','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050159','FTYUIOLJYT^*(PLKJYT)0159','40.41913125404323','130.76845292256868','G000080','1'),
	('GM000160','2019-09-07 13:57:13','仓库货位','仓库货位','192.168.20.10160','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050160','FTYUIOLJYT^*(PLKJYT)0160','40.24967439630309','130.75161392159157','G000080','1'),
	('GM000161','2019-09-04 22:06:29','卡车','卡车','192.168.20.10161','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050161','FTYUIOLJYT^*(PLKJYT)0161','41.24251999242224','130.61418504613044','G000081','1'),
	('GM000162','2019-09-13 14:38:05','小超','小超','192.168.20.10162','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050162','FTYUIOLJYT^*(PLKJYT)0162','41.4030231668878','131.58666365639837','G000081','1'),
	('GM000163','2019-09-12 20:03:42','仓库货位','仓库货位','192.168.20.10163','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050163','FTYUIOLJYT^*(PLKJYT)0163','41.866610667839744','129.71769002124068','G000082','1'),
	('GM000164','2019-08-31 13:06:16','卡车','卡车','192.168.20.10164','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050164','FTYUIOLJYT^*(PLKJYT)0164','40.00500557669018','130.74808229736286','G000082','1'),
	('GM000165','2019-09-07 04:34:25','小超','小超','192.168.20.10165','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050165','FTYUIOLJYT^*(PLKJYT)0165','42.427630287795324','129.72636607788485','G000083','1'),
	('GM000166','2019-09-13 05:46:32','仓库货位','仓库货位','192.168.20.10166','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050166','FTYUIOLJYT^*(PLKJYT)0166','40.120849610839805','129.33476965523715','G000083','1'),
	('GM000167','2019-09-07 05:08:05','卡车','卡车','192.168.20.10167','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050167','FTYUIOLJYT^*(PLKJYT)0167','41.13257021389007','130.01651630878263','G000084','1'),
	('GM000168','2019-08-26 23:40:33','小超','小超','192.168.20.10168','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050168','FTYUIOLJYT^*(PLKJYT)0168','42.495633612198674','131.50474727495194','G000084','1'),
	('GM000169','2019-09-09 21:49:21','仓库货位','仓库货位','192.168.20.10169','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050169','FTYUIOLJYT^*(PLKJYT)0169','42.690120779918246','131.43675633520297','G000085','1'),
	('GM000170','2019-09-11 06:53:18','卡车','卡车','192.168.20.10170','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050170','FTYUIOLJYT^*(PLKJYT)0170','42.62855864295353','129.29218936923613','G000085','1'),
	('GM000171','2019-08-27 10:55:17','小超','小超','192.168.20.10171','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050171','FTYUIOLJYT^*(PLKJYT)0171','40.533968212468594','130.22777104913072','G000086','1'),
	('GM000172','2019-08-27 22:02:03','仓库货位','仓库货位','192.168.20.10172','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050172','FTYUIOLJYT^*(PLKJYT)0172','42.355099042062555','131.20023038880387','G000086','1'),
	('GM000173','2019-09-11 10:37:47','卡车','卡车','192.168.20.10173','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050173','FTYUIOLJYT^*(PLKJYT)0173','41.297556003442146','132.12756738589516','G000087','1'),
	('GM000174','2019-08-25 18:19:31','小超','小超','192.168.20.10174','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050174','FTYUIOLJYT^*(PLKJYT)0174','42.71012685138009','130.37125110589497','G000087','1'),
	('GM000175','2019-09-01 06:59:01','仓库货位','仓库货位','192.168.20.10175','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050175','FTYUIOLJYT^*(PLKJYT)0175','42.220922855168276','129.9902575234185','G000088','1'),
	('GM000176','2019-08-26 05:49:56','卡车','卡车','192.168.20.10176','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050176','FTYUIOLJYT^*(PLKJYT)0176','42.66173828155838','130.45880385589382','G000088','1'),
	('GM000177','2019-09-05 23:22:03','小超','小超','192.168.20.10177','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050177','FTYUIOLJYT^*(PLKJYT)0177','39.88349527398952','130.10637539589806','G000089','1'),
	('GM000178','2019-09-07 01:32:35','仓库货位','仓库货位','192.168.20.10178','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050178','FTYUIOLJYT^*(PLKJYT)0178','42.30481909818548','130.485261071599','G000089','1'),
	('GM000179','2019-08-31 05:45:31','卡车','卡车','192.168.20.10179','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050179','FTYUIOLJYT^*(PLKJYT)0179','40.716235190154855','132.03545013981588','G000090','1'),
	('GM000180','2019-08-26 04:34:00','小超','小超','192.168.20.10180','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050180','FTYUIOLJYT^*(PLKJYT)0180','41.3039284939867','130.4149012767792','G000090','1'),
	('GM000181','2019-08-29 21:16:01','仓库货位','仓库货位','192.168.20.10181','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050181','FTYUIOLJYT^*(PLKJYT)0181','42.02243319058065','130.00934563621018','G000091','1'),
	('GM000182','2019-08-27 17:12:29','卡车','卡车','192.168.20.10182','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050182','FTYUIOLJYT^*(PLKJYT)0182','42.68603674489437','130.86734852375082','G000091','1'),
	('GM000183','2019-09-09 06:01:58','小超','小超','192.168.20.10183','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050183','FTYUIOLJYT^*(PLKJYT)0183','42.36443845958252','131.09064764487422','G000092','1'),
	('GM000184','2019-09-10 08:06:33','仓库货位','仓库货位','192.168.20.10184','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050184','FTYUIOLJYT^*(PLKJYT)0184','42.054822633749055','131.57054595632766','G000092','1'),
	('GM000185','2019-09-08 11:31:53','卡车','卡车','192.168.20.10185','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050185','FTYUIOLJYT^*(PLKJYT)0185','41.30510119425573','130.66770171970668','G000093','1'),
	('GM000186','2019-09-13 05:26:07','小超','小超','192.168.20.10186','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050186','FTYUIOLJYT^*(PLKJYT)0186','41.87005815181806','132.05089706650276','G000093','1'),
	('GM000187','2019-09-01 16:07:07','仓库货位','仓库货位','192.168.20.10187','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050187','FTYUIOLJYT^*(PLKJYT)0187','42.04465110994708','129.8209484087331','G000094','1'),
	('GM000188','2019-09-05 13:58:42','卡车','卡车','192.168.20.10188','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050188','FTYUIOLJYT^*(PLKJYT)0188','40.68912622620979','129.69157763004478','G000094','1'),
	('GM000189','2019-09-12 04:30:07','小超','小超','192.168.20.10189','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050189','FTYUIOLJYT^*(PLKJYT)0189','40.89878042967218','131.52877841098237','G000095','1'),
	('GM000190','2019-09-01 03:55:29','仓库货位','仓库货位','192.168.20.10190','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050190','FTYUIOLJYT^*(PLKJYT)0190','40.17462308485379','132.18468776008626','G000095','1'),
	('GM000191','2019-09-03 11:09:30','卡车','卡车','192.168.20.10191','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050191','FTYUIOLJYT^*(PLKJYT)0191','41.02006835991121','130.91066282759098','G000096','1'),
	('GM000192','2019-09-11 09:34:33','小超','小超','192.168.20.10192','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050192','FTYUIOLJYT^*(PLKJYT)0192','40.84458117811979','130.35086297988806','G000096','1'),
	('GM000193','2019-08-27 12:25:46','仓库货位','仓库货位','192.168.20.10193','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050193','FTYUIOLJYT^*(PLKJYT)0193','40.98645475767066','132.18686395138275','G000097','1'),
	('GM000194','2019-09-14 15:51:17','卡车','卡车','192.168.20.10194','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050194','FTYUIOLJYT^*(PLKJYT)0194','39.983056062345796','130.1088100653681','G000097','1'),
	('GM000195','2019-08-25 14:15:42','小超','小超','192.168.20.10195','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050195','FTYUIOLJYT^*(PLKJYT)0195','39.8467286481214','130.11427222032867','G000098','1'),
	('GM000196','2019-09-03 08:09:15','仓库货位','仓库货位','192.168.20.10196','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050196','FTYUIOLJYT^*(PLKJYT)0196','39.98219302632066','129.6202280871758','G000098','1'),
	('GM000197','2019-09-02 05:38:31','卡车','卡车','192.168.20.10197','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050197','FTYUIOLJYT^*(PLKJYT)0197','40.91906371355321','129.32415647008912','G000099','1'),
	('GM000198','2019-08-31 20:34:18','小超','小超','192.168.20.10198','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050198','FTYUIOLJYT^*(PLKJYT)0198','41.68661487045814','131.40157657081846','G000099','1'),
	('GM000199','2019-09-12 18:57:39','仓库货位','仓库货位','192.168.20.10199','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050199','FTYUIOLJYT^*(PLKJYT)0199','41.84524897861097','131.61778492195265','G000100','1'),
	('GM000200','2019-09-02 01:17:57','卡车','卡车','192.168.20.10200','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050200','FTYUIOLJYT^*(PLKJYT)0200','42.7318514224653','131.8376579346524','G000100','1'),
	('GM000201','2019-08-29 14:35:58','小超','小超','192.168.20.10201','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050201','FTYUIOLJYT^*(PLKJYT)0201','40.38679335720243','130.38852322026207','G000101','1'),
	('GM000202','2019-08-27 09:34:06','仓库货位','仓库货位','192.168.20.10202','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050202','FTYUIOLJYT^*(PLKJYT)0202','40.47599402808108','131.42310632270235','G000101','1'),
	('GM000203','2019-09-02 17:06:36','卡车','卡车','192.168.20.10203','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050203','FTYUIOLJYT^*(PLKJYT)0203','41.75152524242332','130.34333257320876','G000102','1'),
	('GM000204','2019-09-10 18:35:16','小超','小超','192.168.20.10204','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050204','FTYUIOLJYT^*(PLKJYT)0204','42.123864203845116','131.33236172476919','G000102','1'),
	('GM000205','2019-09-11 01:30:57','仓库货位','仓库货位','192.168.20.10205','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050205','FTYUIOLJYT^*(PLKJYT)0205','40.418273502795046','131.64237284383185','G000103','1'),
	('GM000206','2019-09-10 03:09:37','卡车','卡车','192.168.20.10206','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050206','FTYUIOLJYT^*(PLKJYT)0206','42.13240343775083','131.2279223067283','G000103','1'),
	('GM000207','2019-09-07 15:28:21','小超','小超','192.168.20.10207','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050207','FTYUIOLJYT^*(PLKJYT)0207','41.805950615818375','131.9030916216061','G000104','1'),
	('GM000208','2019-08-30 21:39:33','仓库货位','仓库货位','192.168.20.10208','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050208','FTYUIOLJYT^*(PLKJYT)0208','41.70204010639011','131.47760755242825','G000104','1'),
	('GM000209','2019-08-28 00:28:42','卡车','卡车','192.168.20.10209','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050209','FTYUIOLJYT^*(PLKJYT)0209','41.5507303784427','131.8058140727428','G000105','1'),
	('GM000210','2019-09-06 08:28:49','小超','小超','192.168.20.10210','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050210','FTYUIOLJYT^*(PLKJYT)0210','41.229386210005885','130.0968366061515','G000105','1'),
	('GM000211','2019-09-13 17:26:19','仓库货位','仓库货位','192.168.20.10211','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050211','FTYUIOLJYT^*(PLKJYT)0211','42.71550777481604','129.76310754414567','G000106','1'),
	('GM000212','2019-09-03 22:45:50','卡车','卡车','192.168.20.10212','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050212','FTYUIOLJYT^*(PLKJYT)0212','42.29032324442518','129.4597842484895','G000106','1'),
	('GM000213','2019-08-28 06:43:50','小超','小超','192.168.20.10213','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050213','FTYUIOLJYT^*(PLKJYT)0213','40.07957108627286','130.38739334461317','G000107','1'),
	('GM000214','2019-09-07 18:28:51','仓库货位','仓库货位','192.168.20.10214','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050214','FTYUIOLJYT^*(PLKJYT)0214','42.19853106239231','131.34757927409726','G000107','1'),
	('GM000215','2019-09-12 02:22:45','卡车','卡车','192.168.20.10215','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050215','FTYUIOLJYT^*(PLKJYT)0215','41.62914705891673','130.81334182923345','G000108','1'),
	('GM000216','2019-08-27 10:10:31','小超','小超','192.168.20.10216','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050216','FTYUIOLJYT^*(PLKJYT)0216','41.24260038124704','131.7019540069154','G000108','1'),
	('GM000217','2019-09-11 14:23:40','仓库货位','仓库货位','192.168.20.10217','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050217','FTYUIOLJYT^*(PLKJYT)0217','39.89255826846278','129.94707123667587','G000109','1'),
	('GM000218','2019-09-04 09:23:14','卡车','卡车','192.168.20.10218','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050218','FTYUIOLJYT^*(PLKJYT)0218','42.53547649787805','130.02405345662336','G000109','1'),
	('GM000219','2019-08-30 06:53:46','小超','小超','192.168.20.10219','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050219','FTYUIOLJYT^*(PLKJYT)0219','42.50416633691242','130.95725257113793','G000110','1'),
	('GM000220','2019-08-29 18:14:01','仓库货位','仓库货位','192.168.20.10220','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050220','FTYUIOLJYT^*(PLKJYT)0220','42.344168314521546','130.96121323665136','G000110','1'),
	('GM000221','2019-08-27 03:46:54','卡车','卡车','192.168.20.10221','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050221','FTYUIOLJYT^*(PLKJYT)0221','40.021661864416416','129.96871452110622','G000111','1'),
	('GM000222','2019-09-03 17:40:01','小超','小超','192.168.20.10222','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050222','FTYUIOLJYT^*(PLKJYT)0222','41.027097501847024','131.03578118716715','G000111','1'),
	('GM000223','2019-08-28 17:14:11','仓库货位','仓库货位','192.168.20.10223','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050223','FTYUIOLJYT^*(PLKJYT)0223','42.00986310866858','129.53246337349626','G000112','1'),
	('GM000224','2019-09-12 22:15:26','卡车','卡车','192.168.20.10224','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050224','FTYUIOLJYT^*(PLKJYT)0224','40.153465144325516','129.73148317438856','G000112','1'),
	('GM000225','2019-09-06 19:48:33','小超','小超','192.168.20.10225','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050225','FTYUIOLJYT^*(PLKJYT)0225','42.704854864823375','131.73324621275907','G000113','1'),
	('GM000226','2019-08-29 23:05:23','仓库货位','仓库货位','192.168.20.10226','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050226','FTYUIOLJYT^*(PLKJYT)0226','42.26650593414144','129.3220331382661','G000113','1'),
	('GM000227','2019-08-25 08:26:28','卡车','卡车','192.168.20.10227','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050227','FTYUIOLJYT^*(PLKJYT)0227','40.41453451395535','130.35356654084578','G000114','1'),
	('GM000228','2019-08-28 18:29:29','小超','小超','192.168.20.10228','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050228','FTYUIOLJYT^*(PLKJYT)0228','40.474039221538874','129.72690874902867','G000114','1'),
	('GM000229','2019-08-29 00:15:33','仓库货位','仓库货位','192.168.20.10229','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050229','FTYUIOLJYT^*(PLKJYT)0229','41.44054978632641','130.57871660952478','G000115','1'),
	('GM000230','2019-09-11 00:37:00','卡车','卡车','192.168.20.10230','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050230','FTYUIOLJYT^*(PLKJYT)0230','40.8894896148099','131.649315486117','G000115','1'),
	('GM000231','2019-08-26 08:34:12','小超','小超','192.168.20.10231','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050231','FTYUIOLJYT^*(PLKJYT)0231','41.73295583168941','129.92884847761016','G000116','1'),
	('GM000232','2019-09-02 07:29:03','仓库货位','仓库货位','192.168.20.10232','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050232','FTYUIOLJYT^*(PLKJYT)0232','39.829342953135054','129.8958460010472','G000116','1'),
	('GM000233','2019-08-24 22:44:25','卡车','卡车','192.168.20.10233','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050233','FTYUIOLJYT^*(PLKJYT)0233','41.239051267174936','131.20992158840681','G000117','1'),
	('GM000234','2019-09-14 09:07:03','小超','小超','192.168.20.10234','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050234','FTYUIOLJYT^*(PLKJYT)0234','39.91425636373706','130.7163164871334','G000117','1'),
	('GM000235','2019-08-26 23:10:32','仓库货位','仓库货位','192.168.20.10235','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050235','FTYUIOLJYT^*(PLKJYT)0235','41.77377104158508','129.94471852765588','G000118','1'),
	('GM000236','2019-09-10 04:33:34','卡车','卡车','192.168.20.10236','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050236','FTYUIOLJYT^*(PLKJYT)0236','42.27680931620582','129.621475177721','G000118','1'),
	('GM000237','2019-09-07 02:10:28','小超','小超','192.168.20.10237','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050237','FTYUIOLJYT^*(PLKJYT)0237','41.028331787574594','131.27781547149922','G000119','1'),
	('GM000238','2019-08-25 01:38:10','仓库货位','仓库货位','192.168.20.10238','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050238','FTYUIOLJYT^*(PLKJYT)0238','41.29584126323488','131.33709559017132','G000119','1'),
	('GM000239','2019-09-12 11:44:24','卡车','卡车','192.168.20.10239','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050239','FTYUIOLJYT^*(PLKJYT)0239','42.61978629898698','129.43486341936574','G000120','1'),
	('GM000240','2019-09-08 21:25:33','小超','小超','192.168.20.10240','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050240','FTYUIOLJYT^*(PLKJYT)0240','41.64278344854341','129.50238022290733','G000120','1'),
	('GM000241','2019-09-04 18:30:21','仓库货位','仓库货位','192.168.20.10241','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050241','FTYUIOLJYT^*(PLKJYT)0241','41.95561552174772','129.28782865616293','G000121','1'),
	('GM000242','2019-09-06 17:19:38','卡车','卡车','192.168.20.10242','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050242','FTYUIOLJYT^*(PLKJYT)0242','42.31727825837306','131.60122654423023','G000121','1'),
	('GM000243','2019-08-25 11:57:39','小超','小超','192.168.20.10243','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050243','FTYUIOLJYT^*(PLKJYT)0243','42.49895984657494','131.15564241208878','G000122','1'),
	('GM000244','2019-09-12 11:59:50','仓库货位','仓库货位','192.168.20.10244','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050244','FTYUIOLJYT^*(PLKJYT)0244','41.286250590309905','129.37499071982216','G000122','1'),
	('GM000245','2019-09-04 01:27:06','卡车','卡车','192.168.20.10245','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050245','FTYUIOLJYT^*(PLKJYT)0245','40.141685632857126','132.01632230251258','G000123','1'),
	('GM000246','2019-09-01 23:39:35','小超','小超','192.168.20.10246','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050246','FTYUIOLJYT^*(PLKJYT)0246','42.73162950650959','132.06878739014806','G000123','1'),
	('GM000247','2019-09-06 02:51:22','仓库货位','仓库货位','192.168.20.10247','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050247','FTYUIOLJYT^*(PLKJYT)0247','39.95993710625182','130.5749797276557','G000124','1'),
	('GM000248','2019-08-27 14:48:45','卡车','卡车','192.168.20.10248','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050248','FTYUIOLJYT^*(PLKJYT)0248','39.80691797500726','130.03958661074589','G000124','1'),
	('GM000249','2019-09-13 07:07:11','小超','小超','192.168.20.10249','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050249','FTYUIOLJYT^*(PLKJYT)0249','41.291509842375035','131.01577473456206','G000125','1'),
	('GM000250','2019-09-05 02:14:14','仓库货位','仓库货位','192.168.20.10250','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050250','FTYUIOLJYT^*(PLKJYT)0250','40.642206741080585','132.2485179193782','G000125','1'),
	('GM000251','2019-08-26 22:00:08','卡车','卡车','192.168.20.10251','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050251','FTYUIOLJYT^*(PLKJYT)0251','42.75328504685823','129.5490049187075','G000126','1'),
	('GM000252','2019-09-07 09:14:03','小超','小超','192.168.20.10252','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050252','FTYUIOLJYT^*(PLKJYT)0252','40.70207621074983','130.48262063929425','G000126','1'),
	('GM000253','2019-08-31 12:36:41','仓库货位','仓库货位','192.168.20.10253','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050253','FTYUIOLJYT^*(PLKJYT)0253','40.442709853857174','129.4719153462716','G000127','1'),
	('GM000254','2019-08-30 16:36:36','卡车','卡车','192.168.20.10254','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050254','FTYUIOLJYT^*(PLKJYT)0254','41.962813063792666','131.82914607241173','G000127','1'),
	('GM000255','2019-09-13 12:13:34','小超','小超','192.168.20.10255','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050255','FTYUIOLJYT^*(PLKJYT)0255','40.838133262637605','130.20893074017033','G000128','1'),
	('GM000256','2019-09-09 18:27:47','仓库货位','仓库货位','192.168.20.10256','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050256','FTYUIOLJYT^*(PLKJYT)0256','39.84678145493705','130.25041839413205','G000128','1');

insert into supplier_space_data values
	('SS000001','成都龙泉驿飞鹤路20号供货商独立管理区','02887654321','1876平方米','W000001','40.22125710096093','131.53934691239817','2019-09-03 03:34:52','1'),
	('SS000002','成都龙泉驿飞鹤路20号供货商独立管理区0002','028876543210002','1876平方米0002','W000001','39.88609605876','129.4323440501859','2019-08-25 00:02:35','1'),
	('SS000003','成都龙泉驿飞鹤路20号供货商独立管理区0003','028876543210003','1876平方米0003','W000002','41.89884657482882','131.98050597742622','2019-08-28 02:12:43','1'),
	('SS000004','成都龙泉驿飞鹤路20号供货商独立管理区0004','028876543210004','1876平方米0004','W000002','39.84954717773283','131.32003867595034','2019-09-05 22:40:48','1');

insert into receiving_space_data values
	('RS000001','成都龙泉驿飞鹤路20号仓库卸货区','02887654321','每个收货区可以供一辆车卸货','1876平方米','W000001','41.70420832972879','129.98154059464582','2019-08-24 14:22:29','1'),
	('RS000002','成都龙泉驿飞鹤路20号仓库卸货区0002','028876543210002','每个收货区可以供一辆车卸货0002','1876平方米0002','W000001','42.120690862125855','130.09768988107234','2019-08-26 09:08:21','1'),
	('RS000003','成都龙泉驿飞鹤路20号仓库卸货区0003','028876543210003','每个收货区可以供一辆车卸货0003','1876平方米0003','W000002','40.83856338294027','132.01329114022002','2019-08-24 09:56:14','1'),
	('RS000004','成都龙泉驿飞鹤路20号仓库卸货区0004','028876543210004','每个收货区可以供一辆车卸货0004','1876平方米0004','W000002','40.689939536101576','130.05489225596574','2019-09-01 02:38:21','1');

insert into shipping_space_data values
	('SS000001','成都龙泉驿飞鹤路20号装货区','02887654321','1876平方米','W000001','40.96646241068654','131.70528127001216','每个收货区可以供一辆车装货','2019-09-09 02:03:06','1'),
	('SS000002','成都龙泉驿飞鹤路20号装货区0002','028876543210002','1876平方米0002','W000001','40.64855833129529','129.80929351905766','每个收货区可以供一辆车装货0002','2019-09-13 23:41:04','1'),
	('SS000003','成都龙泉驿飞鹤路20号装货区0003','028876543210003','1876平方米0003','W000002','40.177156196658856','130.8722700020622','每个收货区可以供一辆车装货0003','2019-09-14 13:25:49','1'),
	('SS000004','成都龙泉驿飞鹤路20号装货区0004','028876543210004','1876平方米0004','W000002','39.92166758154155','131.93636785795374','每个收货区可以供一辆车装货0004','2019-09-13 11:26:44','1');

insert into damage_space_data values
	('DS000001','成都龙泉驿飞鹤路20号仓库损坏货物堆放区','02887654321','1876平方米','41.525568572429464','131.9627820656725','W000001','2019-08-25 01:52:35','1'),
	('DS000002','成都龙泉驿飞鹤路20号仓库损坏货物堆放区0002','028876543210002','1876平方米0002','41.40639977284549','130.86625913076227','W000001','2019-08-24 10:09:37','1'),
	('DS000003','成都龙泉驿飞鹤路20号仓库损坏货物堆放区0003','028876543210003','1876平方米0003','41.18808708632024','131.27923354025933','W000002','2019-08-28 03:45:20','1'),
	('DS000004','成都龙泉驿飞鹤路20号仓库损坏货物堆放区0004','028876543210004','1876平方米0004','39.83754874147254','130.57937617521821','W000002','2019-08-25 19:17:41','1');

insert into warehouse_asset_data values
	('WA000001','叉车','备用件存放区设备库房','W000001','2019-09-09 08:48:30','1'),
	('WA000002','托盘','备用件存放区设备库房0002','W000001','2019-09-08 15:50:58','1'),
	('WA000003','传送带备件','备用件存放区设备库房0003','W000002','2019-09-07 03:43:14','1'),
	('WA000004','叉车','备用件存放区设备库房0004','W000002','2019-08-25 05:42:17','1');

insert into transport_fleet_data values
	('TF000001','双链先锋号车队','02887654321','RSCC000001','2019-08-30 04:13:20','1'),
	('TF000002','双链先锋号车队0002','028876543210002','RSCC000001','2019-08-29 00:43:43','1');

insert into transport_truck_data values
	('TT000001','运货卡车','川AK5','02887654321','VL9198','EN00102','2017-05-12','100万公里','红色','TF000001','1'),
	('TT000002','运货卡车0002','川AK50002','028876543210002','VL91980002','EN001020002','2019-06-09','100万公里0002','蓝色','TF000001','1'),
	('TT000003','运货卡车0003','川AK50003','028876543210003','VL91980003','EN001020003','2016-11-14','100万公里0003','白色','TF000002','1'),
	('TT000004','运货卡车0004','川AK50004','028876543210004','VL91980004','EN001020004','2018-10-26','100万公里0004','灰色','TF000002','1');

insert into truck_driver_data values
	('TD000001','运货卡车司机','51099887733','18777778888','TF000001','1'),
	('TD000002','运货卡车司机0002','510998877330002','13900000002','TF000001','1'),
	('TD000003','运货卡车司机0003','510998877330003','13900000003','TF000002','1'),
	('TD000004','运货卡车司机0004','510998877330004','13900000004','TF000002','1');

insert into transport_task_data values
	('TT000001','货运记录','双链二号仓','2018-02-11','RS000001','TD000001','TT000001','TF000001','40.506442534107414','129.95960256007464','1'),
	('TT000002','货运记录0002','双链二号仓0002','2017-01-19','RS000001','TD000001','TT000001','TF000001','41.14642456876358','131.89562129246985','1'),
	('TT000003','货运记录0003','双链二号仓0003','2017-03-11','RS000002','TD000001','TT000001','TF000001','40.84593720882818','129.63396377080505','1'),
	('TT000004','货运记录0004','双链二号仓0004','2018-11-07','RS000002','TD000001','TT000001','TF000001','41.47097342453367','131.96328413495925','1'),
	('TT000005','货运记录0005','双链二号仓0005','2019-05-29','RS000003','TD000002','TT000002','TF000001','42.58364091191429','131.82891375856568','1'),
	('TT000006','货运记录0006','双链二号仓0006','2019-07-27','RS000003','TD000002','TT000002','TF000001','40.96507467122429','131.00922288304548','1'),
	('TT000007','货运记录0007','双链二号仓0007','2016-12-02','RS000004','TD000002','TT000002','TF000001','42.70617200267386','129.5027234583779','1'),
	('TT000008','货运记录0008','双链二号仓0008','2018-09-04','RS000004','TD000002','TT000002','TF000001','40.14721974423062','130.9567605608741','1'),
	('TT000009','货运记录0009','双链二号仓0009','2018-07-15','RS000005','TD000003','TT000003','TF000002','42.69861780903819','132.01872694068538','1'),
	('TT000010','货运记录0010','双链二号仓0010','2017-06-01','RS000005','TD000003','TT000003','TF000002','42.60844646108346','130.41671539224217','1'),
	('TT000011','货运记录0011','双链二号仓0011','2018-06-21','RS000006','TD000003','TT000003','TF000002','41.15500289231302','131.8460926677419','1'),
	('TT000012','货运记录0012','双链二号仓0012','2019-08-28','RS000006','TD000003','TT000003','TF000002','42.51298087379506','129.27895863060647','1'),
	('TT000013','货运记录0013','双链二号仓0013','2017-11-04','RS000007','TD000004','TT000004','TF000002','42.23526141577213','130.72536995629676','1'),
	('TT000014','货运记录0014','双链二号仓0014','2018-02-21','RS000007','TD000004','TT000004','TF000002','40.0168254346101','131.91233417149076','1'),
	('TT000015','货运记录0015','双链二号仓0015','2017-12-28','RS000008','TD000004','TT000004','TF000002','39.97975757023538','132.23050242410838','1'),
	('TT000016','货运记录0016','双链二号仓0016','2019-08-06','RS000008','TD000004','TT000004','TF000002','42.38880363527784','131.19181581697086','1');

insert into transport_task_track_data values
	('TTT000001','2018-05-22','32.09312164453476','104.85770236160012','TT000001','1'),
	('TTT000002','2017-11-28','32.86910567129725','104.51623805169952','TT000001','1'),
	('TTT000003','2019-03-05','32.48511327065295','105.27755233628606','TT000002','1'),
	('TTT000004','2018-08-22','31.94205207688032','104.15305226178182','TT000002','1'),
	('TTT000005','2017-04-19','32.60974987102514','105.18468436588493','TT000003','1'),
	('TTT000006','2018-09-21','30.8990279123238','103.8596406834605','TT000003','1'),
	('TTT000007','2017-01-28','31.166796793975234','104.18454774247701','TT000004','1'),
	('TTT000008','2018-06-10','32.055152749416415','103.80048483153564','TT000004','1'),
	('TTT000009','2018-05-22','30.050204492427948','103.66775227168725','TT000005','1'),
	('TTT000010','2016-12-28','30.701594036932377','105.5811407545972','TT000005','1'),
	('TTT000011','2018-08-15','32.80500282675038','104.48710949658414','TT000006','1'),
	('TTT000012','2019-04-30','30.872386329007035','103.45292803070893','TT000006','1'),
	('TTT000013','2018-05-22','32.38289644346319','103.20211253296769','TT000007','1'),
	('TTT000014','2019-01-13','32.03960590612968','104.86437022209051','TT000007','1'),
	('TTT000015','2016-11-26','30.45207954053193','103.35193370943306','TT000008','1'),
	('TTT000016','2018-06-12','31.247575182444905','104.81004404475851','TT000008','1'),
	('TTT000017','2019-06-19','31.591327525948017','104.85478325330266','TT000009','1'),
	('TTT000018','2017-05-03','30.04221347867801','104.5248570470316','TT000009','1'),
	('TTT000019','2019-01-12','31.210027120918774','105.06711937192962','TT000010','1'),
	('TTT000020','2019-05-11','30.962580038209136','104.20191167113254','TT000010','1'),
	('TTT000021','2018-09-17','31.213983432015524','103.86741934614028','TT000011','1'),
	('TTT000022','2016-10-02','32.73163160265379','103.3982701606685','TT000011','1'),
	('TTT000023','2018-12-31','31.526694171218303','105.59331589644441','TT000012','1'),
	('TTT000024','2019-07-15','32.896417395537036','104.97397670991845','TT000012','1'),
	('TTT000025','2017-03-22','32.58806413096526','104.38579425140489','TT000013','1'),
	('TTT000026','2017-04-13','32.44916718207357','103.39011227487335','TT000013','1'),
	('TTT000027','2017-04-17','30.41360041649635','104.24840284256062','TT000014','1'),
	('TTT000028','2017-09-20','31.22541554895521','104.59157091875556','TT000014','1'),
	('TTT000029','2018-10-27','31.498987066496046','103.57221937171666','TT000015','1'),
	('TTT000030','2017-05-01','31.079512846545786','103.90539796812624','TT000015','1'),
	('TTT000031','2017-03-09','30.605191144307977','103.30844732807937','TT000016','1'),
	('TTT000032','2017-03-02','32.328269573268116','104.29728351517814','TT000016','1');

insert into account_set_data values
	('AS000001','账套2017','2017年','2018-02-26','企业会计制度','RMB','人民币','招商银行','33265805054885','RSCC000001','RS000001','GS000001','2019-09-14 11:29:18','1'),
	('AS000002','账套2018','2018年','2019-08-31','小企业会计制度','USD','美元','工商银行','332658050548850002','RSCC000001','RS000001','GS000001','2019-08-26 04:07:57','1'),
	('AS000003','账套2019','2019年','2019-07-05','合伙制会计制度','RMB','人民币','招商银行','332658050548850003','RSCC000001','RS000002','GS000001','2019-09-07 17:22:35','1'),
	('AS000004','账套2017','2017年','2018-06-25','企业会计制度','USD','美元','工商银行','332658050548850004','RSCC000001','RS000002','GS000001','2019-08-28 04:40:39','1'),
	('AS000005','账套2018','2018年','2017-09-24','小企业会计制度','RMB','人民币','招商银行','332658050548850005','RSCC000001','RS000003','GS000001','2019-09-05 04:54:05','1'),
	('AS000006','账套2019','2019年','2017-05-16','合伙制会计制度','USD','美元','工商银行','332658050548850006','RSCC000001','RS000003','GS000001','2019-08-25 08:27:07','1'),
	('AS000007','账套2017','2017年','2016-09-27','企业会计制度','RMB','人民币','招商银行','332658050548850007','RSCC000001','RS000004','GS000001','2019-09-02 20:45:50','1'),
	('AS000008','账套2018','2018年','2018-07-24','小企业会计制度','USD','美元','工商银行','332658050548850008','RSCC000001','RS000004','GS000001','2019-09-10 07:48:24','1'),
	('AS000009','账套2019','2019年','2018-03-28','合伙制会计制度','RMB','人民币','招商银行','332658050548850009','RSCC000001','RS000005','GS000002','2019-08-28 23:08:06','1'),
	('AS000010','账套2017','2017年','2017-04-07','企业会计制度','USD','美元','工商银行','332658050548850010','RSCC000001','RS000005','GS000002','2019-08-26 14:52:05','1'),
	('AS000011','账套2018','2018年','2019-03-27','小企业会计制度','RMB','人民币','招商银行','332658050548850011','RSCC000001','RS000006','GS000002','2019-09-01 20:18:28','1'),
	('AS000012','账套2019','2019年','2018-04-23','合伙制会计制度','USD','美元','工商银行','332658050548850012','RSCC000001','RS000006','GS000002','2019-09-03 04:30:35','1'),
	('AS000013','账套2017','2017年','2018-11-07','企业会计制度','RMB','人民币','招商银行','332658050548850013','RSCC000001','RS000007','GS000002','2019-09-07 02:57:15','1'),
	('AS000014','账套2018','2018年','2019-08-30','小企业会计制度','USD','美元','工商银行','332658050548850014','RSCC000001','RS000007','GS000002','2019-09-06 07:43:44','1'),
	('AS000015','账套2019','2019年','2018-01-02','合伙制会计制度','RMB','人民币','招商银行','332658050548850015','RSCC000001','RS000008','GS000002','2019-09-08 00:43:14','1'),
	('AS000016','账套2017','2017年','2018-08-20','企业会计制度','USD','美元','工商银行','332658050548850016','RSCC000001','RS000008','GS000002','2019-09-09 23:26:33','1');

insert into accounting_subject_data values
	('AS000001','AS9999','银行存款','1','资产类','AS000001','1'),
	('AS000002','AS99990002','银行存款0002','2','负债类','AS000001','1'),
	('AS000003','AS99990003','银行存款0003','3','共同类','AS000002','1'),
	('AS000004','AS99990004','银行存款0004','4','所有者权益类','AS000002','1'),
	('AS000005','AS99990005','银行存款0005','5','成本类','AS000003','1'),
	('AS000006','AS99990006','银行存款0006','6','损益类','AS000003','1'),
	('AS000007','AS99990007','银行存款0007','1','资产类','AS000004','1'),
	('AS000008','AS99990008','银行存款0008','2','负债类','AS000004','1'),
	('AS000009','AS99990009','银行存款0009','3','共同类','AS000005','1'),
	('AS000010','AS99990010','银行存款0010','4','所有者权益类','AS000005','1'),
	('AS000011','AS99990011','银行存款0011','5','成本类','AS000006','1'),
	('AS000012','AS99990012','银行存款0012','6','损益类','AS000006','1'),
	('AS000013','AS99990013','银行存款0013','1','资产类','AS000007','1'),
	('AS000014','AS99990014','银行存款0014','2','负债类','AS000007','1'),
	('AS000015','AS99990015','银行存款0015','3','共同类','AS000008','1'),
	('AS000016','AS99990016','银行存款0016','4','所有者权益类','AS000008','1'),
	('AS000017','AS99990017','银行存款0017','5','成本类','AS000009','1'),
	('AS000018','AS99990018','银行存款0018','6','损益类','AS000009','1'),
	('AS000019','AS99990019','银行存款0019','1','资产类','AS000010','1'),
	('AS000020','AS99990020','银行存款0020','2','负债类','AS000010','1'),
	('AS000021','AS99990021','银行存款0021','3','共同类','AS000011','1'),
	('AS000022','AS99990022','银行存款0022','4','所有者权益类','AS000011','1'),
	('AS000023','AS99990023','银行存款0023','5','成本类','AS000012','1'),
	('AS000024','AS99990024','银行存款0024','6','损益类','AS000012','1'),
	('AS000025','AS99990025','银行存款0025','1','资产类','AS000013','1'),
	('AS000026','AS99990026','银行存款0026','2','负债类','AS000013','1'),
	('AS000027','AS99990027','银行存款0027','3','共同类','AS000014','1'),
	('AS000028','AS99990028','银行存款0028','4','所有者权益类','AS000014','1'),
	('AS000029','AS99990029','银行存款0029','5','成本类','AS000015','1'),
	('AS000030','AS99990030','银行存款0030','6','损益类','AS000015','1'),
	('AS000031','AS99990031','银行存款0031','1','资产类','AS000016','1'),
	('AS000032','AS99990032','银行存款0032','2','负债类','AS000016','1');

insert into accounting_period_data values
	('AP000001','2017年1月','2018-08-26','2016-12-23','AS000001','1'),
	('AP000002','2017年2月','2018-09-10','2018-12-18','AS000001','1'),
	('AP000003','2017年3月','2019-08-01','2018-01-16','AS000002','1'),
	('AP000004','2017年4月','2016-12-05','2017-12-12','AS000002','1'),
	('AP000005','2017年5月','2017-02-19','2019-06-12','AS000003','1'),
	('AP000006','2017年6月','2018-09-02','2017-09-07','AS000003','1'),
	('AP000007','2017年7月','2018-09-03','2016-11-24','AS000004','1'),
	('AP000008','2017年8月','2016-12-04','2018-09-18','AS000004','1'),
	('AP000009','2017年9月','2019-03-02','2018-08-20','AS000005','1'),
	('AP000010','2017年10月','2018-12-25','2017-11-25','AS000005','1'),
	('AP000011','2017年11月','2016-12-23','2017-12-14','AS000006','1'),
	('AP000012','2017年12月','2018-12-11','2018-08-01','AS000006','1'),
	('AP000013','2017年1月','2018-07-24','2018-11-06','AS000007','1'),
	('AP000014','2017年2月','2016-10-17','2018-09-28','AS000007','1'),
	('AP000015','2017年3月','2017-10-04','2017-05-30','AS000008','1'),
	('AP000016','2017年4月','2019-02-07','2018-11-11','AS000008','1'),
	('AP000017','2017年5月','2019-03-09','2018-11-10','AS000009','1'),
	('AP000018','2017年6月','2017-09-06','2019-07-04','AS000009','1'),
	('AP000019','2017年7月','2019-05-12','2018-07-18','AS000010','1'),
	('AP000020','2017年8月','2017-01-17','2017-07-05','AS000010','1'),
	('AP000021','2017年9月','2018-03-07','2018-03-26','AS000011','1'),
	('AP000022','2017年10月','2017-12-25','2017-11-03','AS000011','1'),
	('AP000023','2017年11月','2016-09-30','2016-12-26','AS000012','1'),
	('AP000024','2017年12月','2017-04-24','2019-09-04','AS000012','1'),
	('AP000025','2017年1月','2017-09-18','2018-10-23','AS000013','1'),
	('AP000026','2017年2月','2019-06-10','2017-01-29','AS000013','1'),
	('AP000027','2017年3月','2017-10-10','2016-10-01','AS000014','1'),
	('AP000028','2017年4月','2019-05-13','2018-11-12','AS000014','1'),
	('AP000029','2017年5月','2018-06-04','2017-09-25','AS000015','1'),
	('AP000030','2017年6月','2017-07-02','2016-10-20','AS000015','1'),
	('AP000031','2017年7月','2018-09-20','2016-09-30','AS000016','1'),
	('AP000032','2017年8月','2018-11-24','2019-02-04','AS000016','1');

insert into accounting_document_type_data values
	('ADT000001','记账凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。','AS000001','1'),
	('ADT000002','收款凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0002','AS000001','1'),
	('ADT000003','付款凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0003','AS000002','1'),
	('ADT000004','记账凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0004','AS000002','1'),
	('ADT000005','收款凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0005','AS000003','1'),
	('ADT000006','付款凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0006','AS000003','1'),
	('ADT000007','记账凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0007','AS000004','1'),
	('ADT000008','收款凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0008','AS000004','1'),
	('ADT000009','付款凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0009','AS000005','1'),
	('ADT000010','记账凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0010','AS000005','1'),
	('ADT000011','收款凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0011','AS000006','1'),
	('ADT000012','付款凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0012','AS000006','1'),
	('ADT000013','记账凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0013','AS000007','1'),
	('ADT000014','收款凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0014','AS000007','1'),
	('ADT000015','付款凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0015','AS000008','1'),
	('ADT000016','记账凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0016','AS000008','1'),
	('ADT000017','收款凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0017','AS000009','1'),
	('ADT000018','付款凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0018','AS000009','1'),
	('ADT000019','记账凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0019','AS000010','1'),
	('ADT000020','收款凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0020','AS000010','1'),
	('ADT000021','付款凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0021','AS000011','1'),
	('ADT000022','记账凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0022','AS000011','1'),
	('ADT000023','收款凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0023','AS000012','1'),
	('ADT000024','付款凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0024','AS000012','1'),
	('ADT000025','记账凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0025','AS000013','1'),
	('ADT000026','收款凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0026','AS000013','1'),
	('ADT000027','付款凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0027','AS000014','1'),
	('ADT000028','记账凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0028','AS000014','1'),
	('ADT000029','收款凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0029','AS000015','1'),
	('ADT000030','付款凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0030','AS000015','1'),
	('ADT000031','记账凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0031','AS000016','1'),
	('ADT000032','收款凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0032','AS000016','1');

insert into accounting_document_data values
	('AD000001','记账凭证','2017-05-16','AP000001','ADT000001',NULL,NULL,NULL,NULL,'CREATED','1'),
	('AD000002','记账凭证0002','2019-01-19','AP000001','ADT000001',NULL,NULL,NULL,NULL,'CONFIRMED','1'),
	('AD000003','记账凭证0003','2019-04-20','AP000002','ADT000002',NULL,NULL,NULL,NULL,'AUDITED','1'),
	('AD000004','记账凭证0004','2018-06-05','AP000002','ADT000002',NULL,NULL,NULL,NULL,'POSTED','1'),
	('AD000005','记账凭证0005','2019-05-16','AP000003','ADT000003',NULL,NULL,NULL,NULL,'CREATED','1'),
	('AD000006','记账凭证0006','2019-04-02','AP000003','ADT000003',NULL,NULL,NULL,NULL,'CONFIRMED','1'),
	('AD000007','记账凭证0007','2016-12-18','AP000004','ADT000004',NULL,NULL,NULL,NULL,'AUDITED','1'),
	('AD000008','记账凭证0008','2019-04-16','AP000004','ADT000004',NULL,NULL,NULL,NULL,'POSTED','1'),
	('AD000009','记账凭证0009','2019-03-19','AP000005','ADT000005',NULL,NULL,NULL,NULL,'CREATED','1'),
	('AD000010','记账凭证0010','2016-10-31','AP000005','ADT000005',NULL,NULL,NULL,NULL,'CONFIRMED','1'),
	('AD000011','记账凭证0011','2019-03-04','AP000006','ADT000006',NULL,NULL,NULL,NULL,'AUDITED','1'),
	('AD000012','记账凭证0012','2018-05-06','AP000006','ADT000006',NULL,NULL,NULL,NULL,'POSTED','1'),
	('AD000013','记账凭证0013','2017-08-13','AP000007','ADT000007',NULL,NULL,NULL,NULL,'CREATED','1'),
	('AD000014','记账凭证0014','2019-07-11','AP000007','ADT000007',NULL,NULL,NULL,NULL,'CONFIRMED','1'),
	('AD000015','记账凭证0015','2019-01-06','AP000008','ADT000008',NULL,NULL,NULL,NULL,'AUDITED','1'),
	('AD000016','记账凭证0016','2016-09-28','AP000008','ADT000008',NULL,NULL,NULL,NULL,'POSTED','1'),
	('AD000017','记账凭证0017','2018-12-09','AP000009','ADT000009',NULL,NULL,NULL,NULL,'CREATED','1'),
	('AD000018','记账凭证0018','2017-05-06','AP000009','ADT000009',NULL,NULL,NULL,NULL,'CONFIRMED','1'),
	('AD000019','记账凭证0019','2019-04-06','AP000010','ADT000010',NULL,NULL,NULL,NULL,'AUDITED','1'),
	('AD000020','记账凭证0020','2018-11-29','AP000010','ADT000010',NULL,NULL,NULL,NULL,'POSTED','1'),
	('AD000021','记账凭证0021','2017-05-07','AP000011','ADT000011',NULL,NULL,NULL,NULL,'CREATED','1'),
	('AD000022','记账凭证0022','2017-08-26','AP000011','ADT000011',NULL,NULL,NULL,NULL,'CONFIRMED','1'),
	('AD000023','记账凭证0023','2018-12-03','AP000012','ADT000012',NULL,NULL,NULL,NULL,'AUDITED','1'),
	('AD000024','记账凭证0024','2018-05-20','AP000012','ADT000012',NULL,NULL,NULL,NULL,'POSTED','1'),
	('AD000025','记账凭证0025','2017-04-28','AP000013','ADT000013',NULL,NULL,NULL,NULL,'CREATED','1'),
	('AD000026','记账凭证0026','2018-09-08','AP000013','ADT000013',NULL,NULL,NULL,NULL,'CONFIRMED','1'),
	('AD000027','记账凭证0027','2018-08-01','AP000014','ADT000014',NULL,NULL,NULL,NULL,'AUDITED','1'),
	('AD000028','记账凭证0028','2019-04-28','AP000014','ADT000014',NULL,NULL,NULL,NULL,'POSTED','1'),
	('AD000029','记账凭证0029','2018-03-10','AP000015','ADT000015',NULL,NULL,NULL,NULL,'CREATED','1'),
	('AD000030','记账凭证0030','2019-03-29','AP000015','ADT000015',NULL,NULL,NULL,NULL,'CONFIRMED','1'),
	('AD000031','记账凭证0031','2017-07-24','AP000016','ADT000016',NULL,NULL,NULL,NULL,'AUDITED','1'),
	('AD000032','记账凭证0032','2019-03-28','AP000016','ADT000016',NULL,NULL,NULL,NULL,'POSTED','1'),
	('AD000033','记账凭证0033','2016-12-19','AP000017','ADT000017',NULL,NULL,NULL,NULL,'CREATED','1'),
	('AD000034','记账凭证0034','2016-12-11','AP000017','ADT000017',NULL,NULL,NULL,NULL,'CONFIRMED','1'),
	('AD000035','记账凭证0035','2017-07-15','AP000018','ADT000018',NULL,NULL,NULL,NULL,'AUDITED','1'),
	('AD000036','记账凭证0036','2018-03-13','AP000018','ADT000018',NULL,NULL,NULL,NULL,'POSTED','1'),
	('AD000037','记账凭证0037','2019-04-08','AP000019','ADT000019',NULL,NULL,NULL,NULL,'CREATED','1'),
	('AD000038','记账凭证0038','2019-07-04','AP000019','ADT000019',NULL,NULL,NULL,NULL,'CONFIRMED','1'),
	('AD000039','记账凭证0039','2018-07-07','AP000020','ADT000020',NULL,NULL,NULL,NULL,'AUDITED','1'),
	('AD000040','记账凭证0040','2019-03-30','AP000020','ADT000020',NULL,NULL,NULL,NULL,'POSTED','1'),
	('AD000041','记账凭证0041','2019-08-03','AP000021','ADT000021',NULL,NULL,NULL,NULL,'CREATED','1'),
	('AD000042','记账凭证0042','2018-10-06','AP000021','ADT000021',NULL,NULL,NULL,NULL,'CONFIRMED','1'),
	('AD000043','记账凭证0043','2016-10-18','AP000022','ADT000022',NULL,NULL,NULL,NULL,'AUDITED','1'),
	('AD000044','记账凭证0044','2018-05-13','AP000022','ADT000022',NULL,NULL,NULL,NULL,'POSTED','1'),
	('AD000045','记账凭证0045','2019-02-10','AP000023','ADT000023',NULL,NULL,NULL,NULL,'CREATED','1'),
	('AD000046','记账凭证0046','2016-12-19','AP000023','ADT000023',NULL,NULL,NULL,NULL,'CONFIRMED','1'),
	('AD000047','记账凭证0047','2018-12-28','AP000024','ADT000024',NULL,NULL,NULL,NULL,'AUDITED','1'),
	('AD000048','记账凭证0048','2018-05-07','AP000024','ADT000024',NULL,NULL,NULL,NULL,'POSTED','1'),
	('AD000049','记账凭证0049','2018-12-01','AP000025','ADT000025',NULL,NULL,NULL,NULL,'CREATED','1'),
	('AD000050','记账凭证0050','2016-11-28','AP000025','ADT000025',NULL,NULL,NULL,NULL,'CONFIRMED','1'),
	('AD000051','记账凭证0051','2017-01-21','AP000026','ADT000026',NULL,NULL,NULL,NULL,'AUDITED','1'),
	('AD000052','记账凭证0052','2019-03-14','AP000026','ADT000026',NULL,NULL,NULL,NULL,'POSTED','1'),
	('AD000053','记账凭证0053','2018-05-07','AP000027','ADT000027',NULL,NULL,NULL,NULL,'CREATED','1'),
	('AD000054','记账凭证0054','2016-09-25','AP000027','ADT000027',NULL,NULL,NULL,NULL,'CONFIRMED','1'),
	('AD000055','记账凭证0055','2018-01-04','AP000028','ADT000028',NULL,NULL,NULL,NULL,'AUDITED','1'),
	('AD000056','记账凭证0056','2017-07-27','AP000028','ADT000028',NULL,NULL,NULL,NULL,'POSTED','1'),
	('AD000057','记账凭证0057','2017-05-14','AP000029','ADT000029',NULL,NULL,NULL,NULL,'CREATED','1'),
	('AD000058','记账凭证0058','2018-03-17','AP000029','ADT000029',NULL,NULL,NULL,NULL,'CONFIRMED','1'),
	('AD000059','记账凭证0059','2018-01-09','AP000030','ADT000030',NULL,NULL,NULL,NULL,'AUDITED','1'),
	('AD000060','记账凭证0060','2018-07-02','AP000030','ADT000030',NULL,NULL,NULL,NULL,'POSTED','1'),
	('AD000061','记账凭证0061','2017-10-12','AP000031','ADT000031',NULL,NULL,NULL,NULL,'CREATED','1'),
	('AD000062','记账凭证0062','2017-02-05','AP000031','ADT000031',NULL,NULL,NULL,NULL,'CONFIRMED','1'),
	('AD000063','记账凭证0063','2019-06-19','AP000032','ADT000032',NULL,NULL,NULL,NULL,'AUDITED','1'),
	('AD000064','记账凭证0064','2018-06-01','AP000032','ADT000032',NULL,NULL,NULL,NULL,'POSTED','1');

insert into accounting_document_creation_data values
	('ADC000001','财务会计','确认提交','2017-05-04','1');

insert into accounting_document_confirmation_data values
	('ADC000001','财务会计','确认通过','2018-12-04','1');

insert into accounting_document_auditing_data values
	('ADA000001','财务会计','审核通过，要都审核过了才通过哦','2018-09-14','1');

insert into accounting_document_posting_data values
	('ADP000001','财务会计','审核通过，要都审核过了才通过哦','2016-09-28','1');

insert into original_voucher_data values
	('OV000001','这是手写的发票','李亚青','本公司','原始凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000001',NULL,NULL,NULL,'CREATED','1'),
	('OV000002','这是手写的发票0002','李亚青0002','本公司0002','发票','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000001',NULL,NULL,NULL,'CONFIRMED','1'),
	('OV000003','这是手写的发票0003','李亚青0003','本公司0003','出库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000002',NULL,NULL,NULL,'AUDITED','1'),
	('OV000004','这是手写的发票0004','李亚青0004','本公司0004','入库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000002',NULL,NULL,NULL,'CREATED','1'),
	('OV000005','这是手写的发票0005','李亚青0005','本公司0005','存款回执','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000003',NULL,NULL,NULL,'CONFIRMED','1'),
	('OV000006','这是手写的发票0006','李亚青0006','本公司0006','验收证明','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000003',NULL,NULL,NULL,'AUDITED','1'),
	('OV000007','这是手写的发票0007','李亚青0007','本公司0007','借款凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000004',NULL,NULL,NULL,'CREATED','1'),
	('OV000008','这是手写的发票0008','李亚青0008','本公司0008','原始凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000004',NULL,NULL,NULL,'CONFIRMED','1'),
	('OV000009','这是手写的发票0009','李亚青0009','本公司0009','发票','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000005',NULL,NULL,NULL,'AUDITED','1'),
	('OV000010','这是手写的发票0010','李亚青0010','本公司0010','出库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000005',NULL,NULL,NULL,'CREATED','1'),
	('OV000011','这是手写的发票0011','李亚青0011','本公司0011','入库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000006',NULL,NULL,NULL,'CONFIRMED','1'),
	('OV000012','这是手写的发票0012','李亚青0012','本公司0012','存款回执','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000006',NULL,NULL,NULL,'AUDITED','1'),
	('OV000013','这是手写的发票0013','李亚青0013','本公司0013','验收证明','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000007',NULL,NULL,NULL,'CREATED','1'),
	('OV000014','这是手写的发票0014','李亚青0014','本公司0014','借款凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000007',NULL,NULL,NULL,'CONFIRMED','1'),
	('OV000015','这是手写的发票0015','李亚青0015','本公司0015','原始凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000008',NULL,NULL,NULL,'AUDITED','1'),
	('OV000016','这是手写的发票0016','李亚青0016','本公司0016','发票','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000008',NULL,NULL,NULL,'CREATED','1'),
	('OV000017','这是手写的发票0017','李亚青0017','本公司0017','出库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000009',NULL,NULL,NULL,'CONFIRMED','1'),
	('OV000018','这是手写的发票0018','李亚青0018','本公司0018','入库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000009',NULL,NULL,NULL,'AUDITED','1'),
	('OV000019','这是手写的发票0019','李亚青0019','本公司0019','存款回执','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000010',NULL,NULL,NULL,'CREATED','1'),
	('OV000020','这是手写的发票0020','李亚青0020','本公司0020','验收证明','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000010',NULL,NULL,NULL,'CONFIRMED','1'),
	('OV000021','这是手写的发票0021','李亚青0021','本公司0021','借款凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000011',NULL,NULL,NULL,'AUDITED','1'),
	('OV000022','这是手写的发票0022','李亚青0022','本公司0022','原始凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000011',NULL,NULL,NULL,'CREATED','1'),
	('OV000023','这是手写的发票0023','李亚青0023','本公司0023','发票','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000012',NULL,NULL,NULL,'CONFIRMED','1'),
	('OV000024','这是手写的发票0024','李亚青0024','本公司0024','出库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000012',NULL,NULL,NULL,'AUDITED','1'),
	('OV000025','这是手写的发票0025','李亚青0025','本公司0025','入库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000013',NULL,NULL,NULL,'CREATED','1'),
	('OV000026','这是手写的发票0026','李亚青0026','本公司0026','存款回执','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000013',NULL,NULL,NULL,'CONFIRMED','1'),
	('OV000027','这是手写的发票0027','李亚青0027','本公司0027','验收证明','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000014',NULL,NULL,NULL,'AUDITED','1'),
	('OV000028','这是手写的发票0028','李亚青0028','本公司0028','借款凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000014',NULL,NULL,NULL,'CREATED','1'),
	('OV000029','这是手写的发票0029','李亚青0029','本公司0029','原始凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000015',NULL,NULL,NULL,'CONFIRMED','1'),
	('OV000030','这是手写的发票0030','李亚青0030','本公司0030','发票','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000015',NULL,NULL,NULL,'AUDITED','1'),
	('OV000031','这是手写的发票0031','李亚青0031','本公司0031','出库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000016',NULL,NULL,NULL,'CREATED','1'),
	('OV000032','这是手写的发票0032','李亚青0032','本公司0032','入库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000016',NULL,NULL,NULL,'CONFIRMED','1'),
	('OV000033','这是手写的发票0033','李亚青0033','本公司0033','存款回执','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000017',NULL,NULL,NULL,'AUDITED','1'),
	('OV000034','这是手写的发票0034','李亚青0034','本公司0034','验收证明','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000017',NULL,NULL,NULL,'CREATED','1'),
	('OV000035','这是手写的发票0035','李亚青0035','本公司0035','借款凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000018',NULL,NULL,NULL,'CONFIRMED','1'),
	('OV000036','这是手写的发票0036','李亚青0036','本公司0036','原始凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000018',NULL,NULL,NULL,'AUDITED','1'),
	('OV000037','这是手写的发票0037','李亚青0037','本公司0037','发票','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000019',NULL,NULL,NULL,'CREATED','1'),
	('OV000038','这是手写的发票0038','李亚青0038','本公司0038','出库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000019',NULL,NULL,NULL,'CONFIRMED','1'),
	('OV000039','这是手写的发票0039','李亚青0039','本公司0039','入库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000020',NULL,NULL,NULL,'AUDITED','1'),
	('OV000040','这是手写的发票0040','李亚青0040','本公司0040','存款回执','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000020',NULL,NULL,NULL,'CREATED','1'),
	('OV000041','这是手写的发票0041','李亚青0041','本公司0041','验收证明','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000021',NULL,NULL,NULL,'CONFIRMED','1'),
	('OV000042','这是手写的发票0042','李亚青0042','本公司0042','借款凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000021',NULL,NULL,NULL,'AUDITED','1'),
	('OV000043','这是手写的发票0043','李亚青0043','本公司0043','原始凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000022',NULL,NULL,NULL,'CREATED','1'),
	('OV000044','这是手写的发票0044','李亚青0044','本公司0044','发票','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000022',NULL,NULL,NULL,'CONFIRMED','1'),
	('OV000045','这是手写的发票0045','李亚青0045','本公司0045','出库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000023',NULL,NULL,NULL,'AUDITED','1'),
	('OV000046','这是手写的发票0046','李亚青0046','本公司0046','入库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000023',NULL,NULL,NULL,'CREATED','1'),
	('OV000047','这是手写的发票0047','李亚青0047','本公司0047','存款回执','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000024',NULL,NULL,NULL,'CONFIRMED','1'),
	('OV000048','这是手写的发票0048','李亚青0048','本公司0048','验收证明','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000024',NULL,NULL,NULL,'AUDITED','1'),
	('OV000049','这是手写的发票0049','李亚青0049','本公司0049','借款凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000025',NULL,NULL,NULL,'CREATED','1'),
	('OV000050','这是手写的发票0050','李亚青0050','本公司0050','原始凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000025',NULL,NULL,NULL,'CONFIRMED','1'),
	('OV000051','这是手写的发票0051','李亚青0051','本公司0051','发票','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000026',NULL,NULL,NULL,'AUDITED','1'),
	('OV000052','这是手写的发票0052','李亚青0052','本公司0052','出库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000026',NULL,NULL,NULL,'CREATED','1'),
	('OV000053','这是手写的发票0053','李亚青0053','本公司0053','入库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000027',NULL,NULL,NULL,'CONFIRMED','1'),
	('OV000054','这是手写的发票0054','李亚青0054','本公司0054','存款回执','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000027',NULL,NULL,NULL,'AUDITED','1'),
	('OV000055','这是手写的发票0055','李亚青0055','本公司0055','验收证明','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000028',NULL,NULL,NULL,'CREATED','1'),
	('OV000056','这是手写的发票0056','李亚青0056','本公司0056','借款凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000028',NULL,NULL,NULL,'CONFIRMED','1'),
	('OV000057','这是手写的发票0057','李亚青0057','本公司0057','原始凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000029',NULL,NULL,NULL,'AUDITED','1'),
	('OV000058','这是手写的发票0058','李亚青0058','本公司0058','发票','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000029',NULL,NULL,NULL,'CREATED','1'),
	('OV000059','这是手写的发票0059','李亚青0059','本公司0059','出库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000030',NULL,NULL,NULL,'CONFIRMED','1'),
	('OV000060','这是手写的发票0060','李亚青0060','本公司0060','入库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000030',NULL,NULL,NULL,'AUDITED','1'),
	('OV000061','这是手写的发票0061','李亚青0061','本公司0061','存款回执','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000031',NULL,NULL,NULL,'CREATED','1'),
	('OV000062','这是手写的发票0062','李亚青0062','本公司0062','验收证明','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000031',NULL,NULL,NULL,'CONFIRMED','1'),
	('OV000063','这是手写的发票0063','李亚青0063','本公司0063','借款凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000032',NULL,NULL,NULL,'AUDITED','1'),
	('OV000064','这是手写的发票0064','李亚青0064','本公司0064','原始凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000032',NULL,NULL,NULL,'CREATED','1'),
	('OV000065','这是手写的发票0065','李亚青0065','本公司0065','发票','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000033',NULL,NULL,NULL,'CONFIRMED','1'),
	('OV000066','这是手写的发票0066','李亚青0066','本公司0066','出库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000033',NULL,NULL,NULL,'AUDITED','1'),
	('OV000067','这是手写的发票0067','李亚青0067','本公司0067','入库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000034',NULL,NULL,NULL,'CREATED','1'),
	('OV000068','这是手写的发票0068','李亚青0068','本公司0068','存款回执','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000034',NULL,NULL,NULL,'CONFIRMED','1'),
	('OV000069','这是手写的发票0069','李亚青0069','本公司0069','验收证明','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000035',NULL,NULL,NULL,'AUDITED','1'),
	('OV000070','这是手写的发票0070','李亚青0070','本公司0070','借款凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000035',NULL,NULL,NULL,'CREATED','1'),
	('OV000071','这是手写的发票0071','李亚青0071','本公司0071','原始凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000036',NULL,NULL,NULL,'CONFIRMED','1'),
	('OV000072','这是手写的发票0072','李亚青0072','本公司0072','发票','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000036',NULL,NULL,NULL,'AUDITED','1'),
	('OV000073','这是手写的发票0073','李亚青0073','本公司0073','出库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000037',NULL,NULL,NULL,'CREATED','1'),
	('OV000074','这是手写的发票0074','李亚青0074','本公司0074','入库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000037',NULL,NULL,NULL,'CONFIRMED','1'),
	('OV000075','这是手写的发票0075','李亚青0075','本公司0075','存款回执','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000038',NULL,NULL,NULL,'AUDITED','1'),
	('OV000076','这是手写的发票0076','李亚青0076','本公司0076','验收证明','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000038',NULL,NULL,NULL,'CREATED','1'),
	('OV000077','这是手写的发票0077','李亚青0077','本公司0077','借款凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000039',NULL,NULL,NULL,'CONFIRMED','1'),
	('OV000078','这是手写的发票0078','李亚青0078','本公司0078','原始凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000039',NULL,NULL,NULL,'AUDITED','1'),
	('OV000079','这是手写的发票0079','李亚青0079','本公司0079','发票','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000040',NULL,NULL,NULL,'CREATED','1'),
	('OV000080','这是手写的发票0080','李亚青0080','本公司0080','出库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000040',NULL,NULL,NULL,'CONFIRMED','1'),
	('OV000081','这是手写的发票0081','李亚青0081','本公司0081','入库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000041',NULL,NULL,NULL,'AUDITED','1'),
	('OV000082','这是手写的发票0082','李亚青0082','本公司0082','存款回执','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000041',NULL,NULL,NULL,'CREATED','1'),
	('OV000083','这是手写的发票0083','李亚青0083','本公司0083','验收证明','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000042',NULL,NULL,NULL,'CONFIRMED','1'),
	('OV000084','这是手写的发票0084','李亚青0084','本公司0084','借款凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000042',NULL,NULL,NULL,'AUDITED','1'),
	('OV000085','这是手写的发票0085','李亚青0085','本公司0085','原始凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000043',NULL,NULL,NULL,'CREATED','1'),
	('OV000086','这是手写的发票0086','李亚青0086','本公司0086','发票','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000043',NULL,NULL,NULL,'CONFIRMED','1'),
	('OV000087','这是手写的发票0087','李亚青0087','本公司0087','出库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000044',NULL,NULL,NULL,'AUDITED','1'),
	('OV000088','这是手写的发票0088','李亚青0088','本公司0088','入库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000044',NULL,NULL,NULL,'CREATED','1'),
	('OV000089','这是手写的发票0089','李亚青0089','本公司0089','存款回执','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000045',NULL,NULL,NULL,'CONFIRMED','1'),
	('OV000090','这是手写的发票0090','李亚青0090','本公司0090','验收证明','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000045',NULL,NULL,NULL,'AUDITED','1'),
	('OV000091','这是手写的发票0091','李亚青0091','本公司0091','借款凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000046',NULL,NULL,NULL,'CREATED','1'),
	('OV000092','这是手写的发票0092','李亚青0092','本公司0092','原始凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000046',NULL,NULL,NULL,'CONFIRMED','1'),
	('OV000093','这是手写的发票0093','李亚青0093','本公司0093','发票','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000047',NULL,NULL,NULL,'AUDITED','1'),
	('OV000094','这是手写的发票0094','李亚青0094','本公司0094','出库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000047',NULL,NULL,NULL,'CREATED','1'),
	('OV000095','这是手写的发票0095','李亚青0095','本公司0095','入库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000048',NULL,NULL,NULL,'CONFIRMED','1'),
	('OV000096','这是手写的发票0096','李亚青0096','本公司0096','存款回执','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000048',NULL,NULL,NULL,'AUDITED','1'),
	('OV000097','这是手写的发票0097','李亚青0097','本公司0097','验收证明','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000049',NULL,NULL,NULL,'CREATED','1'),
	('OV000098','这是手写的发票0098','李亚青0098','本公司0098','借款凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000049',NULL,NULL,NULL,'CONFIRMED','1'),
	('OV000099','这是手写的发票0099','李亚青0099','本公司0099','原始凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000050',NULL,NULL,NULL,'AUDITED','1'),
	('OV000100','这是手写的发票0100','李亚青0100','本公司0100','发票','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000050',NULL,NULL,NULL,'CREATED','1'),
	('OV000101','这是手写的发票0101','李亚青0101','本公司0101','出库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000051',NULL,NULL,NULL,'CONFIRMED','1'),
	('OV000102','这是手写的发票0102','李亚青0102','本公司0102','入库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000051',NULL,NULL,NULL,'AUDITED','1'),
	('OV000103','这是手写的发票0103','李亚青0103','本公司0103','存款回执','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000052',NULL,NULL,NULL,'CREATED','1'),
	('OV000104','这是手写的发票0104','李亚青0104','本公司0104','验收证明','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000052',NULL,NULL,NULL,'CONFIRMED','1'),
	('OV000105','这是手写的发票0105','李亚青0105','本公司0105','借款凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000053',NULL,NULL,NULL,'AUDITED','1'),
	('OV000106','这是手写的发票0106','李亚青0106','本公司0106','原始凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000053',NULL,NULL,NULL,'CREATED','1'),
	('OV000107','这是手写的发票0107','李亚青0107','本公司0107','发票','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000054',NULL,NULL,NULL,'CONFIRMED','1'),
	('OV000108','这是手写的发票0108','李亚青0108','本公司0108','出库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000054',NULL,NULL,NULL,'AUDITED','1'),
	('OV000109','这是手写的发票0109','李亚青0109','本公司0109','入库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000055',NULL,NULL,NULL,'CREATED','1'),
	('OV000110','这是手写的发票0110','李亚青0110','本公司0110','存款回执','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000055',NULL,NULL,NULL,'CONFIRMED','1'),
	('OV000111','这是手写的发票0111','李亚青0111','本公司0111','验收证明','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000056',NULL,NULL,NULL,'AUDITED','1'),
	('OV000112','这是手写的发票0112','李亚青0112','本公司0112','借款凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000056',NULL,NULL,NULL,'CREATED','1'),
	('OV000113','这是手写的发票0113','李亚青0113','本公司0113','原始凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000057',NULL,NULL,NULL,'CONFIRMED','1'),
	('OV000114','这是手写的发票0114','李亚青0114','本公司0114','发票','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000057',NULL,NULL,NULL,'AUDITED','1'),
	('OV000115','这是手写的发票0115','李亚青0115','本公司0115','出库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000058',NULL,NULL,NULL,'CREATED','1'),
	('OV000116','这是手写的发票0116','李亚青0116','本公司0116','入库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000058',NULL,NULL,NULL,'CONFIRMED','1'),
	('OV000117','这是手写的发票0117','李亚青0117','本公司0117','存款回执','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000059',NULL,NULL,NULL,'AUDITED','1'),
	('OV000118','这是手写的发票0118','李亚青0118','本公司0118','验收证明','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000059',NULL,NULL,NULL,'CREATED','1'),
	('OV000119','这是手写的发票0119','李亚青0119','本公司0119','借款凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000060',NULL,NULL,NULL,'CONFIRMED','1'),
	('OV000120','这是手写的发票0120','李亚青0120','本公司0120','原始凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000060',NULL,NULL,NULL,'AUDITED','1'),
	('OV000121','这是手写的发票0121','李亚青0121','本公司0121','发票','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000061',NULL,NULL,NULL,'CREATED','1'),
	('OV000122','这是手写的发票0122','李亚青0122','本公司0122','出库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000061',NULL,NULL,NULL,'CONFIRMED','1'),
	('OV000123','这是手写的发票0123','李亚青0123','本公司0123','入库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000062',NULL,NULL,NULL,'AUDITED','1'),
	('OV000124','这是手写的发票0124','李亚青0124','本公司0124','存款回执','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000062',NULL,NULL,NULL,'CREATED','1'),
	('OV000125','这是手写的发票0125','李亚青0125','本公司0125','验收证明','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000063',NULL,NULL,NULL,'CONFIRMED','1'),
	('OV000126','这是手写的发票0126','李亚青0126','本公司0126','借款凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000063',NULL,NULL,NULL,'AUDITED','1'),
	('OV000127','这是手写的发票0127','李亚青0127','本公司0127','原始凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000064',NULL,NULL,NULL,'CREATED','1'),
	('OV000128','这是手写的发票0128','李亚青0128','本公司0128','发票','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000064',NULL,NULL,NULL,'CONFIRMED','1');

insert into original_voucher_creation_data values
	('OVC000001','财务会计','确认提交','2017-02-10','1');

insert into original_voucher_confirmation_data values
	('OVC000001','财务会计','确认通过','2018-12-10','1');

insert into original_voucher_auditing_data values
	('OVA000001','财务会计','审核通过，要都审核过了才通过哦','2017-07-29','1');

insert into accounting_document_line_data values
	('ADL000001','收到存款','AS9999','借','975328.31','AD000001','AS000001','1'),
	('ADL000002','收到存款0002','AS99990002','贷','978608.44','AD000001','AS000001','1'),
	('ADL000003','收到存款0003','AS99990003','借','812432.06','AD000002','AS000001','1'),
	('ADL000004','收到存款0004','AS99990004','贷','782685.06','AD000002','AS000001','1'),
	('ADL000005','收到存款0005','AS99990005','借','938548.00','AD000003','AS000002','1'),
	('ADL000006','收到存款0006','AS99990006','贷','935998.00','AD000003','AS000002','1'),
	('ADL000007','收到存款0007','AS99990007','借','943965.12','AD000004','AS000002','1'),
	('ADL000008','收到存款0008','AS99990008','贷','774134.19','AD000004','AS000002','1'),
	('ADL000009','收到存款0009','AS99990009','借','794780.62','AD000005','AS000003','1'),
	('ADL000010','收到存款0010','AS99990010','贷','801622.12','AD000005','AS000003','1'),
	('ADL000011','收到存款0011','AS99990011','借','748545.69','AD000006','AS000003','1'),
	('ADL000012','收到存款0012','AS99990012','贷','783796.62','AD000006','AS000003','1'),
	('ADL000013','收到存款0013','AS99990013','借','723788.00','AD000007','AS000004','1'),
	('ADL000014','收到存款0014','AS99990014','贷','859807.69','AD000007','AS000004','1'),
	('ADL000015','收到存款0015','AS99990015','借','849875.69','AD000008','AS000004','1'),
	('ADL000016','收到存款0016','AS99990016','贷','883745.12','AD000008','AS000004','1'),
	('ADL000017','收到存款0017','AS99990017','借','950031.00','AD000009','AS000005','1'),
	('ADL000018','收到存款0018','AS99990018','贷','818995.44','AD000009','AS000005','1'),
	('ADL000019','收到存款0019','AS99990019','借','978359.94','AD000010','AS000005','1'),
	('ADL000020','收到存款0020','AS99990020','贷','952683.75','AD000010','AS000005','1'),
	('ADL000021','收到存款0021','AS99990021','借','815370.12','AD000011','AS000006','1'),
	('ADL000022','收到存款0022','AS99990022','贷','779629.19','AD000011','AS000006','1'),
	('ADL000023','收到存款0023','AS99990023','借','981416.81','AD000012','AS000006','1'),
	('ADL000024','收到存款0024','AS99990024','贷','938198.25','AD000012','AS000006','1'),
	('ADL000025','收到存款0025','AS99990025','借','879529.12','AD000013','AS000007','1'),
	('ADL000026','收到存款0026','AS99990026','贷','795764.38','AD000013','AS000007','1'),
	('ADL000027','收到存款0027','AS99990027','借','712425.19','AD000014','AS000007','1'),
	('ADL000028','收到存款0028','AS99990028','贷','841826.19','AD000014','AS000007','1'),
	('ADL000029','收到存款0029','AS99990029','借','761921.50','AD000015','AS000008','1'),
	('ADL000030','收到存款0030','AS99990030','贷','818494.94','AD000015','AS000008','1'),
	('ADL000031','收到存款0031','AS99990031','借','841635.88','AD000016','AS000008','1'),
	('ADL000032','收到存款0032','AS99990032','贷','745120.00','AD000016','AS000008','1'),
	('ADL000033','收到存款0033','AS99990033','借','887092.19','AD000017','AS000009','1'),
	('ADL000034','收到存款0034','AS99990034','贷','720250.00','AD000017','AS000009','1'),
	('ADL000035','收到存款0035','AS99990035','借','785411.56','AD000018','AS000009','1'),
	('ADL000036','收到存款0036','AS99990036','贷','770342.50','AD000018','AS000009','1'),
	('ADL000037','收到存款0037','AS99990037','借','948799.31','AD000019','AS000010','1'),
	('ADL000038','收到存款0038','AS99990038','贷','968072.38','AD000019','AS000010','1'),
	('ADL000039','收到存款0039','AS99990039','借','933826.19','AD000020','AS000010','1'),
	('ADL000040','收到存款0040','AS99990040','贷','880738.38','AD000020','AS000010','1'),
	('ADL000041','收到存款0041','AS99990041','借','815590.38','AD000021','AS000011','1'),
	('ADL000042','收到存款0042','AS99990042','贷','922701.69','AD000021','AS000011','1'),
	('ADL000043','收到存款0043','AS99990043','借','847147.94','AD000022','AS000011','1'),
	('ADL000044','收到存款0044','AS99990044','贷','872458.12','AD000022','AS000011','1'),
	('ADL000045','收到存款0045','AS99990045','借','911566.00','AD000023','AS000012','1'),
	('ADL000046','收到存款0046','AS99990046','贷','899476.00','AD000023','AS000012','1'),
	('ADL000047','收到存款0047','AS99990047','借','953034.88','AD000024','AS000012','1'),
	('ADL000048','收到存款0048','AS99990048','贷','902968.44','AD000024','AS000012','1'),
	('ADL000049','收到存款0049','AS99990049','借','867620.56','AD000025','AS000013','1'),
	('ADL000050','收到存款0050','AS99990050','贷','724864.88','AD000025','AS000013','1'),
	('ADL000051','收到存款0051','AS99990051','借','786801.56','AD000026','AS000013','1'),
	('ADL000052','收到存款0052','AS99990052','贷','955465.88','AD000026','AS000013','1'),
	('ADL000053','收到存款0053','AS99990053','借','922551.50','AD000027','AS000014','1'),
	('ADL000054','收到存款0054','AS99990054','贷','817426.38','AD000027','AS000014','1'),
	('ADL000055','收到存款0055','AS99990055','借','731076.50','AD000028','AS000014','1'),
	('ADL000056','收到存款0056','AS99990056','贷','877140.31','AD000028','AS000014','1'),
	('ADL000057','收到存款0057','AS99990057','借','872052.12','AD000029','AS000015','1'),
	('ADL000058','收到存款0058','AS99990058','贷','775142.69','AD000029','AS000015','1'),
	('ADL000059','收到存款0059','AS99990059','借','741736.56','AD000030','AS000015','1'),
	('ADL000060','收到存款0060','AS99990060','贷','962012.06','AD000030','AS000015','1'),
	('ADL000061','收到存款0061','AS99990061','借','738388.31','AD000031','AS000016','1'),
	('ADL000062','收到存款0062','AS99990062','贷','760137.56','AD000031','AS000016','1'),
	('ADL000063','收到存款0063','AS99990063','借','920143.31','AD000032','AS000016','1'),
	('ADL000064','收到存款0064','AS99990064','贷','927559.25','AD000032','AS000016','1'),
	('ADL000065','收到存款0065','AS99990065','借','749390.06','AD000033','AS000017','1'),
	('ADL000066','收到存款0066','AS99990066','贷','796610.62','AD000033','AS000017','1'),
	('ADL000067','收到存款0067','AS99990067','借','793387.94','AD000034','AS000017','1'),
	('ADL000068','收到存款0068','AS99990068','贷','867141.56','AD000034','AS000017','1'),
	('ADL000069','收到存款0069','AS99990069','借','895015.12','AD000035','AS000018','1'),
	('ADL000070','收到存款0070','AS99990070','贷','717679.75','AD000035','AS000018','1'),
	('ADL000071','收到存款0071','AS99990071','借','919396.88','AD000036','AS000018','1'),
	('ADL000072','收到存款0072','AS99990072','贷','872359.75','AD000036','AS000018','1'),
	('ADL000073','收到存款0073','AS99990073','借','700375.88','AD000037','AS000019','1'),
	('ADL000074','收到存款0074','AS99990074','贷','721568.69','AD000037','AS000019','1'),
	('ADL000075','收到存款0075','AS99990075','借','784827.00','AD000038','AS000019','1'),
	('ADL000076','收到存款0076','AS99990076','贷','843519.12','AD000038','AS000019','1'),
	('ADL000077','收到存款0077','AS99990077','借','883142.94','AD000039','AS000020','1'),
	('ADL000078','收到存款0078','AS99990078','贷','899997.00','AD000039','AS000020','1'),
	('ADL000079','收到存款0079','AS99990079','借','970367.81','AD000040','AS000020','1'),
	('ADL000080','收到存款0080','AS99990080','贷','737979.75','AD000040','AS000020','1'),
	('ADL000081','收到存款0081','AS99990081','借','755018.81','AD000041','AS000021','1'),
	('ADL000082','收到存款0082','AS99990082','贷','945858.00','AD000041','AS000021','1'),
	('ADL000083','收到存款0083','AS99990083','借','917246.19','AD000042','AS000021','1'),
	('ADL000084','收到存款0084','AS99990084','贷','970369.25','AD000042','AS000021','1'),
	('ADL000085','收到存款0085','AS99990085','借','926002.19','AD000043','AS000022','1'),
	('ADL000086','收到存款0086','AS99990086','贷','818098.56','AD000043','AS000022','1'),
	('ADL000087','收到存款0087','AS99990087','借','732626.12','AD000044','AS000022','1'),
	('ADL000088','收到存款0088','AS99990088','贷','798226.81','AD000044','AS000022','1'),
	('ADL000089','收到存款0089','AS99990089','借','728754.06','AD000045','AS000023','1'),
	('ADL000090','收到存款0090','AS99990090','贷','922844.00','AD000045','AS000023','1'),
	('ADL000091','收到存款0091','AS99990091','借','741025.62','AD000046','AS000023','1'),
	('ADL000092','收到存款0092','AS99990092','贷','874442.44','AD000046','AS000023','1'),
	('ADL000093','收到存款0093','AS99990093','借','950517.75','AD000047','AS000024','1'),
	('ADL000094','收到存款0094','AS99990094','贷','812308.88','AD000047','AS000024','1'),
	('ADL000095','收到存款0095','AS99990095','借','820442.56','AD000048','AS000024','1'),
	('ADL000096','收到存款0096','AS99990096','贷','895677.19','AD000048','AS000024','1'),
	('ADL000097','收到存款0097','AS99990097','借','964766.50','AD000049','AS000025','1'),
	('ADL000098','收到存款0098','AS99990098','贷','880814.31','AD000049','AS000025','1'),
	('ADL000099','收到存款0099','AS99990099','借','907838.62','AD000050','AS000025','1'),
	('ADL000100','收到存款0100','AS99990100','贷','804089.19','AD000050','AS000025','1'),
	('ADL000101','收到存款0101','AS99990101','借','951455.88','AD000051','AS000026','1'),
	('ADL000102','收到存款0102','AS99990102','贷','981866.12','AD000051','AS000026','1'),
	('ADL000103','收到存款0103','AS99990103','借','947224.12','AD000052','AS000026','1'),
	('ADL000104','收到存款0104','AS99990104','贷','806132.81','AD000052','AS000026','1'),
	('ADL000105','收到存款0105','AS99990105','借','903208.56','AD000053','AS000027','1'),
	('ADL000106','收到存款0106','AS99990106','贷','987509.38','AD000053','AS000027','1'),
	('ADL000107','收到存款0107','AS99990107','借','700013.56','AD000054','AS000027','1'),
	('ADL000108','收到存款0108','AS99990108','贷','815520.00','AD000054','AS000027','1'),
	('ADL000109','收到存款0109','AS99990109','借','939133.88','AD000055','AS000028','1'),
	('ADL000110','收到存款0110','AS99990110','贷','704645.94','AD000055','AS000028','1'),
	('ADL000111','收到存款0111','AS99990111','借','713338.56','AD000056','AS000028','1'),
	('ADL000112','收到存款0112','AS99990112','贷','958769.19','AD000056','AS000028','1'),
	('ADL000113','收到存款0113','AS99990113','借','752533.81','AD000057','AS000029','1'),
	('ADL000114','收到存款0114','AS99990114','贷','816735.06','AD000057','AS000029','1'),
	('ADL000115','收到存款0115','AS99990115','借','896531.50','AD000058','AS000029','1'),
	('ADL000116','收到存款0116','AS99990116','贷','907654.12','AD000058','AS000029','1'),
	('ADL000117','收到存款0117','AS99990117','借','961006.19','AD000059','AS000030','1'),
	('ADL000118','收到存款0118','AS99990118','贷','971390.75','AD000059','AS000030','1'),
	('ADL000119','收到存款0119','AS99990119','借','986817.25','AD000060','AS000030','1'),
	('ADL000120','收到存款0120','AS99990120','贷','969993.31','AD000060','AS000030','1'),
	('ADL000121','收到存款0121','AS99990121','借','781399.00','AD000061','AS000031','1'),
	('ADL000122','收到存款0122','AS99990122','贷','710865.81','AD000061','AS000031','1'),
	('ADL000123','收到存款0123','AS99990123','借','985907.94','AD000062','AS000031','1'),
	('ADL000124','收到存款0124','AS99990124','贷','713436.56','AD000062','AS000031','1'),
	('ADL000125','收到存款0125','AS99990125','借','723041.81','AD000063','AS000032','1'),
	('ADL000126','收到存款0126','AS99990126','贷','705317.62','AD000063','AS000032','1'),
	('ADL000127','收到存款0127','AS99990127','借','784860.06','AD000064','AS000032','1'),
	('ADL000128','收到存款0128','AS99990128','贷','793304.88','AD000064','AS000032','1');

insert into level_one_department_data values
	('LOD000001','RSCC000001','供应链部','主要执行集团信息系统建设，维护，规划','刘强','2016-10-03','1'),
	('LOD000002','RSCC000001','采购部','主要执行集团信息系统建设，维护，规划0002','王德宏','2017-05-25','1');

insert into level_two_department_data values
	('LTD000001','LOD000001','信息系统部大数据部门','主要执行集团信息系统建设，维护，规划','2019-04-27','1'),
	('LTD000002','LOD000001','信息系统部大数据部门0002','主要执行集团信息系统建设，维护，规划0002','2018-03-11','1'),
	('LTD000003','LOD000002','信息系统部大数据部门0003','主要执行集团信息系统建设，维护，规划0003','2017-04-09','1'),
	('LTD000004','LOD000002','信息系统部大数据部门0004','主要执行集团信息系统建设，维护，规划0004','2019-06-20','1');

insert into level_three_department_data values
	('LTD000001','LTD000001','信息系统部大数据清洗组','主要执行集团信息系统建设，维护，规划','2018-07-06','1'),
	('LTD000002','LTD000001','信息系统部大数据运算组','主要执行集团信息系统建设，维护，规划0002','2017-07-24','1'),
	('LTD000003','LTD000002','信息系统部大数据解决方案组','主要执行集团信息系统建设，维护，规划0003','2018-04-22','1'),
	('LTD000004','LTD000002','信息系统部大数据清洗组','主要执行集团信息系统建设，维护，规划0004','2018-01-07','1'),
	('LTD000005','LTD000003','信息系统部大数据运算组','主要执行集团信息系统建设，维护，规划0005','2017-10-28','1'),
	('LTD000006','LTD000003','信息系统部大数据解决方案组','主要执行集团信息系统建设，维护，规划0006','2018-11-26','1'),
	('LTD000007','LTD000004','信息系统部大数据清洗组','主要执行集团信息系统建设，维护，规划0007','2019-08-16','1'),
	('LTD000008','LTD000004','信息系统部大数据运算组','主要执行集团信息系统建设，维护，规划0008','2016-12-01','1');

insert into skill_type_data values
	('ST000001','S0000','RSCC000001','JAVA编程','1'),
	('ST000002','S00000002','RSCC000001','大数据','1');

insert into responsibility_type_data values
	('RT000001','S0000','RSCC000001','合规管理','负责集团及其他分公司信息系统有效运作，并使集团在技术上领先','1'),
	('RT000002','S00000002','RSCC000001','财务管理','负责集团及其他分公司信息系统有效运作，并使集团在技术上领先0002','1');

insert into termination_reason_data values
	('TR000001','ETR0000','RSCC000001','业务发展，公司转型','1'),
	('TR000002','ETR00000002','RSCC000001','战略调整','1');

insert into termination_type_data values
	('TT000001','ETT0000','RSCC000001','合同解除','这个终止原因的描述是这样的.................................................','1'),
	('TT000002','ETT00000002','RSCC000001','辞职','这个终止原因的描述是这样的.................................................0002','1');

insert into occupation_type_data values
	('OT000001','OT0000','RSCC000001','需求分析员','故事还得从遥远的古代开始.................................................','1'),
	('OT000002','OT00000002','RSCC000001','软件工程师','故事还得从遥远的古代开始.................................................0002','1');

insert into leave_type_data values
	('LT000001','LT0000','RSCC000001','带薪年假','故事还得从遥远的古代开始.................................................','1'),
	('LT000002','LT00000002','RSCC000001','病假','故事还得从遥远的古代开始.................................................0002','1');

insert into salary_grade_data values
	('SG000001','SG0000','RSCC000001','一级薪资','故事还得从遥远的古代开始.................................................','1'),
	('SG000002','SG00000002','RSCC000001','二级薪资','故事还得从遥远的古代开始.................................................0002','1');

insert into interview_type_data values
	('IT000001','INTRVW00','RSCC000001','特别情况面试','故事还得从遥远的古代开始.................................................','1'),
	('IT000002','INTRVW000002','RSCC000001','离职面试','故事还得从遥远的古代开始.................................................0002','1');

insert into training_course_type_data values
	('TCT000001','TC00','RSCC000001','入职培训','培训是提升个人和企业竞争力的法宝','1'),
	('TCT000002','TC000002','RSCC000001','售前培训','培训是提升个人和企业竞争力的法宝0002','1');

insert into public_holiday_data values
	('PH000001','PH00','RSCC000001','元旦节','节日快乐，万事如意！','1'),
	('PH000002','PH000002','RSCC000001','春节','节日快乐，万事如意！0002','1');

insert into termination_data values
	('T000001','TR000001','TT000001','员工离职','1'),
	('T000002','TR000001','TT000001','员工离职0002','1'),
	('T000003','TR000002','TT000002','员工离职0003','1'),
	('T000004','TR000002','TT000002','员工离职0004','1');

insert into view_data values
	('V000001','面试官','小伙子不错，值得培养','2016-09-28','1');

insert into employee_data values
	('E000001','RSCC000001','程序员','LTD000001','张','文强','share@163.com','北京','学院路234号','18677778888','OT000001','RT000001','SG000001','6226 7788 9908 ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-04 12:18:44','JOB_APPLIED','1'),
	('E000002','RSCC000001','程序员0002','LTD000001','王','大伟','2@qq.com','天津','学院路234号0002','13900000002','OT000001','RT000001','SG000001','6226 7788 9908 0002',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-05 20:50:13','PASSED_WITH_PROFESSION','1'),
	('E000003','RSCC000001','程序员0003','LTD000002','李','字章','3@qq.com','成都','学院路234号0003','13900000003','OT000001','RT000001','SG000001','6226 7788 9908 0003',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-12 10:21:19','PASSED_BY_HR','1'),
	('E000004','RSCC000001','程序员0004','LTD000002','贺','文强','4@qq.com','上海','学院路234号0004','13900000004','OT000001','RT000001','SG000001','6226 7788 9908 0004',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-13 10:22:17','OFFER_APPROVED','1'),
	('E000005','RSCC000001','程序员0005','LTD000003','张','大伟','5@qq.com','深圳','学院路234号0005','13900000005','OT000001','RT000001','SG000001','6226 7788 9908 0005',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-01 16:51:41','OFFER_ACCEPTED','1'),
	('E000006','RSCC000001','程序员0006','LTD000003','王','字章','6@qq.com','广州','学院路234号0006','13900000006','OT000001','RT000001','SG000001','6226 7788 9908 0006',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-08-25 07:02:48','EMPLOYEE_BOARDED','1'),
	('E000007','RSCC000001','程序员0007','LTD000004','李','文强','7@qq.com','西安','学院路234号0007','13900000007','OT000001','RT000001','SG000001','6226 7788 9908 0007',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-06 09:54:02','TERMINATED','1'),
	('E000008','RSCC000001','程序员0008','LTD000004','贺','大伟','8@qq.com','北京','学院路234号0008','13900000008','OT000001','RT000001','SG000001','6226 7788 9908 0008',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-08-30 03:31:15','JOB_APPLIED','1'),
	('E000009','RSCC000001','程序员0009','LTD000005','张','字章','9@qq.com','天津','学院路234号0009','13900000009','OT000002','RT000002','SG000002','6226 7788 9908 0009',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-08-28 10:30:03','PASSED_WITH_PROFESSION','1'),
	('E000010','RSCC000001','程序员0010','LTD000005','王','文强','10@qq.com','成都','学院路234号0010','13900000010','OT000002','RT000002','SG000002','6226 7788 9908 0010',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-08-28 21:39:27','PASSED_BY_HR','1'),
	('E000011','RSCC000001','程序员0011','LTD000006','李','大伟','11@qq.com','上海','学院路234号0011','13900000011','OT000002','RT000002','SG000002','6226 7788 9908 0011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-08-31 22:41:09','OFFER_APPROVED','1'),
	('E000012','RSCC000001','程序员0012','LTD000006','贺','字章','12@qq.com','深圳','学院路234号0012','13900000012','OT000002','RT000002','SG000002','6226 7788 9908 0012',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-11 03:03:27','OFFER_ACCEPTED','1'),
	('E000013','RSCC000001','程序员0013','LTD000007','张','文强','13@qq.com','广州','学院路234号0013','13900000013','OT000002','RT000002','SG000002','6226 7788 9908 0013',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-08-27 00:20:31','EMPLOYEE_BOARDED','1'),
	('E000014','RSCC000001','程序员0014','LTD000007','王','大伟','14@qq.com','西安','学院路234号0014','13900000014','OT000002','RT000002','SG000002','6226 7788 9908 0014',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-07 19:32:39','TERMINATED','1'),
	('E000015','RSCC000001','程序员0015','LTD000008','李','字章','15@qq.com','北京','学院路234号0015','13900000015','OT000002','RT000002','SG000002','6226 7788 9908 0015',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-11 01:47:26','JOB_APPLIED','1'),
	('E000016','RSCC000001','程序员0016','LTD000008','贺','文强','16@qq.com','天津','学院路234号0016','13900000016','OT000002','RT000002','SG000002','6226 7788 9908 0016',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-05 23:48:16','PASSED_WITH_PROFESSION','1');

insert into job_application_data values
	('JA000001','2018-01-04','申请者本人','我觉得我符合职位要求，请给我一个机会为公司发展做出贡献，谢谢！','1');

insert into profession_interview_data values
	('PI000001','技术部','2018-05-14','能力各方面表现不错，进入下一轮','1');

insert into hr_interview_data values
	('HI000001','人力资源部','2019-01-29','软技能，责任感，气质不错啊','1');

insert into offer_approval_data values
	('OA000001','总经理','2017-03-01','该员工发展潜力不错，','1');

insert into offer_acceptance_data values
	('OA000001','申请者','2017-03-24','谢谢，我一个月内上班','1');

insert into employee_boarding_data values
	('EB000001','人力资源部','2017-06-15','欢迎加入植物医生大家庭','1');

insert into instructor_data values
	('I000001','高级讲师','张','文强','18699990000','instructor@gmail.com','RSCC000001','这是一个长长长长长长长长的介绍','2019-09-13 02:31:37','1'),
	('I000002','高级讲师0002','王','大伟','13900000002','2@qq.com','RSCC000001','这是一个长长长长长长长长的介绍0002','2019-09-03 13:14:27','1');

insert into company_training_data values
	('CT000001','入职培训','RSCC000001','I000001','TCT000001','2018-10-05','3','2019-09-04 15:14:41','1'),
	('CT000002','入职培训0002','RSCC000001','I000001','TCT000001','2017-06-27','3','2019-08-31 02:06:29','1'),
	('CT000003','入职培训0003','RSCC000001','I000002','TCT000002','2019-03-21','3','2019-08-26 03:17:24','1'),
	('CT000004','入职培训0004','RSCC000001','I000002','TCT000002','2019-06-05','3','2019-09-03 02:25:39','1');

insert into scoring_data values
	('S000001','王志文','91','这个题做的真不错啊','1');

insert into employee_company_training_data values
	('ECT000001','E000001','CT000001',NULL,'SCORED','1'),
	('ECT000002','E000001','CT000001',NULL,'SCORED0002','1'),
	('ECT000003','E000002','CT000001',NULL,'SCORED0003','1'),
	('ECT000004','E000002','CT000001',NULL,'SCORED0004','1'),
	('ECT000005','E000003','CT000001',NULL,'SCORED0005','1'),
	('ECT000006','E000003','CT000001',NULL,'SCORED0006','1'),
	('ECT000007','E000004','CT000001',NULL,'SCORED0007','1'),
	('ECT000008','E000004','CT000001',NULL,'SCORED0008','1'),
	('ECT000009','E000005','CT000002',NULL,'SCORED0009','1'),
	('ECT000010','E000005','CT000002',NULL,'SCORED0010','1'),
	('ECT000011','E000006','CT000002',NULL,'SCORED0011','1'),
	('ECT000012','E000006','CT000002',NULL,'SCORED0012','1'),
	('ECT000013','E000007','CT000002',NULL,'SCORED0013','1'),
	('ECT000014','E000007','CT000002',NULL,'SCORED0014','1'),
	('ECT000015','E000008','CT000002',NULL,'SCORED0015','1'),
	('ECT000016','E000008','CT000002',NULL,'SCORED0016','1'),
	('ECT000017','E000009','CT000003',NULL,'SCORED0017','1'),
	('ECT000018','E000009','CT000003',NULL,'SCORED0018','1'),
	('ECT000019','E000010','CT000003',NULL,'SCORED0019','1'),
	('ECT000020','E000010','CT000003',NULL,'SCORED0020','1'),
	('ECT000021','E000011','CT000003',NULL,'SCORED0021','1'),
	('ECT000022','E000011','CT000003',NULL,'SCORED0022','1'),
	('ECT000023','E000012','CT000003',NULL,'SCORED0023','1'),
	('ECT000024','E000012','CT000003',NULL,'SCORED0024','1'),
	('ECT000025','E000013','CT000004',NULL,'SCORED0025','1'),
	('ECT000026','E000013','CT000004',NULL,'SCORED0026','1'),
	('ECT000027','E000014','CT000004',NULL,'SCORED0027','1'),
	('ECT000028','E000014','CT000004',NULL,'SCORED0028','1'),
	('ECT000029','E000015','CT000004',NULL,'SCORED0029','1'),
	('ECT000030','E000015','CT000004',NULL,'SCORED0030','1'),
	('ECT000031','E000016','CT000004',NULL,'SCORED0031','1'),
	('ECT000032','E000016','CT000004',NULL,'SCORED0032','1');

insert into employee_skill_data values
	('ES000001','E000001','ST000001','高手高手高高手','1'),
	('ES000002','E000001','ST000001','高手高手高高手0002','1'),
	('ES000003','E000002','ST000001','高手高手高高手0003','1'),
	('ES000004','E000002','ST000001','高手高手高高手0004','1'),
	('ES000005','E000003','ST000001','高手高手高高手0005','1'),
	('ES000006','E000003','ST000001','高手高手高高手0006','1'),
	('ES000007','E000004','ST000001','高手高手高高手0007','1'),
	('ES000008','E000004','ST000001','高手高手高高手0008','1'),
	('ES000009','E000005','ST000001','高手高手高高手0009','1'),
	('ES000010','E000005','ST000001','高手高手高高手0010','1'),
	('ES000011','E000006','ST000001','高手高手高高手0011','1'),
	('ES000012','E000006','ST000001','高手高手高高手0012','1'),
	('ES000013','E000007','ST000001','高手高手高高手0013','1'),
	('ES000014','E000007','ST000001','高手高手高高手0014','1'),
	('ES000015','E000008','ST000001','高手高手高高手0015','1'),
	('ES000016','E000008','ST000001','高手高手高高手0016','1'),
	('ES000017','E000009','ST000002','高手高手高高手0017','1'),
	('ES000018','E000009','ST000002','高手高手高高手0018','1'),
	('ES000019','E000010','ST000002','高手高手高高手0019','1'),
	('ES000020','E000010','ST000002','高手高手高高手0020','1'),
	('ES000021','E000011','ST000002','高手高手高高手0021','1'),
	('ES000022','E000011','ST000002','高手高手高高手0022','1'),
	('ES000023','E000012','ST000002','高手高手高高手0023','1'),
	('ES000024','E000012','ST000002','高手高手高高手0024','1'),
	('ES000025','E000013','ST000002','高手高手高高手0025','1'),
	('ES000026','E000013','ST000002','高手高手高高手0026','1'),
	('ES000027','E000014','ST000002','高手高手高高手0027','1'),
	('ES000028','E000014','ST000002','高手高手高高手0028','1'),
	('ES000029','E000015','ST000002','高手高手高高手0029','1'),
	('ES000030','E000015','ST000002','高手高手高高手0030','1'),
	('ES000031','E000016','ST000002','高手高手高高手0031','1'),
	('ES000032','E000016','ST000002','高手高手高高手0032','1');

insert into employee_performance_data values
	('EP000001','E000001','绩效大大的不错','1'),
	('EP000002','E000001','绩效大大的不错0002','1'),
	('EP000003','E000002','绩效大大的不错0003','1'),
	('EP000004','E000002','绩效大大的不错0004','1'),
	('EP000005','E000003','绩效大大的不错0005','1'),
	('EP000006','E000003','绩效大大的不错0006','1'),
	('EP000007','E000004','绩效大大的不错0007','1'),
	('EP000008','E000004','绩效大大的不错0008','1'),
	('EP000009','E000005','绩效大大的不错0009','1'),
	('EP000010','E000005','绩效大大的不错0010','1'),
	('EP000011','E000006','绩效大大的不错0011','1'),
	('EP000012','E000006','绩效大大的不错0012','1'),
	('EP000013','E000007','绩效大大的不错0013','1'),
	('EP000014','E000007','绩效大大的不错0014','1'),
	('EP000015','E000008','绩效大大的不错0015','1'),
	('EP000016','E000008','绩效大大的不错0016','1'),
	('EP000017','E000009','绩效大大的不错0017','1'),
	('EP000018','E000009','绩效大大的不错0018','1'),
	('EP000019','E000010','绩效大大的不错0019','1'),
	('EP000020','E000010','绩效大大的不错0020','1'),
	('EP000021','E000011','绩效大大的不错0021','1'),
	('EP000022','E000011','绩效大大的不错0022','1'),
	('EP000023','E000012','绩效大大的不错0023','1'),
	('EP000024','E000012','绩效大大的不错0024','1'),
	('EP000025','E000013','绩效大大的不错0025','1'),
	('EP000026','E000013','绩效大大的不错0026','1'),
	('EP000027','E000014','绩效大大的不错0027','1'),
	('EP000028','E000014','绩效大大的不错0028','1'),
	('EP000029','E000015','绩效大大的不错0029','1'),
	('EP000030','E000015','绩效大大的不错0030','1'),
	('EP000031','E000016','绩效大大的不错0031','1'),
	('EP000032','E000016','绩效大大的不错0032','1');

insert into employee_work_experience_data values
	('EWE000001','E000001','2019-07-09','2018-10-27','丝芙兰化妆品公司','在此期间取得非常好的绩效，赢得了客户的信赖','1'),
	('EWE000002','E000001','2016-10-26','2019-01-01','丝芙兰化妆品公司0002','在此期间取得非常好的绩效，赢得了客户的信赖0002','1'),
	('EWE000003','E000002','2017-09-01','2018-09-09','丝芙兰化妆品公司0003','在此期间取得非常好的绩效，赢得了客户的信赖0003','1'),
	('EWE000004','E000002','2016-12-08','2018-12-29','丝芙兰化妆品公司0004','在此期间取得非常好的绩效，赢得了客户的信赖0004','1'),
	('EWE000005','E000003','2017-08-31','2018-02-05','丝芙兰化妆品公司0005','在此期间取得非常好的绩效，赢得了客户的信赖0005','1'),
	('EWE000006','E000003','2018-05-15','2019-02-02','丝芙兰化妆品公司0006','在此期间取得非常好的绩效，赢得了客户的信赖0006','1'),
	('EWE000007','E000004','2019-04-14','2018-04-01','丝芙兰化妆品公司0007','在此期间取得非常好的绩效，赢得了客户的信赖0007','1'),
	('EWE000008','E000004','2017-04-21','2019-05-26','丝芙兰化妆品公司0008','在此期间取得非常好的绩效，赢得了客户的信赖0008','1'),
	('EWE000009','E000005','2017-10-01','2019-06-12','丝芙兰化妆品公司0009','在此期间取得非常好的绩效，赢得了客户的信赖0009','1'),
	('EWE000010','E000005','2017-09-09','2019-09-01','丝芙兰化妆品公司0010','在此期间取得非常好的绩效，赢得了客户的信赖0010','1'),
	('EWE000011','E000006','2017-11-03','2017-01-24','丝芙兰化妆品公司0011','在此期间取得非常好的绩效，赢得了客户的信赖0011','1'),
	('EWE000012','E000006','2018-01-13','2017-04-28','丝芙兰化妆品公司0012','在此期间取得非常好的绩效，赢得了客户的信赖0012','1'),
	('EWE000013','E000007','2017-06-02','2017-06-25','丝芙兰化妆品公司0013','在此期间取得非常好的绩效，赢得了客户的信赖0013','1'),
	('EWE000014','E000007','2018-12-04','2018-12-26','丝芙兰化妆品公司0014','在此期间取得非常好的绩效，赢得了客户的信赖0014','1'),
	('EWE000015','E000008','2018-01-06','2019-01-31','丝芙兰化妆品公司0015','在此期间取得非常好的绩效，赢得了客户的信赖0015','1'),
	('EWE000016','E000008','2018-12-23','2018-02-17','丝芙兰化妆品公司0016','在此期间取得非常好的绩效，赢得了客户的信赖0016','1'),
	('EWE000017','E000009','2018-06-13','2018-11-22','丝芙兰化妆品公司0017','在此期间取得非常好的绩效，赢得了客户的信赖0017','1'),
	('EWE000018','E000009','2019-01-05','2018-09-06','丝芙兰化妆品公司0018','在此期间取得非常好的绩效，赢得了客户的信赖0018','1'),
	('EWE000019','E000010','2019-01-13','2019-08-21','丝芙兰化妆品公司0019','在此期间取得非常好的绩效，赢得了客户的信赖0019','1'),
	('EWE000020','E000010','2017-03-10','2018-11-10','丝芙兰化妆品公司0020','在此期间取得非常好的绩效，赢得了客户的信赖0020','1'),
	('EWE000021','E000011','2017-12-27','2016-10-07','丝芙兰化妆品公司0021','在此期间取得非常好的绩效，赢得了客户的信赖0021','1'),
	('EWE000022','E000011','2019-07-10','2017-11-07','丝芙兰化妆品公司0022','在此期间取得非常好的绩效，赢得了客户的信赖0022','1'),
	('EWE000023','E000012','2018-10-31','2018-06-16','丝芙兰化妆品公司0023','在此期间取得非常好的绩效，赢得了客户的信赖0023','1'),
	('EWE000024','E000012','2018-12-15','2017-08-22','丝芙兰化妆品公司0024','在此期间取得非常好的绩效，赢得了客户的信赖0024','1'),
	('EWE000025','E000013','2017-05-24','2018-05-07','丝芙兰化妆品公司0025','在此期间取得非常好的绩效，赢得了客户的信赖0025','1'),
	('EWE000026','E000013','2017-06-24','2017-09-20','丝芙兰化妆品公司0026','在此期间取得非常好的绩效，赢得了客户的信赖0026','1'),
	('EWE000027','E000014','2017-11-20','2019-08-24','丝芙兰化妆品公司0027','在此期间取得非常好的绩效，赢得了客户的信赖0027','1'),
	('EWE000028','E000014','2018-03-03','2018-05-21','丝芙兰化妆品公司0028','在此期间取得非常好的绩效，赢得了客户的信赖0028','1'),
	('EWE000029','E000015','2018-12-20','2019-01-09','丝芙兰化妆品公司0029','在此期间取得非常好的绩效，赢得了客户的信赖0029','1'),
	('EWE000030','E000015','2019-02-26','2016-12-03','丝芙兰化妆品公司0030','在此期间取得非常好的绩效，赢得了客户的信赖0030','1'),
	('EWE000031','E000016','2017-05-14','2016-10-26','丝芙兰化妆品公司0031','在此期间取得非常好的绩效，赢得了客户的信赖0031','1'),
	('EWE000032','E000016','2018-06-16','2017-01-27','丝芙兰化妆品公司0032','在此期间取得非常好的绩效，赢得了客户的信赖0032','1');

insert into employee_leave_data values
	('EL000001','E000001','LT000001','8','请年假，出去耍！！！！','1'),
	('EL000002','E000001','LT000001','8','请年假，出去耍！！！！0002','1'),
	('EL000003','E000002','LT000001','6','请年假，出去耍！！！！0003','1'),
	('EL000004','E000002','LT000001','8','请年假，出去耍！！！！0004','1'),
	('EL000005','E000003','LT000001','7','请年假，出去耍！！！！0005','1'),
	('EL000006','E000003','LT000001','6','请年假，出去耍！！！！0006','1'),
	('EL000007','E000004','LT000001','7','请年假，出去耍！！！！0007','1'),
	('EL000008','E000004','LT000001','8','请年假，出去耍！！！！0008','1'),
	('EL000009','E000005','LT000001','6','请年假，出去耍！！！！0009','1'),
	('EL000010','E000005','LT000001','8','请年假，出去耍！！！！0010','1'),
	('EL000011','E000006','LT000001','8','请年假，出去耍！！！！0011','1'),
	('EL000012','E000006','LT000001','8','请年假，出去耍！！！！0012','1'),
	('EL000013','E000007','LT000001','8','请年假，出去耍！！！！0013','1'),
	('EL000014','E000007','LT000001','6','请年假，出去耍！！！！0014','1'),
	('EL000015','E000008','LT000001','7','请年假，出去耍！！！！0015','1'),
	('EL000016','E000008','LT000001','8','请年假，出去耍！！！！0016','1'),
	('EL000017','E000009','LT000002','8','请年假，出去耍！！！！0017','1'),
	('EL000018','E000009','LT000002','7','请年假，出去耍！！！！0018','1'),
	('EL000019','E000010','LT000002','6','请年假，出去耍！！！！0019','1'),
	('EL000020','E000010','LT000002','8','请年假，出去耍！！！！0020','1'),
	('EL000021','E000011','LT000002','8','请年假，出去耍！！！！0021','1'),
	('EL000022','E000011','LT000002','8','请年假，出去耍！！！！0022','1'),
	('EL000023','E000012','LT000002','8','请年假，出去耍！！！！0023','1'),
	('EL000024','E000012','LT000002','8','请年假，出去耍！！！！0024','1'),
	('EL000025','E000013','LT000002','7','请年假，出去耍！！！！0025','1'),
	('EL000026','E000013','LT000002','8','请年假，出去耍！！！！0026','1'),
	('EL000027','E000014','LT000002','6','请年假，出去耍！！！！0027','1'),
	('EL000028','E000014','LT000002','8','请年假，出去耍！！！！0028','1'),
	('EL000029','E000015','LT000002','7','请年假，出去耍！！！！0029','1'),
	('EL000030','E000015','LT000002','7','请年假，出去耍！！！！0030','1'),
	('EL000031','E000016','LT000002','8','请年假，出去耍！！！！0031','1'),
	('EL000032','E000016','LT000002','8','请年假，出去耍！！！！0032','1');

insert into employee_interview_data values
	('EI000001','E000001','IT000001','结果不错，面试通过！','1'),
	('EI000002','E000001','IT000001','结果不错，面试通过！0002','1'),
	('EI000003','E000002','IT000001','结果不错，面试通过！0003','1'),
	('EI000004','E000002','IT000001','结果不错，面试通过！0004','1'),
	('EI000005','E000003','IT000001','结果不错，面试通过！0005','1'),
	('EI000006','E000003','IT000001','结果不错，面试通过！0006','1'),
	('EI000007','E000004','IT000001','结果不错，面试通过！0007','1'),
	('EI000008','E000004','IT000001','结果不错，面试通过！0008','1'),
	('EI000009','E000005','IT000001','结果不错，面试通过！0009','1'),
	('EI000010','E000005','IT000001','结果不错，面试通过！0010','1'),
	('EI000011','E000006','IT000001','结果不错，面试通过！0011','1'),
	('EI000012','E000006','IT000001','结果不错，面试通过！0012','1'),
	('EI000013','E000007','IT000001','结果不错，面试通过！0013','1'),
	('EI000014','E000007','IT000001','结果不错，面试通过！0014','1'),
	('EI000015','E000008','IT000001','结果不错，面试通过！0015','1'),
	('EI000016','E000008','IT000001','结果不错，面试通过！0016','1'),
	('EI000017','E000009','IT000002','结果不错，面试通过！0017','1'),
	('EI000018','E000009','IT000002','结果不错，面试通过！0018','1'),
	('EI000019','E000010','IT000002','结果不错，面试通过！0019','1'),
	('EI000020','E000010','IT000002','结果不错，面试通过！0020','1'),
	('EI000021','E000011','IT000002','结果不错，面试通过！0021','1'),
	('EI000022','E000011','IT000002','结果不错，面试通过！0022','1'),
	('EI000023','E000012','IT000002','结果不错，面试通过！0023','1'),
	('EI000024','E000012','IT000002','结果不错，面试通过！0024','1'),
	('EI000025','E000013','IT000002','结果不错，面试通过！0025','1'),
	('EI000026','E000013','IT000002','结果不错，面试通过！0026','1'),
	('EI000027','E000014','IT000002','结果不错，面试通过！0027','1'),
	('EI000028','E000014','IT000002','结果不错，面试通过！0028','1'),
	('EI000029','E000015','IT000002','结果不错，面试通过！0029','1'),
	('EI000030','E000015','IT000002','结果不错，面试通过！0030','1'),
	('EI000031','E000016','IT000002','结果不错，面试通过！0031','1'),
	('EI000032','E000016','IT000002','结果不错，面试通过！0032','1');

insert into employee_attendance_data values
	('EA000001','E000001','2018-12-14','2019-04-16','8','今天状态不错啊','1'),
	('EA000002','E000001','2017-06-04','2019-01-15','6','今天状态不错啊0002','1'),
	('EA000003','E000002','2017-03-18','2019-08-29','7','今天状态不错啊0003','1'),
	('EA000004','E000002','2017-11-27','2018-12-22','8','今天状态不错啊0004','1'),
	('EA000005','E000003','2017-05-26','2018-07-24','6','今天状态不错啊0005','1'),
	('EA000006','E000003','2018-01-01','2016-12-11','6','今天状态不错啊0006','1'),
	('EA000007','E000004','2019-05-27','2019-08-13','6','今天状态不错啊0007','1'),
	('EA000008','E000004','2019-04-29','2016-10-19','7','今天状态不错啊0008','1'),
	('EA000009','E000005','2017-01-10','2018-08-24','8','今天状态不错啊0009','1'),
	('EA000010','E000005','2018-03-19','2018-04-14','8','今天状态不错啊0010','1'),
	('EA000011','E000006','2017-11-07','2019-09-04','6','今天状态不错啊0011','1'),
	('EA000012','E000006','2017-03-06','2016-09-28','7','今天状态不错啊0012','1'),
	('EA000013','E000007','2018-05-19','2016-12-22','8','今天状态不错啊0013','1'),
	('EA000014','E000007','2019-06-09','2017-05-10','7','今天状态不错啊0014','1'),
	('EA000015','E000008','2017-07-31','2018-04-14','7','今天状态不错啊0015','1'),
	('EA000016','E000008','2017-05-12','2017-12-15','7','今天状态不错啊0016','1'),
	('EA000017','E000009','2017-08-08','2018-01-22','8','今天状态不错啊0017','1'),
	('EA000018','E000009','2019-01-18','2017-02-28','7','今天状态不错啊0018','1'),
	('EA000019','E000010','2016-10-05','2018-10-10','7','今天状态不错啊0019','1'),
	('EA000020','E000010','2017-10-15','2018-01-29','8','今天状态不错啊0020','1'),
	('EA000021','E000011','2017-04-22','2018-12-03','8','今天状态不错啊0021','1'),
	('EA000022','E000011','2018-12-28','2017-06-11','8','今天状态不错啊0022','1'),
	('EA000023','E000012','2019-03-04','2018-05-02','7','今天状态不错啊0023','1'),
	('EA000024','E000012','2018-03-24','2019-08-03','7','今天状态不错啊0024','1'),
	('EA000025','E000013','2017-09-08','2016-12-27','7','今天状态不错啊0025','1'),
	('EA000026','E000013','2019-07-23','2019-03-07','7','今天状态不错啊0026','1'),
	('EA000027','E000014','2017-01-01','2017-12-30','8','今天状态不错啊0027','1'),
	('EA000028','E000014','2017-12-04','2019-06-19','7','今天状态不错啊0028','1'),
	('EA000029','E000015','2016-12-19','2018-04-12','8','今天状态不错啊0029','1'),
	('EA000030','E000015','2017-01-02','2019-04-02','6','今天状态不错啊0030','1'),
	('EA000031','E000016','2018-11-17','2018-03-14','8','今天状态不错啊0031','1'),
	('EA000032','E000016','2016-12-24','2018-03-20','7','今天状态不错啊0032','1');

insert into employee_qualifier_data values
	('EQ000001','E000001','2018-08-28','认证药剂师','高级','考试成绩当年第一名','1'),
	('EQ000002','E000001','2017-12-23','认证架构师','中级','考试成绩当年第一名0002','1'),
	('EQ000003','E000002','2018-05-12','认证会计师','初级','考试成绩当年第一名0003','1'),
	('EQ000004','E000002','2019-02-25','认证经济师','高级','考试成绩当年第一名0004','1'),
	('EQ000005','E000003','2017-11-22','OCP','中级','考试成绩当年第一名0005','1'),
	('EQ000006','E000003','2017-06-10','CCNA','初级','考试成绩当年第一名0006','1'),
	('EQ000007','E000004','2019-07-19','CCNP','高级','考试成绩当年第一名0007','1'),
	('EQ000008','E000004','2018-08-22','认证药剂师','中级','考试成绩当年第一名0008','1'),
	('EQ000009','E000005','2017-03-17','认证架构师','初级','考试成绩当年第一名0009','1'),
	('EQ000010','E000005','2016-11-21','认证会计师','高级','考试成绩当年第一名0010','1'),
	('EQ000011','E000006','2017-11-20','认证经济师','中级','考试成绩当年第一名0011','1'),
	('EQ000012','E000006','2017-09-21','OCP','初级','考试成绩当年第一名0012','1'),
	('EQ000013','E000007','2018-09-25','CCNA','高级','考试成绩当年第一名0013','1'),
	('EQ000014','E000007','2019-01-29','CCNP','中级','考试成绩当年第一名0014','1'),
	('EQ000015','E000008','2019-06-28','认证药剂师','初级','考试成绩当年第一名0015','1'),
	('EQ000016','E000008','2018-04-23','认证架构师','高级','考试成绩当年第一名0016','1'),
	('EQ000017','E000009','2018-05-29','认证会计师','中级','考试成绩当年第一名0017','1'),
	('EQ000018','E000009','2018-12-12','认证经济师','初级','考试成绩当年第一名0018','1'),
	('EQ000019','E000010','2018-11-30','OCP','高级','考试成绩当年第一名0019','1'),
	('EQ000020','E000010','2018-12-03','CCNA','中级','考试成绩当年第一名0020','1'),
	('EQ000021','E000011','2016-11-28','CCNP','初级','考试成绩当年第一名0021','1'),
	('EQ000022','E000011','2019-08-03','认证药剂师','高级','考试成绩当年第一名0022','1'),
	('EQ000023','E000012','2019-08-27','认证架构师','中级','考试成绩当年第一名0023','1'),
	('EQ000024','E000012','2016-11-26','认证会计师','初级','考试成绩当年第一名0024','1'),
	('EQ000025','E000013','2018-04-26','认证经济师','高级','考试成绩当年第一名0025','1'),
	('EQ000026','E000013','2017-09-03','OCP','中级','考试成绩当年第一名0026','1'),
	('EQ000027','E000014','2019-04-25','CCNA','初级','考试成绩当年第一名0027','1'),
	('EQ000028','E000014','2018-12-22','CCNP','高级','考试成绩当年第一名0028','1'),
	('EQ000029','E000015','2019-06-29','认证药剂师','中级','考试成绩当年第一名0029','1'),
	('EQ000030','E000015','2019-06-05','认证架构师','初级','考试成绩当年第一名0030','1'),
	('EQ000031','E000016','2018-09-28','认证会计师','高级','考试成绩当年第一名0031','1'),
	('EQ000032','E000016','2017-02-24','认证经济师','中级','考试成绩当年第一名0032','1');

insert into employee_education_data values
	('EE000001','E000001','2019-01-30','小学','考试成绩当年第一名','1'),
	('EE000002','E000001','2019-03-15','初中','考试成绩当年第一名0002','1'),
	('EE000003','E000002','2018-02-22','高中','考试成绩当年第一名0003','1'),
	('EE000004','E000002','2018-07-13','大学','考试成绩当年第一名0004','1'),
	('EE000005','E000003','2019-02-04','硕士','考试成绩当年第一名0005','1'),
	('EE000006','E000003','2019-07-28','博士','考试成绩当年第一名0006','1'),
	('EE000007','E000004','2017-06-17','职业教育','考试成绩当年第一名0007','1'),
	('EE000008','E000004','2017-07-24','小学','考试成绩当年第一名0008','1'),
	('EE000009','E000005','2019-07-08','初中','考试成绩当年第一名0009','1'),
	('EE000010','E000005','2018-11-07','高中','考试成绩当年第一名0010','1'),
	('EE000011','E000006','2018-09-02','大学','考试成绩当年第一名0011','1'),
	('EE000012','E000006','2018-02-08','硕士','考试成绩当年第一名0012','1'),
	('EE000013','E000007','2018-03-07','博士','考试成绩当年第一名0013','1'),
	('EE000014','E000007','2018-03-10','职业教育','考试成绩当年第一名0014','1'),
	('EE000015','E000008','2017-09-27','小学','考试成绩当年第一名0015','1'),
	('EE000016','E000008','2018-11-27','初中','考试成绩当年第一名0016','1'),
	('EE000017','E000009','2018-05-14','高中','考试成绩当年第一名0017','1'),
	('EE000018','E000009','2019-06-12','大学','考试成绩当年第一名0018','1'),
	('EE000019','E000010','2018-11-29','硕士','考试成绩当年第一名0019','1'),
	('EE000020','E000010','2016-12-15','博士','考试成绩当年第一名0020','1'),
	('EE000021','E000011','2018-01-15','职业教育','考试成绩当年第一名0021','1'),
	('EE000022','E000011','2018-07-14','小学','考试成绩当年第一名0022','1'),
	('EE000023','E000012','2017-11-06','初中','考试成绩当年第一名0023','1'),
	('EE000024','E000012','2018-09-22','高中','考试成绩当年第一名0024','1'),
	('EE000025','E000013','2018-06-16','大学','考试成绩当年第一名0025','1'),
	('EE000026','E000013','2017-02-17','硕士','考试成绩当年第一名0026','1'),
	('EE000027','E000014','2018-09-12','博士','考试成绩当年第一名0027','1'),
	('EE000028','E000014','2019-04-23','职业教育','考试成绩当年第一名0028','1'),
	('EE000029','E000015','2018-03-02','小学','考试成绩当年第一名0029','1'),
	('EE000030','E000015','2019-04-26','初中','考试成绩当年第一名0030','1'),
	('EE000031','E000016','2017-10-21','高中','考试成绩当年第一名0031','1'),
	('EE000032','E000016','2019-03-16','大学','考试成绩当年第一名0032','1');

insert into employee_award_data values
	('EA000001','E000001','2017-11-05','明星员工','考试成绩当年第一名','1'),
	('EA000002','E000001','2019-03-17','销售之星','考试成绩当年第一名0002','1'),
	('EA000003','E000002','2018-12-02','技术之星','考试成绩当年第一名0003','1'),
	('EA000004','E000002','2019-09-04','管理之星','考试成绩当年第一名0004','1'),
	('EA000005','E000003','2018-05-16','终身成就奖','考试成绩当年第一名0005','1'),
	('EA000006','E000003','2019-04-27','明星员工','考试成绩当年第一名0006','1'),
	('EA000007','E000004','2017-02-12','销售之星','考试成绩当年第一名0007','1'),
	('EA000008','E000004','2017-07-17','技术之星','考试成绩当年第一名0008','1'),
	('EA000009','E000005','2016-09-21','管理之星','考试成绩当年第一名0009','1'),
	('EA000010','E000005','2018-03-31','终身成就奖','考试成绩当年第一名0010','1'),
	('EA000011','E000006','2019-07-06','明星员工','考试成绩当年第一名0011','1'),
	('EA000012','E000006','2017-09-07','销售之星','考试成绩当年第一名0012','1'),
	('EA000013','E000007','2016-11-08','技术之星','考试成绩当年第一名0013','1'),
	('EA000014','E000007','2018-01-02','管理之星','考试成绩当年第一名0014','1'),
	('EA000015','E000008','2017-10-18','终身成就奖','考试成绩当年第一名0015','1'),
	('EA000016','E000008','2017-07-18','明星员工','考试成绩当年第一名0016','1'),
	('EA000017','E000009','2018-08-18','销售之星','考试成绩当年第一名0017','1'),
	('EA000018','E000009','2018-06-27','技术之星','考试成绩当年第一名0018','1'),
	('EA000019','E000010','2017-05-10','管理之星','考试成绩当年第一名0019','1'),
	('EA000020','E000010','2017-08-16','终身成就奖','考试成绩当年第一名0020','1'),
	('EA000021','E000011','2019-02-17','明星员工','考试成绩当年第一名0021','1'),
	('EA000022','E000011','2018-05-25','销售之星','考试成绩当年第一名0022','1'),
	('EA000023','E000012','2019-02-25','技术之星','考试成绩当年第一名0023','1'),
	('EA000024','E000012','2018-02-10','管理之星','考试成绩当年第一名0024','1'),
	('EA000025','E000013','2017-04-07','终身成就奖','考试成绩当年第一名0025','1'),
	('EA000026','E000013','2019-04-12','明星员工','考试成绩当年第一名0026','1'),
	('EA000027','E000014','2018-02-09','销售之星','考试成绩当年第一名0027','1'),
	('EA000028','E000014','2019-09-07','技术之星','考试成绩当年第一名0028','1'),
	('EA000029','E000015','2019-07-02','管理之星','考试成绩当年第一名0029','1'),
	('EA000030','E000015','2018-06-19','终身成就奖','考试成绩当年第一名0030','1'),
	('EA000031','E000016','2018-10-30','明星员工','考试成绩当年第一名0031','1'),
	('EA000032','E000016','2018-11-18','销售之星','考试成绩当年第一名0032','1');

insert into employee_salary_sheet_data values
	('ESS000001','E000001','SG000001','2627.66','961.20','703.00','569.68','798.93','1207.91','8.54',NULL,'PAID_OFF','1'),
	('ESS000002','E000001','SG000001','2574.19','919.48','734.80','626.76','882.37','925.16','8.20',NULL,'PAID_OFF0002','1'),
	('ESS000003','E000001','SG000001','2230.57','899.26','952.61','601.61','954.80','937.27','7.70',NULL,'PAID_OFF0003','1'),
	('ESS000004','E000001','SG000001','2374.40','970.70','896.20','713.22','924.43','1187.79','8.48',NULL,'PAID_OFF0004','1'),
	('ESS000005','E000002','SG000001','2294.36','849.37','721.19','759.60','863.69','1174.96','7.92',NULL,'PAID_OFF0005','1'),
	('ESS000006','E000002','SG000001','2502.02','966.05','757.11','682.16','824.14','949.91','6.24',NULL,'PAID_OFF0006','1'),
	('ESS000007','E000002','SG000001','2646.94','777.22','835.39','614.58','1079.19','1024.33','8.55',NULL,'PAID_OFF0007','1'),
	('ESS000008','E000002','SG000001','2807.43','792.24','715.13','790.81','1014.34','1192.24','7.11',NULL,'PAID_OFF0008','1'),
	('ESS000009','E000003','SG000001','2512.52','793.09','718.38','762.09','840.36','1193.21','6.24',NULL,'PAID_OFF0009','1'),
	('ESS000010','E000003','SG000001','2556.77','781.06','876.15','644.60','924.42','1138.36','7.39',NULL,'PAID_OFF0010','1'),
	('ESS000011','E000003','SG000001','2253.44','786.13','870.66','612.81','871.62','1071.11','8.27',NULL,'PAID_OFF0011','1'),
	('ESS000012','E000003','SG000001','2857.85','884.54','752.75','755.20','859.19','1008.25','6.37',NULL,'PAID_OFF0012','1'),
	('ESS000013','E000004','SG000001','2543.28','771.07','846.15','643.64','830.47','1053.56','8.00',NULL,'PAID_OFF0013','1'),
	('ESS000014','E000004','SG000001','2423.68','724.71','932.80','679.55','1021.04','1020.26','7.76',NULL,'PAID_OFF0014','1'),
	('ESS000015','E000004','SG000001','2444.19','733.62','929.44','626.89','1003.46','1104.30','7.79',NULL,'PAID_OFF0015','1'),
	('ESS000016','E000004','SG000001','2891.77','701.52','892.36','756.40','865.16','1079.95','7.64',NULL,'PAID_OFF0016','1'),
	('ESS000017','E000005','SG000001','2405.17','903.26','816.10','696.88','947.27','1198.74','8.62',NULL,'PAID_OFF0017','1'),
	('ESS000018','E000005','SG000001','2181.73','730.69','706.85','753.50','860.32','987.09','6.36',NULL,'PAID_OFF0018','1'),
	('ESS000019','E000005','SG000001','2314.99','980.28','931.26','693.40','788.89','886.52','8.03',NULL,'PAID_OFF0019','1'),
	('ESS000020','E000005','SG000001','2208.21','839.03','845.80','747.33','915.28','1164.18','7.17',NULL,'PAID_OFF0020','1'),
	('ESS000021','E000006','SG000001','2701.47','869.31','970.76','694.63','1030.55','1184.48','6.32',NULL,'PAID_OFF0021','1'),
	('ESS000022','E000006','SG000001','2473.27','887.48','775.86','591.00','925.29','957.37','8.86',NULL,'PAID_OFF0022','1'),
	('ESS000023','E000006','SG000001','2309.22','873.96','871.33','724.07','970.09','1104.89','8.10',NULL,'PAID_OFF0023','1'),
	('ESS000024','E000006','SG000001','2370.02','734.95','873.79','682.98','932.52','1109.04','6.85',NULL,'PAID_OFF0024','1'),
	('ESS000025','E000007','SG000001','2706.20','742.29','848.55','675.99','1058.73','1152.28','7.54',NULL,'PAID_OFF0025','1'),
	('ESS000026','E000007','SG000001','2241.80','928.03','801.32','660.57','868.01','1071.49','6.98',NULL,'PAID_OFF0026','1'),
	('ESS000027','E000007','SG000001','2385.48','705.58','950.14','591.41','1097.53','984.85','7.54',NULL,'PAID_OFF0027','1'),
	('ESS000028','E000007','SG000001','2538.98','773.26','786.09','661.27','1087.32','1006.91','8.41',NULL,'PAID_OFF0028','1'),
	('ESS000029','E000008','SG000001','2766.84','861.98','956.43','694.25','1016.89','1178.79','8.75',NULL,'PAID_OFF0029','1'),
	('ESS000030','E000008','SG000001','2708.90','961.97','705.12','710.48','778.72','875.93','7.19',NULL,'PAID_OFF0030','1'),
	('ESS000031','E000008','SG000001','2659.59','842.41','891.47','778.28','1020.96','1001.31','8.86',NULL,'PAID_OFF0031','1'),
	('ESS000032','E000008','SG000001','2573.55','797.85','881.96','590.03','935.89','872.16','8.24',NULL,'PAID_OFF0032','1'),
	('ESS000033','E000009','SG000002','2877.29','882.08','848.54','637.85','774.30','1194.86','8.04',NULL,'PAID_OFF0033','1'),
	('ESS000034','E000009','SG000002','2810.39','880.60','989.81','555.65','1088.98','1115.39','7.57',NULL,'PAID_OFF0034','1'),
	('ESS000035','E000009','SG000002','2870.70','959.92','863.11','666.15','1096.48','1143.51','6.69',NULL,'PAID_OFF0035','1'),
	('ESS000036','E000009','SG000002','2835.41','706.03','936.58','755.40','795.30','1191.41','8.62',NULL,'PAID_OFF0036','1'),
	('ESS000037','E000010','SG000002','2549.37','870.27','705.18','701.86','843.91','907.51','8.73',NULL,'PAID_OFF0037','1'),
	('ESS000038','E000010','SG000002','2115.77','721.40','881.69','780.71','1096.11','1026.05','7.83',NULL,'PAID_OFF0038','1'),
	('ESS000039','E000010','SG000002','2547.30','842.46','900.86','580.99','949.59','1197.89','8.22',NULL,'PAID_OFF0039','1'),
	('ESS000040','E000010','SG000002','2243.78','864.77','869.84','638.31','1056.78','1033.23','6.30',NULL,'PAID_OFF0040','1'),
	('ESS000041','E000011','SG000002','2863.10','718.12','710.05','718.01','770.54','955.39','8.61',NULL,'PAID_OFF0041','1'),
	('ESS000042','E000011','SG000002','2510.42','893.69','736.55','656.42','1038.97','877.48','7.19',NULL,'PAID_OFF0042','1'),
	('ESS000043','E000011','SG000002','2102.47','755.51','883.99','586.39','888.42','1043.16','8.00',NULL,'PAID_OFF0043','1'),
	('ESS000044','E000011','SG000002','2211.60','874.89','847.89','602.32','994.19','1164.12','7.09',NULL,'PAID_OFF0044','1'),
	('ESS000045','E000012','SG000002','2406.06','931.29','937.87','670.78','816.07','906.43','7.39',NULL,'PAID_OFF0045','1'),
	('ESS000046','E000012','SG000002','2429.41','942.01','940.50','671.88','857.64','970.15','7.05',NULL,'PAID_OFF0046','1'),
	('ESS000047','E000012','SG000002','2569.65','810.65','915.70','570.31','793.42','857.10','7.64',NULL,'PAID_OFF0047','1'),
	('ESS000048','E000012','SG000002','2995.61','801.10','867.20','639.65','777.77','1037.42','6.28',NULL,'PAID_OFF0048','1'),
	('ESS000049','E000013','SG000002','2521.52','817.27','887.54','588.52','912.91','882.56','6.26',NULL,'PAID_OFF0049','1'),
	('ESS000050','E000013','SG000002','2694.93','857.96','768.29','556.69','829.57','1137.05','7.62',NULL,'PAID_OFF0050','1'),
	('ESS000051','E000013','SG000002','2800.40','845.98','827.40','788.01','865.98','942.78','7.09',NULL,'PAID_OFF0051','1'),
	('ESS000052','E000013','SG000002','2694.30','786.02','753.95','746.35','931.35','1045.38','8.87',NULL,'PAID_OFF0052','1'),
	('ESS000053','E000014','SG000002','2970.42','970.71','828.77','586.91','789.70','1210.00','7.12',NULL,'PAID_OFF0053','1'),
	('ESS000054','E000014','SG000002','2823.56','944.44','724.38','685.61','963.23','956.13','6.54',NULL,'PAID_OFF0054','1'),
	('ESS000055','E000014','SG000002','2183.91','931.72','750.81','631.51','1021.36','1158.91','8.67',NULL,'PAID_OFF0055','1'),
	('ESS000056','E000014','SG000002','2932.38','877.77','979.49','643.72','1090.89','1032.97','8.40',NULL,'PAID_OFF0056','1'),
	('ESS000057','E000015','SG000002','2778.23','770.85','871.19','691.47','1088.22','1106.28','8.59',NULL,'PAID_OFF0057','1'),
	('ESS000058','E000015','SG000002','2339.54','989.06','788.21','623.74','1014.97','903.19','7.56',NULL,'PAID_OFF0058','1'),
	('ESS000059','E000015','SG000002','2813.95','980.68','885.46','752.91','997.16','1054.31','6.85',NULL,'PAID_OFF0059','1'),
	('ESS000060','E000015','SG000002','2677.19','720.38','944.11','777.68','868.23','913.71','8.09',NULL,'PAID_OFF0060','1'),
	('ESS000061','E000016','SG000002','2979.84','758.06','917.38','647.39','1051.00','1011.89','8.27',NULL,'PAID_OFF0061','1'),
	('ESS000062','E000016','SG000002','2651.23','816.07','718.52','607.94','809.76','856.28','6.66',NULL,'PAID_OFF0062','1'),
	('ESS000063','E000016','SG000002','2623.45','899.30','932.88','755.28','953.48','1189.42','6.35',NULL,'PAID_OFF0063','1'),
	('ESS000064','E000016','SG000002','2744.70','785.93','918.71','640.20','886.59','966.33','6.53',NULL,'PAID_OFF0064','1');

insert into paying_off_data values
	('PO000001','出纳','E000001','2016-09-19','3861.39','1'),
	('PO000002','出纳0002','E000001','2018-07-01','3776.39','1'),
	('PO000003','出纳0003','E000002','2019-06-14','3906.81','1'),
	('PO000004','出纳0004','E000002','2017-11-23','4392.66','1'),
	('PO000005','出纳0005','E000003','2017-02-17','4891.65','1'),
	('PO000006','出纳0006','E000003','2017-06-18','5203.78','1'),
	('PO000007','出纳0007','E000004','2016-10-12','4000.92','1'),
	('PO000008','出纳0008','E000004','2017-04-09','4983.28','1'),
	('PO000009','出纳0009','E000005','2016-12-27','4731.79','1'),
	('PO000010','出纳0010','E000005','2017-03-14','5176.28','1'),
	('PO000011','出纳0011','E000006','2016-10-15','4467.15','1'),
	('PO000012','出纳0012','E000006','2019-01-19','4981.73','1'),
	('PO000013','出纳0013','E000007','2018-09-20','4158.44','1'),
	('PO000014','出纳0014','E000007','2018-02-19','4081.12','1'),
	('PO000015','出纳0015','E000008','2019-06-10','4142.80','1'),
	('PO000016','出纳0016','E000008','2019-04-17','4610.16','1'),
	('PO000017','出纳0017','E000009','2016-09-17','4662.22','1'),
	('PO000018','出纳0018','E000009','2019-09-08','3833.50','1'),
	('PO000019','出纳0019','E000010','2018-07-24','4221.64','1'),
	('PO000020','出纳0020','E000010','2018-11-21','4058.53','1'),
	('PO000021','出纳0021','E000011','2017-07-13','4188.60','1'),
	('PO000022','出纳0022','E000011','2016-09-30','4971.09','1'),
	('PO000023','出纳0023','E000012','2019-08-11','4075.42','1'),
	('PO000024','出纳0024','E000012','2019-06-14','5195.23','1'),
	('PO000025','出纳0025','E000013','2019-03-23','4351.50','1'),
	('PO000026','出纳0026','E000013','2017-11-10','5069.95','1'),
	('PO000027','出纳0027','E000014','2018-01-22','4872.07','1'),
	('PO000028','出纳0028','E000014','2017-10-04','4605.33','1'),
	('PO000029','出纳0029','E000015','2018-12-10','5214.32','1'),
	('PO000030','出纳0030','E000015','2018-01-17','4254.62','1'),
	('PO000031','出纳0031','E000016','2017-01-19','4725.16','1'),
	('PO000032','出纳0032','E000016','2019-02-27','3906.67','1');

insert into user_domain_data values
	('UD000001','用户区域','1');

insert into user_white_list_data values
	('UWL000001','clariones','tester;ios-spokesperson','UD000001','1'),
	('UWL000002','13808188512','tester;ios-spokesperson0002','UD000001','1');

insert into sec_user_data values
	('SU000001','login','13900000001','','C183EC89F92A462CF45B95504792EC4625E847C90536EEFE512D1C9DB8602E95','wx123456789abcdefghijklmn','wxapp12098410239840','jwt_token_12345678','0','2019-08-26 04:19:21','2019-09-09 01:18:47','UD000001',NULL,'BLOCKED','1'),
	('SU000002','login0002','13900000002','suddy_chang@163.com','AC2F95628244C6975EB2C36942EA879ED93D93F5895EF3157733E4629FA86B92','wx123456789abcdefghijklmn0002','wxapp120984102398400002','jwt_token_123456780002','9999999','2019-09-10 06:38:31','2019-09-05 00:04:01','UD000001',NULL,'BLOCKED0002','1');

insert into sec_user_blocking_data values
	('SUB000001','currentUser()','2019-08-24 13:03:58','这个用户多次发送违反社区的帖子，现在把他给屏蔽了','1');

insert into user_app_data values
	('UA000001','审车平台','SU000001','users','1','MXWR','CarInspectionPlatform','CIP000001','/link/to/app','1'),
	('UA000002','账户管理','SU000001','bank','1','MXWR','UserDomain','UD000001','/link/to/app0002','1'),
	('UA000003','接车公司','SU000002','wechat','1','MXWR','CarReceivingServiceCompany','CRSC000001','/link/to/app0003','1'),
	('UA000004','审车公司','SU000002','bar-chart','1','MXWR','CarInspectionServiceCompany','CISC000001','/link/to/app0004','1');

insert into quick_link_data values
	('QL000001','列表','facebook','https://demo.doublechaintech.com/demodata/imageManager/genImage/y00/200/200/red/','列表','2019-08-30 15:04:57','UA000001','1'),
	('QL000002','列表0002','google','https://demo.doublechaintech.com/demodata/imageManager/genImage/y00/200/200/red/','列表0002','2019-09-10 00:45:39','UA000001','1'),
	('QL000003','列表0003','facebook','https://demo.doublechaintech.com/demodata/imageManager/genImage/y00/200/200/red/','列表0003','2019-08-28 11:13:01','UA000002','1'),
	('QL000004','列表0004','google','https://demo.doublechaintech.com/demodata/imageManager/genImage/y00/200/200/red/','列表0004','2019-09-09 21:36:34','UA000002','1'),
	('QL000005','列表0005','facebook','https://demo.doublechaintech.com/demodata/imageManager/genImage/y00/200/200/red/','列表0005','2019-08-27 08:12:30','UA000003','1'),
	('QL000006','列表0006','google','https://demo.doublechaintech.com/demodata/imageManager/genImage/y00/200/200/red/','列表0006','2019-09-13 02:11:59','UA000003','1'),
	('QL000007','列表0007','facebook','https://demo.doublechaintech.com/demodata/imageManager/genImage/y00/200/200/red/','列表0007','2019-09-14 03:43:24','UA000004','1'),
	('QL000008','列表0008','google','https://demo.doublechaintech.com/demodata/imageManager/genImage/y00/200/200/red/','列表0008','2019-09-14 03:56:24','UA000004','1');

insert into list_access_data values
	('LA000001','列表','levelOneCategoryList','1','1','1','1','1','UA000001','1'),
	('LA000002','列表0002','levelOneCategoryList0002','1','1','1','1','1','UA000001','1'),
	('LA000003','列表0003','levelOneCategoryList0003','1','1','1','1','1','UA000002','1'),
	('LA000004','列表0004','levelOneCategoryList0004','1','1','1','1','1','UA000002','1'),
	('LA000005','列表0005','levelOneCategoryList0005','1','1','1','1','1','UA000003','1'),
	('LA000006','列表0006','levelOneCategoryList0006','1','1','1','1','1','UA000003','1'),
	('LA000007','列表0007','levelOneCategoryList0007','1','1','1','1','1','UA000004','1'),
	('LA000008','列表0008','levelOneCategoryList0008','1','1','1','1','1','UA000004','1');

insert into object_access_data values
	('OA000001','控制访问列表1','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000001','1'),
	('OA000002','控制访问列表10002','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000001','1'),
	('OA000003','控制访问列表10003','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000002','1'),
	('OA000004','控制访问列表10004','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000002','1'),
	('OA000005','控制访问列表10005','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000003','1'),
	('OA000006','控制访问列表10006','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000003','1'),
	('OA000007','控制访问列表10007','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000004','1'),
	('OA000008','控制访问列表10008','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000004','1');

insert into login_history_data values
	('LH000001','2019-09-05 05:40:51','192.168.1.1','登陆成功','SU000001','1'),
	('LH000002','2019-09-10 03:26:26','192.168.1.2','登陆成功0002','SU000001','1'),
	('LH000003','2019-09-12 03:18:34','192.168.1.1','登陆成功0003','SU000002','1'),
	('LH000004','2019-09-02 07:37:47','192.168.1.2','登陆成功0004','SU000002','1');

insert into generic_form_data values
	('GF000001','登记输入单','姓名就是你身份证上的名字','1');

insert into form_message_data values
	('FM000001','字段组合错误','GF000001','success','1'),
	('FM000002','字段组合错误0002','GF000001','info','1');

insert into form_field_message_data values
	('FFM000001','输入错误','name','GF000001','success','1'),
	('FFM000002','输入错误0002','name0002','GF000001','info','1');

insert into form_field_data values
	('FF000001','姓名','name','name','text','GF000001','姓名就是你身份证上的名字','李一一','姓名就是你身份证上的名字','基础信息','maybe any value','a value expression','1','1','1','','','1'),
	('FF000002','年龄','age','name0002','longtext','GF000001','姓名就是你身份证上的名字0002','李一一0002','姓名就是你身份证上的名字0002','扩展信息','maybe any value0002','a value expression0002','1','1','1','','','1');

insert into form_action_data values
	('FA000001','功能','name','save','default','genericFormManager/name/name0002/name0003/','GF000001','1'),
	('FA000002','功能0002','name0002','update','warning','genericFormManager/name/name0002/name0003/0002','GF000001','1');

insert into candidate_container_data values
	('CC000001','我只是一个容器','1');

insert into candidate_element_data values
	('CE000001','搜索到的匹配字段','类型描述','https://demo.doublechaintech.com/demodata/imageManager/genImage/100/400/200/grey/','CC000001','1'),
	('CE000002','搜索到的匹配字段0002','类型描述0002','https://demo.doublechaintech.com/demodata/imageManager/genImage/100/400/200/grey/','CC000001','1');



/*
Mysql innodb's foreign key has index automatically

*/

create unique index idx_retail_store_country_center_version on retail_store_country_center_data(id, version);

create unique index idx_catalog_version on catalog_data(id, version);

alter table catalog_data add constraint catalog4owner_fk
	foreign key(owner) references retail_store_country_center_data(id) on delete cascade on update cascade;
create unique index idx_level_one_category_version on level_one_category_data(id, version);

alter table level_one_category_data add constraint level_one_category4catalog_fk
	foreign key(catalog) references catalog_data(id) on delete cascade on update cascade;
create unique index idx_level_two_category_version on level_two_category_data(id, version);

alter table level_two_category_data add constraint level_two_category4parent_category_fk
	foreign key(parent_category) references level_one_category_data(id) on delete cascade on update cascade;
create unique index idx_level_three_category_version on level_three_category_data(id, version);

alter table level_three_category_data add constraint level_three_category4parent_category_fk
	foreign key(parent_category) references level_two_category_data(id) on delete cascade on update cascade;
create unique index idx_product_version on product_data(id, version);

alter table product_data add constraint product4parent_category_fk
	foreign key(parent_category) references level_three_category_data(id) on delete cascade on update cascade;
create unique index idx_sku_version on sku_data(id, version);

alter table sku_data add constraint sku4product_fk
	foreign key(product) references product_data(id) on delete cascade on update cascade;
create unique index idx_retail_store_province_center_version on retail_store_province_center_data(id, version);

alter table retail_store_province_center_data add constraint retail_store_province_center4country_fk
	foreign key(country) references retail_store_country_center_data(id) on delete cascade on update cascade;
create unique index idx_province_center_department_version on province_center_department_data(id, version);

alter table province_center_department_data add constraint province_center_department4province_center_fk
	foreign key(province_center) references retail_store_province_center_data(id) on delete cascade on update cascade;
create unique index idx_province_center_employee_version on province_center_employee_data(id, version);

alter table province_center_employee_data add constraint province_center_employee4department_fk
	foreign key(department) references province_center_department_data(id) on delete cascade on update cascade;
alter table province_center_employee_data add constraint province_center_employee4province_center_fk
	foreign key(province_center) references retail_store_province_center_data(id) on delete cascade on update cascade;
create unique index idx_retail_store_city_service_center_version on retail_store_city_service_center_data(id, version);

alter table retail_store_city_service_center_data add constraint retail_store_city_service_center4belongs_to_fk
	foreign key(belongs_to) references retail_store_province_center_data(id) on delete cascade on update cascade;
create unique index idx_city_partner_version on city_partner_data(id, version);

alter table city_partner_data add constraint city_partner4city_service_center_fk
	foreign key(city_service_center) references retail_store_city_service_center_data(id) on delete cascade on update cascade;
create unique index idx_potential_customer_version on potential_customer_data(id, version);

alter table potential_customer_data add constraint potential_customer4city_service_center_fk
	foreign key(city_service_center) references retail_store_city_service_center_data(id) on delete cascade on update cascade;
alter table potential_customer_data add constraint potential_customer4city_partner_fk
	foreign key(city_partner) references city_partner_data(id) on delete cascade on update cascade;
create unique index idx_potential_customer_contact_person_version on potential_customer_contact_person_data(id, version);

alter table potential_customer_contact_person_data add constraint potential_customer_contact_person4potential_customer_fk
	foreign key(potential_customer) references potential_customer_data(id) on delete cascade on update cascade;
create unique index idx_potential_customer_contact_version on potential_customer_contact_data(id, version);

alter table potential_customer_contact_data add constraint potential_customer_contact4potential_customer_fk
	foreign key(potential_customer) references potential_customer_data(id) on delete cascade on update cascade;
alter table potential_customer_contact_data add constraint potential_customer_contact4city_partner_fk
	foreign key(city_partner) references city_partner_data(id) on delete cascade on update cascade;
alter table potential_customer_contact_data add constraint potential_customer_contact4contact_to_fk
	foreign key(contact_to) references potential_customer_contact_person_data(id) on delete cascade on update cascade;
create unique index idx_city_event_version on city_event_data(id, version);

alter table city_event_data add constraint city_event4city_service_center_fk
	foreign key(city_service_center) references retail_store_city_service_center_data(id) on delete cascade on update cascade;
create unique index idx_event_attendance_version on event_attendance_data(id, version);

alter table event_attendance_data add constraint event_attendance4potential_customer_fk
	foreign key(potential_customer) references potential_customer_data(id) on delete cascade on update cascade;
alter table event_attendance_data add constraint event_attendance4city_event_fk
	foreign key(city_event) references city_event_data(id) on delete cascade on update cascade;
create unique index idx_retail_store_version on retail_store_data(id, version);

alter table retail_store_data add constraint retail_store4retail_store_country_center_fk
	foreign key(retail_store_country_center) references retail_store_country_center_data(id) on delete cascade on update cascade;
alter table retail_store_data add constraint retail_store4city_service_center_fk
	foreign key(city_service_center) references retail_store_city_service_center_data(id) on delete cascade on update cascade;
alter table retail_store_data add constraint retail_store4creation_fk
	foreign key(creation) references retail_store_creation_data(id) on delete cascade on update cascade;
alter table retail_store_data add constraint retail_store4investment_invitation_fk
	foreign key(investment_invitation) references retail_store_investment_invitation_data(id) on delete cascade on update cascade;
alter table retail_store_data add constraint retail_store4franchising_fk
	foreign key(franchising) references retail_store_franchising_data(id) on delete cascade on update cascade;
alter table retail_store_data add constraint retail_store4decoration_fk
	foreign key(decoration) references retail_store_decoration_data(id) on delete cascade on update cascade;
alter table retail_store_data add constraint retail_store4opening_fk
	foreign key(opening) references retail_store_opening_data(id) on delete cascade on update cascade;
alter table retail_store_data add constraint retail_store4closing_fk
	foreign key(closing) references retail_store_closing_data(id) on delete cascade on update cascade;
create unique index idx_retail_store_creation_version on retail_store_creation_data(id, version);

create unique index idx_retail_store_investment_invitation_version on retail_store_investment_invitation_data(id, version);

create unique index idx_retail_store_franchising_version on retail_store_franchising_data(id, version);

create unique index idx_retail_store_decoration_version on retail_store_decoration_data(id, version);

create unique index idx_retail_store_opening_version on retail_store_opening_data(id, version);

create unique index idx_retail_store_closing_version on retail_store_closing_data(id, version);

create unique index idx_retail_store_member_version on retail_store_member_data(id, version);

alter table retail_store_member_data add constraint retail_store_member4owner_fk
	foreign key(owner) references retail_store_country_center_data(id) on delete cascade on update cascade;
create unique index idx_consumer_order_version on consumer_order_data(id, version);

alter table consumer_order_data add constraint consumer_order4consumer_fk
	foreign key(consumer) references retail_store_member_data(id) on delete cascade on update cascade;
alter table consumer_order_data add constraint consumer_order4confirmation_fk
	foreign key(confirmation) references supply_order_confirmation_data(id) on delete cascade on update cascade;
alter table consumer_order_data add constraint consumer_order4approval_fk
	foreign key(approval) references supply_order_approval_data(id) on delete cascade on update cascade;
alter table consumer_order_data add constraint consumer_order4processing_fk
	foreign key(processing) references supply_order_processing_data(id) on delete cascade on update cascade;
alter table consumer_order_data add constraint consumer_order4shipment_fk
	foreign key(shipment) references supply_order_shipment_data(id) on delete cascade on update cascade;
alter table consumer_order_data add constraint consumer_order4delivery_fk
	foreign key(delivery) references supply_order_delivery_data(id) on delete cascade on update cascade;
alter table consumer_order_data add constraint consumer_order4store_fk
	foreign key(store) references retail_store_data(id) on delete cascade on update cascade;
create unique index idx_consumer_order_confirmation_version on consumer_order_confirmation_data(id, version);

create unique index idx_consumer_order_approval_version on consumer_order_approval_data(id, version);

create unique index idx_consumer_order_processing_version on consumer_order_processing_data(id, version);

create unique index idx_consumer_order_shipment_version on consumer_order_shipment_data(id, version);

create unique index idx_consumer_order_delivery_version on consumer_order_delivery_data(id, version);

create unique index idx_consumer_order_line_item_version on consumer_order_line_item_data(id, version);

alter table consumer_order_line_item_data add constraint consumer_order_line_item4biz_order_fk
	foreign key(biz_order) references consumer_order_data(id) on delete cascade on update cascade;
create unique index idx_consumer_order_shipping_group_version on consumer_order_shipping_group_data(id, version);

alter table consumer_order_shipping_group_data add constraint consumer_order_shipping_group4biz_order_fk
	foreign key(biz_order) references consumer_order_data(id) on delete cascade on update cascade;
create unique index idx_consumer_order_payment_group_version on consumer_order_payment_group_data(id, version);

alter table consumer_order_payment_group_data add constraint consumer_order_payment_group4biz_order_fk
	foreign key(biz_order) references consumer_order_data(id) on delete cascade on update cascade;
create unique index idx_consumer_order_price_adjustment_version on consumer_order_price_adjustment_data(id, version);

alter table consumer_order_price_adjustment_data add constraint consumer_order_price_adjustment4biz_order_fk
	foreign key(biz_order) references consumer_order_data(id) on delete cascade on update cascade;
create unique index idx_retail_store_member_coupon_version on retail_store_member_coupon_data(id, version);

alter table retail_store_member_coupon_data add constraint retail_store_member_coupon4owner_fk
	foreign key(owner) references retail_store_member_data(id) on delete cascade on update cascade;
create unique index idx_member_wishlist_version on member_wishlist_data(id, version);

alter table member_wishlist_data add constraint member_wishlist4owner_fk
	foreign key(owner) references retail_store_member_data(id) on delete cascade on update cascade;
create unique index idx_member_reward_point_version on member_reward_point_data(id, version);

alter table member_reward_point_data add constraint member_reward_point4owner_fk
	foreign key(owner) references retail_store_member_data(id) on delete cascade on update cascade;
create unique index idx_member_reward_point_redemption_version on member_reward_point_redemption_data(id, version);

alter table member_reward_point_redemption_data add constraint member_reward_point_redemption4owner_fk
	foreign key(owner) references retail_store_member_data(id) on delete cascade on update cascade;
create unique index idx_member_wishlist_product_version on member_wishlist_product_data(id, version);

alter table member_wishlist_product_data add constraint member_wishlist_product4owner_fk
	foreign key(owner) references member_wishlist_data(id) on delete cascade on update cascade;
create unique index idx_retail_store_member_address_version on retail_store_member_address_data(id, version);

alter table retail_store_member_address_data add constraint retail_store_member_address4owner_fk
	foreign key(owner) references retail_store_member_data(id) on delete cascade on update cascade;
create unique index idx_retail_store_member_gift_card_version on retail_store_member_gift_card_data(id, version);

alter table retail_store_member_gift_card_data add constraint retail_store_member_gift_card4owner_fk
	foreign key(owner) references retail_store_member_data(id) on delete cascade on update cascade;
create unique index idx_retail_store_member_gift_card_consume_record_version on retail_store_member_gift_card_consume_record_data(id, version);

alter table retail_store_member_gift_card_consume_record_data add constraint retail_store_member_gift_card_consume_record4owner_fk
	foreign key(owner) references retail_store_member_gift_card_data(id) on delete cascade on update cascade;
alter table retail_store_member_gift_card_consume_record_data add constraint retail_store_member_gift_card_consume_record4biz_order_fk
	foreign key(biz_order) references consumer_order_data(id) on delete cascade on update cascade;
create unique index idx_goods_supplier_version on goods_supplier_data(id, version);

alter table goods_supplier_data add constraint goods_supplier4belong_to_fk
	foreign key(belong_to) references retail_store_country_center_data(id) on delete cascade on update cascade;
create unique index idx_supplier_product_version on supplier_product_data(id, version);

alter table supplier_product_data add constraint supplier_product4supplier_fk
	foreign key(supplier) references goods_supplier_data(id) on delete cascade on update cascade;
create unique index idx_product_supply_duration_version on product_supply_duration_data(id, version);

alter table product_supply_duration_data add constraint product_supply_duration4product_fk
	foreign key(product) references supplier_product_data(id) on delete cascade on update cascade;
create unique index idx_supply_order_version on supply_order_data(id, version);

alter table supply_order_data add constraint supply_order4buyer_fk
	foreign key(buyer) references retail_store_country_center_data(id) on delete cascade on update cascade;
alter table supply_order_data add constraint supply_order4seller_fk
	foreign key(seller) references goods_supplier_data(id) on delete cascade on update cascade;
alter table supply_order_data add constraint supply_order4confirmation_fk
	foreign key(confirmation) references supply_order_confirmation_data(id) on delete cascade on update cascade;
alter table supply_order_data add constraint supply_order4approval_fk
	foreign key(approval) references supply_order_approval_data(id) on delete cascade on update cascade;
alter table supply_order_data add constraint supply_order4processing_fk
	foreign key(processing) references supply_order_processing_data(id) on delete cascade on update cascade;
alter table supply_order_data add constraint supply_order4picking_fk
	foreign key(picking) references supply_order_picking_data(id) on delete cascade on update cascade;
alter table supply_order_data add constraint supply_order4shipment_fk
	foreign key(shipment) references supply_order_shipment_data(id) on delete cascade on update cascade;
alter table supply_order_data add constraint supply_order4delivery_fk
	foreign key(delivery) references supply_order_delivery_data(id) on delete cascade on update cascade;
create unique index idx_supply_order_confirmation_version on supply_order_confirmation_data(id, version);

create unique index idx_supply_order_approval_version on supply_order_approval_data(id, version);

create unique index idx_supply_order_processing_version on supply_order_processing_data(id, version);

create unique index idx_supply_order_picking_version on supply_order_picking_data(id, version);

create unique index idx_supply_order_shipment_version on supply_order_shipment_data(id, version);

create unique index idx_supply_order_delivery_version on supply_order_delivery_data(id, version);

create unique index idx_supply_order_line_item_version on supply_order_line_item_data(id, version);

alter table supply_order_line_item_data add constraint supply_order_line_item4biz_order_fk
	foreign key(biz_order) references supply_order_data(id) on delete cascade on update cascade;
create unique index idx_supply_order_shipping_group_version on supply_order_shipping_group_data(id, version);

alter table supply_order_shipping_group_data add constraint supply_order_shipping_group4biz_order_fk
	foreign key(biz_order) references supply_order_data(id) on delete cascade on update cascade;
create unique index idx_supply_order_payment_group_version on supply_order_payment_group_data(id, version);

alter table supply_order_payment_group_data add constraint supply_order_payment_group4biz_order_fk
	foreign key(biz_order) references supply_order_data(id) on delete cascade on update cascade;
create unique index idx_retail_store_order_version on retail_store_order_data(id, version);

alter table retail_store_order_data add constraint retail_store_order4buyer_fk
	foreign key(buyer) references retail_store_data(id) on delete cascade on update cascade;
alter table retail_store_order_data add constraint retail_store_order4seller_fk
	foreign key(seller) references retail_store_country_center_data(id) on delete cascade on update cascade;
alter table retail_store_order_data add constraint retail_store_order4confirmation_fk
	foreign key(confirmation) references retail_store_order_confirmation_data(id) on delete cascade on update cascade;
alter table retail_store_order_data add constraint retail_store_order4approval_fk
	foreign key(approval) references retail_store_order_approval_data(id) on delete cascade on update cascade;
alter table retail_store_order_data add constraint retail_store_order4processing_fk
	foreign key(processing) references retail_store_order_processing_data(id) on delete cascade on update cascade;
alter table retail_store_order_data add constraint retail_store_order4picking_fk
	foreign key(picking) references retail_store_order_picking_data(id) on delete cascade on update cascade;
alter table retail_store_order_data add constraint retail_store_order4shipment_fk
	foreign key(shipment) references retail_store_order_shipment_data(id) on delete cascade on update cascade;
alter table retail_store_order_data add constraint retail_store_order4delivery_fk
	foreign key(delivery) references retail_store_order_delivery_data(id) on delete cascade on update cascade;
create unique index idx_retail_store_order_confirmation_version on retail_store_order_confirmation_data(id, version);

create unique index idx_retail_store_order_approval_version on retail_store_order_approval_data(id, version);

create unique index idx_retail_store_order_processing_version on retail_store_order_processing_data(id, version);

create unique index idx_retail_store_order_picking_version on retail_store_order_picking_data(id, version);

create unique index idx_retail_store_order_shipment_version on retail_store_order_shipment_data(id, version);

create unique index idx_retail_store_order_delivery_version on retail_store_order_delivery_data(id, version);

create unique index idx_retail_store_order_line_item_version on retail_store_order_line_item_data(id, version);

alter table retail_store_order_line_item_data add constraint retail_store_order_line_item4biz_order_fk
	foreign key(biz_order) references retail_store_order_data(id) on delete cascade on update cascade;
create unique index idx_retail_store_order_shipping_group_version on retail_store_order_shipping_group_data(id, version);

alter table retail_store_order_shipping_group_data add constraint retail_store_order_shipping_group4biz_order_fk
	foreign key(biz_order) references retail_store_order_data(id) on delete cascade on update cascade;
create unique index idx_retail_store_order_payment_group_version on retail_store_order_payment_group_data(id, version);

alter table retail_store_order_payment_group_data add constraint retail_store_order_payment_group4biz_order_fk
	foreign key(biz_order) references retail_store_order_data(id) on delete cascade on update cascade;
create unique index idx_warehouse_version on warehouse_data(id, version);

alter table warehouse_data add constraint warehouse4owner_fk
	foreign key(owner) references retail_store_country_center_data(id) on delete cascade on update cascade;
create unique index idx_storage_space_version on storage_space_data(id, version);

alter table storage_space_data add constraint storage_space4warehouse_fk
	foreign key(warehouse) references warehouse_data(id) on delete cascade on update cascade;
create unique index idx_smart_pallet_version on smart_pallet_data(id, version);

alter table smart_pallet_data add constraint smart_pallet4warehouse_fk
	foreign key(warehouse) references warehouse_data(id) on delete cascade on update cascade;
create unique index idx_goods_shelf_version on goods_shelf_data(id, version);

alter table goods_shelf_data add constraint goods_shelf4storage_space_fk
	foreign key(storage_space) references storage_space_data(id) on delete cascade on update cascade;
alter table goods_shelf_data add constraint goods_shelf4supplier_space_fk
	foreign key(supplier_space) references supplier_space_data(id) on delete cascade on update cascade;
alter table goods_shelf_data add constraint goods_shelf4damage_space_fk
	foreign key(damage_space) references damage_space_data(id) on delete cascade on update cascade;
create unique index idx_goods_shelf_stock_count_version on goods_shelf_stock_count_data(id, version);

alter table goods_shelf_stock_count_data add constraint goods_shelf_stock_count4shelf_fk
	foreign key(shelf) references goods_shelf_data(id) on delete cascade on update cascade;
create unique index idx_stock_count_issue_track_version on stock_count_issue_track_data(id, version);

alter table stock_count_issue_track_data add constraint stock_count_issue_track4stock_count_fk
	foreign key(stock_count) references goods_shelf_stock_count_data(id) on delete cascade on update cascade;
create unique index idx_goods_allocation_version on goods_allocation_data(id, version);

alter table goods_allocation_data add constraint goods_allocation4goods_shelf_fk
	foreign key(goods_shelf) references goods_shelf_data(id) on delete cascade on update cascade;
create unique index idx_goods_version on goods_data(id, version);

alter table goods_data add constraint goods4sku_fk
	foreign key(sku) references sku_data(id) on delete cascade on update cascade;
alter table goods_data add constraint goods4receiving_space_fk
	foreign key(receiving_space) references receiving_space_data(id) on delete cascade on update cascade;
alter table goods_data add constraint goods4goods_allocation_fk
	foreign key(goods_allocation) references goods_allocation_data(id) on delete cascade on update cascade;
alter table goods_data add constraint goods4smart_pallet_fk
	foreign key(smart_pallet) references smart_pallet_data(id) on delete cascade on update cascade;
alter table goods_data add constraint goods4shipping_space_fk
	foreign key(shipping_space) references shipping_space_data(id) on delete cascade on update cascade;
alter table goods_data add constraint goods4transport_task_fk
	foreign key(transport_task) references transport_task_data(id) on delete cascade on update cascade;
alter table goods_data add constraint goods4retail_store_fk
	foreign key(retail_store) references retail_store_data(id) on delete cascade on update cascade;
alter table goods_data add constraint goods4biz_order_fk
	foreign key(biz_order) references supply_order_data(id) on delete cascade on update cascade;
alter table goods_data add constraint goods4retail_store_order_fk
	foreign key(retail_store_order) references retail_store_order_data(id) on delete cascade on update cascade;
alter table goods_data add constraint goods4packaging_fk
	foreign key(packaging) references goods_packaging_data(id) on delete cascade on update cascade;
create unique index idx_goods_packaging_version on goods_packaging_data(id, version);

create unique index idx_goods_movement_version on goods_movement_data(id, version);

alter table goods_movement_data add constraint goods_movement4goods_fk
	foreign key(goods) references goods_data(id) on delete cascade on update cascade;
create unique index idx_supplier_space_version on supplier_space_data(id, version);

alter table supplier_space_data add constraint supplier_space4warehouse_fk
	foreign key(warehouse) references warehouse_data(id) on delete cascade on update cascade;
create unique index idx_receiving_space_version on receiving_space_data(id, version);

alter table receiving_space_data add constraint receiving_space4warehouse_fk
	foreign key(warehouse) references warehouse_data(id) on delete cascade on update cascade;
create unique index idx_shipping_space_version on shipping_space_data(id, version);

alter table shipping_space_data add constraint shipping_space4warehouse_fk
	foreign key(warehouse) references warehouse_data(id) on delete cascade on update cascade;
create unique index idx_damage_space_version on damage_space_data(id, version);

alter table damage_space_data add constraint damage_space4warehouse_fk
	foreign key(warehouse) references warehouse_data(id) on delete cascade on update cascade;
create unique index idx_warehouse_asset_version on warehouse_asset_data(id, version);

alter table warehouse_asset_data add constraint warehouse_asset4owner_fk
	foreign key(owner) references warehouse_data(id) on delete cascade on update cascade;
create unique index idx_transport_fleet_version on transport_fleet_data(id, version);

alter table transport_fleet_data add constraint transport_fleet4owner_fk
	foreign key(owner) references retail_store_country_center_data(id) on delete cascade on update cascade;
create unique index idx_transport_truck_version on transport_truck_data(id, version);

alter table transport_truck_data add constraint transport_truck4owner_fk
	foreign key(owner) references transport_fleet_data(id) on delete cascade on update cascade;
create unique index idx_truck_driver_version on truck_driver_data(id, version);

alter table truck_driver_data add constraint truck_driver4belongs_to_fk
	foreign key(belongs_to) references transport_fleet_data(id) on delete cascade on update cascade;
create unique index idx_transport_task_version on transport_task_data(id, version);

alter table transport_task_data add constraint transport_task4end_fk
	foreign key(end) references retail_store_data(id) on delete cascade on update cascade;
alter table transport_task_data add constraint transport_task4driver_fk
	foreign key(driver) references truck_driver_data(id) on delete cascade on update cascade;
alter table transport_task_data add constraint transport_task4truck_fk
	foreign key(truck) references transport_truck_data(id) on delete cascade on update cascade;
alter table transport_task_data add constraint transport_task4belongs_to_fk
	foreign key(belongs_to) references transport_fleet_data(id) on delete cascade on update cascade;
create unique index idx_transport_task_track_version on transport_task_track_data(id, version);

alter table transport_task_track_data add constraint transport_task_track4movement_fk
	foreign key(movement) references transport_task_data(id) on delete cascade on update cascade;
create unique index idx_account_set_version on account_set_data(id, version);

alter table account_set_data add constraint account_set4country_center_fk
	foreign key(country_center) references retail_store_country_center_data(id) on delete cascade on update cascade;
alter table account_set_data add constraint account_set4retail_store_fk
	foreign key(retail_store) references retail_store_data(id) on delete cascade on update cascade;
alter table account_set_data add constraint account_set4goods_supplier_fk
	foreign key(goods_supplier) references goods_supplier_data(id) on delete cascade on update cascade;
create unique index idx_accounting_subject_version on accounting_subject_data(id, version);

alter table accounting_subject_data add constraint accounting_subject4account_set_fk
	foreign key(account_set) references account_set_data(id) on delete cascade on update cascade;
create unique index idx_accounting_period_version on accounting_period_data(id, version);

alter table accounting_period_data add constraint accounting_period4account_set_fk
	foreign key(account_set) references account_set_data(id) on delete cascade on update cascade;
create unique index idx_accounting_document_type_version on accounting_document_type_data(id, version);

alter table accounting_document_type_data add constraint accounting_document_type4accounting_period_fk
	foreign key(accounting_period) references account_set_data(id) on delete cascade on update cascade;
create unique index idx_accounting_document_version on accounting_document_data(id, version);

alter table accounting_document_data add constraint accounting_document4accounting_period_fk
	foreign key(accounting_period) references accounting_period_data(id) on delete cascade on update cascade;
alter table accounting_document_data add constraint accounting_document4document_type_fk
	foreign key(document_type) references accounting_document_type_data(id) on delete cascade on update cascade;
alter table accounting_document_data add constraint accounting_document4creation_fk
	foreign key(creation) references accounting_document_creation_data(id) on delete cascade on update cascade;
alter table accounting_document_data add constraint accounting_document4confirmation_fk
	foreign key(confirmation) references accounting_document_confirmation_data(id) on delete cascade on update cascade;
alter table accounting_document_data add constraint accounting_document4auditing_fk
	foreign key(auditing) references accounting_document_auditing_data(id) on delete cascade on update cascade;
alter table accounting_document_data add constraint accounting_document4posting_fk
	foreign key(posting) references accounting_document_posting_data(id) on delete cascade on update cascade;
create unique index idx_accounting_document_creation_version on accounting_document_creation_data(id, version);

create unique index idx_accounting_document_confirmation_version on accounting_document_confirmation_data(id, version);

create unique index idx_accounting_document_auditing_version on accounting_document_auditing_data(id, version);

create unique index idx_accounting_document_posting_version on accounting_document_posting_data(id, version);

create unique index idx_original_voucher_version on original_voucher_data(id, version);

alter table original_voucher_data add constraint original_voucher4belongs_to_fk
	foreign key(belongs_to) references accounting_document_data(id) on delete cascade on update cascade;
alter table original_voucher_data add constraint original_voucher4creation_fk
	foreign key(creation) references original_voucher_creation_data(id) on delete cascade on update cascade;
alter table original_voucher_data add constraint original_voucher4confirmation_fk
	foreign key(confirmation) references original_voucher_confirmation_data(id) on delete cascade on update cascade;
alter table original_voucher_data add constraint original_voucher4auditing_fk
	foreign key(auditing) references original_voucher_auditing_data(id) on delete cascade on update cascade;
create unique index idx_original_voucher_creation_version on original_voucher_creation_data(id, version);

create unique index idx_original_voucher_confirmation_version on original_voucher_confirmation_data(id, version);

create unique index idx_original_voucher_auditing_version on original_voucher_auditing_data(id, version);

create unique index idx_accounting_document_line_version on accounting_document_line_data(id, version);

alter table accounting_document_line_data add constraint accounting_document_line4belongs_to_fk
	foreign key(belongs_to) references accounting_document_data(id) on delete cascade on update cascade;
alter table accounting_document_line_data add constraint accounting_document_line4accounting_subject_fk
	foreign key(accounting_subject) references accounting_subject_data(id) on delete cascade on update cascade;
create unique index idx_level_one_department_version on level_one_department_data(id, version);

alter table level_one_department_data add constraint level_one_department4belongs_to_fk
	foreign key(belongs_to) references retail_store_country_center_data(id) on delete cascade on update cascade;
create unique index idx_level_two_department_version on level_two_department_data(id, version);

alter table level_two_department_data add constraint level_two_department4belongs_to_fk
	foreign key(belongs_to) references level_one_department_data(id) on delete cascade on update cascade;
create unique index idx_level_three_department_version on level_three_department_data(id, version);

alter table level_three_department_data add constraint level_three_department4belongs_to_fk
	foreign key(belongs_to) references level_two_department_data(id) on delete cascade on update cascade;
create unique index idx_skill_type_version on skill_type_data(id, version);

alter table skill_type_data add constraint skill_type4company_fk
	foreign key(company) references retail_store_country_center_data(id) on delete cascade on update cascade;
create unique index idx_responsibility_type_version on responsibility_type_data(id, version);

alter table responsibility_type_data add constraint responsibility_type4company_fk
	foreign key(company) references retail_store_country_center_data(id) on delete cascade on update cascade;
create unique index idx_termination_reason_version on termination_reason_data(id, version);

alter table termination_reason_data add constraint termination_reason4company_fk
	foreign key(company) references retail_store_country_center_data(id) on delete cascade on update cascade;
create unique index idx_termination_type_version on termination_type_data(id, version);

alter table termination_type_data add constraint termination_type4company_fk
	foreign key(company) references retail_store_country_center_data(id) on delete cascade on update cascade;
create unique index idx_occupation_type_version on occupation_type_data(id, version);

alter table occupation_type_data add constraint occupation_type4company_fk
	foreign key(company) references retail_store_country_center_data(id) on delete cascade on update cascade;
create unique index idx_leave_type_version on leave_type_data(id, version);

alter table leave_type_data add constraint leave_type4company_fk
	foreign key(company) references retail_store_country_center_data(id) on delete cascade on update cascade;
create unique index idx_salary_grade_version on salary_grade_data(id, version);

alter table salary_grade_data add constraint salary_grade4company_fk
	foreign key(company) references retail_store_country_center_data(id) on delete cascade on update cascade;
create unique index idx_interview_type_version on interview_type_data(id, version);

alter table interview_type_data add constraint interview_type4company_fk
	foreign key(company) references retail_store_country_center_data(id) on delete cascade on update cascade;
create unique index idx_training_course_type_version on training_course_type_data(id, version);

alter table training_course_type_data add constraint training_course_type4company_fk
	foreign key(company) references retail_store_country_center_data(id) on delete cascade on update cascade;
create unique index idx_public_holiday_version on public_holiday_data(id, version);

alter table public_holiday_data add constraint public_holiday4company_fk
	foreign key(company) references retail_store_country_center_data(id) on delete cascade on update cascade;
create unique index idx_termination_version on termination_data(id, version);

alter table termination_data add constraint termination4reason_fk
	foreign key(reason) references termination_reason_data(id) on delete cascade on update cascade;
alter table termination_data add constraint termination4type_fk
	foreign key(type) references termination_type_data(id) on delete cascade on update cascade;
create unique index idx_view_version on view_data(id, version);

create unique index idx_employee_version on employee_data(id, version);

alter table employee_data add constraint employee4company_fk
	foreign key(company) references retail_store_country_center_data(id) on delete cascade on update cascade;
alter table employee_data add constraint employee4department_fk
	foreign key(department) references level_three_department_data(id) on delete cascade on update cascade;
alter table employee_data add constraint employee4occupation_fk
	foreign key(occupation) references occupation_type_data(id) on delete cascade on update cascade;
alter table employee_data add constraint employee4responsible_for_fk
	foreign key(responsible_for) references responsibility_type_data(id) on delete cascade on update cascade;
alter table employee_data add constraint employee4current_salary_grade_fk
	foreign key(current_salary_grade) references salary_grade_data(id) on delete cascade on update cascade;
alter table employee_data add constraint employee4job_application_fk
	foreign key(job_application) references job_application_data(id) on delete cascade on update cascade;
alter table employee_data add constraint employee4profession_interview_fk
	foreign key(profession_interview) references profession_interview_data(id) on delete cascade on update cascade;
alter table employee_data add constraint employee4hr_interview_fk
	foreign key(hr_interview) references hr_interview_data(id) on delete cascade on update cascade;
alter table employee_data add constraint employee4offer_approval_fk
	foreign key(offer_approval) references offer_approval_data(id) on delete cascade on update cascade;
alter table employee_data add constraint employee4offer_acceptance_fk
	foreign key(offer_acceptance) references offer_acceptance_data(id) on delete cascade on update cascade;
alter table employee_data add constraint employee4employee_boarding_fk
	foreign key(employee_boarding) references employee_boarding_data(id) on delete cascade on update cascade;
alter table employee_data add constraint employee4termination_fk
	foreign key(termination) references termination_data(id) on delete cascade on update cascade;
create unique index idx_job_application_version on job_application_data(id, version);

create unique index idx_profession_interview_version on profession_interview_data(id, version);

create unique index idx_hr_interview_version on hr_interview_data(id, version);

create unique index idx_offer_approval_version on offer_approval_data(id, version);

create unique index idx_offer_acceptance_version on offer_acceptance_data(id, version);

create unique index idx_employee_boarding_version on employee_boarding_data(id, version);

create unique index idx_instructor_version on instructor_data(id, version);

alter table instructor_data add constraint instructor4company_fk
	foreign key(company) references retail_store_country_center_data(id) on delete cascade on update cascade;
create unique index idx_company_training_version on company_training_data(id, version);

alter table company_training_data add constraint company_training4company_fk
	foreign key(company) references retail_store_country_center_data(id) on delete cascade on update cascade;
alter table company_training_data add constraint company_training4instructor_fk
	foreign key(instructor) references instructor_data(id) on delete cascade on update cascade;
alter table company_training_data add constraint company_training4training_course_type_fk
	foreign key(training_course_type) references training_course_type_data(id) on delete cascade on update cascade;
create unique index idx_scoring_version on scoring_data(id, version);

create unique index idx_employee_company_training_version on employee_company_training_data(id, version);

alter table employee_company_training_data add constraint employee_company_training4employee_fk
	foreign key(employee) references employee_data(id) on delete cascade on update cascade;
alter table employee_company_training_data add constraint employee_company_training4training_fk
	foreign key(training) references company_training_data(id) on delete cascade on update cascade;
alter table employee_company_training_data add constraint employee_company_training4scoring_fk
	foreign key(scoring) references scoring_data(id) on delete cascade on update cascade;
create unique index idx_employee_skill_version on employee_skill_data(id, version);

alter table employee_skill_data add constraint employee_skill4employee_fk
	foreign key(employee) references employee_data(id) on delete cascade on update cascade;
alter table employee_skill_data add constraint employee_skill4skill_type_fk
	foreign key(skill_type) references skill_type_data(id) on delete cascade on update cascade;
create unique index idx_employee_performance_version on employee_performance_data(id, version);

alter table employee_performance_data add constraint employee_performance4employee_fk
	foreign key(employee) references employee_data(id) on delete cascade on update cascade;
create unique index idx_employee_work_experience_version on employee_work_experience_data(id, version);

alter table employee_work_experience_data add constraint employee_work_experience4employee_fk
	foreign key(employee) references employee_data(id) on delete cascade on update cascade;
create unique index idx_employee_leave_version on employee_leave_data(id, version);

alter table employee_leave_data add constraint employee_leave4who_fk
	foreign key(who) references employee_data(id) on delete cascade on update cascade;
alter table employee_leave_data add constraint employee_leave4type_fk
	foreign key(type) references leave_type_data(id) on delete cascade on update cascade;
create unique index idx_employee_interview_version on employee_interview_data(id, version);

alter table employee_interview_data add constraint employee_interview4employee_fk
	foreign key(employee) references employee_data(id) on delete cascade on update cascade;
alter table employee_interview_data add constraint employee_interview4interview_type_fk
	foreign key(interview_type) references interview_type_data(id) on delete cascade on update cascade;
create unique index idx_employee_attendance_version on employee_attendance_data(id, version);

alter table employee_attendance_data add constraint employee_attendance4employee_fk
	foreign key(employee) references employee_data(id) on delete cascade on update cascade;
create unique index idx_employee_qualifier_version on employee_qualifier_data(id, version);

alter table employee_qualifier_data add constraint employee_qualifier4employee_fk
	foreign key(employee) references employee_data(id) on delete cascade on update cascade;
create unique index idx_employee_education_version on employee_education_data(id, version);

alter table employee_education_data add constraint employee_education4employee_fk
	foreign key(employee) references employee_data(id) on delete cascade on update cascade;
create unique index idx_employee_award_version on employee_award_data(id, version);

alter table employee_award_data add constraint employee_award4employee_fk
	foreign key(employee) references employee_data(id) on delete cascade on update cascade;
create unique index idx_employee_salary_sheet_version on employee_salary_sheet_data(id, version);

alter table employee_salary_sheet_data add constraint employee_salary_sheet4employee_fk
	foreign key(employee) references employee_data(id) on delete cascade on update cascade;
alter table employee_salary_sheet_data add constraint employee_salary_sheet4current_salary_grade_fk
	foreign key(current_salary_grade) references salary_grade_data(id) on delete cascade on update cascade;
alter table employee_salary_sheet_data add constraint employee_salary_sheet4paying_off_fk
	foreign key(paying_off) references paying_off_data(id) on delete cascade on update cascade;
create unique index idx_paying_off_version on paying_off_data(id, version);

alter table paying_off_data add constraint paying_off4paid_for_fk
	foreign key(paid_for) references employee_data(id) on delete cascade on update cascade;
create unique index idx_user_domain_version on user_domain_data(id, version);

create unique index idx_user_white_list_version on user_white_list_data(id, version);

alter table user_white_list_data add constraint user_white_list4domain_fk
	foreign key(domain) references user_domain_data(id) on delete cascade on update cascade;
create unique index idx_sec_user_version on sec_user_data(id, version);

alter table sec_user_data add constraint sec_user4domain_fk
	foreign key(domain) references user_domain_data(id) on delete cascade on update cascade;
alter table sec_user_data add constraint sec_user4blocking_fk
	foreign key(blocking) references sec_user_blocking_data(id) on delete cascade on update cascade;
create unique index idx_sec_user_blocking_version on sec_user_blocking_data(id, version);

create unique index idx_user_app_version on user_app_data(id, version);

alter table user_app_data add constraint user_app4sec_user_fk
	foreign key(sec_user) references sec_user_data(id) on delete cascade on update cascade;
create unique index idx_quick_link_version on quick_link_data(id, version);

alter table quick_link_data add constraint quick_link4app_fk
	foreign key(app) references user_app_data(id) on delete cascade on update cascade;
create unique index idx_list_access_version on list_access_data(id, version);

alter table list_access_data add constraint list_access4app_fk
	foreign key(app) references user_app_data(id) on delete cascade on update cascade;
create unique index idx_object_access_version on object_access_data(id, version);

alter table object_access_data add constraint object_access4app_fk
	foreign key(app) references user_app_data(id) on delete cascade on update cascade;
create unique index idx_login_history_version on login_history_data(id, version);

alter table login_history_data add constraint login_history4sec_user_fk
	foreign key(sec_user) references sec_user_data(id) on delete cascade on update cascade;
create unique index idx_generic_form_version on generic_form_data(id, version);

create unique index idx_form_message_version on form_message_data(id, version);

alter table form_message_data add constraint form_message4form_fk
	foreign key(form) references generic_form_data(id) on delete cascade on update cascade;
create unique index idx_form_field_message_version on form_field_message_data(id, version);

alter table form_field_message_data add constraint form_field_message4form_fk
	foreign key(form) references generic_form_data(id) on delete cascade on update cascade;
create unique index idx_form_field_version on form_field_data(id, version);

alter table form_field_data add constraint form_field4form_fk
	foreign key(form) references generic_form_data(id) on delete cascade on update cascade;
create unique index idx_form_action_version on form_action_data(id, version);

alter table form_action_data add constraint form_action4form_fk
	foreign key(form) references generic_form_data(id) on delete cascade on update cascade;
create unique index idx_candidate_container_version on candidate_container_data(id, version);

create unique index idx_candidate_element_version on candidate_element_data(id, version);

alter table candidate_element_data add constraint candidate_element4container_fk
	foreign key(container) references candidate_container_data(id) on delete cascade on update cascade;
-- create extra index for time, number and mobile phone

create index retail_store_country_center4founded_idx on retail_store_country_center_data(founded);
create index retail_store_country_center4version_idx on retail_store_country_center_data(version);
create index catalog4version_idx on catalog_data(version);
create index level_one_category4version_idx on level_one_category_data(version);
create index level_two_category4version_idx on level_two_category_data(version);
create index level_three_category4version_idx on level_three_category_data(version);
create index product4last_update_time_idx on product_data(last_update_time);
create index product4version_idx on product_data(version);
create index sku4price_idx on sku_data(price);
create index sku4version_idx on sku_data(version);
create index retail_store_province_center4founded_idx on retail_store_province_center_data(founded);
create index retail_store_province_center4last_update_time_idx on retail_store_province_center_data(last_update_time);
create index retail_store_province_center4version_idx on retail_store_province_center_data(version);
create index province_center_department4founded_idx on province_center_department_data(founded);
create index province_center_department4version_idx on province_center_department_data(version);
create index province_center_employee4mobile_idx on province_center_employee_data(mobile);
create index province_center_employee4founded_idx on province_center_employee_data(founded);
create index province_center_employee4version_idx on province_center_employee_data(version);
create index retail_store_city_service_center4founded_idx on retail_store_city_service_center_data(founded);
create index retail_store_city_service_center4last_update_time_idx on retail_store_city_service_center_data(last_update_time);
create index retail_store_city_service_center4version_idx on retail_store_city_service_center_data(version);
create index city_partner4mobile_idx on city_partner_data(mobile);
create index city_partner4last_update_time_idx on city_partner_data(last_update_time);
create index city_partner4version_idx on city_partner_data(version);
create index potential_customer4mobile_idx on potential_customer_data(mobile);
create index potential_customer4last_update_time_idx on potential_customer_data(last_update_time);
create index potential_customer4version_idx on potential_customer_data(version);
create index potential_customer_contact_person4mobile_idx on potential_customer_contact_person_data(mobile);
create index potential_customer_contact_person4version_idx on potential_customer_contact_person_data(version);
create index potential_customer_contact4contact_date_idx on potential_customer_contact_data(contact_date);
create index potential_customer_contact4last_update_time_idx on potential_customer_contact_data(last_update_time);
create index potential_customer_contact4version_idx on potential_customer_contact_data(version);
create index city_event4mobile_idx on city_event_data(mobile);
create index city_event4last_update_time_idx on city_event_data(last_update_time);
create index city_event4version_idx on city_event_data(version);
create index event_attendance4version_idx on event_attendance_data(version);
create index retail_store4founded_idx on retail_store_data(founded);
create index retail_store4latitude_idx on retail_store_data(latitude);
create index retail_store4longitude_idx on retail_store_data(longitude);
create index retail_store4last_update_time_idx on retail_store_data(last_update_time);
create index retail_store4version_idx on retail_store_data(version);
create index retail_store_creation4version_idx on retail_store_creation_data(version);
create index retail_store_investment_invitation4version_idx on retail_store_investment_invitation_data(version);
create index retail_store_franchising4version_idx on retail_store_franchising_data(version);
create index retail_store_decoration4version_idx on retail_store_decoration_data(version);
create index retail_store_opening4version_idx on retail_store_opening_data(version);
create index retail_store_closing4version_idx on retail_store_closing_data(version);
create index retail_store_member4mobile_phone_idx on retail_store_member_data(mobile_phone);
create index retail_store_member4version_idx on retail_store_member_data(version);
create index consumer_order4last_update_time_idx on consumer_order_data(last_update_time);
create index consumer_order4version_idx on consumer_order_data(version);
create index consumer_order_confirmation4confirm_time_idx on consumer_order_confirmation_data(confirm_time);
create index consumer_order_confirmation4version_idx on consumer_order_confirmation_data(version);
create index consumer_order_approval4approve_time_idx on consumer_order_approval_data(approve_time);
create index consumer_order_approval4version_idx on consumer_order_approval_data(version);
create index consumer_order_processing4process_time_idx on consumer_order_processing_data(process_time);
create index consumer_order_processing4version_idx on consumer_order_processing_data(version);
create index consumer_order_shipment4ship_time_idx on consumer_order_shipment_data(ship_time);
create index consumer_order_shipment4version_idx on consumer_order_shipment_data(version);
create index consumer_order_delivery4delivery_time_idx on consumer_order_delivery_data(delivery_time);
create index consumer_order_delivery4version_idx on consumer_order_delivery_data(version);
create index consumer_order_line_item4sku_id_idx on consumer_order_line_item_data(sku_id);
create index consumer_order_line_item4price_idx on consumer_order_line_item_data(price);
create index consumer_order_line_item4quantity_idx on consumer_order_line_item_data(quantity);
create index consumer_order_line_item4amount_idx on consumer_order_line_item_data(amount);
create index consumer_order_line_item4last_update_time_idx on consumer_order_line_item_data(last_update_time);
create index consumer_order_line_item4version_idx on consumer_order_line_item_data(version);
create index consumer_order_shipping_group4amount_idx on consumer_order_shipping_group_data(amount);
create index consumer_order_shipping_group4version_idx on consumer_order_shipping_group_data(version);
create index consumer_order_payment_group4version_idx on consumer_order_payment_group_data(version);
create index consumer_order_price_adjustment4amount_idx on consumer_order_price_adjustment_data(amount);
create index consumer_order_price_adjustment4version_idx on consumer_order_price_adjustment_data(version);
create index retail_store_member_coupon4last_update_time_idx on retail_store_member_coupon_data(last_update_time);
create index retail_store_member_coupon4version_idx on retail_store_member_coupon_data(version);
create index member_wishlist4version_idx on member_wishlist_data(version);
create index member_reward_point4point_idx on member_reward_point_data(point);
create index member_reward_point4version_idx on member_reward_point_data(version);
create index member_reward_point_redemption4point_idx on member_reward_point_redemption_data(point);
create index member_reward_point_redemption4version_idx on member_reward_point_redemption_data(version);
create index member_wishlist_product4version_idx on member_wishlist_product_data(version);
create index retail_store_member_address4mobile_phone_idx on retail_store_member_address_data(mobile_phone);
create index retail_store_member_address4version_idx on retail_store_member_address_data(version);
create index retail_store_member_gift_card4remain_idx on retail_store_member_gift_card_data(remain);
create index retail_store_member_gift_card4version_idx on retail_store_member_gift_card_data(version);
create index retail_store_member_gift_card_consume_record4occure_time_idx on retail_store_member_gift_card_consume_record_data(occure_time);
create index retail_store_member_gift_card_consume_record4amount_idx on retail_store_member_gift_card_consume_record_data(amount);
create index retail_store_member_gift_card_consume_record4version_idx on retail_store_member_gift_card_consume_record_data(version);
create index goods_supplier4contact_number_idx on goods_supplier_data(contact_number);
create index goods_supplier4last_update_time_idx on goods_supplier_data(last_update_time);
create index goods_supplier4version_idx on goods_supplier_data(version);
create index supplier_product4version_idx on supplier_product_data(version);
create index product_supply_duration4quantity_idx on product_supply_duration_data(quantity);
create index product_supply_duration4price_idx on product_supply_duration_data(price);
create index product_supply_duration4version_idx on product_supply_duration_data(version);
create index supply_order4total_amount_idx on supply_order_data(total_amount);
create index supply_order4last_update_time_idx on supply_order_data(last_update_time);
create index supply_order4version_idx on supply_order_data(version);
create index supply_order_confirmation4confirm_time_idx on supply_order_confirmation_data(confirm_time);
create index supply_order_confirmation4version_idx on supply_order_confirmation_data(version);
create index supply_order_approval4approve_time_idx on supply_order_approval_data(approve_time);
create index supply_order_approval4version_idx on supply_order_approval_data(version);
create index supply_order_processing4process_time_idx on supply_order_processing_data(process_time);
create index supply_order_processing4version_idx on supply_order_processing_data(version);
create index supply_order_picking4process_time_idx on supply_order_picking_data(process_time);
create index supply_order_picking4version_idx on supply_order_picking_data(version);
create index supply_order_shipment4ship_time_idx on supply_order_shipment_data(ship_time);
create index supply_order_shipment4version_idx on supply_order_shipment_data(version);
create index supply_order_delivery4delivery_time_idx on supply_order_delivery_data(delivery_time);
create index supply_order_delivery4version_idx on supply_order_delivery_data(version);
create index supply_order_line_item4sku_id_idx on supply_order_line_item_data(sku_id);
create index supply_order_line_item4amount_idx on supply_order_line_item_data(amount);
create index supply_order_line_item4quantity_idx on supply_order_line_item_data(quantity);
create index supply_order_line_item4version_idx on supply_order_line_item_data(version);
create index supply_order_shipping_group4amount_idx on supply_order_shipping_group_data(amount);
create index supply_order_shipping_group4version_idx on supply_order_shipping_group_data(version);
create index supply_order_payment_group4version_idx on supply_order_payment_group_data(version);
create index retail_store_order4total_amount_idx on retail_store_order_data(total_amount);
create index retail_store_order4last_update_time_idx on retail_store_order_data(last_update_time);
create index retail_store_order4version_idx on retail_store_order_data(version);
create index retail_store_order_confirmation4confirm_time_idx on retail_store_order_confirmation_data(confirm_time);
create index retail_store_order_confirmation4version_idx on retail_store_order_confirmation_data(version);
create index retail_store_order_approval4approve_time_idx on retail_store_order_approval_data(approve_time);
create index retail_store_order_approval4version_idx on retail_store_order_approval_data(version);
create index retail_store_order_processing4process_time_idx on retail_store_order_processing_data(process_time);
create index retail_store_order_processing4version_idx on retail_store_order_processing_data(version);
create index retail_store_order_picking4process_time_idx on retail_store_order_picking_data(process_time);
create index retail_store_order_picking4version_idx on retail_store_order_picking_data(version);
create index retail_store_order_shipment4ship_time_idx on retail_store_order_shipment_data(ship_time);
create index retail_store_order_shipment4version_idx on retail_store_order_shipment_data(version);
create index retail_store_order_delivery4delivery_time_idx on retail_store_order_delivery_data(delivery_time);
create index retail_store_order_delivery4version_idx on retail_store_order_delivery_data(version);
create index retail_store_order_line_item4sku_id_idx on retail_store_order_line_item_data(sku_id);
create index retail_store_order_line_item4amount_idx on retail_store_order_line_item_data(amount);
create index retail_store_order_line_item4quantity_idx on retail_store_order_line_item_data(quantity);
create index retail_store_order_line_item4version_idx on retail_store_order_line_item_data(version);
create index retail_store_order_shipping_group4amount_idx on retail_store_order_shipping_group_data(amount);
create index retail_store_order_shipping_group4version_idx on retail_store_order_shipping_group_data(version);
create index retail_store_order_payment_group4version_idx on retail_store_order_payment_group_data(version);
create index warehouse4latitude_idx on warehouse_data(latitude);
create index warehouse4longitude_idx on warehouse_data(longitude);
create index warehouse4last_update_time_idx on warehouse_data(last_update_time);
create index warehouse4version_idx on warehouse_data(version);
create index storage_space4latitude_idx on storage_space_data(latitude);
create index storage_space4longitude_idx on storage_space_data(longitude);
create index storage_space4last_update_time_idx on storage_space_data(last_update_time);
create index storage_space4version_idx on storage_space_data(version);
create index smart_pallet4latitude_idx on smart_pallet_data(latitude);
create index smart_pallet4longitude_idx on smart_pallet_data(longitude);
create index smart_pallet4last_update_time_idx on smart_pallet_data(last_update_time);
create index smart_pallet4version_idx on smart_pallet_data(version);
create index goods_shelf4last_update_time_idx on goods_shelf_data(last_update_time);
create index goods_shelf4version_idx on goods_shelf_data(version);
create index goods_shelf_stock_count4count_time_idx on goods_shelf_stock_count_data(count_time);
create index goods_shelf_stock_count4version_idx on goods_shelf_stock_count_data(version);
create index stock_count_issue_track4count_time_idx on stock_count_issue_track_data(count_time);
create index stock_count_issue_track4version_idx on stock_count_issue_track_data(version);
create index goods_allocation4latitude_idx on goods_allocation_data(latitude);
create index goods_allocation4longitude_idx on goods_allocation_data(longitude);
create index goods_allocation4version_idx on goods_allocation_data(version);
create index goods4max_package_idx on goods_data(max_package);
create index goods4expire_time_idx on goods_data(expire_time);
create index goods4version_idx on goods_data(version);
create index goods_packaging4package_time_idx on goods_packaging_data(package_time);
create index goods_packaging4version_idx on goods_packaging_data(version);
create index goods_movement4move_time_idx on goods_movement_data(move_time);
create index goods_movement4facility_id_idx on goods_movement_data(facility_id);
create index goods_movement4session_id_idx on goods_movement_data(session_id);
create index goods_movement4latitude_idx on goods_movement_data(latitude);
create index goods_movement4longitude_idx on goods_movement_data(longitude);
create index goods_movement4version_idx on goods_movement_data(version);
create index supplier_space4latitude_idx on supplier_space_data(latitude);
create index supplier_space4longitude_idx on supplier_space_data(longitude);
create index supplier_space4last_update_time_idx on supplier_space_data(last_update_time);
create index supplier_space4version_idx on supplier_space_data(version);
create index receiving_space4latitude_idx on receiving_space_data(latitude);
create index receiving_space4longitude_idx on receiving_space_data(longitude);
create index receiving_space4last_update_time_idx on receiving_space_data(last_update_time);
create index receiving_space4version_idx on receiving_space_data(version);
create index shipping_space4latitude_idx on shipping_space_data(latitude);
create index shipping_space4longitude_idx on shipping_space_data(longitude);
create index shipping_space4last_update_time_idx on shipping_space_data(last_update_time);
create index shipping_space4version_idx on shipping_space_data(version);
create index damage_space4latitude_idx on damage_space_data(latitude);
create index damage_space4longitude_idx on damage_space_data(longitude);
create index damage_space4last_update_time_idx on damage_space_data(last_update_time);
create index damage_space4version_idx on damage_space_data(version);
create index warehouse_asset4last_update_time_idx on warehouse_asset_data(last_update_time);
create index warehouse_asset4version_idx on warehouse_asset_data(version);
create index transport_fleet4last_update_time_idx on transport_fleet_data(last_update_time);
create index transport_fleet4version_idx on transport_fleet_data(version);
create index transport_truck4make_date_idx on transport_truck_data(make_date);
create index transport_truck4version_idx on transport_truck_data(version);
create index truck_driver4contact_number_idx on truck_driver_data(contact_number);
create index truck_driver4version_idx on truck_driver_data(version);
create index transport_task4begin_time_idx on transport_task_data(begin_time);
create index transport_task4latitude_idx on transport_task_data(latitude);
create index transport_task4longitude_idx on transport_task_data(longitude);
create index transport_task4version_idx on transport_task_data(version);
create index transport_task_track4track_time_idx on transport_task_track_data(track_time);
create index transport_task_track4latitude_idx on transport_task_track_data(latitude);
create index transport_task_track4longitude_idx on transport_task_track_data(longitude);
create index transport_task_track4version_idx on transport_task_track_data(version);
create index account_set4effective_date_idx on account_set_data(effective_date);
create index account_set4last_update_time_idx on account_set_data(last_update_time);
create index account_set4version_idx on account_set_data(version);
create index accounting_subject4accounting_subject_class_code_idx on accounting_subject_data(accounting_subject_class_code);
create index accounting_subject4version_idx on accounting_subject_data(version);
create index accounting_period4start_date_idx on accounting_period_data(start_date);
create index accounting_period4end_date_idx on accounting_period_data(end_date);
create index accounting_period4version_idx on accounting_period_data(version);
create index accounting_document_type4version_idx on accounting_document_type_data(version);
create index accounting_document4accounting_document_date_idx on accounting_document_data(accounting_document_date);
create index accounting_document4version_idx on accounting_document_data(version);
create index accounting_document_creation4make_date_idx on accounting_document_creation_data(make_date);
create index accounting_document_creation4version_idx on accounting_document_creation_data(version);
create index accounting_document_confirmation4make_date_idx on accounting_document_confirmation_data(make_date);
create index accounting_document_confirmation4version_idx on accounting_document_confirmation_data(version);
create index accounting_document_auditing4make_date_idx on accounting_document_auditing_data(make_date);
create index accounting_document_auditing4version_idx on accounting_document_auditing_data(version);
create index accounting_document_posting4make_date_idx on accounting_document_posting_data(make_date);
create index accounting_document_posting4version_idx on accounting_document_posting_data(version);
create index original_voucher4version_idx on original_voucher_data(version);
create index original_voucher_creation4make_date_idx on original_voucher_creation_data(make_date);
create index original_voucher_creation4version_idx on original_voucher_creation_data(version);
create index original_voucher_confirmation4make_date_idx on original_voucher_confirmation_data(make_date);
create index original_voucher_confirmation4version_idx on original_voucher_confirmation_data(version);
create index original_voucher_auditing4make_date_idx on original_voucher_auditing_data(make_date);
create index original_voucher_auditing4version_idx on original_voucher_auditing_data(version);
create index accounting_document_line4amount_idx on accounting_document_line_data(amount);
create index accounting_document_line4version_idx on accounting_document_line_data(version);
create index level_one_department4founded_idx on level_one_department_data(founded);
create index level_one_department4version_idx on level_one_department_data(version);
create index level_two_department4founded_idx on level_two_department_data(founded);
create index level_two_department4version_idx on level_two_department_data(version);
create index level_three_department4founded_idx on level_three_department_data(founded);
create index level_three_department4version_idx on level_three_department_data(version);
create index skill_type4version_idx on skill_type_data(version);
create index responsibility_type4version_idx on responsibility_type_data(version);
create index termination_reason4version_idx on termination_reason_data(version);
create index termination_type4version_idx on termination_type_data(version);
create index occupation_type4version_idx on occupation_type_data(version);
create index leave_type4version_idx on leave_type_data(version);
create index salary_grade4version_idx on salary_grade_data(version);
create index interview_type4version_idx on interview_type_data(version);
create index training_course_type4version_idx on training_course_type_data(version);
create index public_holiday4version_idx on public_holiday_data(version);
create index termination4version_idx on termination_data(version);
create index view4interview_time_idx on view_data(interview_time);
create index view4version_idx on view_data(version);
create index employee4cell_phone_idx on employee_data(cell_phone);
create index employee4last_update_time_idx on employee_data(last_update_time);
create index employee4version_idx on employee_data(version);
create index job_application4application_time_idx on job_application_data(application_time);
create index job_application4version_idx on job_application_data(version);
create index profession_interview4interview_time_idx on profession_interview_data(interview_time);
create index profession_interview4version_idx on profession_interview_data(version);
create index hr_interview4interview_time_idx on hr_interview_data(interview_time);
create index hr_interview4version_idx on hr_interview_data(version);
create index offer_approval4approve_time_idx on offer_approval_data(approve_time);
create index offer_approval4version_idx on offer_approval_data(version);
create index offer_acceptance4accept_time_idx on offer_acceptance_data(accept_time);
create index offer_acceptance4version_idx on offer_acceptance_data(version);
create index employee_boarding4employ_time_idx on employee_boarding_data(employ_time);
create index employee_boarding4version_idx on employee_boarding_data(version);
create index instructor4cell_phone_idx on instructor_data(cell_phone);
create index instructor4last_update_time_idx on instructor_data(last_update_time);
create index instructor4version_idx on instructor_data(version);
create index company_training4time_start_idx on company_training_data(time_start);
create index company_training4duration_hours_idx on company_training_data(duration_hours);
create index company_training4last_update_time_idx on company_training_data(last_update_time);
create index company_training4version_idx on company_training_data(version);
create index scoring4score_idx on scoring_data(score);
create index scoring4version_idx on scoring_data(version);
create index employee_company_training4version_idx on employee_company_training_data(version);
create index employee_skill4version_idx on employee_skill_data(version);
create index employee_performance4version_idx on employee_performance_data(version);
create index employee_work_experience4start_idx on employee_work_experience_data(start);
create index employee_work_experience4end_idx on employee_work_experience_data(end);
create index employee_work_experience4version_idx on employee_work_experience_data(version);
create index employee_leave4leave_duration_hour_idx on employee_leave_data(leave_duration_hour);
create index employee_leave4version_idx on employee_leave_data(version);
create index employee_interview4version_idx on employee_interview_data(version);
create index employee_attendance4enter_time_idx on employee_attendance_data(enter_time);
create index employee_attendance4leave_time_idx on employee_attendance_data(leave_time);
create index employee_attendance4duration_hours_idx on employee_attendance_data(duration_hours);
create index employee_attendance4version_idx on employee_attendance_data(version);
create index employee_qualifier4qualified_time_idx on employee_qualifier_data(qualified_time);
create index employee_qualifier4version_idx on employee_qualifier_data(version);
create index employee_education4complete_time_idx on employee_education_data(complete_time);
create index employee_education4version_idx on employee_education_data(version);
create index employee_award4complete_time_idx on employee_award_data(complete_time);
create index employee_award4version_idx on employee_award_data(version);
create index employee_salary_sheet4base_salary_idx on employee_salary_sheet_data(base_salary);
create index employee_salary_sheet4bonus_idx on employee_salary_sheet_data(bonus);
create index employee_salary_sheet4reward_idx on employee_salary_sheet_data(reward);
create index employee_salary_sheet4personal_tax_idx on employee_salary_sheet_data(personal_tax);
create index employee_salary_sheet4social_security_idx on employee_salary_sheet_data(social_security);
create index employee_salary_sheet4housing_found_idx on employee_salary_sheet_data(housing_found);
create index employee_salary_sheet4job_insurance_idx on employee_salary_sheet_data(job_insurance);
create index employee_salary_sheet4version_idx on employee_salary_sheet_data(version);
create index paying_off4paid_time_idx on paying_off_data(paid_time);
create index paying_off4amount_idx on paying_off_data(amount);
create index paying_off4version_idx on paying_off_data(version);
create index user_domain4version_idx on user_domain_data(version);
create index user_white_list4version_idx on user_white_list_data(version);
create index sec_user4mobile_idx on sec_user_data(mobile);
create index sec_user4verification_code_idx on sec_user_data(verification_code);
create index sec_user4verification_code_expire_idx on sec_user_data(verification_code_expire);
create index sec_user4last_login_time_idx on sec_user_data(last_login_time);
create index sec_user4version_idx on sec_user_data(version);
create index sec_user_blocking4block_time_idx on sec_user_blocking_data(block_time);
create index sec_user_blocking4version_idx on sec_user_blocking_data(version);
create index user_app4object_id_idx on user_app_data(object_id);
create index user_app4version_idx on user_app_data(version);
create index quick_link4create_time_idx on quick_link_data(create_time);
create index quick_link4version_idx on quick_link_data(version);
create index list_access4version_idx on list_access_data(version);
create index object_access4version_idx on object_access_data(version);
create index login_history4login_time_idx on login_history_data(login_time);
create index login_history4version_idx on login_history_data(version);
create index generic_form4version_idx on generic_form_data(version);
create index form_message4version_idx on form_message_data(version);
create index form_field_message4version_idx on form_field_message_data(version);
create index form_field4version_idx on form_field_data(version);
create index form_action4version_idx on form_action_data(version);
create index candidate_container4version_idx on candidate_container_data(version);
create index candidate_element4version_idx on candidate_element_data(version);










delete from list_access_data ;
delete from object_access_data ;
delete from user_app_data ;
delete from login_history_data ;
delete from sec_user_data ;
delete from user_domain_data ;
insert into user_domain_data values ('UD000001','用户区域','1');



insert into sec_user_data values('SU000001','User000001','13900000001','1000001@qq.com','24327F1C00D22210298A18D0DB9AA6C4C22DEAC4BEAE7C02E616442CA7764246', 'weixin_openid_000001', 'weixin_appid_000001', 'jwt_token_000001' ,'9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000001','双链小超全国运营中心','SU000001','store',1,'MXWR','RetailStoreCountryCenter','RSCC000001','/link/to/app','1');
insert into user_app_data values('UA000002','我的账户','SU000001','lock',1,'MXWR','SecUser','SU000001','/link/to/app','1');
insert into sec_user_data values('SU000002','User000002','13900000002','1000002@qq.com','BB5210DAE99659C7164D7DBCFC51FB2D167D0DA372D58EF26A9F8533EEA2967C', 'weixin_openid_000002', 'weixin_appid_000002', 'jwt_token_000002' ,'9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000003','双链小超省中心','SU000002','store',1,'MXWR','RetailStoreProvinceCenter','RSPC000001','/link/to/app','1');
insert into user_app_data values('UA000004','我的账户','SU000002','lock',1,'MXWR','SecUser','SU000002','/link/to/app','1');
insert into sec_user_data values('SU000003','User000003','13900000003','1000003@qq.com','9D4104DF2774FDEAAE074CA35B052D8F664F4F99064C7BEAB0B589C2605C4EDA', 'weixin_openid_000003', 'weixin_appid_000003', 'jwt_token_000003' ,'9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000005','双链小超城市服务中心','SU000003','city',1,'MXWR','RetailStoreCityServiceCenter','RSCSC000001','/link/to/app','1');
insert into user_app_data values('UA000006','我的账户','SU000003','lock',1,'MXWR','SecUser','SU000003','/link/to/app','1');
insert into sec_user_data values('SU000004','User000004','13900000004','1000004@qq.com','9B223EBD008D7B544A3A640739EBE47459D3A4C5296DDA00F594FAF60FE88B28', 'weixin_openid_000004', 'weixin_appid_000004', 'jwt_token_000004' ,'9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000007','城市合伙人','SU000004','city',1,'MXWR','CityPartner','CP000001','/link/to/app','1');
insert into user_app_data values('UA000008','我的账户','SU000004','lock',1,'MXWR','SecUser','SU000004','/link/to/app','1');
insert into sec_user_data values('SU000005','User000005','13900000005','1000005@qq.com','AE5F93F319636A96963C06D035B97F004D18E61D80129EFEA331784A6E21DC5C', 'weixin_openid_000005', 'weixin_appid_000005', 'jwt_token_000005' ,'9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000009','潜在的客户','SU000005','om',1,'MXWR','PotentialCustomer','PC000001','/link/to/app','1');
insert into user_app_data values('UA000010','我的账户','SU000005','lock',1,'MXWR','SecUser','SU000005','/link/to/app','1');
insert into sec_user_data values('SU000006','User000006','13900000006','1000006@qq.com','5FBBDBEAD9F84D599E8819CEEA167854CDA0FFD8D297D17D12E4619CE76F3B55', 'weixin_openid_000006', 'weixin_appid_000006', 'jwt_token_000006' ,'9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000011','双链小超','SU000006','store',1,'MXWR','RetailStore','RS000001','/link/to/app','1');
insert into user_app_data values('UA000012','我的账户','SU000006','lock',1,'MXWR','SecUser','SU000006','/link/to/app','1');
insert into sec_user_data values('SU000007','User000007','13900000007','1000007@qq.com','A9652F0D7C1ACCB421BAF55EB3E7286AFA8F591897F1AE4CEB6A76402CCBE803', 'weixin_openid_000007', 'weixin_appid_000007', 'jwt_token_000007' ,'9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000013','生超会员','SU000007','store',1,'MXWR','RetailStoreMember','RSM000001','/link/to/app','1');
insert into user_app_data values('UA000014','我的账户','SU000007','lock',1,'MXWR','SecUser','SU000007','/link/to/app','1');
insert into sec_user_data values('SU000008','User000008','13900000008','1000008@qq.com','A4B83C2652CD6BECE5C7909576555B313078D7EE50AA028F26B8F0245C191B4B', 'weixin_openid_000008', 'weixin_appid_000008', 'jwt_token_000008' ,'9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000015','消费者订单','SU000008','first-order',1,'MXWR','ConsumerOrder','CO000001','/link/to/app','1');
insert into user_app_data values('UA000016','我的账户','SU000008','lock',1,'MXWR','SecUser','SU000008','/link/to/app','1');
insert into sec_user_data values('SU000009','User000009','13900000009','1000009@qq.com','88F8AB5F153081C5AB21F5E5354B4EB14286EFB43CEA588ED1C73FE2B46B35C1', 'weixin_openid_000009', 'weixin_appid_000009', 'jwt_token_000009' ,'9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000017','产品供应商','SU000009','apper',1,'MXWR','GoodsSupplier','GS000001','/link/to/app','1');
insert into user_app_data values('UA000018','我的账户','SU000009','lock',1,'MXWR','SecUser','SU000009','/link/to/app','1');
insert into sec_user_data values('SU000010','User000010','13900000010','1000010@qq.com','EF8232ABB97CC3858F271527A1AA1452A33715A3AC48312A44B0940D5C948600', 'weixin_openid_000010', 'weixin_appid_000010', 'jwt_token_000010' ,'9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000019','供应订单','SU000010','first-order',1,'MXWR','SupplyOrder','SO000001','/link/to/app','1');
insert into user_app_data values('UA000020','我的账户','SU000010','lock',1,'MXWR','SecUser','SU000010','/link/to/app','1');
insert into sec_user_data values('SU000011','User000011','13900000011','1000011@qq.com','FE7AF5D4F030CD575C117A73124FC39AB41528DFFC41D2CFBC1130E755694243', 'weixin_openid_000011', 'weixin_appid_000011', 'jwt_token_000011' ,'9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000021','生超的订单','SU000011','store',1,'MXWR','RetailStoreOrder','RSO000001','/link/to/app','1');
insert into user_app_data values('UA000022','我的账户','SU000011','lock',1,'MXWR','SecUser','SU000011','/link/to/app','1');
insert into sec_user_data values('SU000012','User000012','13900000012','1000012@qq.com','999DD89E35807C62458F2D191D4F55548B49245EEC6E186FE9497EC867C40088', 'weixin_openid_000012', 'weixin_appid_000012', 'jwt_token_000012' ,'9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000023','仓库','SU000012','warehouse',1,'MXWR','Warehouse','W000001','/link/to/app','1');
insert into user_app_data values('UA000024','我的账户','SU000012','lock',1,'MXWR','SecUser','SU000012','/link/to/app','1');
insert into sec_user_data values('SU000013','User000013','13900000013','1000013@qq.com','0AE92E17166CBB59341836C218E92EF083058CC4E3108C5FD2FB904650013A69', 'weixin_openid_000013', 'weixin_appid_000013', 'jwt_token_000013' ,'9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000025','货架','SU000013','asterisk',1,'MXWR','GoodsShelf','GS000001','/link/to/app','1');
insert into user_app_data values('UA000026','我的账户','SU000013','lock',1,'MXWR','SecUser','SU000013','/link/to/app','1');
insert into sec_user_data values('SU000014','User000014','13900000014','1000014@qq.com','E79E64241204EB0FCE03C4BA0E315F21ECDB11D22264BE7B1AAD41D04D77A6D0', 'weixin_openid_000014', 'weixin_appid_000014', 'jwt_token_000014' ,'9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000027','运输车队','SU000014','backspace',1,'MXWR','TransportFleet','TF000001','/link/to/app','1');
insert into user_app_data values('UA000028','我的账户','SU000014','lock',1,'MXWR','SecUser','SU000014','/link/to/app','1');
insert into sec_user_data values('SU000015','User000015','13900000015','1000015@qq.com','1D858671B95062DAFE1D989C089188CC4EFDF3D5C45D8F24DD20BF3E352A3D9B', 'weixin_openid_000015', 'weixin_appid_000015', 'jwt_token_000015' ,'9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000029','运输任务','SU000015','tasks',1,'MXWR','TransportTask','TT000001','/link/to/app','1');
insert into user_app_data values('UA000030','我的账户','SU000015','lock',1,'MXWR','SecUser','SU000015','/link/to/app','1');
insert into sec_user_data values('SU000016','User000016','13900000016','1000016@qq.com','14B1F5E667F8B6697C8A2952C3619D9AD82F846E5B32FD9F258918786B3ED519', 'weixin_openid_000016', 'weixin_appid_000016', 'jwt_token_000016' ,'9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000031','账套','SU000016','headset',1,'MXWR','AccountSet','AS000001','/link/to/app','1');
insert into user_app_data values('UA000032','我的账户','SU000016','lock',1,'MXWR','SecUser','SU000016','/link/to/app','1');
insert into sec_user_data values('SU000017','User000017','13900000017','1000017@qq.com','1A803C7096681FC2AA7C55C46A6A99D8089481B96997774EA5B1C785C8035010', 'weixin_openid_000017', 'weixin_appid_000017', 'jwt_token_000017' ,'9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000033','会计凭证','SU000017','basketball-ball',1,'MXWR','AccountingDocument','AD000001','/link/to/app','1');
insert into user_app_data values('UA000034','我的账户','SU000017','lock',1,'MXWR','SecUser','SU000017','/link/to/app','1');
insert into sec_user_data values('SU000018','User000018','13900000018','1000018@qq.com','FA485AC06A6BD6BBF7AC9F253FCC516227CB232598792232277A70386FD892ED', 'weixin_openid_000018', 'weixin_appid_000018', 'jwt_token_000018' ,'9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000035','工资等级','SU000018','ad',1,'MXWR','SalaryGrade','SG000001','/link/to/app','1');
insert into user_app_data values('UA000036','我的账户','SU000018','lock',1,'MXWR','SecUser','SU000018','/link/to/app','1');
insert into sec_user_data values('SU000019','User000019','13900000019','1000019@qq.com','A5D9532EB6FC76A7D06764C14F751A4AFBC7C5BC49C215272A2EE42BBEA1A502', 'weixin_openid_000019', 'weixin_appid_000019', 'jwt_token_000019' ,'9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000037','观','SU000019','street-view',1,'MXWR','View','V000001','/link/to/app','1');
insert into user_app_data values('UA000038','我的账户','SU000019','lock',1,'MXWR','SecUser','SU000019','/link/to/app','1');
insert into sec_user_data values('SU000020','User000020','13900000020','1000020@qq.com','7CB0B35123A314B427FC1459C4083AA314D8F9E2505BB9187594B223BE5623A0', 'weixin_openid_000020', 'weixin_appid_000020', 'jwt_token_000020' ,'9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000039','员工','SU000020','blackberry',1,'MXWR','Employee','E000001','/link/to/app','1');
insert into user_app_data values('UA000040','我的账户','SU000020','lock',1,'MXWR','SecUser','SU000020','/link/to/app','1');
insert into sec_user_data values('SU000021','User000021','13900000021','1000021@qq.com','C21B3A395B3E337A4D06491AEC7B485523BB4E5790DE925000FECEC237F939F2', 'weixin_openid_000021', 'weixin_appid_000021', 'jwt_token_000021' ,'9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000041','用户域','SU000021','user',1,'MXWR','UserDomain','UD000001','/link/to/app','1');
insert into user_app_data values('UA000042','我的账户','SU000021','lock',1,'MXWR','SecUser','SU000021','/link/to/app','1');
insert into sec_user_data values('SU000022','User000022','13900000022','1000022@qq.com','D6C0743E4B79BE93E8BDB4D0B55054EC3532F6B1AF8F69EDD542F0D22DD228C9', 'weixin_openid_000022', 'weixin_appid_000022', 'jwt_token_000022' ,'9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000043','安全用户','SU000022','user',1,'MXWR','SecUser','SU000001','/link/to/app','1');
insert into user_app_data values('UA000044','我的账户','SU000022','lock',1,'MXWR','SecUser','SU000022','/link/to/app','1');
insert into sec_user_data values('SU000023','User000023','13900000023','1000023@qq.com','D5405F91AA444B65AE234F0AA39FF8A43A2F0CF28F238479A0AC08D9C292629E', 'weixin_openid_000023', 'weixin_appid_000023', 'jwt_token_000023' ,'9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000045','用户应用程序','SU000023','user',1,'MXWR','UserApp','UA000001','/link/to/app','1');
insert into user_app_data values('UA000046','我的账户','SU000023','lock',1,'MXWR','SecUser','SU000023','/link/to/app','1');
insert into sec_user_data values('SU000024','User000024','13900000024','1000024@qq.com','663EE204DCB9B63399177CA2CF9E0206E286B7ECBF8E9A9874F50A9A863E9B02', 'weixin_openid_000024', 'weixin_appid_000024', 'jwt_token_000024' ,'9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000047','候选人容器','SU000024','at',1,'MXWR','CandidateContainer','CC000001','/link/to/app','1');
insert into user_app_data values('UA000048','我的账户','SU000024','lock',1,'MXWR','SecUser','SU000024','/link/to/app','1');

/* ------------------------------------------------------------------------ */


select id,pwd from sec_user_data;

/*
| 角色        | 用户名           | 密码         |
| ------------- |:-------------:|:-------------------:|
|双链小超全国运营中心|13900000001|DoubleChain!y1|
|双链小超省中心|13900000002|DoubleChain!y1|
|双链小超城市服务中心|13900000003|DoubleChain!y1|
|城市合伙人|13900000004|DoubleChain!y1|
|潜在的客户|13900000005|DoubleChain!y1|
|双链小超|13900000006|DoubleChain!y1|
|生超会员|13900000007|DoubleChain!y1|
|消费者订单|13900000008|DoubleChain!y1|
|产品供应商|13900000009|DoubleChain!y1|
|供应订单|13900000010|DoubleChain!y1|
|生超的订单|13900000011|DoubleChain!y1|
|仓库|13900000012|DoubleChain!y1|
|货架|13900000013|DoubleChain!y1|
|运输车队|13900000014|DoubleChain!y1|
|运输任务|13900000015|DoubleChain!y1|
|账套|13900000016|DoubleChain!y1|
|会计凭证|13900000017|DoubleChain!y1|
|工资等级|13900000018|DoubleChain!y1|
|观|13900000019|DoubleChain!y1|
|员工|13900000020|DoubleChain!y1|
|用户域|13900000021|DoubleChain!y1|
|安全用户|13900000022|DoubleChain!y1|
|用户应用程序|13900000023|DoubleChain!y1|
|候选人容器|13900000024|DoubleChain!y1|


*/



/* start with data patch */
/* The sql file is not found from: /home/philip/resin-3.1.12/webapps/sky/data-patch/retailscm.sql */


/*

+----------+---------------------------------+---------------------+--------+
| Charset  | Description                     | Default collation   | Maxlen |
+----------+---------------------------------+---------------------+--------+
| gb2312   | GB2312 Simplified Chinese       | gb2312_chinese_ci   |      2 |
| gbk      | GBK Simplified Chinese          | gbk_chinese_ci      |      2 |
| utf8mb4  | UTF-8 Unicode                   | utf8mb4_general_ci  |      4 |
| utf32    | UTF-32 Unicode                  | utf32_general_ci    |      4 |
| gb18030  | China National Standard GB18030 | gb18030_chinese_ci  |      4 |
+----------+---------------------------------+---------------------+--------+

*/

