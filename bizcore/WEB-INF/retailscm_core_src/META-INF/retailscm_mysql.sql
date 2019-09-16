-- BUILD WITH MODEL TIME 190613T1817





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
	('RSCC000001','双链小超中国国运营中心','4000-800-','2017-03-17','https://www.doublechaintech.com/','四川省成都市天府新区双链大厦','双链集团','张喜来','中国中心正式成立，恭喜恭喜','1');

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
	('P000001','啤酒','LTC000001','四川','可口可乐，销售百年的糖水，获得了全世界额青睐','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-09-12 05:07:22','1'),
	('P000002','可乐','LTC000001','广东','可口可乐，销售百年的糖水，获得了全世界额青睐0002','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0002','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-09-07 11:58:09','1'),
	('P000003','久久鸭','LTC000002','江苏','可口可乐，销售百年的糖水，获得了全世界额青睐0003','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0003','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-09-13 01:32:41','1'),
	('P000004','啤酒','LTC000002','安徽','可口可乐，销售百年的糖水，获得了全世界额青睐0004','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0004','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-09-06 10:53:45','1'),
	('P000005','可乐','LTC000003','日本','可口可乐，销售百年的糖水，获得了全世界额青睐0005','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0005','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-09-14 04:22:19','1'),
	('P000006','久久鸭','LTC000003','法国','可口可乐，销售百年的糖水，获得了全世界额青睐0006','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0006','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-09-03 00:35:56','1'),
	('P000007','啤酒','LTC000004','四川','可口可乐，销售百年的糖水，获得了全世界额青睐0007','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0007','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-08-31 13:31:08','1'),
	('P000008','可乐','LTC000004','广东','可口可乐，销售百年的糖水，获得了全世界额青睐0008','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0008','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-09-14 09:19:03','1'),
	('P000009','久久鸭','LTC000005','江苏','可口可乐，销售百年的糖水，获得了全世界额青睐0009','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0009','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-09-12 09:59:05','1'),
	('P000010','啤酒','LTC000005','安徽','可口可乐，销售百年的糖水，获得了全世界额青睐0010','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0010','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-08-27 09:51:09','1'),
	('P000011','可乐','LTC000006','日本','可口可乐，销售百年的糖水，获得了全世界额青睐0011','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0011','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-09-15 01:46:23','1'),
	('P000012','久久鸭','LTC000006','法国','可口可乐，销售百年的糖水，获得了全世界额青睐0012','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0012','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-09-12 15:58:18','1'),
	('P000013','啤酒','LTC000007','四川','可口可乐，销售百年的糖水，获得了全世界额青睐0013','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0013','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-08-29 03:55:59','1'),
	('P000014','可乐','LTC000007','广东','可口可乐，销售百年的糖水，获得了全世界额青睐0014','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0014','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-09-07 02:40:12','1'),
	('P000015','久久鸭','LTC000008','江苏','可口可乐，销售百年的糖水，获得了全世界额青睐0015','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0015','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-08-26 14:22:46','1'),
	('P000016','啤酒','LTC000008','安徽','可口可乐，销售百年的糖水，获得了全世界额青睐0016','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0016','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-09-06 02:09:38','1'),
	('P000017','可乐','LTC000009','日本','可口可乐，销售百年的糖水，获得了全世界额青睐0017','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0017','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-08-31 14:39:23','1'),
	('P000018','久久鸭','LTC000009','法国','可口可乐，销售百年的糖水，获得了全世界额青睐0018','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0018','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-08-30 11:37:04','1'),
	('P000019','啤酒','LTC000010','四川','可口可乐，销售百年的糖水，获得了全世界额青睐0019','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0019','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-08-30 08:46:30','1'),
	('P000020','可乐','LTC000010','广东','可口可乐，销售百年的糖水，获得了全世界额青睐0020','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0020','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-09-01 09:25:44','1'),
	('P000021','久久鸭','LTC000011','江苏','可口可乐，销售百年的糖水，获得了全世界额青睐0021','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0021','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-09-06 02:31:51','1'),
	('P000022','啤酒','LTC000011','安徽','可口可乐，销售百年的糖水，获得了全世界额青睐0022','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0022','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-08-30 13:28:31','1'),
	('P000023','可乐','LTC000012','日本','可口可乐，销售百年的糖水，获得了全世界额青睐0023','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0023','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-09-08 08:33:07','1'),
	('P000024','久久鸭','LTC000012','法国','可口可乐，销售百年的糖水，获得了全世界额青睐0024','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0024','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-08-28 00:19:44','1'),
	('P000025','啤酒','LTC000013','四川','可口可乐，销售百年的糖水，获得了全世界额青睐0025','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0025','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-09-12 21:08:34','1'),
	('P000026','可乐','LTC000013','广东','可口可乐，销售百年的糖水，获得了全世界额青睐0026','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0026','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-09-12 18:37:34','1'),
	('P000027','久久鸭','LTC000014','江苏','可口可乐，销售百年的糖水，获得了全世界额青睐0027','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0027','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-09-14 06:44:00','1'),
	('P000028','啤酒','LTC000014','安徽','可口可乐，销售百年的糖水，获得了全世界额青睐0028','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0028','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-09-13 01:31:36','1'),
	('P000029','可乐','LTC000015','日本','可口可乐，销售百年的糖水，获得了全世界额青睐0029','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0029','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-09-11 04:20:54','1'),
	('P000030','久久鸭','LTC000015','法国','可口可乐，销售百年的糖水，获得了全世界额青睐0030','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0030','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-09-05 18:13:34','1'),
	('P000031','啤酒','LTC000016','四川','可口可乐，销售百年的糖水，获得了全世界额青睐0031','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0031','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-08-28 12:28:55','1'),
	('P000032','可乐','LTC000016','广东','可口可乐，销售百年的糖水，获得了全世界额青睐0032','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0032','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-09-12 19:46:09','1');

insert into sku_data values
	('S000001','可乐-大罐的','大','P000001','TM00000000001','包装类型','包装数量等信息,包装数量等信息,包装数量等信息','1078.39','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000002','可乐-大罐的0002','中','P000001','TM000000000010002','包装类型0002','包装数量等信息,包装数量等信息,包装数量等信息0002','1322.04','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000003','可乐-大罐的0003','小','P000002','TM000000000010003','包装类型0003','包装数量等信息,包装数量等信息,包装数量等信息0003','1251.70','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000004','可乐-大罐的0004','大','P000002','TM000000000010004','包装类型0004','包装数量等信息,包装数量等信息,包装数量等信息0004','1280.45','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000005','可乐-大罐的0005','中','P000003','TM000000000010005','包装类型0005','包装数量等信息,包装数量等信息,包装数量等信息0005','1058.62','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000006','可乐-大罐的0006','小','P000003','TM000000000010006','包装类型0006','包装数量等信息,包装数量等信息,包装数量等信息0006','1000.67','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000007','可乐-大罐的0007','大','P000004','TM000000000010007','包装类型0007','包装数量等信息,包装数量等信息,包装数量等信息0007','1009.24','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000008','可乐-大罐的0008','中','P000004','TM000000000010008','包装类型0008','包装数量等信息,包装数量等信息,包装数量等信息0008','1201.72','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000009','可乐-大罐的0009','小','P000005','TM000000000010009','包装类型0009','包装数量等信息,包装数量等信息,包装数量等信息0009','970.45','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000010','可乐-大罐的0010','大','P000005','TM000000000010010','包装类型0010','包装数量等信息,包装数量等信息,包装数量等信息0010','1005.28','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000011','可乐-大罐的0011','中','P000006','TM000000000010011','包装类型0011','包装数量等信息,包装数量等信息,包装数量等信息0011','1097.49','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000012','可乐-大罐的0012','小','P000006','TM000000000010012','包装类型0012','包装数量等信息,包装数量等信息,包装数量等信息0012','1087.42','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000013','可乐-大罐的0013','大','P000007','TM000000000010013','包装类型0013','包装数量等信息,包装数量等信息,包装数量等信息0013','1042.67','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000014','可乐-大罐的0014','中','P000007','TM000000000010014','包装类型0014','包装数量等信息,包装数量等信息,包装数量等信息0014','1009.32','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000015','可乐-大罐的0015','小','P000008','TM000000000010015','包装类型0015','包装数量等信息,包装数量等信息,包装数量等信息0015','1194.65','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000016','可乐-大罐的0016','大','P000008','TM000000000010016','包装类型0016','包装数量等信息,包装数量等信息,包装数量等信息0016','1108.50','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000017','可乐-大罐的0017','中','P000009','TM000000000010017','包装类型0017','包装数量等信息,包装数量等信息,包装数量等信息0017','1253.76','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000018','可乐-大罐的0018','小','P000009','TM000000000010018','包装类型0018','包装数量等信息,包装数量等信息,包装数量等信息0018','1223.33','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000019','可乐-大罐的0019','大','P000010','TM000000000010019','包装类型0019','包装数量等信息,包装数量等信息,包装数量等信息0019','1191.52','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000020','可乐-大罐的0020','中','P000010','TM000000000010020','包装类型0020','包装数量等信息,包装数量等信息,包装数量等信息0020','1030.99','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000021','可乐-大罐的0021','小','P000011','TM000000000010021','包装类型0021','包装数量等信息,包装数量等信息,包装数量等信息0021','1116.71','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000022','可乐-大罐的0022','大','P000011','TM000000000010022','包装类型0022','包装数量等信息,包装数量等信息,包装数量等信息0022','1081.77','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000023','可乐-大罐的0023','中','P000012','TM000000000010023','包装类型0023','包装数量等信息,包装数量等信息,包装数量等信息0023','1175.01','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000024','可乐-大罐的0024','小','P000012','TM000000000010024','包装类型0024','包装数量等信息,包装数量等信息,包装数量等信息0024','1084.90','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000025','可乐-大罐的0025','大','P000013','TM000000000010025','包装类型0025','包装数量等信息,包装数量等信息,包装数量等信息0025','1193.40','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000026','可乐-大罐的0026','中','P000013','TM000000000010026','包装类型0026','包装数量等信息,包装数量等信息,包装数量等信息0026','1126.76','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000027','可乐-大罐的0027','小','P000014','TM000000000010027','包装类型0027','包装数量等信息,包装数量等信息,包装数量等信息0027','1150.26','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000028','可乐-大罐的0028','大','P000014','TM000000000010028','包装类型0028','包装数量等信息,包装数量等信息,包装数量等信息0028','1189.31','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000029','可乐-大罐的0029','中','P000015','TM000000000010029','包装类型0029','包装数量等信息,包装数量等信息,包装数量等信息0029','1099.86','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000030','可乐-大罐的0030','小','P000015','TM000000000010030','包装类型0030','包装数量等信息,包装数量等信息,包装数量等信息0030','995.77','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000031','可乐-大罐的0031','大','P000016','TM000000000010031','包装类型0031','包装数量等信息,包装数量等信息,包装数量等信息0031','954.38','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000032','可乐-大罐的0032','中','P000016','TM000000000010032','包装类型0032','包装数量等信息,包装数量等信息,包装数量等信息0032','1038.92','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000033','可乐-大罐的0033','小','P000017','TM000000000010033','包装类型0033','包装数量等信息,包装数量等信息,包装数量等信息0033','950.60','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000034','可乐-大罐的0034','大','P000017','TM000000000010034','包装类型0034','包装数量等信息,包装数量等信息,包装数量等信息0034','1036.06','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000035','可乐-大罐的0035','中','P000018','TM000000000010035','包装类型0035','包装数量等信息,包装数量等信息,包装数量等信息0035','1259.40','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000036','可乐-大罐的0036','小','P000018','TM000000000010036','包装类型0036','包装数量等信息,包装数量等信息,包装数量等信息0036','1220.39','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000037','可乐-大罐的0037','大','P000019','TM000000000010037','包装类型0037','包装数量等信息,包装数量等信息,包装数量等信息0037','999.23','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000038','可乐-大罐的0038','中','P000019','TM000000000010038','包装类型0038','包装数量等信息,包装数量等信息,包装数量等信息0038','1236.83','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000039','可乐-大罐的0039','小','P000020','TM000000000010039','包装类型0039','包装数量等信息,包装数量等信息,包装数量等信息0039','1089.38','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000040','可乐-大罐的0040','大','P000020','TM000000000010040','包装类型0040','包装数量等信息,包装数量等信息,包装数量等信息0040','1141.59','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000041','可乐-大罐的0041','中','P000021','TM000000000010041','包装类型0041','包装数量等信息,包装数量等信息,包装数量等信息0041','936.32','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000042','可乐-大罐的0042','小','P000021','TM000000000010042','包装类型0042','包装数量等信息,包装数量等信息,包装数量等信息0042','1294.72','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000043','可乐-大罐的0043','大','P000022','TM000000000010043','包装类型0043','包装数量等信息,包装数量等信息,包装数量等信息0043','1293.19','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000044','可乐-大罐的0044','中','P000022','TM000000000010044','包装类型0044','包装数量等信息,包装数量等信息,包装数量等信息0044','991.31','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000045','可乐-大罐的0045','小','P000023','TM000000000010045','包装类型0045','包装数量等信息,包装数量等信息,包装数量等信息0045','1289.70','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000046','可乐-大罐的0046','大','P000023','TM000000000010046','包装类型0046','包装数量等信息,包装数量等信息,包装数量等信息0046','1200.42','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000047','可乐-大罐的0047','中','P000024','TM000000000010047','包装类型0047','包装数量等信息,包装数量等信息,包装数量等信息0047','945.18','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000048','可乐-大罐的0048','小','P000024','TM000000000010048','包装类型0048','包装数量等信息,包装数量等信息,包装数量等信息0048','1306.54','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000049','可乐-大罐的0049','大','P000025','TM000000000010049','包装类型0049','包装数量等信息,包装数量等信息,包装数量等信息0049','1064.49','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000050','可乐-大罐的0050','中','P000025','TM000000000010050','包装类型0050','包装数量等信息,包装数量等信息,包装数量等信息0050','1015.79','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000051','可乐-大罐的0051','小','P000026','TM000000000010051','包装类型0051','包装数量等信息,包装数量等信息,包装数量等信息0051','1235.41','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000052','可乐-大罐的0052','大','P000026','TM000000000010052','包装类型0052','包装数量等信息,包装数量等信息,包装数量等信息0052','1064.79','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000053','可乐-大罐的0053','中','P000027','TM000000000010053','包装类型0053','包装数量等信息,包装数量等信息,包装数量等信息0053','1110.97','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000054','可乐-大罐的0054','小','P000027','TM000000000010054','包装类型0054','包装数量等信息,包装数量等信息,包装数量等信息0054','1104.87','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000055','可乐-大罐的0055','大','P000028','TM000000000010055','包装类型0055','包装数量等信息,包装数量等信息,包装数量等信息0055','1075.99','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000056','可乐-大罐的0056','中','P000028','TM000000000010056','包装类型0056','包装数量等信息,包装数量等信息,包装数量等信息0056','1304.58','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000057','可乐-大罐的0057','小','P000029','TM000000000010057','包装类型0057','包装数量等信息,包装数量等信息,包装数量等信息0057','976.90','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000058','可乐-大罐的0058','大','P000029','TM000000000010058','包装类型0058','包装数量等信息,包装数量等信息,包装数量等信息0058','1254.82','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000059','可乐-大罐的0059','中','P000030','TM000000000010059','包装类型0059','包装数量等信息,包装数量等信息,包装数量等信息0059','1077.73','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000060','可乐-大罐的0060','小','P000030','TM000000000010060','包装类型0060','包装数量等信息,包装数量等信息,包装数量等信息0060','1100.11','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000061','可乐-大罐的0061','大','P000031','TM000000000010061','包装类型0061','包装数量等信息,包装数量等信息,包装数量等信息0061','1160.19','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000062','可乐-大罐的0062','中','P000031','TM000000000010062','包装类型0062','包装数量等信息,包装数量等信息,包装数量等信息0062','1180.77','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000063','可乐-大罐的0063','小','P000032','TM000000000010063','包装类型0063','包装数量等信息,包装数量等信息,包装数量等信息0063','1100.14','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000064','可乐-大罐的0064','大','P000032','TM000000000010064','包装类型0064','包装数量等信息,包装数量等信息,包装数量等信息0064','1307.30','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1');

insert into retail_store_province_center_data values
	('RSPC000001','双链小超四川省运营中心','2018-12-30','RSCC000001','2019-09-03 16:25:12','1'),
	('RSPC000002','双链小超北京运营中心','2018-02-05','RSCC000001','2019-08-28 16:13:53','1');

insert into province_center_department_data values
	('PCD000001','供应链部','2016-12-30','RSPC000001','刘强','1'),
	('PCD000002','采购部','2018-02-27','RSPC000001','王德宏','1'),
	('PCD000003','管理部','2019-01-17','RSPC000002','刘强','1'),
	('PCD000004','财务部','2019-05-30','RSPC000002','王德宏','1');

insert into province_center_employee_data values
	('PCE000001','刘强','13999998888','wangdehong@yatang.cn','2017-01-17','PCD000001','RSPC000001','1'),
	('PCE000002','王德宏','13900000002','liuqiang@yatang.cn','2019-04-15','PCD000001','RSPC000001','1'),
	('PCE000003','刘强','13900000003','wangdehong@yatang.cn','2018-07-26','PCD000002','RSPC000001','1'),
	('PCE000004','王德宏','13900000004','liuqiang@yatang.cn','2019-03-20','PCD000002','RSPC000001','1'),
	('PCE000005','刘强','13900000005','wangdehong@yatang.cn','2019-07-18','PCD000003','RSPC000002','1'),
	('PCE000006','王德宏','13900000006','liuqiang@yatang.cn','2017-11-08','PCD000003','RSPC000002','1'),
	('PCE000007','刘强','13900000007','wangdehong@yatang.cn','2018-06-28','PCD000004','RSPC000002','1'),
	('PCE000008','王德宏','13900000008','liuqiang@yatang.cn','2019-04-01','PCD000004','RSPC000002','1');

insert into retail_store_city_service_center_data values
	('RSCSC000001','双链小超成都办事处','2019-01-14','RSPC000001','2019-09-10 20:23:42','1'),
	('RSCSC000002','双链小超绵阳办事处','2017-07-19','RSPC000001','2019-09-10 23:32:42','1'),
	('RSCSC000003','双链小超巴中办事处','2018-06-07','RSPC000002','2019-09-07 16:50:28','1'),
	('RSCSC000004','双链小超成都办事处','2019-08-13','RSPC000002','2019-09-04 13:03:27','1');

insert into city_partner_data values
	('CP000001','曾倩','13677778888','RSCSC000001','负责开拓市场，具有极强的开拓能力','2019-09-01 22:16:43','1'),
	('CP000002','黄风格','13900000002','RSCSC000001','负责开拓市场，具有极强的开拓能力0002','2019-08-31 04:58:57','1'),
	('CP000003','郭超','13900000003','RSCSC000002','负责开拓市场，具有极强的开拓能力0003','2019-09-14 11:38:47','1'),
	('CP000004','曾倩','13900000004','RSCSC000002','负责开拓市场，具有极强的开拓能力0004','2019-09-04 22:16:51','1'),
	('CP000005','黄风格','13900000005','RSCSC000003','负责开拓市场，具有极强的开拓能力0005','2019-09-06 04:50:44','1'),
	('CP000006','郭超','13900000006','RSCSC000003','负责开拓市场，具有极强的开拓能力0006','2019-08-31 15:11:06','1'),
	('CP000007','曾倩','13900000007','RSCSC000004','负责开拓市场，具有极强的开拓能力0007','2019-09-08 21:15:17','1'),
	('CP000008','黄风格','13900000008','RSCSC000004','负责开拓市场，具有极强的开拓能力0008','2019-08-28 06:04:12','1');

insert into potential_customer_data values
	('PC000001','曾倩','13677778888','RSCSC000001','CP000001','负责开拓市场，具有极强的开拓能力','2019-09-05 21:19:43','1'),
	('PC000002','黄风格','13900000002','RSCSC000001','CP000001','负责开拓市场，具有极强的开拓能力0002','2019-09-03 14:03:22','1'),
	('PC000003','郭超','13900000003','RSCSC000001','CP000002','负责开拓市场，具有极强的开拓能力0003','2019-09-11 13:22:52','1'),
	('PC000004','曾倩','13900000004','RSCSC000001','CP000002','负责开拓市场，具有极强的开拓能力0004','2019-09-09 07:27:31','1'),
	('PC000005','黄风格','13900000005','RSCSC000002','CP000003','负责开拓市场，具有极强的开拓能力0005','2019-09-04 13:29:00','1'),
	('PC000006','郭超','13900000006','RSCSC000002','CP000003','负责开拓市场，具有极强的开拓能力0006','2019-09-03 15:32:46','1'),
	('PC000007','曾倩','13900000007','RSCSC000002','CP000004','负责开拓市场，具有极强的开拓能力0007','2019-08-26 17:12:39','1'),
	('PC000008','黄风格','13900000008','RSCSC000002','CP000004','负责开拓市场，具有极强的开拓能力0008','2019-09-14 08:19:17','1'),
	('PC000009','郭超','13900000009','RSCSC000003','CP000005','负责开拓市场，具有极强的开拓能力0009','2019-09-01 16:04:33','1'),
	('PC000010','曾倩','13900000010','RSCSC000003','CP000005','负责开拓市场，具有极强的开拓能力0010','2019-09-01 08:24:58','1'),
	('PC000011','黄风格','13900000011','RSCSC000003','CP000006','负责开拓市场，具有极强的开拓能力0011','2019-09-13 02:01:43','1'),
	('PC000012','郭超','13900000012','RSCSC000003','CP000006','负责开拓市场，具有极强的开拓能力0012','2019-09-02 16:28:19','1'),
	('PC000013','曾倩','13900000013','RSCSC000004','CP000007','负责开拓市场，具有极强的开拓能力0013','2019-09-02 03:20:55','1'),
	('PC000014','黄风格','13900000014','RSCSC000004','CP000007','负责开拓市场，具有极强的开拓能力0014','2019-09-02 20:58:49','1'),
	('PC000015','郭超','13900000015','RSCSC000004','CP000008','负责开拓市场，具有极强的开拓能力0015','2019-08-31 01:50:22','1'),
	('PC000016','曾倩','13900000016','RSCSC000004','CP000008','负责开拓市场，具有极强的开拓能力0016','2019-09-06 01:47:44','1');

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
	('PCC000001','和连载客户的联系记录','2018-11-06','电话','PC000001','CP000001','PCCP000001','转化希望很大','2019-09-03 17:09:21','1'),
	('PCC000002','和连载客户的联系记录0002','2018-09-20','短信','PC000001','CP000001','PCCP000001','转化希望很大0002','2019-09-12 03:53:52','1'),
	('PCC000003','和连载客户的联系记录0003','2017-09-13','登门拜访','PC000001','CP000001','PCCP000002','转化希望很大0003','2019-09-11 12:40:06','1'),
	('PCC000004','和连载客户的联系记录0004','2017-12-25','活动聊天','PC000001','CP000001','PCCP000002','转化希望很大0004','2019-08-25 23:20:18','1'),
	('PCC000005','和连载客户的联系记录0005','2017-09-15','电话','PC000002','CP000001','PCCP000003','转化希望很大0005','2019-09-01 18:26:34','1'),
	('PCC000006','和连载客户的联系记录0006','2018-07-29','短信','PC000002','CP000001','PCCP000003','转化希望很大0006','2019-09-09 14:38:58','1'),
	('PCC000007','和连载客户的联系记录0007','2017-03-08','登门拜访','PC000002','CP000001','PCCP000004','转化希望很大0007','2019-09-12 10:52:35','1'),
	('PCC000008','和连载客户的联系记录0008','2018-07-21','活动聊天','PC000002','CP000001','PCCP000004','转化希望很大0008','2019-09-03 09:58:41','1'),
	('PCC000009','和连载客户的联系记录0009','2018-08-30','电话','PC000003','CP000002','PCCP000005','转化希望很大0009','2019-09-13 12:42:44','1'),
	('PCC000010','和连载客户的联系记录0010','2018-06-19','短信','PC000003','CP000002','PCCP000005','转化希望很大0010','2019-08-26 05:22:36','1'),
	('PCC000011','和连载客户的联系记录0011','2017-07-31','登门拜访','PC000003','CP000002','PCCP000006','转化希望很大0011','2019-09-09 13:57:43','1'),
	('PCC000012','和连载客户的联系记录0012','2018-08-04','活动聊天','PC000003','CP000002','PCCP000006','转化希望很大0012','2019-08-30 16:38:48','1'),
	('PCC000013','和连载客户的联系记录0013','2018-04-01','电话','PC000004','CP000002','PCCP000007','转化希望很大0013','2019-09-07 19:23:17','1'),
	('PCC000014','和连载客户的联系记录0014','2019-08-28','短信','PC000004','CP000002','PCCP000007','转化希望很大0014','2019-09-14 06:16:47','1'),
	('PCC000015','和连载客户的联系记录0015','2017-08-20','登门拜访','PC000004','CP000002','PCCP000008','转化希望很大0015','2019-09-06 16:38:21','1'),
	('PCC000016','和连载客户的联系记录0016','2018-04-18','活动聊天','PC000004','CP000002','PCCP000008','转化希望很大0016','2019-09-16 07:46:35','1'),
	('PCC000017','和连载客户的联系记录0017','2019-09-07','电话','PC000005','CP000003','PCCP000009','转化希望很大0017','2019-08-28 20:26:49','1'),
	('PCC000018','和连载客户的联系记录0018','2019-02-11','短信','PC000005','CP000003','PCCP000009','转化希望很大0018','2019-09-11 14:06:04','1'),
	('PCC000019','和连载客户的联系记录0019','2017-01-12','登门拜访','PC000005','CP000003','PCCP000010','转化希望很大0019','2019-08-31 03:19:16','1'),
	('PCC000020','和连载客户的联系记录0020','2016-11-07','活动聊天','PC000005','CP000003','PCCP000010','转化希望很大0020','2019-09-08 12:25:46','1'),
	('PCC000021','和连载客户的联系记录0021','2019-06-26','电话','PC000006','CP000003','PCCP000011','转化希望很大0021','2019-09-10 22:20:39','1'),
	('PCC000022','和连载客户的联系记录0022','2019-03-09','短信','PC000006','CP000003','PCCP000011','转化希望很大0022','2019-09-03 12:03:43','1'),
	('PCC000023','和连载客户的联系记录0023','2019-05-17','登门拜访','PC000006','CP000003','PCCP000012','转化希望很大0023','2019-09-11 22:57:19','1'),
	('PCC000024','和连载客户的联系记录0024','2018-10-25','活动聊天','PC000006','CP000003','PCCP000012','转化希望很大0024','2019-09-11 16:01:57','1'),
	('PCC000025','和连载客户的联系记录0025','2018-09-05','电话','PC000007','CP000004','PCCP000013','转化希望很大0025','2019-08-26 20:48:41','1'),
	('PCC000026','和连载客户的联系记录0026','2017-12-01','短信','PC000007','CP000004','PCCP000013','转化希望很大0026','2019-08-31 15:06:33','1'),
	('PCC000027','和连载客户的联系记录0027','2017-01-13','登门拜访','PC000007','CP000004','PCCP000014','转化希望很大0027','2019-08-29 04:45:55','1'),
	('PCC000028','和连载客户的联系记录0028','2018-08-02','活动聊天','PC000007','CP000004','PCCP000014','转化希望很大0028','2019-09-01 12:22:42','1'),
	('PCC000029','和连载客户的联系记录0029','2019-02-02','电话','PC000008','CP000004','PCCP000015','转化希望很大0029','2019-08-29 19:38:45','1'),
	('PCC000030','和连载客户的联系记录0030','2017-11-05','短信','PC000008','CP000004','PCCP000015','转化希望很大0030','2019-08-28 02:14:17','1'),
	('PCC000031','和连载客户的联系记录0031','2019-02-17','登门拜访','PC000008','CP000004','PCCP000016','转化希望很大0031','2019-08-29 08:07:01','1'),
	('PCC000032','和连载客户的联系记录0032','2017-08-30','活动聊天','PC000008','CP000004','PCCP000016','转化希望很大0032','2019-09-04 22:09:33','1'),
	('PCC000033','和连载客户的联系记录0033','2016-10-23','电话','PC000009','CP000005','PCCP000017','转化希望很大0033','2019-09-01 09:12:23','1'),
	('PCC000034','和连载客户的联系记录0034','2016-11-13','短信','PC000009','CP000005','PCCP000017','转化希望很大0034','2019-08-27 07:27:20','1'),
	('PCC000035','和连载客户的联系记录0035','2016-09-18','登门拜访','PC000009','CP000005','PCCP000018','转化希望很大0035','2019-08-30 05:31:16','1'),
	('PCC000036','和连载客户的联系记录0036','2019-03-14','活动聊天','PC000009','CP000005','PCCP000018','转化希望很大0036','2019-09-07 06:06:04','1'),
	('PCC000037','和连载客户的联系记录0037','2017-10-06','电话','PC000010','CP000005','PCCP000019','转化希望很大0037','2019-09-03 04:07:53','1'),
	('PCC000038','和连载客户的联系记录0038','2017-07-06','短信','PC000010','CP000005','PCCP000019','转化希望很大0038','2019-09-05 09:08:58','1'),
	('PCC000039','和连载客户的联系记录0039','2016-11-18','登门拜访','PC000010','CP000005','PCCP000020','转化希望很大0039','2019-08-30 22:47:40','1'),
	('PCC000040','和连载客户的联系记录0040','2017-01-09','活动聊天','PC000010','CP000005','PCCP000020','转化希望很大0040','2019-08-27 05:45:48','1'),
	('PCC000041','和连载客户的联系记录0041','2017-01-04','电话','PC000011','CP000006','PCCP000021','转化希望很大0041','2019-09-16 15:59:29','1'),
	('PCC000042','和连载客户的联系记录0042','2019-09-13','短信','PC000011','CP000006','PCCP000021','转化希望很大0042','2019-09-01 05:50:02','1'),
	('PCC000043','和连载客户的联系记录0043','2017-05-24','登门拜访','PC000011','CP000006','PCCP000022','转化希望很大0043','2019-09-02 19:47:18','1'),
	('PCC000044','和连载客户的联系记录0044','2018-02-11','活动聊天','PC000011','CP000006','PCCP000022','转化希望很大0044','2019-09-05 21:15:58','1'),
	('PCC000045','和连载客户的联系记录0045','2019-03-27','电话','PC000012','CP000006','PCCP000023','转化希望很大0045','2019-08-29 01:35:56','1'),
	('PCC000046','和连载客户的联系记录0046','2016-11-13','短信','PC000012','CP000006','PCCP000023','转化希望很大0046','2019-09-08 15:13:41','1'),
	('PCC000047','和连载客户的联系记录0047','2019-01-10','登门拜访','PC000012','CP000006','PCCP000024','转化希望很大0047','2019-09-11 20:06:08','1'),
	('PCC000048','和连载客户的联系记录0048','2018-03-29','活动聊天','PC000012','CP000006','PCCP000024','转化希望很大0048','2019-09-07 13:00:55','1'),
	('PCC000049','和连载客户的联系记录0049','2019-06-30','电话','PC000013','CP000007','PCCP000025','转化希望很大0049','2019-09-06 02:17:00','1'),
	('PCC000050','和连载客户的联系记录0050','2018-12-28','短信','PC000013','CP000007','PCCP000025','转化希望很大0050','2019-08-28 09:02:33','1'),
	('PCC000051','和连载客户的联系记录0051','2017-09-25','登门拜访','PC000013','CP000007','PCCP000026','转化希望很大0051','2019-09-15 13:36:07','1'),
	('PCC000052','和连载客户的联系记录0052','2019-03-22','活动聊天','PC000013','CP000007','PCCP000026','转化希望很大0052','2019-09-04 10:41:22','1'),
	('PCC000053','和连载客户的联系记录0053','2017-03-17','电话','PC000014','CP000007','PCCP000027','转化希望很大0053','2019-09-10 04:51:04','1'),
	('PCC000054','和连载客户的联系记录0054','2018-11-22','短信','PC000014','CP000007','PCCP000027','转化希望很大0054','2019-09-12 18:25:56','1'),
	('PCC000055','和连载客户的联系记录0055','2018-05-07','登门拜访','PC000014','CP000007','PCCP000028','转化希望很大0055','2019-09-02 23:45:08','1'),
	('PCC000056','和连载客户的联系记录0056','2018-01-19','活动聊天','PC000014','CP000007','PCCP000028','转化希望很大0056','2019-09-12 14:33:12','1'),
	('PCC000057','和连载客户的联系记录0057','2016-12-25','电话','PC000015','CP000008','PCCP000029','转化希望很大0057','2019-09-01 11:56:51','1'),
	('PCC000058','和连载客户的联系记录0058','2016-11-26','短信','PC000015','CP000008','PCCP000029','转化希望很大0058','2019-09-16 15:41:15','1'),
	('PCC000059','和连载客户的联系记录0059','2019-05-26','登门拜访','PC000015','CP000008','PCCP000030','转化希望很大0059','2019-08-31 06:22:57','1'),
	('PCC000060','和连载客户的联系记录0060','2018-10-21','活动聊天','PC000015','CP000008','PCCP000030','转化希望很大0060','2019-09-10 14:21:48','1'),
	('PCC000061','和连载客户的联系记录0061','2018-09-18','电话','PC000016','CP000008','PCCP000031','转化希望很大0061','2019-09-14 00:07:50','1'),
	('PCC000062','和连载客户的联系记录0062','2018-09-20','短信','PC000016','CP000008','PCCP000031','转化希望很大0062','2019-08-26 07:31:18','1'),
	('PCC000063','和连载客户的联系记录0063','2018-04-12','登门拜访','PC000016','CP000008','PCCP000032','转化希望很大0063','2019-09-12 13:54:05','1'),
	('PCC000064','和连载客户的联系记录0064','2017-02-04','活动聊天','PC000016','CP000008','PCCP000032','转化希望很大0064','2019-09-11 23:20:01','1');

insert into city_event_data values
	('CE000001','小超见面会','13677778888','RSCSC000001','给大家讲解小超的发展蓝图','2019-09-04 23:18:13','1'),
	('CE000002','双链小超说明会','13900000002','RSCSC000001','给大家讲解小超的发展蓝图0002','2019-08-28 19:22:44','1'),
	('CE000003','小超见面会','13900000003','RSCSC000002','给大家讲解小超的发展蓝图0003','2019-09-04 14:01:01','1'),
	('CE000004','双链小超说明会','13900000004','RSCSC000002','给大家讲解小超的发展蓝图0004','2019-08-28 21:07:45','1'),
	('CE000005','小超见面会','13900000005','RSCSC000003','给大家讲解小超的发展蓝图0005','2019-09-02 21:36:33','1'),
	('CE000006','双链小超说明会','13900000006','RSCSC000003','给大家讲解小超的发展蓝图0006','2019-09-01 11:58:33','1'),
	('CE000007','小超见面会','13900000007','RSCSC000004','给大家讲解小超的发展蓝图0007','2019-09-07 19:55:24','1'),
	('CE000008','双链小超说明会','13900000008','RSCSC000004','给大家讲解小超的发展蓝图0008','2019-09-03 09:37:25','1');

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
	('RS000001','中和社区小超','02887654321','吕刚','RSCC000001','RSCSC000001',NULL,NULL,NULL,NULL,NULL,NULL,'2018-06-09','42.77637831806761','130.92819164349754','啤酒饮料矿泉水，香肠瓜子方便面, 请让一让','2019-09-15 09:10:21','CREATED','1'),
	('RS000002','华阳社区小超','028876543210002','吕刚0002','RSCC000001','RSCSC000001',NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-01','42.11394409390302','130.7184829219962','啤酒饮料矿泉水，香肠瓜子方便面, 请让一让0002','2019-08-31 20:01:03','INVESTMENT_INVITED','1'),
	('RS000003','大源社区小超','028876543210003','吕刚0003','RSCC000001','RSCSC000002',NULL,NULL,NULL,NULL,NULL,NULL,'2019-06-15','40.538522683551975','129.49656821657223','啤酒饮料矿泉水，香肠瓜子方便面, 请让一让0003','2019-09-10 04:04:05','FRANCHISED','1'),
	('RS000004','中和社区小超','028876543210004','吕刚0004','RSCC000001','RSCSC000002',NULL,NULL,NULL,NULL,NULL,NULL,'2018-06-17','40.281175779417325','132.21833181515257','啤酒饮料矿泉水，香肠瓜子方便面, 请让一让0004','2019-08-30 14:39:28','DECORATED','1'),
	('RS000005','华阳社区小超','028876543210005','吕刚0005','RSCC000001','RSCSC000003',NULL,NULL,NULL,NULL,NULL,NULL,'2018-06-07','42.67787937476159','131.38376922455575','啤酒饮料矿泉水，香肠瓜子方便面, 请让一让0005','2019-08-25 20:56:06','OPENNED','1'),
	('RS000006','大源社区小超','028876543210006','吕刚0006','RSCC000001','RSCSC000003',NULL,NULL,NULL,NULL,NULL,NULL,'2017-11-01','40.86946842844132','131.20149012212823','啤酒饮料矿泉水，香肠瓜子方便面, 请让一让0006','2019-09-16 01:30:01','CLOSED','1'),
	('RS000007','中和社区小超','028876543210007','吕刚0007','RSCC000001','RSCSC000004',NULL,NULL,NULL,NULL,NULL,NULL,'2017-11-30','42.67959679478827','130.16508533047087','啤酒饮料矿泉水，香肠瓜子方便面, 请让一让0007','2019-08-30 19:10:18','CREATED','1'),
	('RS000008','华阳社区小超','028876543210008','吕刚0008','RSCC000001','RSCSC000004',NULL,NULL,NULL,NULL,NULL,NULL,'2017-03-25','40.506132051336714','131.4321969774197','啤酒饮料矿泉水，香肠瓜子方便面, 请让一让0008','2019-09-07 12:09:20','INVESTMENT_INVITED','1');

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
	('CO000001','消费订单','RSM000001',NULL,NULL,NULL,NULL,NULL,'RS000001','2019-08-26 12:04:40','CONFIRMED','1'),
	('CO000002','消费订单0002','RSM000001',NULL,NULL,NULL,NULL,NULL,'RS000001','2019-09-16 00:14:32','APPROVED','1'),
	('CO000003','消费订单0003','RSM000001',NULL,NULL,NULL,NULL,NULL,'RS000002','2019-09-04 12:17:01','PROCESSED','1'),
	('CO000004','消费订单0004','RSM000001',NULL,NULL,NULL,NULL,NULL,'RS000002','2019-09-14 01:37:44','SHIPPED','1'),
	('CO000005','消费订单0005','RSM000001',NULL,NULL,NULL,NULL,NULL,'RS000003','2019-09-14 14:40:03','DELIVERED','1'),
	('CO000006','消费订单0006','RSM000001',NULL,NULL,NULL,NULL,NULL,'RS000003','2019-09-13 08:04:33','CONFIRMED','1'),
	('CO000007','消费订单0007','RSM000001',NULL,NULL,NULL,NULL,NULL,'RS000004','2019-08-26 15:42:18','APPROVED','1'),
	('CO000008','消费订单0008','RSM000001',NULL,NULL,NULL,NULL,NULL,'RS000004','2019-09-10 12:10:55','PROCESSED','1'),
	('CO000009','消费订单0009','RSM000002',NULL,NULL,NULL,NULL,NULL,'RS000005','2019-09-15 12:33:49','SHIPPED','1'),
	('CO000010','消费订单0010','RSM000002',NULL,NULL,NULL,NULL,NULL,'RS000005','2019-08-29 09:18:09','DELIVERED','1'),
	('CO000011','消费订单0011','RSM000002',NULL,NULL,NULL,NULL,NULL,'RS000006','2019-09-02 22:16:35','CONFIRMED','1'),
	('CO000012','消费订单0012','RSM000002',NULL,NULL,NULL,NULL,NULL,'RS000006','2019-09-13 03:20:28','APPROVED','1'),
	('CO000013','消费订单0013','RSM000002',NULL,NULL,NULL,NULL,NULL,'RS000007','2019-09-06 19:15:15','PROCESSED','1'),
	('CO000014','消费订单0014','RSM000002',NULL,NULL,NULL,NULL,NULL,'RS000007','2019-08-29 12:53:27','SHIPPED','1'),
	('CO000015','消费订单0015','RSM000002',NULL,NULL,NULL,NULL,NULL,'RS000008','2019-09-02 20:25:37','DELIVERED','1'),
	('CO000016','消费订单0016','RSM000002',NULL,NULL,NULL,NULL,NULL,'RS000008','2019-09-10 13:29:52','CONFIRMED','1');

insert into consumer_order_confirmation_data values
	('COC000001','确认者','2017-10-20','1');

insert into consumer_order_approval_data values
	('COA000001','批准者','2017-11-29','1');

insert into consumer_order_processing_data values
	('COP000001','处理者','2019-04-03','1');

insert into consumer_order_shipment_data values
	('COS000001','运货者','2019-07-26','1');

insert into consumer_order_delivery_data values
	('COD000001','送货者','2018-04-02','1');

insert into consumer_order_line_item_data values
	('COLI000001','CO000001','SKU','大瓶可乐','5.45','837.67','8808.54','2019-08-26 02:29:03','1'),
	('COLI000002','CO000001','SKU0002','大瓶可乐0002','5.54','728.43','8100.53','2019-09-14 02:57:50','1'),
	('COLI000003','CO000002','SKU0003','大瓶可乐0003','4.61','753.53','7398.08','2019-08-27 02:32:48','1'),
	('COLI000004','CO000002','SKU0004','大瓶可乐0004','5.13','848.60','9101.14','2019-09-04 03:31:33','1'),
	('COLI000005','CO000003','SKU0005','大瓶可乐0005','5.14','933.80','7233.84','2019-09-12 03:00:32','1'),
	('COLI000006','CO000003','SKU0006','大瓶可乐0006','4.22','841.22','7395.50','2019-09-08 18:05:19','1'),
	('COLI000007','CO000004','SKU0007','大瓶可乐0007','5.11','760.21','7831.10','2019-09-12 16:30:07','1'),
	('COLI000008','CO000004','SKU0008','大瓶可乐0008','4.28','792.14','8041.09','2019-08-28 10:27:07','1'),
	('COLI000009','CO000005','SKU0009','大瓶可乐0009','5.05','952.09','7531.13','2019-09-13 08:57:15','1'),
	('COLI000010','CO000005','SKU0010','大瓶可乐0010','4.49','928.27','9014.34','2019-08-27 15:19:19','1'),
	('COLI000011','CO000006','SKU0011','大瓶可乐0011','4.18','811.53','7621.72','2019-09-02 17:55:56','1'),
	('COLI000012','CO000006','SKU0012','大瓶可乐0012','4.91','837.38','7450.91','2019-09-12 17:31:02','1'),
	('COLI000013','CO000007','SKU0013','大瓶可乐0013','4.22','740.53','7088.97','2019-09-10 03:36:43','1'),
	('COLI000014','CO000007','SKU0014','大瓶可乐0014','5.75','708.36','8581.93','2019-09-02 14:55:42','1'),
	('COLI000015','CO000008','SKU0015','大瓶可乐0015','5.50','733.46','9691.99','2019-09-03 09:16:25','1'),
	('COLI000016','CO000008','SKU0016','大瓶可乐0016','4.52','808.09','9182.50','2019-09-10 21:01:03','1'),
	('COLI000017','CO000009','SKU0017','大瓶可乐0017','4.92','773.51','7301.83','2019-09-11 14:48:17','1'),
	('COLI000018','CO000009','SKU0018','大瓶可乐0018','4.67','735.80','7598.82','2019-09-06 06:51:05','1'),
	('COLI000019','CO000010','SKU0019','大瓶可乐0019','4.81','886.49','7695.95','2019-08-29 06:06:30','1'),
	('COLI000020','CO000010','SKU0020','大瓶可乐0020','4.34','820.98','7670.48','2019-09-07 14:51:22','1'),
	('COLI000021','CO000011','SKU0021','大瓶可乐0021','5.33','930.66','9249.84','2019-08-30 14:42:15','1'),
	('COLI000022','CO000011','SKU0022','大瓶可乐0022','4.89','755.91','7114.13','2019-08-29 15:53:13','1'),
	('COLI000023','CO000012','SKU0023','大瓶可乐0023','4.84','725.90','7216.96','2019-08-30 08:24:50','1'),
	('COLI000024','CO000012','SKU0024','大瓶可乐0024','4.93','978.78','8185.16','2019-09-14 04:36:02','1'),
	('COLI000025','CO000013','SKU0025','大瓶可乐0025','5.05','751.01','7538.65','2019-08-30 17:25:07','1'),
	('COLI000026','CO000013','SKU0026','大瓶可乐0026','4.55','848.35','9683.58','2019-08-26 13:55:25','1'),
	('COLI000027','CO000014','SKU0027','大瓶可乐0027','4.97','862.34','8375.15','2019-09-11 12:59:03','1'),
	('COLI000028','CO000014','SKU0028','大瓶可乐0028','5.91','776.33','7620.67','2019-09-05 16:48:17','1'),
	('COLI000029','CO000015','SKU0029','大瓶可乐0029','4.77','712.56','7799.45','2019-08-27 17:56:30','1'),
	('COLI000030','CO000015','SKU0030','大瓶可乐0030','5.34','708.32','7112.70','2019-08-27 16:26:46','1'),
	('COLI000031','CO000016','SKU0031','大瓶可乐0031','4.36','972.86','8345.02','2019-08-31 05:48:44','1'),
	('COLI000032','CO000016','SKU0032','大瓶可乐0032','5.36','769.47','8318.21','2019-09-15 20:47:48','1');

insert into consumer_order_shipping_group_data values
	('COSG000001','送货到刘强家','CO000001','449.89','1'),
	('COSG000002','送货到刘强家0002','CO000001','472.34','1'),
	('COSG000003','送货到刘强家0003','CO000002','560.94','1'),
	('COSG000004','送货到刘强家0004','CO000002','458.34','1'),
	('COSG000005','送货到刘强家0005','CO000003','477.15','1'),
	('COSG000006','送货到刘强家0006','CO000003','489.43','1'),
	('COSG000007','送货到刘强家0007','CO000004','569.10','1'),
	('COSG000008','送货到刘强家0008','CO000004','470.51','1'),
	('COSG000009','送货到刘强家0009','CO000005','488.63','1'),
	('COSG000010','送货到刘强家0010','CO000005','547.38','1'),
	('COSG000011','送货到刘强家0011','CO000006','436.98','1'),
	('COSG000012','送货到刘强家0012','CO000006','519.58','1'),
	('COSG000013','送货到刘强家0013','CO000007','527.32','1'),
	('COSG000014','送货到刘强家0014','CO000007','574.12','1'),
	('COSG000015','送货到刘强家0015','CO000008','565.46','1'),
	('COSG000016','送货到刘强家0016','CO000008','584.07','1'),
	('COSG000017','送货到刘强家0017','CO000009','467.68','1'),
	('COSG000018','送货到刘强家0018','CO000009','552.74','1'),
	('COSG000019','送货到刘强家0019','CO000010','510.64','1'),
	('COSG000020','送货到刘强家0020','CO000010','528.19','1'),
	('COSG000021','送货到刘强家0021','CO000011','452.72','1'),
	('COSG000022','送货到刘强家0022','CO000011','505.29','1'),
	('COSG000023','送货到刘强家0023','CO000012','538.57','1'),
	('COSG000024','送货到刘强家0024','CO000012','526.38','1'),
	('COSG000025','送货到刘强家0025','CO000013','588.16','1'),
	('COSG000026','送货到刘强家0026','CO000013','585.09','1'),
	('COSG000027','送货到刘强家0027','CO000014','429.98','1'),
	('COSG000028','送货到刘强家0028','CO000014','450.32','1'),
	('COSG000029','送货到刘强家0029','CO000015','575.92','1'),
	('COSG000030','送货到刘强家0030','CO000015','494.84','1'),
	('COSG000031','送货到刘强家0031','CO000016','437.11','1'),
	('COSG000032','送货到刘强家0032','CO000016','540.65','1');

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
	('COPA000001','端午促销','CO000001','436.74','供货商','1'),
	('COPA000002','端午促销0002','CO000001','534.48','小超老板','1'),
	('COPA000003','端午促销0003','CO000002','545.63','广告赞助','1'),
	('COPA000004','端午促销0004','CO000002','433.90','供货商','1'),
	('COPA000005','端午促销0005','CO000003','580.92','小超老板','1'),
	('COPA000006','端午促销0006','CO000003','507.47','广告赞助','1'),
	('COPA000007','端午促销0007','CO000004','537.10','供货商','1'),
	('COPA000008','端午促销0008','CO000004','530.08','小超老板','1'),
	('COPA000009','端午促销0009','CO000005','437.51','广告赞助','1'),
	('COPA000010','端午促销0010','CO000005','514.58','供货商','1'),
	('COPA000011','端午促销0011','CO000006','482.36','小超老板','1'),
	('COPA000012','端午促销0012','CO000006','508.34','广告赞助','1'),
	('COPA000013','端午促销0013','CO000007','544.93','供货商','1'),
	('COPA000014','端午促销0014','CO000007','542.63','小超老板','1'),
	('COPA000015','端午促销0015','CO000008','562.45','广告赞助','1'),
	('COPA000016','端午促销0016','CO000008','527.07','供货商','1'),
	('COPA000017','端午促销0017','CO000009','581.32','小超老板','1'),
	('COPA000018','端午促销0018','CO000009','529.97','广告赞助','1'),
	('COPA000019','端午促销0019','CO000010','512.12','供货商','1'),
	('COPA000020','端午促销0020','CO000010','420.21','小超老板','1'),
	('COPA000021','端午促销0021','CO000011','449.54','广告赞助','1'),
	('COPA000022','端午促销0022','CO000011','542.50','供货商','1'),
	('COPA000023','端午促销0023','CO000012','531.07','小超老板','1'),
	('COPA000024','端午促销0024','CO000012','444.39','广告赞助','1'),
	('COPA000025','端午促销0025','CO000013','490.10','供货商','1'),
	('COPA000026','端午促销0026','CO000013','462.22','小超老板','1'),
	('COPA000027','端午促销0027','CO000014','550.40','广告赞助','1'),
	('COPA000028','端午促销0028','CO000014','540.78','供货商','1'),
	('COPA000029','端午促销0029','CO000015','496.49','小超老板','1'),
	('COPA000030','端午促销0030','CO000015','535.66','广告赞助','1'),
	('COPA000031','端午促销0031','CO000016','555.41','供货商','1'),
	('COPA000032','端午促销0032','CO000016','471.81','小超老板','1');

insert into retail_store_member_coupon_data values
	('RSMC000001','优惠券','RSM000001','CP00001','2019-09-05 21:37:44','1'),
	('RSMC000002','优惠券0002','RSM000001','CP000010002','2019-09-05 12:16:28','1'),
	('RSMC000003','优惠券0003','RSM000002','CP000010003','2019-08-31 16:08:53','1'),
	('RSMC000004','优惠券0004','RSM000002','CP000010004','2019-08-26 06:46:14','1');

insert into member_wishlist_data values
	('MW000001','每周购买清单','RSM000001','1'),
	('MW000002','每月购买清单','RSM000001','1'),
	('MW000003','每周购买清单','RSM000002','1'),
	('MW000004','每月购买清单','RSM000002','1');

insert into member_reward_point_data values
	('MRP000001','购买积分','19','RSM000001','1'),
	('MRP000002','每月购买清单','17','RSM000001','1'),
	('MRP000003','购买积分','19','RSM000002','1'),
	('MRP000004','每月购买清单','19','RSM000002','1');

insert into member_reward_point_redemption_data values
	('MRPR000001','积分换锅','20','RSM000001','1'),
	('MRPR000002','积分换刀','20','RSM000001','1'),
	('MRPR000003','积分换锅','16','RSM000002','1'),
	('MRPR000004','积分换刀','17','RSM000002','1');

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
	('RSMGC000001','礼品卡','RSM000001','CP00001','202.75','1'),
	('RSMGC000002','礼品卡0002','RSM000001','CP000010002','168.16','1'),
	('RSMGC000003','礼品卡0003','RSM000002','CP000010003','173.10','1'),
	('RSMGC000004','礼品卡0004','RSM000002','CP000010004','149.93','1');

insert into retail_store_member_gift_card_consume_record_data values
	('RSMGCCR000001','2017-05-22','RSMGC000001','CO000001','GF00001','19.03','1'),
	('RSMGCCR000002','2018-05-14','RSMGC000001','CO000001','GF000010002','20.11','1'),
	('RSMGCCR000003','2018-10-28','RSMGC000001','CO000002','GF000010003','15.84','1'),
	('RSMGCCR000004','2017-05-11','RSMGC000001','CO000002','GF000010004','15.52','1'),
	('RSMGCCR000005','2018-02-07','RSMGC000001','CO000003','GF000010005','19.50','1'),
	('RSMGCCR000006','2018-12-12','RSMGC000001','CO000003','GF000010006','20.21','1'),
	('RSMGCCR000007','2019-02-03','RSMGC000001','CO000004','GF000010007','20.46','1'),
	('RSMGCCR000008','2017-07-23','RSMGC000001','CO000004','GF000010008','15.94','1'),
	('RSMGCCR000009','2018-07-29','RSMGC000002','CO000005','GF000010009','15.83','1'),
	('RSMGCCR000010','2019-06-26','RSMGC000002','CO000005','GF000010010','16.75','1'),
	('RSMGCCR000011','2018-10-14','RSMGC000002','CO000006','GF000010011','17.29','1'),
	('RSMGCCR000012','2018-07-24','RSMGC000002','CO000006','GF000010012','15.92','1'),
	('RSMGCCR000013','2019-02-22','RSMGC000002','CO000007','GF000010013','16.51','1'),
	('RSMGCCR000014','2019-08-27','RSMGC000002','CO000007','GF000010014','18.16','1'),
	('RSMGCCR000015','2017-01-30','RSMGC000002','CO000008','GF000010015','17.95','1'),
	('RSMGCCR000016','2018-10-15','RSMGC000002','CO000008','GF000010016','19.90','1'),
	('RSMGCCR000017','2019-06-02','RSMGC000003','CO000009','GF000010017','16.71','1'),
	('RSMGCCR000018','2018-10-21','RSMGC000003','CO000009','GF000010018','18.55','1'),
	('RSMGCCR000019','2018-05-07','RSMGC000003','CO000010','GF000010019','19.61','1'),
	('RSMGCCR000020','2018-03-07','RSMGC000003','CO000010','GF000010020','20.34','1'),
	('RSMGCCR000021','2017-07-18','RSMGC000003','CO000011','GF000010021','20.47','1'),
	('RSMGCCR000022','2018-09-23','RSMGC000003','CO000011','GF000010022','15.74','1'),
	('RSMGCCR000023','2018-06-19','RSMGC000003','CO000012','GF000010023','18.87','1'),
	('RSMGCCR000024','2017-07-15','RSMGC000003','CO000012','GF000010024','20.09','1'),
	('RSMGCCR000025','2018-04-30','RSMGC000004','CO000013','GF000010025','16.43','1'),
	('RSMGCCR000026','2018-07-17','RSMGC000004','CO000013','GF000010026','19.71','1'),
	('RSMGCCR000027','2019-09-15','RSMGC000004','CO000014','GF000010027','16.33','1'),
	('RSMGCCR000028','2019-09-02','RSMGC000004','CO000014','GF000010028','20.26','1'),
	('RSMGCCR000029','2017-01-21','RSMGC000004','CO000015','GF000010029','17.43','1'),
	('RSMGCCR000030','2017-07-17','RSMGC000004','CO000015','GF000010030','18.30','1'),
	('RSMGCCR000031','2018-11-25','RSMGC000004','CO000016','GF000010031','17.63','1'),
	('RSMGCCR000032','2017-02-03','RSMGC000004','CO000016','GF000010032','17.92','1');

insert into goods_supplier_data values
	('GS000001','宝洁','洗护用品','RSCC000001','18677889999','啤酒饮料矿泉水，香肠瓜子方便面都提供','2019-09-16 06:13:13','1'),
	('GS000002','中粮','食品','RSCC000001','13900000002','啤酒饮料矿泉水，香肠瓜子方便面都提供0002','2019-08-26 08:49:14','1');

insert into supplier_product_data values
	('SP000001','黑人牙膏','最好的黑人牙膏，只卖3块喽','件','GS000001','1'),
	('SP000002','黑人牙膏0002','最好的黑人牙膏，只卖3块喽0002','公斤','GS000001','1'),
	('SP000003','黑人牙膏0003','最好的黑人牙膏，只卖3块喽0003','米','GS000002','1'),
	('SP000004','黑人牙膏0004','最好的黑人牙膏，只卖3块喽0004','件','GS000002','1');

insert into product_supply_duration_data values
	('PSD000001','100','现货','8140.66','SP000001','1'),
	('PSD000002','200','两天','7694.52','SP000001','1'),
	('PSD000003','500','三天','7294.17','SP000002','1'),
	('PSD000004','100','一周','7594.25','SP000002','1'),
	('PSD000005','200','现货','9090.71','SP000003','1'),
	('PSD000006','500','两天','9048.31','SP000003','1'),
	('PSD000007','100','三天','7220.07','SP000004','1'),
	('PSD000008','200','一周','7345.50','SP000004','1');

insert into supply_order_data values
	('SO000001','RSCC000001','GS000001','双链给供货商下的订单','2261025024.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-11 18:16:34','CONFIRMED','1'),
	('SO000002','RSCC000001','GS000001','双链给供货商下的订单0002','2262616064.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-15 05:54:35','APPROVED','1'),
	('SO000003','RSCC000001','GS000002','双链给供货商下的订单0003','2274511616.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-08-31 03:14:56','PROCESSED','1'),
	('SO000004','RSCC000001','GS000002','双链给供货商下的订单0004','2866283776.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-08-26 02:02:10','PICKED','1');

insert into supply_order_confirmation_data values
	('SOC000001','确认者','2017-09-02','1');

insert into supply_order_approval_data values
	('SOA000001','批准者','2018-01-16','1');

insert into supply_order_processing_data values
	('SOP000001','处理者','2017-09-06','1');

insert into supply_order_picking_data values
	('SOP000001','处理者','2017-10-12','1');

insert into supply_order_shipment_data values
	('SOS000001','运货者','2019-05-13','1');

insert into supply_order_delivery_data values
	('SOD000001','送货者','2017-03-01','1');

insert into supply_order_line_item_data values
	('SOLI000001','SO000001','SKU','大瓶可乐','5.95','8837','件','1'),
	('SOLI000002','SO000001','SKU0002','大瓶可乐0002','5.87','7252','公斤','1'),
	('SOLI000003','SO000002','SKU0003','大瓶可乐0003','5.84','7534','米','1'),
	('SOLI000004','SO000002','SKU0004','大瓶可乐0004','4.91','8511','件','1'),
	('SOLI000005','SO000003','SKU0005','大瓶可乐0005','5.47','9384','公斤','1'),
	('SOLI000006','SO000003','SKU0006','大瓶可乐0006','5.13','9467','米','1'),
	('SOLI000007','SO000004','SKU0007','大瓶可乐0007','4.93','8382','件','1'),
	('SOLI000008','SO000004','SKU0008','大瓶可乐0008','5.30','8824','公斤','1');

insert into supply_order_shipping_group_data values
	('SOSG000001','送货到双链成都2号仓','SO000001','5.52','1'),
	('SOSG000002','送货到双链成都2号仓0002','SO000001','4.21','1'),
	('SOSG000003','送货到双链成都2号仓0003','SO000002','4.22','1'),
	('SOSG000004','送货到双链成都2号仓0004','SO000002','4.79','1'),
	('SOSG000005','送货到双链成都2号仓0005','SO000003','5.80','1'),
	('SOSG000006','送货到双链成都2号仓0006','SO000003','4.46','1'),
	('SOSG000007','送货到双链成都2号仓0007','SO000004','4.64','1'),
	('SOSG000008','送货到双链成都2号仓0008','SO000004','4.28','1');

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
	('RSO000001','RS000001','RSCC000001','双链小超给双链供应链下的订单','2539333120.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-08-26 02:55:43','CONFIRMED','1'),
	('RSO000002','RS000001','RSCC000001','双链小超给双链供应链下的订单0002','2899123712.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-11 15:45:38','APPROVED','1'),
	('RSO000003','RS000002','RSCC000001','双链小超给双链供应链下的订单0003','2374370560.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-08-31 07:29:42','PROCESSED','1'),
	('RSO000004','RS000002','RSCC000001','双链小超给双链供应链下的订单0004','2279879424.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-06 07:37:46','PICKED','1'),
	('RSO000005','RS000003','RSCC000001','双链小超给双链供应链下的订单0005','2882340352.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-04 21:16:53','SHIPPED','1'),
	('RSO000006','RS000003','RSCC000001','双链小超给双链供应链下的订单0006','2782311168.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-05 22:51:27','DELIVERED','1'),
	('RSO000007','RS000004','RSCC000001','双链小超给双链供应链下的订单0007','2982046720.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-14 10:39:40','CONFIRMED','1'),
	('RSO000008','RS000004','RSCC000001','双链小超给双链供应链下的订单0008','2765277952.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-11 08:00:02','APPROVED','1'),
	('RSO000009','RS000005','RSCC000001','双链小超给双链供应链下的订单0009','2269700608.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-08-28 06:17:13','PROCESSED','1'),
	('RSO000010','RS000005','RSCC000001','双链小超给双链供应链下的订单0010','2222042880.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-08-26 12:46:26','PICKED','1'),
	('RSO000011','RS000006','RSCC000001','双链小超给双链供应链下的订单0011','2313005568.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-15 16:50:54','SHIPPED','1'),
	('RSO000012','RS000006','RSCC000001','双链小超给双链供应链下的订单0012','2566211072.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-09 01:28:24','DELIVERED','1'),
	('RSO000013','RS000007','RSCC000001','双链小超给双链供应链下的订单0013','2894792960.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-06 05:17:35','CONFIRMED','1'),
	('RSO000014','RS000007','RSCC000001','双链小超给双链供应链下的订单0014','2251873536.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-08 13:41:26','APPROVED','1'),
	('RSO000015','RS000008','RSCC000001','双链小超给双链供应链下的订单0015','2369541376.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-03 16:51:39','PROCESSED','1'),
	('RSO000016','RS000008','RSCC000001','双链小超给双链供应链下的订单0016','2514881024.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-08-27 17:42:31','PICKED','1');

insert into retail_store_order_confirmation_data values
	('RSOC000001','确认者','2018-10-07','1');

insert into retail_store_order_approval_data values
	('RSOA000001','批准者','2019-06-11','1');

insert into retail_store_order_processing_data values
	('RSOP000001','处理者','2018-12-15','1');

insert into retail_store_order_picking_data values
	('RSOP000001','处理者','2017-10-15','1');

insert into retail_store_order_shipment_data values
	('RSOS000001','运货者','2019-01-13','1');

insert into retail_store_order_delivery_data values
	('RSOD000001','送货者','2017-03-27','1');

insert into retail_store_order_line_item_data values
	('RSOLI000001','RSO000001','SKU','大瓶可乐','3.72','8782','件','1'),
	('RSOLI000002','RSO000001','SKU0002','大瓶可乐0002','3.58','9083','公斤','1'),
	('RSOLI000003','RSO000002','SKU0003','大瓶可乐0003','3.07','8119','米','1'),
	('RSOLI000004','RSO000002','SKU0004','大瓶可乐0004','3.06','7939','件','1'),
	('RSOLI000005','RSO000003','SKU0005','大瓶可乐0005','3.17','9847','公斤','1'),
	('RSOLI000006','RSO000003','SKU0006','大瓶可乐0006','3.73','8178','米','1'),
	('RSOLI000007','RSO000004','SKU0007','大瓶可乐0007','3.75','9491','件','1'),
	('RSOLI000008','RSO000004','SKU0008','大瓶可乐0008','3.57','9348','公斤','1'),
	('RSOLI000009','RSO000005','SKU0009','大瓶可乐0009','3.82','8768','米','1'),
	('RSOLI000010','RSO000005','SKU0010','大瓶可乐0010','3.30','8112','件','1'),
	('RSOLI000011','RSO000006','SKU0011','大瓶可乐0011','2.82','8945','公斤','1'),
	('RSOLI000012','RSO000006','SKU0012','大瓶可乐0012','3.17','8018','米','1'),
	('RSOLI000013','RSO000007','SKU0013','大瓶可乐0013','3.24','9116','件','1'),
	('RSOLI000014','RSO000007','SKU0014','大瓶可乐0014','3.04','9076','公斤','1'),
	('RSOLI000015','RSO000008','SKU0015','大瓶可乐0015','3.26','7746','米','1'),
	('RSOLI000016','RSO000008','SKU0016','大瓶可乐0016','2.98','8302','件','1'),
	('RSOLI000017','RSO000009','SKU0017','大瓶可乐0017','2.94','7844','公斤','1'),
	('RSOLI000018','RSO000009','SKU0018','大瓶可乐0018','3.35','8222','米','1'),
	('RSOLI000019','RSO000010','SKU0019','大瓶可乐0019','3.71','8889','件','1'),
	('RSOLI000020','RSO000010','SKU0020','大瓶可乐0020','3.26','8318','公斤','1'),
	('RSOLI000021','RSO000011','SKU0021','大瓶可乐0021','2.93','7228','米','1'),
	('RSOLI000022','RSO000011','SKU0022','大瓶可乐0022','3.53','7772','件','1'),
	('RSOLI000023','RSO000012','SKU0023','大瓶可乐0023','3.88','9974','公斤','1'),
	('RSOLI000024','RSO000012','SKU0024','大瓶可乐0024','3.36','8441','米','1'),
	('RSOLI000025','RSO000013','SKU0025','大瓶可乐0025','3.43','7582','件','1'),
	('RSOLI000026','RSO000013','SKU0026','大瓶可乐0026','3.47','9921','公斤','1'),
	('RSOLI000027','RSO000014','SKU0027','大瓶可乐0027','3.65','8187','米','1'),
	('RSOLI000028','RSO000014','SKU0028','大瓶可乐0028','3.59','9692','件','1'),
	('RSOLI000029','RSO000015','SKU0029','大瓶可乐0029','3.74','9456','公斤','1'),
	('RSOLI000030','RSO000015','SKU0030','大瓶可乐0030','3.61','9826','米','1'),
	('RSOLI000031','RSO000016','SKU0031','大瓶可乐0031','3.07','8213','件','1'),
	('RSOLI000032','RSO000016','SKU0032','大瓶可乐0032','2.81','8457','公斤','1');

insert into retail_store_order_shipping_group_data values
	('RSOSG000001','送货到双链中和社区店','RSO000001','5.32','1'),
	('RSOSG000002','送货到双链中和社区店0002','RSO000001','4.97','1'),
	('RSOSG000003','送货到双链中和社区店0003','RSO000002','4.46','1'),
	('RSOSG000004','送货到双链中和社区店0004','RSO000002','5.52','1'),
	('RSOSG000005','送货到双链中和社区店0005','RSO000003','4.32','1'),
	('RSOSG000006','送货到双链中和社区店0006','RSO000003','4.92','1'),
	('RSOSG000007','送货到双链中和社区店0007','RSO000004','4.25','1'),
	('RSOSG000008','送货到双链中和社区店0008','RSO000004','4.91','1'),
	('RSOSG000009','送货到双链中和社区店0009','RSO000005','4.64','1'),
	('RSOSG000010','送货到双链中和社区店0010','RSO000005','5.28','1'),
	('RSOSG000011','送货到双链中和社区店0011','RSO000006','5.05','1'),
	('RSOSG000012','送货到双链中和社区店0012','RSO000006','5.64','1'),
	('RSOSG000013','送货到双链中和社区店0013','RSO000007','5.62','1'),
	('RSOSG000014','送货到双链中和社区店0014','RSO000007','4.29','1'),
	('RSOSG000015','送货到双链中和社区店0015','RSO000008','4.82','1'),
	('RSOSG000016','送货到双链中和社区店0016','RSO000008','4.80','1'),
	('RSOSG000017','送货到双链中和社区店0017','RSO000009','5.17','1'),
	('RSOSG000018','送货到双链中和社区店0018','RSO000009','4.49','1'),
	('RSOSG000019','送货到双链中和社区店0019','RSO000010','4.20','1'),
	('RSOSG000020','送货到双链中和社区店0020','RSO000010','4.68','1'),
	('RSOSG000021','送货到双链中和社区店0021','RSO000011','5.09','1'),
	('RSOSG000022','送货到双链中和社区店0022','RSO000011','4.33','1'),
	('RSOSG000023','送货到双链中和社区店0023','RSO000012','4.55','1'),
	('RSOSG000024','送货到双链中和社区店0024','RSO000012','4.99','1'),
	('RSOSG000025','送货到双链中和社区店0025','RSO000013','5.51','1'),
	('RSOSG000026','送货到双链中和社区店0026','RSO000013','4.76','1'),
	('RSOSG000027','送货到双链中和社区店0027','RSO000014','4.80','1'),
	('RSOSG000028','送货到双链中和社区店0028','RSO000014','5.39','1'),
	('RSOSG000029','送货到双链中和社区店0029','RSO000015','5.11','1'),
	('RSOSG000030','送货到双链中和社区店0030','RSO000015','4.74','1'),
	('RSOSG000031','送货到双链中和社区店0031','RSO000016','4.89','1'),
	('RSOSG000032','送货到双链中和社区店0032','RSO000016','5.99','1');

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
	('W000001','成都龙泉驿飞鹤路20号','02887654321','187672平方米','RSCC000001','42.65846952991629','132.03745299822924','2019-08-27 00:43:27','1'),
	('W000002','成都龙泉驿飞鹤路20号0002','028876543210002','187672平方米0002','RSCC000001','42.51002616821698','129.43924013149157','2019-08-31 16:26:46','1');

insert into storage_space_data values
	('SS000001','成都龙泉驿飞鹤路20号存货区','02887654321','1876平方米','W000001','42.04488289139169','129.78298243582327','2019-09-09 19:17:26','1'),
	('SS000002','成都龙泉驿飞鹤路20号存货区0002','028876543210002','1876平方米0002','W000001','42.660136786913284','130.15089670416705','2019-09-15 22:54:52','1'),
	('SS000003','成都龙泉驿飞鹤路20号存货区0003','028876543210003','1876平方米0003','W000002','40.73146222073954','129.31285563218833','2019-09-03 08:36:56','1'),
	('SS000004','成都龙泉驿飞鹤路20号存货区0004','028876543210004','1876平方米0004','W000002','42.563785904623906','130.43087730810092','2019-09-09 14:29:35','1');

insert into smart_pallet_data values
	('SP000001','成都龙泉驿飞鹤路20号移动区域，比如过道，货运通道等','02887654321','1876平方米','40.09473261535836','129.53171437320069','W000001','2019-08-28 02:44:54','1'),
	('SP000002','成都龙泉驿飞鹤路20号移动区域，比如过道，货运通道等0002','028876543210002','1876平方米0002','41.56693821157652','129.5650879283165','W000001','2019-09-02 14:31:55','1'),
	('SP000003','成都龙泉驿飞鹤路20号移动区域，比如过道，货运通道等0003','028876543210003','1876平方米0003','42.1713691872273','131.3203229181794','W000002','2019-08-27 12:36:58','1'),
	('SP000004','成都龙泉驿飞鹤路20号移动区域，比如过道，货运通道等0004','028876543210004','1876平方米0004','42.675751199383924','131.7684473185691','W000002','2019-09-01 05:10:59','1');

insert into goods_shelf_data values
	('GS000001','成都龙泉驿飞鹤路20号存货区货架','SS000001','SS000001','DS000001','2019-08-29 16:46:09','1'),
	('GS000002','成都龙泉驿飞鹤路20号存货区货架0002','SS000001','SS000001','DS000001','2019-09-03 02:52:13','1'),
	('GS000003','成都龙泉驿飞鹤路20号存货区货架0003','SS000002','SS000002','DS000002','2019-09-07 00:14:32','1'),
	('GS000004','成都龙泉驿飞鹤路20号存货区货架0004','SS000002','SS000002','DS000002','2019-09-07 00:23:08','1'),
	('GS000005','成都龙泉驿飞鹤路20号存货区货架0005','SS000003','SS000003','DS000003','2019-08-27 20:21:33','1'),
	('GS000006','成都龙泉驿飞鹤路20号存货区货架0006','SS000003','SS000003','DS000003','2019-09-04 14:58:55','1'),
	('GS000007','成都龙泉驿飞鹤路20号存货区货架0007','SS000004','SS000004','DS000004','2019-08-27 23:02:02','1'),
	('GS000008','成都龙泉驿飞鹤路20号存货区货架0008','SS000004','SS000004','DS000004','2019-08-26 16:13:34','1');

insert into goods_shelf_stock_count_data values
	('GSSC000001','每日盘点','2019-02-19','使用先进的rfid技术，没有任何错误','GS000001','1'),
	('GSSC000002','每周盘点','2018-09-27','使用先进的rfid技术，没有任何错误0002','GS000001','1'),
	('GSSC000003','每月盘点','2017-10-30','使用先进的rfid技术，没有任何错误0003','GS000002','1'),
	('GSSC000004','年终盘点','2019-04-22','使用先进的rfid技术，没有任何错误0004','GS000002','1'),
	('GSSC000005','每日盘点','2017-04-20','使用先进的rfid技术，没有任何错误0005','GS000003','1'),
	('GSSC000006','每周盘点','2017-09-27','使用先进的rfid技术，没有任何错误0006','GS000003','1'),
	('GSSC000007','每月盘点','2018-02-19','使用先进的rfid技术，没有任何错误0007','GS000004','1'),
	('GSSC000008','年终盘点','2019-01-16','使用先进的rfid技术，没有任何错误0008','GS000004','1'),
	('GSSC000009','每日盘点','2019-08-10','使用先进的rfid技术，没有任何错误0009','GS000005','1'),
	('GSSC000010','每周盘点','2017-03-24','使用先进的rfid技术，没有任何错误0010','GS000005','1'),
	('GSSC000011','每月盘点','2017-12-16','使用先进的rfid技术，没有任何错误0011','GS000006','1'),
	('GSSC000012','年终盘点','2017-06-07','使用先进的rfid技术，没有任何错误0012','GS000006','1'),
	('GSSC000013','每日盘点','2017-09-01','使用先进的rfid技术，没有任何错误0013','GS000007','1'),
	('GSSC000014','每周盘点','2016-10-15','使用先进的rfid技术，没有任何错误0014','GS000007','1'),
	('GSSC000015','每月盘点','2017-08-23','使用先进的rfid技术，没有任何错误0015','GS000008','1'),
	('GSSC000016','年终盘点','2019-04-14','使用先进的rfid技术，没有任何错误0016','GS000008','1');

insert into stock_count_issue_track_data values
	('SCIT000001','盘点差错','2017-01-27','发现错误已经修正完成','GSSC000001','1'),
	('SCIT000002','盘点差错0002','2018-12-26','发现错误已经修正完成0002','GSSC000001','1'),
	('SCIT000003','盘点差错0003','2017-06-25','发现错误已经修正完成0003','GSSC000002','1'),
	('SCIT000004','盘点差错0004','2019-05-20','发现错误已经修正完成0004','GSSC000002','1'),
	('SCIT000005','盘点差错0005','2018-05-25','发现错误已经修正完成0005','GSSC000003','1'),
	('SCIT000006','盘点差错0006','2019-09-14','发现错误已经修正完成0006','GSSC000003','1'),
	('SCIT000007','盘点差错0007','2018-03-24','发现错误已经修正完成0007','GSSC000004','1'),
	('SCIT000008','盘点差错0008','2018-05-31','发现错误已经修正完成0008','GSSC000004','1'),
	('SCIT000009','盘点差错0009','2017-01-18','发现错误已经修正完成0009','GSSC000005','1'),
	('SCIT000010','盘点差错0010','2017-01-04','发现错误已经修正完成0010','GSSC000005','1'),
	('SCIT000011','盘点差错0011','2016-12-08','发现错误已经修正完成0011','GSSC000006','1'),
	('SCIT000012','盘点差错0012','2017-05-28','发现错误已经修正完成0012','GSSC000006','1'),
	('SCIT000013','盘点差错0013','2016-10-10','发现错误已经修正完成0013','GSSC000007','1'),
	('SCIT000014','盘点差错0014','2019-08-03','发现错误已经修正完成0014','GSSC000007','1'),
	('SCIT000015','盘点差错0015','2018-06-27','发现错误已经修正完成0015','GSSC000008','1'),
	('SCIT000016','盘点差错0016','2017-01-05','发现错误已经修正完成0016','GSSC000008','1'),
	('SCIT000017','盘点差错0017','2018-11-19','发现错误已经修正完成0017','GSSC000009','1'),
	('SCIT000018','盘点差错0018','2018-08-24','发现错误已经修正完成0018','GSSC000009','1'),
	('SCIT000019','盘点差错0019','2019-08-22','发现错误已经修正完成0019','GSSC000010','1'),
	('SCIT000020','盘点差错0020','2018-05-31','发现错误已经修正完成0020','GSSC000010','1'),
	('SCIT000021','盘点差错0021','2017-09-27','发现错误已经修正完成0021','GSSC000011','1'),
	('SCIT000022','盘点差错0022','2017-01-01','发现错误已经修正完成0022','GSSC000011','1'),
	('SCIT000023','盘点差错0023','2018-06-30','发现错误已经修正完成0023','GSSC000012','1'),
	('SCIT000024','盘点差错0024','2018-03-18','发现错误已经修正完成0024','GSSC000012','1'),
	('SCIT000025','盘点差错0025','2019-03-13','发现错误已经修正完成0025','GSSC000013','1'),
	('SCIT000026','盘点差错0026','2017-04-14','发现错误已经修正完成0026','GSSC000013','1'),
	('SCIT000027','盘点差错0027','2018-06-25','发现错误已经修正完成0027','GSSC000014','1'),
	('SCIT000028','盘点差错0028','2019-09-14','发现错误已经修正完成0028','GSSC000014','1'),
	('SCIT000029','盘点差错0029','2018-02-13','发现错误已经修正完成0029','GSSC000015','1'),
	('SCIT000030','盘点差错0030','2018-06-17','发现错误已经修正完成0030','GSSC000015','1'),
	('SCIT000031','盘点差错0031','2018-02-01','发现错误已经修正完成0031','GSSC000016','1'),
	('SCIT000032','盘点差错0032','2017-11-01','发现错误已经修正完成0032','GSSC000016','1');

insert into goods_allocation_data values
	('GA000001','成都龙泉驿飞鹤路20号存货区货架20号货位','40.26751085312042','131.1472457343381','GS000001','1'),
	('GA000002','成都龙泉驿飞鹤路20号存货区货架20号货位0002','40.772578127761335','132.16329207434947','GS000001','1'),
	('GA000003','成都龙泉驿飞鹤路20号存货区货架20号货位0003','40.64723375536779','130.8558844122656','GS000002','1'),
	('GA000004','成都龙泉驿飞鹤路20号存货区货架20号货位0004','39.96409424041102','130.63777470522126','GS000002','1'),
	('GA000005','成都龙泉驿飞鹤路20号存货区货架20号货位0005','40.047214967874616','131.38988652649297','GS000003','1'),
	('GA000006','成都龙泉驿飞鹤路20号存货区货架20号货位0006','42.71982804816508','129.660992494534','GS000003','1'),
	('GA000007','成都龙泉驿飞鹤路20号存货区货架20号货位0007','40.18916919173354','131.86614255810156','GS000004','1'),
	('GA000008','成都龙泉驿飞鹤路20号存货区货架20号货位0008','40.007459455124916','130.09391865782607','GS000004','1'),
	('GA000009','成都龙泉驿飞鹤路20号存货区货架20号货位0009','42.463356192763655','132.27083479123462','GS000005','1'),
	('GA000010','成都龙泉驿飞鹤路20号存货区货架20号货位0010','41.16995806978071','130.7978938425819','GS000005','1'),
	('GA000011','成都龙泉驿飞鹤路20号存货区货架20号货位0011','40.858699945046375','132.04036375572593','GS000006','1'),
	('GA000012','成都龙泉驿飞鹤路20号存货区货架20号货位0012','40.40754381898283','130.87250824154202','GS000006','1'),
	('GA000013','成都龙泉驿飞鹤路20号存货区货架20号货位0013','41.23046988356886','130.24395871797648','GS000007','1'),
	('GA000014','成都龙泉驿飞鹤路20号存货区货架20号货位0014','42.7464859675953','129.31766135404018','GS000007','1'),
	('GA000015','成都龙泉驿飞鹤路20号存货区货架20号货位0015','41.00266104720727','131.23927849864538','GS000008','1'),
	('GA000016','成都龙泉驿飞鹤路20号存货区货架20号货位0016','41.528890092620706','132.12733814091715','GS000008','1');

insert into goods_data values
	('G000001','可口可乐','RF99192','件','9','2017-09-07','S000001','RS000001','GA000001','SP000001','SS000001','TT000001','RS000001','SO000001','RSO000001',NULL,'PACKED','1'),
	('G000002','可口可乐0002','RF991920002','箱','8','2019-04-27','S000001','RS000001','GA000001','SP000001','SS000001','TT000001','RS000001','SO000001','RSO000001',NULL,'PACKED0002','1'),
	('G000003','可口可乐0003','RF991920003','件','10','2019-01-16','S000002','RS000001','GA000001','SP000001','SS000001','TT000001','RS000001','SO000001','RSO000001',NULL,'PACKED0003','1'),
	('G000004','可口可乐0004','RF991920004','箱','10','2018-08-22','S000002','RS000001','GA000001','SP000001','SS000001','TT000001','RS000001','SO000001','RSO000001',NULL,'PACKED0004','1'),
	('G000005','可口可乐0005','RF991920005','件','9','2016-11-07','S000003','RS000001','GA000001','SP000001','SS000001','TT000001','RS000001','SO000001','RSO000001',NULL,'PACKED0005','1'),
	('G000006','可口可乐0006','RF991920006','箱','10','2018-04-25','S000003','RS000001','GA000001','SP000001','SS000001','TT000001','RS000001','SO000001','RSO000001',NULL,'PACKED0006','1'),
	('G000007','可口可乐0007','RF991920007','件','9','2017-08-02','S000004','RS000001','GA000001','SP000001','SS000001','TT000001','RS000001','SO000001','RSO000001',NULL,'PACKED0007','1'),
	('G000008','可口可乐0008','RF991920008','箱','10','2017-09-21','S000004','RS000001','GA000001','SP000001','SS000001','TT000001','RS000001','SO000001','RSO000001',NULL,'PACKED0008','1'),
	('G000009','可口可乐0009','RF991920009','件','8','2018-07-07','S000005','RS000001','GA000002','SP000001','SS000001','TT000002','RS000001','SO000001','RSO000002',NULL,'PACKED0009','1'),
	('G000010','可口可乐0010','RF991920010','箱','10','2016-12-30','S000005','RS000001','GA000002','SP000001','SS000001','TT000002','RS000001','SO000001','RSO000002',NULL,'PACKED0010','1'),
	('G000011','可口可乐0011','RF991920011','件','9','2017-02-24','S000006','RS000001','GA000002','SP000001','SS000001','TT000002','RS000001','SO000001','RSO000002',NULL,'PACKED0011','1'),
	('G000012','可口可乐0012','RF991920012','箱','9','2019-08-20','S000006','RS000001','GA000002','SP000001','SS000001','TT000002','RS000001','SO000001','RSO000002',NULL,'PACKED0012','1'),
	('G000013','可口可乐0013','RF991920013','件','9','2017-08-19','S000007','RS000001','GA000002','SP000001','SS000001','TT000002','RS000001','SO000001','RSO000002',NULL,'PACKED0013','1'),
	('G000014','可口可乐0014','RF991920014','箱','10','2017-07-19','S000007','RS000001','GA000002','SP000001','SS000001','TT000002','RS000001','SO000001','RSO000002',NULL,'PACKED0014','1'),
	('G000015','可口可乐0015','RF991920015','件','10','2016-10-01','S000008','RS000001','GA000002','SP000001','SS000001','TT000002','RS000001','SO000001','RSO000002',NULL,'PACKED0015','1'),
	('G000016','可口可乐0016','RF991920016','箱','10','2018-03-15','S000008','RS000001','GA000002','SP000001','SS000001','TT000002','RS000001','SO000001','RSO000002',NULL,'PACKED0016','1'),
	('G000017','可口可乐0017','RF991920017','件','9','2019-06-18','S000009','RS000001','GA000003','SP000001','SS000001','TT000003','RS000002','SO000001','RSO000003',NULL,'PACKED0017','1'),
	('G000018','可口可乐0018','RF991920018','箱','9','2018-04-12','S000009','RS000001','GA000003','SP000001','SS000001','TT000003','RS000002','SO000001','RSO000003',NULL,'PACKED0018','1'),
	('G000019','可口可乐0019','RF991920019','件','9','2017-12-19','S000010','RS000001','GA000003','SP000001','SS000001','TT000003','RS000002','SO000001','RSO000003',NULL,'PACKED0019','1'),
	('G000020','可口可乐0020','RF991920020','箱','8','2019-04-25','S000010','RS000001','GA000003','SP000001','SS000001','TT000003','RS000002','SO000001','RSO000003',NULL,'PACKED0020','1'),
	('G000021','可口可乐0021','RF991920021','件','10','2019-01-15','S000011','RS000001','GA000003','SP000001','SS000001','TT000003','RS000002','SO000001','RSO000003',NULL,'PACKED0021','1'),
	('G000022','可口可乐0022','RF991920022','箱','9','2019-01-15','S000011','RS000001','GA000003','SP000001','SS000001','TT000003','RS000002','SO000001','RSO000003',NULL,'PACKED0022','1'),
	('G000023','可口可乐0023','RF991920023','件','8','2018-11-16','S000012','RS000001','GA000003','SP000001','SS000001','TT000003','RS000002','SO000001','RSO000003',NULL,'PACKED0023','1'),
	('G000024','可口可乐0024','RF991920024','箱','9','2018-08-13','S000012','RS000001','GA000003','SP000001','SS000001','TT000003','RS000002','SO000001','RSO000003',NULL,'PACKED0024','1'),
	('G000025','可口可乐0025','RF991920025','件','9','2016-11-17','S000013','RS000001','GA000004','SP000001','SS000001','TT000004','RS000002','SO000001','RSO000004',NULL,'PACKED0025','1'),
	('G000026','可口可乐0026','RF991920026','箱','8','2019-08-05','S000013','RS000001','GA000004','SP000001','SS000001','TT000004','RS000002','SO000001','RSO000004',NULL,'PACKED0026','1'),
	('G000027','可口可乐0027','RF991920027','件','9','2018-09-30','S000014','RS000001','GA000004','SP000001','SS000001','TT000004','RS000002','SO000001','RSO000004',NULL,'PACKED0027','1'),
	('G000028','可口可乐0028','RF991920028','箱','9','2018-06-11','S000014','RS000001','GA000004','SP000001','SS000001','TT000004','RS000002','SO000001','RSO000004',NULL,'PACKED0028','1'),
	('G000029','可口可乐0029','RF991920029','件','10','2017-11-17','S000015','RS000001','GA000004','SP000001','SS000001','TT000004','RS000002','SO000001','RSO000004',NULL,'PACKED0029','1'),
	('G000030','可口可乐0030','RF991920030','箱','8','2017-06-23','S000015','RS000001','GA000004','SP000001','SS000001','TT000004','RS000002','SO000001','RSO000004',NULL,'PACKED0030','1'),
	('G000031','可口可乐0031','RF991920031','件','9','2018-06-02','S000016','RS000001','GA000004','SP000001','SS000001','TT000004','RS000002','SO000001','RSO000004',NULL,'PACKED0031','1'),
	('G000032','可口可乐0032','RF991920032','箱','9','2017-06-12','S000016','RS000001','GA000004','SP000001','SS000001','TT000004','RS000002','SO000001','RSO000004',NULL,'PACKED0032','1'),
	('G000033','可口可乐0033','RF991920033','件','9','2018-05-23','S000017','RS000002','GA000005','SP000002','SS000002','TT000005','RS000003','SO000002','RSO000005',NULL,'PACKED0033','1'),
	('G000034','可口可乐0034','RF991920034','箱','10','2018-08-23','S000017','RS000002','GA000005','SP000002','SS000002','TT000005','RS000003','SO000002','RSO000005',NULL,'PACKED0034','1'),
	('G000035','可口可乐0035','RF991920035','件','9','2017-02-25','S000018','RS000002','GA000005','SP000002','SS000002','TT000005','RS000003','SO000002','RSO000005',NULL,'PACKED0035','1'),
	('G000036','可口可乐0036','RF991920036','箱','10','2018-01-05','S000018','RS000002','GA000005','SP000002','SS000002','TT000005','RS000003','SO000002','RSO000005',NULL,'PACKED0036','1'),
	('G000037','可口可乐0037','RF991920037','件','10','2016-12-05','S000019','RS000002','GA000005','SP000002','SS000002','TT000005','RS000003','SO000002','RSO000005',NULL,'PACKED0037','1'),
	('G000038','可口可乐0038','RF991920038','箱','9','2017-12-06','S000019','RS000002','GA000005','SP000002','SS000002','TT000005','RS000003','SO000002','RSO000005',NULL,'PACKED0038','1'),
	('G000039','可口可乐0039','RF991920039','件','8','2019-05-04','S000020','RS000002','GA000005','SP000002','SS000002','TT000005','RS000003','SO000002','RSO000005',NULL,'PACKED0039','1'),
	('G000040','可口可乐0040','RF991920040','箱','8','2019-06-05','S000020','RS000002','GA000005','SP000002','SS000002','TT000005','RS000003','SO000002','RSO000005',NULL,'PACKED0040','1'),
	('G000041','可口可乐0041','RF991920041','件','9','2018-12-13','S000021','RS000002','GA000006','SP000002','SS000002','TT000006','RS000003','SO000002','RSO000006',NULL,'PACKED0041','1'),
	('G000042','可口可乐0042','RF991920042','箱','8','2018-01-23','S000021','RS000002','GA000006','SP000002','SS000002','TT000006','RS000003','SO000002','RSO000006',NULL,'PACKED0042','1'),
	('G000043','可口可乐0043','RF991920043','件','9','2017-05-03','S000022','RS000002','GA000006','SP000002','SS000002','TT000006','RS000003','SO000002','RSO000006',NULL,'PACKED0043','1'),
	('G000044','可口可乐0044','RF991920044','箱','8','2019-05-25','S000022','RS000002','GA000006','SP000002','SS000002','TT000006','RS000003','SO000002','RSO000006',NULL,'PACKED0044','1'),
	('G000045','可口可乐0045','RF991920045','件','8','2018-09-28','S000023','RS000002','GA000006','SP000002','SS000002','TT000006','RS000003','SO000002','RSO000006',NULL,'PACKED0045','1'),
	('G000046','可口可乐0046','RF991920046','箱','9','2018-10-13','S000023','RS000002','GA000006','SP000002','SS000002','TT000006','RS000003','SO000002','RSO000006',NULL,'PACKED0046','1'),
	('G000047','可口可乐0047','RF991920047','件','9','2019-05-15','S000024','RS000002','GA000006','SP000002','SS000002','TT000006','RS000003','SO000002','RSO000006',NULL,'PACKED0047','1'),
	('G000048','可口可乐0048','RF991920048','箱','8','2017-05-10','S000024','RS000002','GA000006','SP000002','SS000002','TT000006','RS000003','SO000002','RSO000006',NULL,'PACKED0048','1'),
	('G000049','可口可乐0049','RF991920049','件','10','2017-04-08','S000025','RS000002','GA000007','SP000002','SS000002','TT000007','RS000004','SO000002','RSO000007',NULL,'PACKED0049','1'),
	('G000050','可口可乐0050','RF991920050','箱','8','2019-05-20','S000025','RS000002','GA000007','SP000002','SS000002','TT000007','RS000004','SO000002','RSO000007',NULL,'PACKED0050','1'),
	('G000051','可口可乐0051','RF991920051','件','8','2018-03-29','S000026','RS000002','GA000007','SP000002','SS000002','TT000007','RS000004','SO000002','RSO000007',NULL,'PACKED0051','1'),
	('G000052','可口可乐0052','RF991920052','箱','10','2019-09-12','S000026','RS000002','GA000007','SP000002','SS000002','TT000007','RS000004','SO000002','RSO000007',NULL,'PACKED0052','1'),
	('G000053','可口可乐0053','RF991920053','件','10','2018-07-30','S000027','RS000002','GA000007','SP000002','SS000002','TT000007','RS000004','SO000002','RSO000007',NULL,'PACKED0053','1'),
	('G000054','可口可乐0054','RF991920054','箱','9','2018-08-14','S000027','RS000002','GA000007','SP000002','SS000002','TT000007','RS000004','SO000002','RSO000007',NULL,'PACKED0054','1'),
	('G000055','可口可乐0055','RF991920055','件','8','2019-04-05','S000028','RS000002','GA000007','SP000002','SS000002','TT000007','RS000004','SO000002','RSO000007',NULL,'PACKED0055','1'),
	('G000056','可口可乐0056','RF991920056','箱','10','2017-11-03','S000028','RS000002','GA000007','SP000002','SS000002','TT000007','RS000004','SO000002','RSO000007',NULL,'PACKED0056','1'),
	('G000057','可口可乐0057','RF991920057','件','9','2017-02-08','S000029','RS000002','GA000008','SP000002','SS000002','TT000008','RS000004','SO000002','RSO000008',NULL,'PACKED0057','1'),
	('G000058','可口可乐0058','RF991920058','箱','9','2017-10-29','S000029','RS000002','GA000008','SP000002','SS000002','TT000008','RS000004','SO000002','RSO000008',NULL,'PACKED0058','1'),
	('G000059','可口可乐0059','RF991920059','件','8','2018-09-05','S000030','RS000002','GA000008','SP000002','SS000002','TT000008','RS000004','SO000002','RSO000008',NULL,'PACKED0059','1'),
	('G000060','可口可乐0060','RF991920060','箱','10','2018-10-11','S000030','RS000002','GA000008','SP000002','SS000002','TT000008','RS000004','SO000002','RSO000008',NULL,'PACKED0060','1'),
	('G000061','可口可乐0061','RF991920061','件','8','2018-12-12','S000031','RS000002','GA000008','SP000002','SS000002','TT000008','RS000004','SO000002','RSO000008',NULL,'PACKED0061','1'),
	('G000062','可口可乐0062','RF991920062','箱','8','2018-10-03','S000031','RS000002','GA000008','SP000002','SS000002','TT000008','RS000004','SO000002','RSO000008',NULL,'PACKED0062','1'),
	('G000063','可口可乐0063','RF991920063','件','8','2019-07-14','S000032','RS000002','GA000008','SP000002','SS000002','TT000008','RS000004','SO000002','RSO000008',NULL,'PACKED0063','1'),
	('G000064','可口可乐0064','RF991920064','箱','9','2019-06-30','S000032','RS000002','GA000008','SP000002','SS000002','TT000008','RS000004','SO000002','RSO000008',NULL,'PACKED0064','1'),
	('G000065','可口可乐0065','RF991920065','件','9','2017-12-17','S000033','RS000003','GA000009','SP000003','SS000003','TT000009','RS000005','SO000003','RSO000009',NULL,'PACKED0065','1'),
	('G000066','可口可乐0066','RF991920066','箱','9','2017-05-20','S000033','RS000003','GA000009','SP000003','SS000003','TT000009','RS000005','SO000003','RSO000009',NULL,'PACKED0066','1'),
	('G000067','可口可乐0067','RF991920067','件','10','2019-08-22','S000034','RS000003','GA000009','SP000003','SS000003','TT000009','RS000005','SO000003','RSO000009',NULL,'PACKED0067','1'),
	('G000068','可口可乐0068','RF991920068','箱','10','2018-06-18','S000034','RS000003','GA000009','SP000003','SS000003','TT000009','RS000005','SO000003','RSO000009',NULL,'PACKED0068','1'),
	('G000069','可口可乐0069','RF991920069','件','9','2019-04-12','S000035','RS000003','GA000009','SP000003','SS000003','TT000009','RS000005','SO000003','RSO000009',NULL,'PACKED0069','1'),
	('G000070','可口可乐0070','RF991920070','箱','9','2016-10-09','S000035','RS000003','GA000009','SP000003','SS000003','TT000009','RS000005','SO000003','RSO000009',NULL,'PACKED0070','1'),
	('G000071','可口可乐0071','RF991920071','件','8','2018-03-22','S000036','RS000003','GA000009','SP000003','SS000003','TT000009','RS000005','SO000003','RSO000009',NULL,'PACKED0071','1'),
	('G000072','可口可乐0072','RF991920072','箱','10','2017-01-13','S000036','RS000003','GA000009','SP000003','SS000003','TT000009','RS000005','SO000003','RSO000009',NULL,'PACKED0072','1'),
	('G000073','可口可乐0073','RF991920073','件','9','2017-08-02','S000037','RS000003','GA000010','SP000003','SS000003','TT000010','RS000005','SO000003','RSO000010',NULL,'PACKED0073','1'),
	('G000074','可口可乐0074','RF991920074','箱','9','2019-09-13','S000037','RS000003','GA000010','SP000003','SS000003','TT000010','RS000005','SO000003','RSO000010',NULL,'PACKED0074','1'),
	('G000075','可口可乐0075','RF991920075','件','9','2019-05-03','S000038','RS000003','GA000010','SP000003','SS000003','TT000010','RS000005','SO000003','RSO000010',NULL,'PACKED0075','1'),
	('G000076','可口可乐0076','RF991920076','箱','9','2018-06-14','S000038','RS000003','GA000010','SP000003','SS000003','TT000010','RS000005','SO000003','RSO000010',NULL,'PACKED0076','1'),
	('G000077','可口可乐0077','RF991920077','件','8','2018-03-17','S000039','RS000003','GA000010','SP000003','SS000003','TT000010','RS000005','SO000003','RSO000010',NULL,'PACKED0077','1'),
	('G000078','可口可乐0078','RF991920078','箱','9','2019-08-22','S000039','RS000003','GA000010','SP000003','SS000003','TT000010','RS000005','SO000003','RSO000010',NULL,'PACKED0078','1'),
	('G000079','可口可乐0079','RF991920079','件','9','2017-02-12','S000040','RS000003','GA000010','SP000003','SS000003','TT000010','RS000005','SO000003','RSO000010',NULL,'PACKED0079','1'),
	('G000080','可口可乐0080','RF991920080','箱','8','2017-11-03','S000040','RS000003','GA000010','SP000003','SS000003','TT000010','RS000005','SO000003','RSO000010',NULL,'PACKED0080','1'),
	('G000081','可口可乐0081','RF991920081','件','10','2018-12-02','S000041','RS000003','GA000011','SP000003','SS000003','TT000011','RS000006','SO000003','RSO000011',NULL,'PACKED0081','1'),
	('G000082','可口可乐0082','RF991920082','箱','9','2018-04-23','S000041','RS000003','GA000011','SP000003','SS000003','TT000011','RS000006','SO000003','RSO000011',NULL,'PACKED0082','1'),
	('G000083','可口可乐0083','RF991920083','件','10','2017-07-07','S000042','RS000003','GA000011','SP000003','SS000003','TT000011','RS000006','SO000003','RSO000011',NULL,'PACKED0083','1'),
	('G000084','可口可乐0084','RF991920084','箱','10','2019-05-17','S000042','RS000003','GA000011','SP000003','SS000003','TT000011','RS000006','SO000003','RSO000011',NULL,'PACKED0084','1'),
	('G000085','可口可乐0085','RF991920085','件','9','2017-12-27','S000043','RS000003','GA000011','SP000003','SS000003','TT000011','RS000006','SO000003','RSO000011',NULL,'PACKED0085','1'),
	('G000086','可口可乐0086','RF991920086','箱','9','2017-11-21','S000043','RS000003','GA000011','SP000003','SS000003','TT000011','RS000006','SO000003','RSO000011',NULL,'PACKED0086','1'),
	('G000087','可口可乐0087','RF991920087','件','8','2017-01-03','S000044','RS000003','GA000011','SP000003','SS000003','TT000011','RS000006','SO000003','RSO000011',NULL,'PACKED0087','1'),
	('G000088','可口可乐0088','RF991920088','箱','9','2018-06-11','S000044','RS000003','GA000011','SP000003','SS000003','TT000011','RS000006','SO000003','RSO000011',NULL,'PACKED0088','1'),
	('G000089','可口可乐0089','RF991920089','件','10','2018-11-11','S000045','RS000003','GA000012','SP000003','SS000003','TT000012','RS000006','SO000003','RSO000012',NULL,'PACKED0089','1'),
	('G000090','可口可乐0090','RF991920090','箱','10','2017-08-13','S000045','RS000003','GA000012','SP000003','SS000003','TT000012','RS000006','SO000003','RSO000012',NULL,'PACKED0090','1'),
	('G000091','可口可乐0091','RF991920091','件','8','2018-07-03','S000046','RS000003','GA000012','SP000003','SS000003','TT000012','RS000006','SO000003','RSO000012',NULL,'PACKED0091','1'),
	('G000092','可口可乐0092','RF991920092','箱','10','2019-07-29','S000046','RS000003','GA000012','SP000003','SS000003','TT000012','RS000006','SO000003','RSO000012',NULL,'PACKED0092','1'),
	('G000093','可口可乐0093','RF991920093','件','8','2017-07-11','S000047','RS000003','GA000012','SP000003','SS000003','TT000012','RS000006','SO000003','RSO000012',NULL,'PACKED0093','1'),
	('G000094','可口可乐0094','RF991920094','箱','9','2018-05-02','S000047','RS000003','GA000012','SP000003','SS000003','TT000012','RS000006','SO000003','RSO000012',NULL,'PACKED0094','1'),
	('G000095','可口可乐0095','RF991920095','件','10','2018-05-27','S000048','RS000003','GA000012','SP000003','SS000003','TT000012','RS000006','SO000003','RSO000012',NULL,'PACKED0095','1'),
	('G000096','可口可乐0096','RF991920096','箱','8','2017-06-04','S000048','RS000003','GA000012','SP000003','SS000003','TT000012','RS000006','SO000003','RSO000012',NULL,'PACKED0096','1'),
	('G000097','可口可乐0097','RF991920097','件','8','2019-06-06','S000049','RS000004','GA000013','SP000004','SS000004','TT000013','RS000007','SO000004','RSO000013',NULL,'PACKED0097','1'),
	('G000098','可口可乐0098','RF991920098','箱','10','2018-03-27','S000049','RS000004','GA000013','SP000004','SS000004','TT000013','RS000007','SO000004','RSO000013',NULL,'PACKED0098','1'),
	('G000099','可口可乐0099','RF991920099','件','8','2019-07-04','S000050','RS000004','GA000013','SP000004','SS000004','TT000013','RS000007','SO000004','RSO000013',NULL,'PACKED0099','1'),
	('G000100','可口可乐0100','RF991920100','箱','10','2019-01-16','S000050','RS000004','GA000013','SP000004','SS000004','TT000013','RS000007','SO000004','RSO000013',NULL,'PACKED0100','1'),
	('G000101','可口可乐0101','RF991920101','件','10','2019-07-10','S000051','RS000004','GA000013','SP000004','SS000004','TT000013','RS000007','SO000004','RSO000013',NULL,'PACKED0101','1'),
	('G000102','可口可乐0102','RF991920102','箱','8','2016-11-11','S000051','RS000004','GA000013','SP000004','SS000004','TT000013','RS000007','SO000004','RSO000013',NULL,'PACKED0102','1'),
	('G000103','可口可乐0103','RF991920103','件','8','2017-04-10','S000052','RS000004','GA000013','SP000004','SS000004','TT000013','RS000007','SO000004','RSO000013',NULL,'PACKED0103','1'),
	('G000104','可口可乐0104','RF991920104','箱','10','2018-04-15','S000052','RS000004','GA000013','SP000004','SS000004','TT000013','RS000007','SO000004','RSO000013',NULL,'PACKED0104','1'),
	('G000105','可口可乐0105','RF991920105','件','8','2017-10-12','S000053','RS000004','GA000014','SP000004','SS000004','TT000014','RS000007','SO000004','RSO000014',NULL,'PACKED0105','1'),
	('G000106','可口可乐0106','RF991920106','箱','9','2018-02-11','S000053','RS000004','GA000014','SP000004','SS000004','TT000014','RS000007','SO000004','RSO000014',NULL,'PACKED0106','1'),
	('G000107','可口可乐0107','RF991920107','件','8','2018-08-19','S000054','RS000004','GA000014','SP000004','SS000004','TT000014','RS000007','SO000004','RSO000014',NULL,'PACKED0107','1'),
	('G000108','可口可乐0108','RF991920108','箱','9','2017-01-21','S000054','RS000004','GA000014','SP000004','SS000004','TT000014','RS000007','SO000004','RSO000014',NULL,'PACKED0108','1'),
	('G000109','可口可乐0109','RF991920109','件','8','2017-04-08','S000055','RS000004','GA000014','SP000004','SS000004','TT000014','RS000007','SO000004','RSO000014',NULL,'PACKED0109','1'),
	('G000110','可口可乐0110','RF991920110','箱','9','2017-10-18','S000055','RS000004','GA000014','SP000004','SS000004','TT000014','RS000007','SO000004','RSO000014',NULL,'PACKED0110','1'),
	('G000111','可口可乐0111','RF991920111','件','8','2018-04-11','S000056','RS000004','GA000014','SP000004','SS000004','TT000014','RS000007','SO000004','RSO000014',NULL,'PACKED0111','1'),
	('G000112','可口可乐0112','RF991920112','箱','10','2017-09-23','S000056','RS000004','GA000014','SP000004','SS000004','TT000014','RS000007','SO000004','RSO000014',NULL,'PACKED0112','1'),
	('G000113','可口可乐0113','RF991920113','件','10','2018-08-14','S000057','RS000004','GA000015','SP000004','SS000004','TT000015','RS000008','SO000004','RSO000015',NULL,'PACKED0113','1'),
	('G000114','可口可乐0114','RF991920114','箱','8','2018-12-27','S000057','RS000004','GA000015','SP000004','SS000004','TT000015','RS000008','SO000004','RSO000015',NULL,'PACKED0114','1'),
	('G000115','可口可乐0115','RF991920115','件','8','2017-03-16','S000058','RS000004','GA000015','SP000004','SS000004','TT000015','RS000008','SO000004','RSO000015',NULL,'PACKED0115','1'),
	('G000116','可口可乐0116','RF991920116','箱','8','2016-12-23','S000058','RS000004','GA000015','SP000004','SS000004','TT000015','RS000008','SO000004','RSO000015',NULL,'PACKED0116','1'),
	('G000117','可口可乐0117','RF991920117','件','9','2019-07-05','S000059','RS000004','GA000015','SP000004','SS000004','TT000015','RS000008','SO000004','RSO000015',NULL,'PACKED0117','1'),
	('G000118','可口可乐0118','RF991920118','箱','8','2017-04-11','S000059','RS000004','GA000015','SP000004','SS000004','TT000015','RS000008','SO000004','RSO000015',NULL,'PACKED0118','1'),
	('G000119','可口可乐0119','RF991920119','件','8','2018-12-17','S000060','RS000004','GA000015','SP000004','SS000004','TT000015','RS000008','SO000004','RSO000015',NULL,'PACKED0119','1'),
	('G000120','可口可乐0120','RF991920120','箱','8','2016-11-06','S000060','RS000004','GA000015','SP000004','SS000004','TT000015','RS000008','SO000004','RSO000015',NULL,'PACKED0120','1'),
	('G000121','可口可乐0121','RF991920121','件','8','2019-06-12','S000061','RS000004','GA000016','SP000004','SS000004','TT000016','RS000008','SO000004','RSO000016',NULL,'PACKED0121','1'),
	('G000122','可口可乐0122','RF991920122','箱','8','2018-08-07','S000061','RS000004','GA000016','SP000004','SS000004','TT000016','RS000008','SO000004','RSO000016',NULL,'PACKED0122','1'),
	('G000123','可口可乐0123','RF991920123','件','9','2017-10-07','S000062','RS000004','GA000016','SP000004','SS000004','TT000016','RS000008','SO000004','RSO000016',NULL,'PACKED0123','1'),
	('G000124','可口可乐0124','RF991920124','箱','10','2018-10-06','S000062','RS000004','GA000016','SP000004','SS000004','TT000016','RS000008','SO000004','RSO000016',NULL,'PACKED0124','1'),
	('G000125','可口可乐0125','RF991920125','件','8','2018-12-27','S000063','RS000004','GA000016','SP000004','SS000004','TT000016','RS000008','SO000004','RSO000016',NULL,'PACKED0125','1'),
	('G000126','可口可乐0126','RF991920126','箱','9','2018-03-31','S000063','RS000004','GA000016','SP000004','SS000004','TT000016','RS000008','SO000004','RSO000016',NULL,'PACKED0126','1'),
	('G000127','可口可乐0127','RF991920127','件','8','2017-07-07','S000064','RS000004','GA000016','SP000004','SS000004','TT000016','RS000008','SO000004','RSO000016',NULL,'PACKED0127','1'),
	('G000128','可口可乐0128','RF991920128','箱','10','2017-10-30','S000064','RS000004','GA000016','SP000004','SS000004','TT000016','RS000008','SO000004','RSO000016',NULL,'PACKED0128','1');

insert into goods_packaging_data values
	('GP000001','王煜东','RF99192','2019-06-26','打包完成，准备起运','1');

insert into goods_movement_data values
	('GM000001','2019-09-05 20:17:19','仓库货位','仓库货位','192.168.20.1','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B405','FTYUIOLJYT^*(PLKJYT)','41.64118560654294','129.84869048060713','G000001','1'),
	('GM000002','2019-09-04 06:59:07','卡车','卡车','192.168.20.10002','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050002','FTYUIOLJYT^*(PLKJYT)0002','42.44600830944341','131.42904699180815','G000001','1'),
	('GM000003','2019-09-08 23:29:47','小超','小超','192.168.20.10003','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050003','FTYUIOLJYT^*(PLKJYT)0003','41.854443587930504','129.63309383903206','G000002','1'),
	('GM000004','2019-09-08 13:03:13','仓库货位','仓库货位','192.168.20.10004','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050004','FTYUIOLJYT^*(PLKJYT)0004','41.528141113882825','130.41994557313961','G000002','1'),
	('GM000005','2019-09-07 12:49:00','卡车','卡车','192.168.20.10005','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050005','FTYUIOLJYT^*(PLKJYT)0005','42.74757001741025','132.0506088872427','G000003','1'),
	('GM000006','2019-09-12 08:25:27','小超','小超','192.168.20.10006','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050006','FTYUIOLJYT^*(PLKJYT)0006','40.90901692552103','130.79428469994716','G000003','1'),
	('GM000007','2019-09-13 20:44:51','仓库货位','仓库货位','192.168.20.10007','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050007','FTYUIOLJYT^*(PLKJYT)0007','40.03522118689431','130.20425593624208','G000004','1'),
	('GM000008','2019-09-08 06:31:15','卡车','卡车','192.168.20.10008','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050008','FTYUIOLJYT^*(PLKJYT)0008','40.55689708117029','131.70829098827065','G000004','1'),
	('GM000009','2019-09-11 12:34:21','小超','小超','192.168.20.10009','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050009','FTYUIOLJYT^*(PLKJYT)0009','40.61704261759842','130.64299448104663','G000005','1'),
	('GM000010','2019-08-28 18:49:05','仓库货位','仓库货位','192.168.20.10010','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050010','FTYUIOLJYT^*(PLKJYT)0010','39.89893377462293','131.3637400107457','G000005','1'),
	('GM000011','2019-09-13 19:41:08','卡车','卡车','192.168.20.10011','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050011','FTYUIOLJYT^*(PLKJYT)0011','42.69255621562398','129.6280199695531','G000006','1'),
	('GM000012','2019-09-08 05:30:03','小超','小超','192.168.20.10012','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050012','FTYUIOLJYT^*(PLKJYT)0012','41.65662517982525','130.85270846484298','G000006','1'),
	('GM000013','2019-08-27 14:41:56','仓库货位','仓库货位','192.168.20.10013','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050013','FTYUIOLJYT^*(PLKJYT)0013','40.29859790886019','130.90219420764518','G000007','1'),
	('GM000014','2019-08-27 15:15:51','卡车','卡车','192.168.20.10014','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050014','FTYUIOLJYT^*(PLKJYT)0014','42.3414286776149','130.4809792330146','G000007','1'),
	('GM000015','2019-09-06 10:05:49','小超','小超','192.168.20.10015','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050015','FTYUIOLJYT^*(PLKJYT)0015','40.3370656816539','132.042346917913','G000008','1'),
	('GM000016','2019-09-12 18:36:25','仓库货位','仓库货位','192.168.20.10016','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050016','FTYUIOLJYT^*(PLKJYT)0016','40.475765393342215','129.91475208725168','G000008','1'),
	('GM000017','2019-09-13 03:51:32','卡车','卡车','192.168.20.10017','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050017','FTYUIOLJYT^*(PLKJYT)0017','40.859494186157846','130.66205256496795','G000009','1'),
	('GM000018','2019-09-13 01:25:50','小超','小超','192.168.20.10018','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050018','FTYUIOLJYT^*(PLKJYT)0018','40.61178522540582','130.51621516960702','G000009','1'),
	('GM000019','2019-09-01 17:22:25','仓库货位','仓库货位','192.168.20.10019','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050019','FTYUIOLJYT^*(PLKJYT)0019','40.03595043155722','130.23461573196147','G000010','1'),
	('GM000020','2019-09-10 08:11:48','卡车','卡车','192.168.20.10020','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050020','FTYUIOLJYT^*(PLKJYT)0020','41.61686571303746','131.1795407975262','G000010','1'),
	('GM000021','2019-09-01 18:53:51','小超','小超','192.168.20.10021','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050021','FTYUIOLJYT^*(PLKJYT)0021','42.295461869651156','130.45736413124044','G000011','1'),
	('GM000022','2019-08-30 03:51:44','仓库货位','仓库货位','192.168.20.10022','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050022','FTYUIOLJYT^*(PLKJYT)0022','41.42521988770891','130.5052650217577','G000011','1'),
	('GM000023','2019-09-09 13:42:40','卡车','卡车','192.168.20.10023','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050023','FTYUIOLJYT^*(PLKJYT)0023','40.97330015514851','130.29202621202046','G000012','1'),
	('GM000024','2019-08-28 05:38:39','小超','小超','192.168.20.10024','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050024','FTYUIOLJYT^*(PLKJYT)0024','41.79165667828734','129.3661844285827','G000012','1'),
	('GM000025','2019-09-13 23:45:50','仓库货位','仓库货位','192.168.20.10025','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050025','FTYUIOLJYT^*(PLKJYT)0025','41.529717568516155','129.3331811481062','G000013','1'),
	('GM000026','2019-08-30 02:39:36','卡车','卡车','192.168.20.10026','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050026','FTYUIOLJYT^*(PLKJYT)0026','40.87704974139441','131.13338627064377','G000013','1'),
	('GM000027','2019-08-29 10:05:54','小超','小超','192.168.20.10027','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050027','FTYUIOLJYT^*(PLKJYT)0027','42.561071813813975','130.79683843166606','G000014','1'),
	('GM000028','2019-09-15 23:21:54','仓库货位','仓库货位','192.168.20.10028','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050028','FTYUIOLJYT^*(PLKJYT)0028','40.92414534681809','131.3114597364216','G000014','1'),
	('GM000029','2019-09-03 14:49:38','卡车','卡车','192.168.20.10029','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050029','FTYUIOLJYT^*(PLKJYT)0029','40.15669734473286','130.33160222181877','G000015','1'),
	('GM000030','2019-09-04 19:45:41','小超','小超','192.168.20.10030','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050030','FTYUIOLJYT^*(PLKJYT)0030','40.6038074531722','131.04510094023095','G000015','1'),
	('GM000031','2019-08-29 09:49:26','仓库货位','仓库货位','192.168.20.10031','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050031','FTYUIOLJYT^*(PLKJYT)0031','41.365542910971044','130.26118237999646','G000016','1'),
	('GM000032','2019-08-30 19:49:54','卡车','卡车','192.168.20.10032','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050032','FTYUIOLJYT^*(PLKJYT)0032','39.91062254368526','130.326108182159','G000016','1'),
	('GM000033','2019-09-16 11:03:26','小超','小超','192.168.20.10033','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050033','FTYUIOLJYT^*(PLKJYT)0033','40.03075974376618','131.82294339271039','G000017','1'),
	('GM000034','2019-09-10 18:27:59','仓库货位','仓库货位','192.168.20.10034','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050034','FTYUIOLJYT^*(PLKJYT)0034','41.9260532333772','130.3742023928919','G000017','1'),
	('GM000035','2019-09-05 18:33:50','卡车','卡车','192.168.20.10035','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050035','FTYUIOLJYT^*(PLKJYT)0035','40.88650074866854','130.10456773998874','G000018','1'),
	('GM000036','2019-08-30 03:07:22','小超','小超','192.168.20.10036','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050036','FTYUIOLJYT^*(PLKJYT)0036','40.33824887371377','131.1643381715336','G000018','1'),
	('GM000037','2019-09-16 05:15:34','仓库货位','仓库货位','192.168.20.10037','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050037','FTYUIOLJYT^*(PLKJYT)0037','41.650694697420015','129.65971599176808','G000019','1'),
	('GM000038','2019-09-08 18:38:02','卡车','卡车','192.168.20.10038','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050038','FTYUIOLJYT^*(PLKJYT)0038','39.87952854006082','130.70747805942383','G000019','1'),
	('GM000039','2019-08-26 16:12:25','小超','小超','192.168.20.10039','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050039','FTYUIOLJYT^*(PLKJYT)0039','39.905141472617','131.24187480795982','G000020','1'),
	('GM000040','2019-09-12 21:24:32','仓库货位','仓库货位','192.168.20.10040','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050040','FTYUIOLJYT^*(PLKJYT)0040','40.71290969585826','130.19457360998155','G000020','1'),
	('GM000041','2019-09-12 03:14:44','卡车','卡车','192.168.20.10041','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050041','FTYUIOLJYT^*(PLKJYT)0041','40.54771093016747','129.59960788131085','G000021','1'),
	('GM000042','2019-09-11 06:20:11','小超','小超','192.168.20.10042','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050042','FTYUIOLJYT^*(PLKJYT)0042','42.24344898998152','131.42126324924172','G000021','1'),
	('GM000043','2019-08-28 19:03:51','仓库货位','仓库货位','192.168.20.10043','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050043','FTYUIOLJYT^*(PLKJYT)0043','41.70161199529541','131.27050258246172','G000022','1'),
	('GM000044','2019-09-01 02:50:14','卡车','卡车','192.168.20.10044','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050044','FTYUIOLJYT^*(PLKJYT)0044','42.65230177417585','129.91320481515837','G000022','1'),
	('GM000045','2019-09-12 03:29:01','小超','小超','192.168.20.10045','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050045','FTYUIOLJYT^*(PLKJYT)0045','40.5476586164862','129.56768957485158','G000023','1'),
	('GM000046','2019-09-12 16:17:41','仓库货位','仓库货位','192.168.20.10046','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050046','FTYUIOLJYT^*(PLKJYT)0046','42.03312786396131','131.4617816967427','G000023','1'),
	('GM000047','2019-09-16 08:21:26','卡车','卡车','192.168.20.10047','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050047','FTYUIOLJYT^*(PLKJYT)0047','40.934340151109495','131.32250286802952','G000024','1'),
	('GM000048','2019-08-31 16:29:42','小超','小超','192.168.20.10048','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050048','FTYUIOLJYT^*(PLKJYT)0048','40.061738662194465','129.4030554229972','G000024','1'),
	('GM000049','2019-08-26 12:25:14','仓库货位','仓库货位','192.168.20.10049','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050049','FTYUIOLJYT^*(PLKJYT)0049','40.84758294041753','130.108339834194','G000025','1'),
	('GM000050','2019-09-13 17:19:33','卡车','卡车','192.168.20.10050','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050050','FTYUIOLJYT^*(PLKJYT)0050','41.43877398927375','132.17831052058844','G000025','1'),
	('GM000051','2019-08-30 14:18:34','小超','小超','192.168.20.10051','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050051','FTYUIOLJYT^*(PLKJYT)0051','42.370758537977935','129.8809226392201','G000026','1'),
	('GM000052','2019-08-28 12:55:31','仓库货位','仓库货位','192.168.20.10052','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050052','FTYUIOLJYT^*(PLKJYT)0052','41.52793424561221','131.70449132742138','G000026','1'),
	('GM000053','2019-08-27 09:28:41','卡车','卡车','192.168.20.10053','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050053','FTYUIOLJYT^*(PLKJYT)0053','40.32228743910597','129.81390803546347','G000027','1'),
	('GM000054','2019-09-09 02:31:09','小超','小超','192.168.20.10054','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050054','FTYUIOLJYT^*(PLKJYT)0054','39.86320339736546','130.76254546667425','G000027','1'),
	('GM000055','2019-09-10 06:22:02','仓库货位','仓库货位','192.168.20.10055','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050055','FTYUIOLJYT^*(PLKJYT)0055','40.96273843132921','132.24923042875383','G000028','1'),
	('GM000056','2019-08-30 08:39:13','卡车','卡车','192.168.20.10056','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050056','FTYUIOLJYT^*(PLKJYT)0056','41.04004864341897','131.33956007969584','G000028','1'),
	('GM000057','2019-08-27 05:55:07','小超','小超','192.168.20.10057','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050057','FTYUIOLJYT^*(PLKJYT)0057','40.35842286778735','129.60990498116956','G000029','1'),
	('GM000058','2019-09-09 05:43:13','仓库货位','仓库货位','192.168.20.10058','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050058','FTYUIOLJYT^*(PLKJYT)0058','42.538354211861126','131.1981275980389','G000029','1'),
	('GM000059','2019-08-29 17:03:46','卡车','卡车','192.168.20.10059','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050059','FTYUIOLJYT^*(PLKJYT)0059','40.97001205341431','131.9085961578422','G000030','1'),
	('GM000060','2019-08-30 17:54:54','小超','小超','192.168.20.10060','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050060','FTYUIOLJYT^*(PLKJYT)0060','41.67755235116192','129.40825680253778','G000030','1'),
	('GM000061','2019-08-27 18:32:44','仓库货位','仓库货位','192.168.20.10061','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050061','FTYUIOLJYT^*(PLKJYT)0061','41.80170454122373','129.52553647037243','G000031','1'),
	('GM000062','2019-09-06 17:20:08','卡车','卡车','192.168.20.10062','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050062','FTYUIOLJYT^*(PLKJYT)0062','40.18389179042141','130.3811286069035','G000031','1'),
	('GM000063','2019-09-03 21:22:27','小超','小超','192.168.20.10063','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050063','FTYUIOLJYT^*(PLKJYT)0063','39.951071035020625','129.69994675004344','G000032','1'),
	('GM000064','2019-09-08 05:30:28','仓库货位','仓库货位','192.168.20.10064','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050064','FTYUIOLJYT^*(PLKJYT)0064','40.09099003122168','130.76097640946105','G000032','1'),
	('GM000065','2019-08-29 04:08:23','卡车','卡车','192.168.20.10065','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050065','FTYUIOLJYT^*(PLKJYT)0065','41.29719434969426','130.98366826575125','G000033','1'),
	('GM000066','2019-09-10 14:40:38','小超','小超','192.168.20.10066','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050066','FTYUIOLJYT^*(PLKJYT)0066','40.31084038203895','131.23537758252337','G000033','1'),
	('GM000067','2019-09-13 01:58:38','仓库货位','仓库货位','192.168.20.10067','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050067','FTYUIOLJYT^*(PLKJYT)0067','42.46349067786642','131.6261143596548','G000034','1'),
	('GM000068','2019-09-04 00:35:33','卡车','卡车','192.168.20.10068','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050068','FTYUIOLJYT^*(PLKJYT)0068','40.4444969352194','131.74242228425894','G000034','1'),
	('GM000069','2019-09-06 02:27:13','小超','小超','192.168.20.10069','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050069','FTYUIOLJYT^*(PLKJYT)0069','40.403172304074786','130.70583358326707','G000035','1'),
	('GM000070','2019-09-01 00:39:45','仓库货位','仓库货位','192.168.20.10070','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050070','FTYUIOLJYT^*(PLKJYT)0070','42.06907484778621','132.2158482676653','G000035','1'),
	('GM000071','2019-09-12 17:28:58','卡车','卡车','192.168.20.10071','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050071','FTYUIOLJYT^*(PLKJYT)0071','40.24434102136021','132.08404556913231','G000036','1'),
	('GM000072','2019-08-31 01:55:24','小超','小超','192.168.20.10072','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050072','FTYUIOLJYT^*(PLKJYT)0072','39.9879455120773','130.89970093832417','G000036','1'),
	('GM000073','2019-09-13 12:04:28','仓库货位','仓库货位','192.168.20.10073','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050073','FTYUIOLJYT^*(PLKJYT)0073','42.365956788915376','132.04566805112967','G000037','1'),
	('GM000074','2019-08-29 19:37:39','卡车','卡车','192.168.20.10074','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050074','FTYUIOLJYT^*(PLKJYT)0074','40.989655619406335','130.56891203984313','G000037','1'),
	('GM000075','2019-09-10 10:01:47','小超','小超','192.168.20.10075','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050075','FTYUIOLJYT^*(PLKJYT)0075','40.47630512770052','130.50793550331213','G000038','1'),
	('GM000076','2019-08-29 11:39:20','仓库货位','仓库货位','192.168.20.10076','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050076','FTYUIOLJYT^*(PLKJYT)0076','42.581872528532834','131.8510454420442','G000038','1'),
	('GM000077','2019-09-04 20:55:58','卡车','卡车','192.168.20.10077','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050077','FTYUIOLJYT^*(PLKJYT)0077','40.356119266166836','131.9381816140637','G000039','1'),
	('GM000078','2019-08-28 23:57:58','小超','小超','192.168.20.10078','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050078','FTYUIOLJYT^*(PLKJYT)0078','40.58138805785236','131.10009712218175','G000039','1'),
	('GM000079','2019-09-02 03:39:49','仓库货位','仓库货位','192.168.20.10079','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050079','FTYUIOLJYT^*(PLKJYT)0079','41.48633738655499','131.73130307767855','G000040','1'),
	('GM000080','2019-09-11 09:29:11','卡车','卡车','192.168.20.10080','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050080','FTYUIOLJYT^*(PLKJYT)0080','40.30986140452504','131.22156975298145','G000040','1'),
	('GM000081','2019-09-16 06:52:53','小超','小超','192.168.20.10081','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050081','FTYUIOLJYT^*(PLKJYT)0081','40.28587444373859','130.68254726845086','G000041','1'),
	('GM000082','2019-09-02 18:36:16','仓库货位','仓库货位','192.168.20.10082','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050082','FTYUIOLJYT^*(PLKJYT)0082','42.505635287555606','131.98808091929578','G000041','1'),
	('GM000083','2019-09-14 03:45:19','卡车','卡车','192.168.20.10083','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050083','FTYUIOLJYT^*(PLKJYT)0083','41.87115522152163','131.859417165582','G000042','1'),
	('GM000084','2019-09-02 07:05:36','小超','小超','192.168.20.10084','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050084','FTYUIOLJYT^*(PLKJYT)0084','39.78082646522059','132.16866707059256','G000042','1'),
	('GM000085','2019-09-01 06:22:19','仓库货位','仓库货位','192.168.20.10085','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050085','FTYUIOLJYT^*(PLKJYT)0085','40.053013897525524','130.46261420318874','G000043','1'),
	('GM000086','2019-09-06 09:36:24','卡车','卡车','192.168.20.10086','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050086','FTYUIOLJYT^*(PLKJYT)0086','40.97431294175641','130.37797845535064','G000043','1'),
	('GM000087','2019-09-04 16:43:08','小超','小超','192.168.20.10087','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050087','FTYUIOLJYT^*(PLKJYT)0087','40.597567696342566','130.0831363953624','G000044','1'),
	('GM000088','2019-09-16 02:11:40','仓库货位','仓库货位','192.168.20.10088','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050088','FTYUIOLJYT^*(PLKJYT)0088','40.847670530723015','130.5421276325236','G000044','1'),
	('GM000089','2019-09-14 08:51:56','卡车','卡车','192.168.20.10089','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050089','FTYUIOLJYT^*(PLKJYT)0089','40.18858628134425','130.85212255675913','G000045','1'),
	('GM000090','2019-08-31 22:04:36','小超','小超','192.168.20.10090','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050090','FTYUIOLJYT^*(PLKJYT)0090','40.093141841011224','131.0875751727849','G000045','1'),
	('GM000091','2019-09-14 02:04:13','仓库货位','仓库货位','192.168.20.10091','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050091','FTYUIOLJYT^*(PLKJYT)0091','40.08560711984306','130.66112089838234','G000046','1'),
	('GM000092','2019-09-07 18:55:10','卡车','卡车','192.168.20.10092','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050092','FTYUIOLJYT^*(PLKJYT)0092','40.24906018866106','131.1527605053984','G000046','1'),
	('GM000093','2019-09-09 02:21:53','小超','小超','192.168.20.10093','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050093','FTYUIOLJYT^*(PLKJYT)0093','42.423613437393385','130.55062253052577','G000047','1'),
	('GM000094','2019-09-07 13:20:46','仓库货位','仓库货位','192.168.20.10094','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050094','FTYUIOLJYT^*(PLKJYT)0094','42.10563388316626','131.76698937911','G000047','1'),
	('GM000095','2019-09-03 15:00:52','卡车','卡车','192.168.20.10095','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050095','FTYUIOLJYT^*(PLKJYT)0095','40.648638084579005','130.24952366477774','G000048','1'),
	('GM000096','2019-09-14 12:29:03','小超','小超','192.168.20.10096','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050096','FTYUIOLJYT^*(PLKJYT)0096','40.117586861385206','130.9582659037576','G000048','1'),
	('GM000097','2019-08-27 22:36:16','仓库货位','仓库货位','192.168.20.10097','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050097','FTYUIOLJYT^*(PLKJYT)0097','40.634467678700275','131.25137348331762','G000049','1'),
	('GM000098','2019-08-26 14:15:03','卡车','卡车','192.168.20.10098','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050098','FTYUIOLJYT^*(PLKJYT)0098','41.88293417471227','130.26533371190126','G000049','1'),
	('GM000099','2019-09-05 22:05:15','小超','小超','192.168.20.10099','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050099','FTYUIOLJYT^*(PLKJYT)0099','41.937083174030704','130.86666829138906','G000050','1'),
	('GM000100','2019-09-08 02:40:32','仓库货位','仓库货位','192.168.20.10100','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050100','FTYUIOLJYT^*(PLKJYT)0100','42.39035370620718','131.2163156393175','G000050','1'),
	('GM000101','2019-08-30 04:09:09','卡车','卡车','192.168.20.10101','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050101','FTYUIOLJYT^*(PLKJYT)0101','39.97712129924099','129.85402191273687','G000051','1'),
	('GM000102','2019-09-04 11:17:29','小超','小超','192.168.20.10102','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050102','FTYUIOLJYT^*(PLKJYT)0102','41.55054100508933','129.77728386225718','G000051','1'),
	('GM000103','2019-09-08 09:16:32','仓库货位','仓库货位','192.168.20.10103','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050103','FTYUIOLJYT^*(PLKJYT)0103','40.21111072710271','131.04486681418032','G000052','1'),
	('GM000104','2019-09-08 11:06:58','卡车','卡车','192.168.20.10104','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050104','FTYUIOLJYT^*(PLKJYT)0104','41.90705504540709','131.8022596825153','G000052','1'),
	('GM000105','2019-09-03 23:09:55','小超','小超','192.168.20.10105','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050105','FTYUIOLJYT^*(PLKJYT)0105','40.77731591579555','130.202631485506','G000053','1'),
	('GM000106','2019-09-03 12:25:12','仓库货位','仓库货位','192.168.20.10106','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050106','FTYUIOLJYT^*(PLKJYT)0106','40.84507425486278','129.56804501053628','G000053','1'),
	('GM000107','2019-09-07 19:31:00','卡车','卡车','192.168.20.10107','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050107','FTYUIOLJYT^*(PLKJYT)0107','40.35259552747816','130.14243101228448','G000054','1'),
	('GM000108','2019-09-13 19:43:42','小超','小超','192.168.20.10108','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050108','FTYUIOLJYT^*(PLKJYT)0108','42.38588438737015','131.9425879846075','G000054','1'),
	('GM000109','2019-08-27 10:00:15','仓库货位','仓库货位','192.168.20.10109','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050109','FTYUIOLJYT^*(PLKJYT)0109','41.906783473584724','131.153659623331','G000055','1'),
	('GM000110','2019-08-25 20:44:33','卡车','卡车','192.168.20.10110','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050110','FTYUIOLJYT^*(PLKJYT)0110','40.65266035819536','129.7070462902032','G000055','1'),
	('GM000111','2019-09-08 09:44:34','小超','小超','192.168.20.10111','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050111','FTYUIOLJYT^*(PLKJYT)0111','41.51787105700525','130.36607880579265','G000056','1'),
	('GM000112','2019-08-29 05:26:29','仓库货位','仓库货位','192.168.20.10112','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050112','FTYUIOLJYT^*(PLKJYT)0112','41.52913419156974','130.57523736498828','G000056','1'),
	('GM000113','2019-08-30 20:09:56','卡车','卡车','192.168.20.10113','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050113','FTYUIOLJYT^*(PLKJYT)0113','39.94498989729387','130.05875180765094','G000057','1'),
	('GM000114','2019-08-26 19:07:49','小超','小超','192.168.20.10114','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050114','FTYUIOLJYT^*(PLKJYT)0114','40.19515131775488','130.27877572812324','G000057','1'),
	('GM000115','2019-08-25 21:02:59','仓库货位','仓库货位','192.168.20.10115','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050115','FTYUIOLJYT^*(PLKJYT)0115','42.230254310220275','129.7873350833126','G000058','1'),
	('GM000116','2019-09-11 02:59:01','卡车','卡车','192.168.20.10116','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050116','FTYUIOLJYT^*(PLKJYT)0116','40.228121445403154','130.414045203036','G000058','1'),
	('GM000117','2019-08-27 23:11:29','小超','小超','192.168.20.10117','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050117','FTYUIOLJYT^*(PLKJYT)0117','40.4014542808743','131.6837450239541','G000059','1'),
	('GM000118','2019-09-02 20:37:05','仓库货位','仓库货位','192.168.20.10118','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050118','FTYUIOLJYT^*(PLKJYT)0118','40.5012927410269','130.98350748830947','G000059','1'),
	('GM000119','2019-08-31 21:11:05','卡车','卡车','192.168.20.10119','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050119','FTYUIOLJYT^*(PLKJYT)0119','41.51503516577354','131.5261758127325','G000060','1'),
	('GM000120','2019-09-12 00:22:04','小超','小超','192.168.20.10120','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050120','FTYUIOLJYT^*(PLKJYT)0120','42.21109805250377','130.56711122099173','G000060','1'),
	('GM000121','2019-09-05 15:49:07','仓库货位','仓库货位','192.168.20.10121','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050121','FTYUIOLJYT^*(PLKJYT)0121','42.65553584626765','131.1780475151947','G000061','1'),
	('GM000122','2019-09-01 14:08:01','卡车','卡车','192.168.20.10122','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050122','FTYUIOLJYT^*(PLKJYT)0122','41.12710523074661','130.89125650460366','G000061','1'),
	('GM000123','2019-09-04 19:55:29','小超','小超','192.168.20.10123','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050123','FTYUIOLJYT^*(PLKJYT)0123','42.38958212873474','129.3210616309353','G000062','1'),
	('GM000124','2019-08-26 02:50:15','仓库货位','仓库货位','192.168.20.10124','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050124','FTYUIOLJYT^*(PLKJYT)0124','42.50807758750235','130.23754067680235','G000062','1'),
	('GM000125','2019-08-29 00:23:38','卡车','卡车','192.168.20.10125','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050125','FTYUIOLJYT^*(PLKJYT)0125','42.05866478831914','129.9575839112121','G000063','1'),
	('GM000126','2019-09-02 22:07:46','小超','小超','192.168.20.10126','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050126','FTYUIOLJYT^*(PLKJYT)0126','41.57314172368712','129.36913349960443','G000063','1'),
	('GM000127','2019-09-08 23:51:48','仓库货位','仓库货位','192.168.20.10127','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050127','FTYUIOLJYT^*(PLKJYT)0127','42.6374291423442','131.90665656694756','G000064','1'),
	('GM000128','2019-09-08 00:57:03','卡车','卡车','192.168.20.10128','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050128','FTYUIOLJYT^*(PLKJYT)0128','41.79303341464267','131.62000255669514','G000064','1'),
	('GM000129','2019-09-08 03:42:55','小超','小超','192.168.20.10129','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050129','FTYUIOLJYT^*(PLKJYT)0129','40.83833009899755','130.26976901602077','G000065','1'),
	('GM000130','2019-09-03 17:18:12','仓库货位','仓库货位','192.168.20.10130','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050130','FTYUIOLJYT^*(PLKJYT)0130','40.48593021842087','131.86535727986333','G000065','1'),
	('GM000131','2019-09-16 09:16:04','卡车','卡车','192.168.20.10131','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050131','FTYUIOLJYT^*(PLKJYT)0131','42.31766629563642','131.97892488134482','G000066','1'),
	('GM000132','2019-08-28 21:35:16','小超','小超','192.168.20.10132','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050132','FTYUIOLJYT^*(PLKJYT)0132','40.006698435948266','131.5977475039921','G000066','1'),
	('GM000133','2019-08-31 17:47:29','仓库货位','仓库货位','192.168.20.10133','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050133','FTYUIOLJYT^*(PLKJYT)0133','42.04372296886762','130.7704975193013','G000067','1'),
	('GM000134','2019-09-13 03:46:45','卡车','卡车','192.168.20.10134','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050134','FTYUIOLJYT^*(PLKJYT)0134','42.52681333531702','129.30251974343224','G000067','1'),
	('GM000135','2019-09-12 09:57:06','小超','小超','192.168.20.10135','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050135','FTYUIOLJYT^*(PLKJYT)0135','39.88967162154897','131.0419489412436','G000068','1'),
	('GM000136','2019-08-29 23:43:52','仓库货位','仓库货位','192.168.20.10136','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050136','FTYUIOLJYT^*(PLKJYT)0136','41.66221631860012','132.2421915280673','G000068','1'),
	('GM000137','2019-09-01 03:17:04','卡车','卡车','192.168.20.10137','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050137','FTYUIOLJYT^*(PLKJYT)0137','41.779770096296936','129.66090832780284','G000069','1'),
	('GM000138','2019-09-04 15:28:44','小超','小超','192.168.20.10138','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050138','FTYUIOLJYT^*(PLKJYT)0138','41.743540168127794','130.30828235579054','G000069','1'),
	('GM000139','2019-08-26 20:48:37','仓库货位','仓库货位','192.168.20.10139','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050139','FTYUIOLJYT^*(PLKJYT)0139','42.168178958743844','131.10170796224648','G000070','1'),
	('GM000140','2019-09-14 22:19:33','卡车','卡车','192.168.20.10140','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050140','FTYUIOLJYT^*(PLKJYT)0140','40.89117198771599','129.4208820219228','G000070','1'),
	('GM000141','2019-09-05 08:41:00','小超','小超','192.168.20.10141','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050141','FTYUIOLJYT^*(PLKJYT)0141','41.389378312711045','129.80570828392294','G000071','1'),
	('GM000142','2019-09-05 09:44:56','仓库货位','仓库货位','192.168.20.10142','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050142','FTYUIOLJYT^*(PLKJYT)0142','40.38836783048934','131.39352046585003','G000071','1'),
	('GM000143','2019-09-02 05:05:53','卡车','卡车','192.168.20.10143','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050143','FTYUIOLJYT^*(PLKJYT)0143','40.564890019942794','129.99920625365806','G000072','1'),
	('GM000144','2019-09-09 08:56:14','小超','小超','192.168.20.10144','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050144','FTYUIOLJYT^*(PLKJYT)0144','40.59904909834314','130.0296230385651','G000072','1'),
	('GM000145','2019-08-26 01:53:05','仓库货位','仓库货位','192.168.20.10145','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050145','FTYUIOLJYT^*(PLKJYT)0145','40.06304534854756','131.78511114121724','G000073','1'),
	('GM000146','2019-09-11 11:13:08','卡车','卡车','192.168.20.10146','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050146','FTYUIOLJYT^*(PLKJYT)0146','41.39107705321312','131.47601730783165','G000073','1'),
	('GM000147','2019-09-09 07:10:27','小超','小超','192.168.20.10147','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050147','FTYUIOLJYT^*(PLKJYT)0147','40.220297982382235','132.1587394964896','G000074','1'),
	('GM000148','2019-09-01 08:55:57','仓库货位','仓库货位','192.168.20.10148','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050148','FTYUIOLJYT^*(PLKJYT)0148','40.06693784315938','129.48074972801015','G000074','1'),
	('GM000149','2019-09-01 00:17:05','卡车','卡车','192.168.20.10149','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050149','FTYUIOLJYT^*(PLKJYT)0149','40.58058155650011','132.01897269599732','G000075','1'),
	('GM000150','2019-09-07 18:57:18','小超','小超','192.168.20.10150','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050150','FTYUIOLJYT^*(PLKJYT)0150','41.1162044078575','129.8421452366087','G000075','1'),
	('GM000151','2019-09-05 09:02:02','仓库货位','仓库货位','192.168.20.10151','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050151','FTYUIOLJYT^*(PLKJYT)0151','41.68310300454254','130.66673346902505','G000076','1'),
	('GM000152','2019-09-07 07:28:44','卡车','卡车','192.168.20.10152','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050152','FTYUIOLJYT^*(PLKJYT)0152','39.96033837768573','132.10199985284584','G000076','1'),
	('GM000153','2019-09-11 04:40:02','小超','小超','192.168.20.10153','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050153','FTYUIOLJYT^*(PLKJYT)0153','42.52151855348418','129.9444760743472','G000077','1'),
	('GM000154','2019-08-31 21:13:32','仓库货位','仓库货位','192.168.20.10154','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050154','FTYUIOLJYT^*(PLKJYT)0154','40.61094299523067','129.7395582100657','G000077','1'),
	('GM000155','2019-08-27 02:55:42','卡车','卡车','192.168.20.10155','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050155','FTYUIOLJYT^*(PLKJYT)0155','41.75455836042293','130.89249031861422','G000078','1'),
	('GM000156','2019-09-06 01:11:59','小超','小超','192.168.20.10156','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050156','FTYUIOLJYT^*(PLKJYT)0156','39.986179477125845','130.02914402026633','G000078','1'),
	('GM000157','2019-09-02 07:56:47','仓库货位','仓库货位','192.168.20.10157','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050157','FTYUIOLJYT^*(PLKJYT)0157','42.31887092189305','129.7277432835999','G000079','1'),
	('GM000158','2019-09-14 07:26:24','卡车','卡车','192.168.20.10158','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050158','FTYUIOLJYT^*(PLKJYT)0158','42.283561374899165','131.30075430343203','G000079','1'),
	('GM000159','2019-08-26 09:19:34','小超','小超','192.168.20.10159','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050159','FTYUIOLJYT^*(PLKJYT)0159','40.98129938189555','129.31432522718995','G000080','1'),
	('GM000160','2019-09-01 15:15:11','仓库货位','仓库货位','192.168.20.10160','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050160','FTYUIOLJYT^*(PLKJYT)0160','42.37569578312906','131.01049496352948','G000080','1'),
	('GM000161','2019-09-16 02:57:48','卡车','卡车','192.168.20.10161','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050161','FTYUIOLJYT^*(PLKJYT)0161','39.975249739149795','131.14502459280178','G000081','1'),
	('GM000162','2019-08-27 00:25:18','小超','小超','192.168.20.10162','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050162','FTYUIOLJYT^*(PLKJYT)0162','39.84183841986328','129.41045521361812','G000081','1'),
	('GM000163','2019-09-10 15:00:23','仓库货位','仓库货位','192.168.20.10163','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050163','FTYUIOLJYT^*(PLKJYT)0163','41.05266632101957','130.8229730540229','G000082','1'),
	('GM000164','2019-09-12 11:41:53','卡车','卡车','192.168.20.10164','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050164','FTYUIOLJYT^*(PLKJYT)0164','40.963578769017175','131.28262917419593','G000082','1'),
	('GM000165','2019-09-14 23:38:42','小超','小超','192.168.20.10165','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050165','FTYUIOLJYT^*(PLKJYT)0165','40.11091581919576','132.0806402517996','G000083','1'),
	('GM000166','2019-08-31 11:46:25','仓库货位','仓库货位','192.168.20.10166','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050166','FTYUIOLJYT^*(PLKJYT)0166','40.3669120732989','129.4490827479375','G000083','1'),
	('GM000167','2019-09-04 22:33:46','卡车','卡车','192.168.20.10167','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050167','FTYUIOLJYT^*(PLKJYT)0167','41.03724485777052','129.53879692325165','G000084','1'),
	('GM000168','2019-08-27 21:52:44','小超','小超','192.168.20.10168','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050168','FTYUIOLJYT^*(PLKJYT)0168','41.882842338587324','131.3241131581479','G000084','1'),
	('GM000169','2019-08-30 16:56:21','仓库货位','仓库货位','192.168.20.10169','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050169','FTYUIOLJYT^*(PLKJYT)0169','42.270192784044674','130.55662034267797','G000085','1'),
	('GM000170','2019-08-29 10:14:33','卡车','卡车','192.168.20.10170','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050170','FTYUIOLJYT^*(PLKJYT)0170','40.60008595613203','129.57020100949063','G000085','1'),
	('GM000171','2019-09-12 14:05:25','小超','小超','192.168.20.10171','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050171','FTYUIOLJYT^*(PLKJYT)0171','39.97830699777629','131.10022449534193','G000086','1'),
	('GM000172','2019-09-03 15:12:50','仓库货位','仓库货位','192.168.20.10172','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050172','FTYUIOLJYT^*(PLKJYT)0172','39.800115416952224','130.8477389393265','G000086','1'),
	('GM000173','2019-09-14 21:23:21','卡车','卡车','192.168.20.10173','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050173','FTYUIOLJYT^*(PLKJYT)0173','42.075749877099625','131.33301537761554','G000087','1'),
	('GM000174','2019-08-30 02:55:59','小超','小超','192.168.20.10174','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050174','FTYUIOLJYT^*(PLKJYT)0174','40.87853787416733','129.30162639385242','G000087','1'),
	('GM000175','2019-08-26 20:40:38','仓库货位','仓库货位','192.168.20.10175','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050175','FTYUIOLJYT^*(PLKJYT)0175','39.85904839716004','131.4579895846484','G000088','1'),
	('GM000176','2019-09-08 05:11:30','卡车','卡车','192.168.20.10176','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050176','FTYUIOLJYT^*(PLKJYT)0176','40.1775980104526','129.85173415858378','G000088','1'),
	('GM000177','2019-09-09 14:52:00','小超','小超','192.168.20.10177','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050177','FTYUIOLJYT^*(PLKJYT)0177','41.88959716453932','131.89812130383282','G000089','1'),
	('GM000178','2019-09-05 20:19:29','仓库货位','仓库货位','192.168.20.10178','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050178','FTYUIOLJYT^*(PLKJYT)0178','40.670522868894324','129.79799610386806','G000089','1'),
	('GM000179','2019-09-02 06:44:47','卡车','卡车','192.168.20.10179','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050179','FTYUIOLJYT^*(PLKJYT)0179','41.345976955590245','130.44315358273664','G000090','1'),
	('GM000180','2019-09-05 20:58:43','小超','小超','192.168.20.10180','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050180','FTYUIOLJYT^*(PLKJYT)0180','40.265691905410144','129.91662183686256','G000090','1'),
	('GM000181','2019-09-09 11:59:28','仓库货位','仓库货位','192.168.20.10181','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050181','FTYUIOLJYT^*(PLKJYT)0181','42.11522391900133','132.10438701339203','G000091','1'),
	('GM000182','2019-08-29 13:08:19','卡车','卡车','192.168.20.10182','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050182','FTYUIOLJYT^*(PLKJYT)0182','41.33155983169062','130.01691907659327','G000091','1'),
	('GM000183','2019-09-10 09:54:14','小超','小超','192.168.20.10183','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050183','FTYUIOLJYT^*(PLKJYT)0183','41.02251916550084','129.76653015044462','G000092','1'),
	('GM000184','2019-09-14 10:12:44','仓库货位','仓库货位','192.168.20.10184','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050184','FTYUIOLJYT^*(PLKJYT)0184','40.40433748029663','130.20686806244777','G000092','1'),
	('GM000185','2019-09-05 21:57:20','卡车','卡车','192.168.20.10185','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050185','FTYUIOLJYT^*(PLKJYT)0185','42.15714546621657','131.7985449187544','G000093','1'),
	('GM000186','2019-09-01 06:33:13','小超','小超','192.168.20.10186','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050186','FTYUIOLJYT^*(PLKJYT)0186','42.530242411818406','130.44142145933165','G000093','1'),
	('GM000187','2019-09-08 09:07:26','仓库货位','仓库货位','192.168.20.10187','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050187','FTYUIOLJYT^*(PLKJYT)0187','40.03487304940081','130.65303463217265','G000094','1'),
	('GM000188','2019-09-04 18:54:26','卡车','卡车','192.168.20.10188','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050188','FTYUIOLJYT^*(PLKJYT)0188','40.74136564568181','130.81516442994203','G000094','1'),
	('GM000189','2019-09-14 01:26:53','小超','小超','192.168.20.10189','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050189','FTYUIOLJYT^*(PLKJYT)0189','40.3422106351517','130.543530338078','G000095','1'),
	('GM000190','2019-08-31 19:06:36','仓库货位','仓库货位','192.168.20.10190','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050190','FTYUIOLJYT^*(PLKJYT)0190','41.77571005853836','131.7282334872535','G000095','1'),
	('GM000191','2019-09-16 15:39:40','卡车','卡车','192.168.20.10191','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050191','FTYUIOLJYT^*(PLKJYT)0191','42.18834464086221','130.01662872464925','G000096','1'),
	('GM000192','2019-08-28 01:54:49','小超','小超','192.168.20.10192','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050192','FTYUIOLJYT^*(PLKJYT)0192','42.66269354660765','132.17215454227426','G000096','1'),
	('GM000193','2019-08-26 06:17:46','仓库货位','仓库货位','192.168.20.10193','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050193','FTYUIOLJYT^*(PLKJYT)0193','40.80135760931521','130.93502725756537','G000097','1'),
	('GM000194','2019-09-01 14:14:57','卡车','卡车','192.168.20.10194','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050194','FTYUIOLJYT^*(PLKJYT)0194','41.6184655720817','131.82455031828036','G000097','1'),
	('GM000195','2019-09-12 03:59:58','小超','小超','192.168.20.10195','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050195','FTYUIOLJYT^*(PLKJYT)0195','41.5548684794048','129.939928372518','G000098','1'),
	('GM000196','2019-09-02 21:40:35','仓库货位','仓库货位','192.168.20.10196','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050196','FTYUIOLJYT^*(PLKJYT)0196','40.07196884674919','131.23562429618397','G000098','1'),
	('GM000197','2019-08-31 06:34:52','卡车','卡车','192.168.20.10197','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050197','FTYUIOLJYT^*(PLKJYT)0197','41.411091593469436','132.077001687359','G000099','1'),
	('GM000198','2019-09-12 23:01:20','小超','小超','192.168.20.10198','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050198','FTYUIOLJYT^*(PLKJYT)0198','42.392124076347685','130.6652368317455','G000099','1'),
	('GM000199','2019-09-04 21:15:40','仓库货位','仓库货位','192.168.20.10199','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050199','FTYUIOLJYT^*(PLKJYT)0199','42.58112246498222','130.23719317957736','G000100','1'),
	('GM000200','2019-08-29 08:30:38','卡车','卡车','192.168.20.10200','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050200','FTYUIOLJYT^*(PLKJYT)0200','42.15628921050828','130.0706366884472','G000100','1'),
	('GM000201','2019-09-12 07:15:25','小超','小超','192.168.20.10201','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050201','FTYUIOLJYT^*(PLKJYT)0201','40.40079391191385','130.49835849786345','G000101','1'),
	('GM000202','2019-08-27 15:27:32','仓库货位','仓库货位','192.168.20.10202','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050202','FTYUIOLJYT^*(PLKJYT)0202','39.81582428688477','131.53803018667307','G000101','1'),
	('GM000203','2019-09-06 10:22:25','卡车','卡车','192.168.20.10203','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050203','FTYUIOLJYT^*(PLKJYT)0203','42.521607677432065','130.05031099427217','G000102','1'),
	('GM000204','2019-09-13 08:39:15','小超','小超','192.168.20.10204','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050204','FTYUIOLJYT^*(PLKJYT)0204','40.42989816060344','130.23580274466062','G000102','1'),
	('GM000205','2019-09-11 14:34:46','仓库货位','仓库货位','192.168.20.10205','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050205','FTYUIOLJYT^*(PLKJYT)0205','41.14505867354298','132.16687951515422','G000103','1'),
	('GM000206','2019-09-13 11:01:42','卡车','卡车','192.168.20.10206','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050206','FTYUIOLJYT^*(PLKJYT)0206','42.38543549518433','130.58613197587152','G000103','1'),
	('GM000207','2019-08-30 18:08:30','小超','小超','192.168.20.10207','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050207','FTYUIOLJYT^*(PLKJYT)0207','41.762276332329584','129.75454346339617','G000104','1'),
	('GM000208','2019-09-05 17:47:22','仓库货位','仓库货位','192.168.20.10208','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050208','FTYUIOLJYT^*(PLKJYT)0208','40.659280271535906','131.10084115290164','G000104','1'),
	('GM000209','2019-09-02 18:17:13','卡车','卡车','192.168.20.10209','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050209','FTYUIOLJYT^*(PLKJYT)0209','40.979587382233774','130.28687481880755','G000105','1'),
	('GM000210','2019-09-09 05:31:39','小超','小超','192.168.20.10210','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050210','FTYUIOLJYT^*(PLKJYT)0210','40.246337670083534','131.70566614619267','G000105','1'),
	('GM000211','2019-08-29 17:24:50','仓库货位','仓库货位','192.168.20.10211','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050211','FTYUIOLJYT^*(PLKJYT)0211','40.24775082098561','130.93419334613347','G000106','1'),
	('GM000212','2019-09-07 21:06:41','卡车','卡车','192.168.20.10212','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050212','FTYUIOLJYT^*(PLKJYT)0212','41.74085503960124','131.8367900575152','G000106','1'),
	('GM000213','2019-09-09 22:05:46','小超','小超','192.168.20.10213','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050213','FTYUIOLJYT^*(PLKJYT)0213','42.604760320787314','132.2535030749526','G000107','1'),
	('GM000214','2019-09-06 01:25:19','仓库货位','仓库货位','192.168.20.10214','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050214','FTYUIOLJYT^*(PLKJYT)0214','40.16145411883623','130.28981587586296','G000107','1'),
	('GM000215','2019-09-08 10:19:04','卡车','卡车','192.168.20.10215','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050215','FTYUIOLJYT^*(PLKJYT)0215','41.77888725572517','131.82800565259143','G000108','1'),
	('GM000216','2019-09-02 02:48:17','小超','小超','192.168.20.10216','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050216','FTYUIOLJYT^*(PLKJYT)0216','40.72648839319614','130.3426957700854','G000108','1'),
	('GM000217','2019-08-27 23:27:54','仓库货位','仓库货位','192.168.20.10217','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050217','FTYUIOLJYT^*(PLKJYT)0217','42.77283693901664','130.47948883169187','G000109','1'),
	('GM000218','2019-09-08 10:43:18','卡车','卡车','192.168.20.10218','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050218','FTYUIOLJYT^*(PLKJYT)0218','40.26536235138323','129.87203734466266','G000109','1'),
	('GM000219','2019-09-14 23:32:20','小超','小超','192.168.20.10219','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050219','FTYUIOLJYT^*(PLKJYT)0219','40.407399944916776','129.4400107727637','G000110','1'),
	('GM000220','2019-08-27 04:43:54','仓库货位','仓库货位','192.168.20.10220','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050220','FTYUIOLJYT^*(PLKJYT)0220','40.972317754634624','129.80131341011648','G000110','1'),
	('GM000221','2019-09-09 00:56:24','卡车','卡车','192.168.20.10221','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050221','FTYUIOLJYT^*(PLKJYT)0221','41.49282481703757','131.8089897865272','G000111','1'),
	('GM000222','2019-08-26 05:06:47','小超','小超','192.168.20.10222','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050222','FTYUIOLJYT^*(PLKJYT)0222','41.52870858397115','131.72758638984553','G000111','1'),
	('GM000223','2019-08-27 11:56:57','仓库货位','仓库货位','192.168.20.10223','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050223','FTYUIOLJYT^*(PLKJYT)0223','41.52047155823263','131.46366808114337','G000112','1'),
	('GM000224','2019-08-30 18:15:31','卡车','卡车','192.168.20.10224','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050224','FTYUIOLJYT^*(PLKJYT)0224','40.82290751490254','129.89131584283967','G000112','1'),
	('GM000225','2019-09-04 08:08:57','小超','小超','192.168.20.10225','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050225','FTYUIOLJYT^*(PLKJYT)0225','39.931392957184016','130.88863916050676','G000113','1'),
	('GM000226','2019-09-05 09:16:25','仓库货位','仓库货位','192.168.20.10226','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050226','FTYUIOLJYT^*(PLKJYT)0226','40.24679835463803','130.90567673758218','G000113','1'),
	('GM000227','2019-09-11 17:38:34','卡车','卡车','192.168.20.10227','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050227','FTYUIOLJYT^*(PLKJYT)0227','41.480736888446174','130.27556557349922','G000114','1'),
	('GM000228','2019-09-03 12:26:42','小超','小超','192.168.20.10228','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050228','FTYUIOLJYT^*(PLKJYT)0228','41.335526838728306','129.9247189759227','G000114','1'),
	('GM000229','2019-09-05 04:00:59','仓库货位','仓库货位','192.168.20.10229','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050229','FTYUIOLJYT^*(PLKJYT)0229','41.53879022693869','131.17731244355647','G000115','1'),
	('GM000230','2019-09-06 13:17:09','卡车','卡车','192.168.20.10230','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050230','FTYUIOLJYT^*(PLKJYT)0230','41.41213563584249','129.9839283980523','G000115','1'),
	('GM000231','2019-09-10 13:55:15','小超','小超','192.168.20.10231','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050231','FTYUIOLJYT^*(PLKJYT)0231','39.86573735453533','131.51958032475585','G000116','1'),
	('GM000232','2019-09-13 17:53:33','仓库货位','仓库货位','192.168.20.10232','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050232','FTYUIOLJYT^*(PLKJYT)0232','41.298363771179','131.32569006851728','G000116','1'),
	('GM000233','2019-09-06 08:16:02','卡车','卡车','192.168.20.10233','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050233','FTYUIOLJYT^*(PLKJYT)0233','40.685565697795724','131.2439410041556','G000117','1'),
	('GM000234','2019-09-08 19:37:19','小超','小超','192.168.20.10234','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050234','FTYUIOLJYT^*(PLKJYT)0234','41.53283096949925','131.06234657881052','G000117','1'),
	('GM000235','2019-09-04 19:39:27','仓库货位','仓库货位','192.168.20.10235','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050235','FTYUIOLJYT^*(PLKJYT)0235','41.43590560629425','130.22330277653282','G000118','1'),
	('GM000236','2019-09-02 16:48:09','卡车','卡车','192.168.20.10236','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050236','FTYUIOLJYT^*(PLKJYT)0236','41.201764793081196','131.92061995691927','G000118','1'),
	('GM000237','2019-09-07 22:09:23','小超','小超','192.168.20.10237','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050237','FTYUIOLJYT^*(PLKJYT)0237','41.25897466927632','129.62671814411323','G000119','1'),
	('GM000238','2019-08-28 01:42:48','仓库货位','仓库货位','192.168.20.10238','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050238','FTYUIOLJYT^*(PLKJYT)0238','41.317195785118365','131.14591124366336','G000119','1'),
	('GM000239','2019-09-02 17:08:02','卡车','卡车','192.168.20.10239','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050239','FTYUIOLJYT^*(PLKJYT)0239','40.95134977627384','131.96567605317478','G000120','1'),
	('GM000240','2019-09-01 07:24:15','小超','小超','192.168.20.10240','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050240','FTYUIOLJYT^*(PLKJYT)0240','41.88311029717126','130.4692978517914','G000120','1'),
	('GM000241','2019-09-15 07:47:54','仓库货位','仓库货位','192.168.20.10241','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050241','FTYUIOLJYT^*(PLKJYT)0241','42.23728875712157','130.80731809266157','G000121','1'),
	('GM000242','2019-09-05 16:13:08','卡车','卡车','192.168.20.10242','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050242','FTYUIOLJYT^*(PLKJYT)0242','40.65949149581943','131.1029403367639','G000121','1'),
	('GM000243','2019-09-05 04:14:43','小超','小超','192.168.20.10243','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050243','FTYUIOLJYT^*(PLKJYT)0243','40.85516838872826','130.34820042600512','G000122','1'),
	('GM000244','2019-09-16 15:43:17','仓库货位','仓库货位','192.168.20.10244','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050244','FTYUIOLJYT^*(PLKJYT)0244','42.283711753110644','131.73324081645708','G000122','1'),
	('GM000245','2019-08-30 10:41:13','卡车','卡车','192.168.20.10245','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050245','FTYUIOLJYT^*(PLKJYT)0245','42.23581565618684','130.79026927253594','G000123','1'),
	('GM000246','2019-09-08 17:24:03','小超','小超','192.168.20.10246','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050246','FTYUIOLJYT^*(PLKJYT)0246','42.53269809671866','130.83072781859647','G000123','1'),
	('GM000247','2019-09-12 01:36:13','仓库货位','仓库货位','192.168.20.10247','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050247','FTYUIOLJYT^*(PLKJYT)0247','40.64473703983701','130.91170122184377','G000124','1'),
	('GM000248','2019-08-27 09:13:13','卡车','卡车','192.168.20.10248','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050248','FTYUIOLJYT^*(PLKJYT)0248','42.130138713021054','132.14968900182444','G000124','1'),
	('GM000249','2019-08-27 04:35:34','小超','小超','192.168.20.10249','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050249','FTYUIOLJYT^*(PLKJYT)0249','42.400268205602146','129.37039883015782','G000125','1'),
	('GM000250','2019-09-05 07:04:27','仓库货位','仓库货位','192.168.20.10250','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050250','FTYUIOLJYT^*(PLKJYT)0250','42.721316130412774','131.1105420812925','G000125','1'),
	('GM000251','2019-09-14 22:49:34','卡车','卡车','192.168.20.10251','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050251','FTYUIOLJYT^*(PLKJYT)0251','41.462369569821504','129.68655630587503','G000126','1'),
	('GM000252','2019-08-29 18:00:48','小超','小超','192.168.20.10252','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050252','FTYUIOLJYT^*(PLKJYT)0252','42.3826576609436','130.85849014826027','G000126','1'),
	('GM000253','2019-09-04 21:35:11','仓库货位','仓库货位','192.168.20.10253','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050253','FTYUIOLJYT^*(PLKJYT)0253','39.81121150119101','129.4202888393258','G000127','1'),
	('GM000254','2019-09-04 21:25:29','卡车','卡车','192.168.20.10254','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050254','FTYUIOLJYT^*(PLKJYT)0254','39.810614637546166','130.89090714966645','G000127','1'),
	('GM000255','2019-09-07 04:39:39','小超','小超','192.168.20.10255','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050255','FTYUIOLJYT^*(PLKJYT)0255','40.05296812517124','131.7664293535407','G000128','1'),
	('GM000256','2019-08-26 01:14:27','仓库货位','仓库货位','192.168.20.10256','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050256','FTYUIOLJYT^*(PLKJYT)0256','41.979987794431466','131.4140570014571','G000128','1');

insert into supplier_space_data values
	('SS000001','成都龙泉驿飞鹤路20号供货商独立管理区','02887654321','1876平方米','W000001','40.69036255958049','131.2544185903883','2019-08-27 00:17:40','1'),
	('SS000002','成都龙泉驿飞鹤路20号供货商独立管理区0002','028876543210002','1876平方米0002','W000001','42.7550688715807','131.98515580852398','2019-08-26 18:22:34','1'),
	('SS000003','成都龙泉驿飞鹤路20号供货商独立管理区0003','028876543210003','1876平方米0003','W000002','42.393853642587665','132.25550512879263','2019-08-28 14:39:45','1'),
	('SS000004','成都龙泉驿飞鹤路20号供货商独立管理区0004','028876543210004','1876平方米0004','W000002','40.80479767853302','131.2491230218929','2019-09-07 11:30:18','1');

insert into receiving_space_data values
	('RS000001','成都龙泉驿飞鹤路20号仓库卸货区','02887654321','每个收货区可以供一辆车卸货','1876平方米','W000001','40.93463786828586','131.3351653047769','2019-09-15 16:54:09','1'),
	('RS000002','成都龙泉驿飞鹤路20号仓库卸货区0002','028876543210002','每个收货区可以供一辆车卸货0002','1876平方米0002','W000001','39.83404241973889','130.50793556820878','2019-09-11 13:46:54','1'),
	('RS000003','成都龙泉驿飞鹤路20号仓库卸货区0003','028876543210003','每个收货区可以供一辆车卸货0003','1876平方米0003','W000002','42.06523094574722','132.14650369471426','2019-09-04 19:40:16','1'),
	('RS000004','成都龙泉驿飞鹤路20号仓库卸货区0004','028876543210004','每个收货区可以供一辆车卸货0004','1876平方米0004','W000002','41.47463418541215','129.8706013231426','2019-09-10 09:56:36','1');

insert into shipping_space_data values
	('SS000001','成都龙泉驿飞鹤路20号装货区','02887654321','1876平方米','W000001','40.43753555012635','131.35349765687724','每个收货区可以供一辆车装货','2019-09-08 08:46:14','1'),
	('SS000002','成都龙泉驿飞鹤路20号装货区0002','028876543210002','1876平方米0002','W000001','41.57583331198204','132.13579754365543','每个收货区可以供一辆车装货0002','2019-09-05 01:09:34','1'),
	('SS000003','成都龙泉驿飞鹤路20号装货区0003','028876543210003','1876平方米0003','W000002','40.95056013486554','129.72081232251446','每个收货区可以供一辆车装货0003','2019-09-08 14:38:24','1'),
	('SS000004','成都龙泉驿飞鹤路20号装货区0004','028876543210004','1876平方米0004','W000002','39.84580201916827','131.37704881371437','每个收货区可以供一辆车装货0004','2019-09-16 01:42:03','1');

insert into damage_space_data values
	('DS000001','成都龙泉驿飞鹤路20号仓库损坏货物堆放区','02887654321','1876平方米','41.063624684773124','131.38364284209584','W000001','2019-09-04 06:22:44','1'),
	('DS000002','成都龙泉驿飞鹤路20号仓库损坏货物堆放区0002','028876543210002','1876平方米0002','41.71034290000824','129.4482269031857','W000001','2019-08-31 21:45:16','1'),
	('DS000003','成都龙泉驿飞鹤路20号仓库损坏货物堆放区0003','028876543210003','1876平方米0003','40.69646167370466','129.8492310433696','W000002','2019-09-06 10:26:52','1'),
	('DS000004','成都龙泉驿飞鹤路20号仓库损坏货物堆放区0004','028876543210004','1876平方米0004','42.746569596198945','132.08739564699803','W000002','2019-09-06 12:18:11','1');

insert into warehouse_asset_data values
	('WA000001','叉车','备用件存放区设备库房','W000001','2019-08-29 08:39:43','1'),
	('WA000002','托盘','备用件存放区设备库房0002','W000001','2019-09-16 05:57:37','1'),
	('WA000003','传送带备件','备用件存放区设备库房0003','W000002','2019-09-01 04:57:31','1'),
	('WA000004','叉车','备用件存放区设备库房0004','W000002','2019-09-15 02:35:20','1');

insert into transport_fleet_data values
	('TF000001','双链先锋号车队','02887654321','RSCC000001','2019-09-05 09:07:26','1'),
	('TF000002','双链先锋号车队0002','028876543210002','RSCC000001','2019-09-02 05:33:09','1');

insert into transport_truck_data values
	('TT000001','运货卡车','川AK5','02887654321','VL9198','EN00102','2018-01-12','100万公里','红色','TF000001','1'),
	('TT000002','运货卡车0002','川AK50002','028876543210002','VL91980002','EN001020002','2018-03-23','100万公里0002','蓝色','TF000001','1'),
	('TT000003','运货卡车0003','川AK50003','028876543210003','VL91980003','EN001020003','2018-08-10','100万公里0003','白色','TF000002','1'),
	('TT000004','运货卡车0004','川AK50004','028876543210004','VL91980004','EN001020004','2016-10-08','100万公里0004','灰色','TF000002','1');

insert into truck_driver_data values
	('TD000001','运货卡车司机','51099887733','18777778888','TF000001','1'),
	('TD000002','运货卡车司机0002','510998877330002','13900000002','TF000001','1'),
	('TD000003','运货卡车司机0003','510998877330003','13900000003','TF000002','1'),
	('TD000004','运货卡车司机0004','510998877330004','13900000004','TF000002','1');

insert into transport_task_data values
	('TT000001','货运记录','双链二号仓','2017-03-03','RS000001','TD000001','TT000001','TF000001','42.53761847547097','131.17076428815506','1'),
	('TT000002','货运记录0002','双链二号仓0002','2018-12-23','RS000001','TD000001','TT000001','TF000001','42.635304843484036','130.9391299425085','1'),
	('TT000003','货运记录0003','双链二号仓0003','2018-05-18','RS000002','TD000001','TT000001','TF000001','41.11962757149917','131.8899593293463','1'),
	('TT000004','货运记录0004','双链二号仓0004','2019-07-25','RS000002','TD000001','TT000001','TF000001','40.70687272317217','131.57896170670347','1'),
	('TT000005','货运记录0005','双链二号仓0005','2019-09-01','RS000003','TD000002','TT000002','TF000001','42.47882981587329','129.69659648973607','1'),
	('TT000006','货运记录0006','双链二号仓0006','2017-07-22','RS000003','TD000002','TT000002','TF000001','40.303209685185344','129.5772900510293','1'),
	('TT000007','货运记录0007','双链二号仓0007','2018-02-20','RS000004','TD000002','TT000002','TF000001','39.830942353586224','130.20558573871847','1'),
	('TT000008','货运记录0008','双链二号仓0008','2017-12-23','RS000004','TD000002','TT000002','TF000001','42.71099305114318','130.12483405652333','1'),
	('TT000009','货运记录0009','双链二号仓0009','2017-03-24','RS000005','TD000003','TT000003','TF000002','41.52308213569343','132.0393136984708','1'),
	('TT000010','货运记录0010','双链二号仓0010','2018-02-23','RS000005','TD000003','TT000003','TF000002','39.78945509586238','130.73284722305849','1'),
	('TT000011','货运记录0011','双链二号仓0011','2017-03-18','RS000006','TD000003','TT000003','TF000002','42.18604449944662','130.83524029320512','1'),
	('TT000012','货运记录0012','双链二号仓0012','2018-06-01','RS000006','TD000003','TT000003','TF000002','42.704896111464166','129.4130938677056','1'),
	('TT000013','货运记录0013','双链二号仓0013','2018-06-24','RS000007','TD000004','TT000004','TF000002','40.41524989335564','132.0610020046901','1'),
	('TT000014','货运记录0014','双链二号仓0014','2017-01-19','RS000007','TD000004','TT000004','TF000002','41.425792622825746','131.49834407216855','1'),
	('TT000015','货运记录0015','双链二号仓0015','2019-09-07','RS000008','TD000004','TT000004','TF000002','41.33611717192709','130.23196222408683','1'),
	('TT000016','货运记录0016','双链二号仓0016','2018-04-20','RS000008','TD000004','TT000004','TF000002','41.504307916051836','131.88069235578112','1');

insert into transport_task_track_data values
	('TTT000001','2016-10-19','31.396468745403908','103.34439810156407','TT000001','1'),
	('TTT000002','2017-06-22','32.62393072722543','104.9088884022067','TT000001','1'),
	('TTT000003','2019-07-08','31.637075917985005','104.61376459189809','TT000002','1'),
	('TTT000004','2016-10-14','32.312978314347774','103.12328330685436','TT000002','1'),
	('TTT000005','2017-05-26','31.152880892982083','104.9616281557827','TT000003','1'),
	('TTT000006','2017-05-28','30.873876256268087','105.38315058102627','TT000003','1'),
	('TTT000007','2019-06-16','31.979939478842113','105.76473609072063','TT000004','1'),
	('TTT000008','2018-11-26','31.974447228015414','104.71416844366485','TT000004','1'),
	('TTT000009','2019-06-30','32.258918130927306','103.87407585370555','TT000005','1'),
	('TTT000010','2017-04-25','31.404911277388806','104.77785969042507','TT000005','1'),
	('TTT000011','2018-11-03','30.685272884039072','105.77618698050489','TT000006','1'),
	('TTT000012','2017-10-04','30.930956278245024','104.25559278823079','TT000006','1'),
	('TTT000013','2017-07-26','32.43329612660199','103.51989009953083','TT000007','1'),
	('TTT000014','2019-01-24','32.076159383482775','104.60913320497596','TT000007','1'),
	('TTT000015','2018-02-20','32.28720057598648','103.80339138312806','TT000008','1'),
	('TTT000016','2017-06-15','31.405190825514776','105.58242316132686','TT000008','1'),
	('TTT000017','2018-11-08','31.053927871274112','103.7632650320713','TT000009','1'),
	('TTT000018','2016-11-12','32.26204006009157','105.99441220139704','TT000009','1'),
	('TTT000019','2016-10-26','32.238645371519624','103.23422722522467','TT000010','1'),
	('TTT000020','2019-08-16','31.472005282687594','105.1168066909085','TT000010','1'),
	('TTT000021','2017-02-24','32.79332900008309','104.68873758975576','TT000011','1'),
	('TTT000022','2017-12-29','32.73358976625464','103.31069958747491','TT000011','1'),
	('TTT000023','2017-01-01','32.06294258296773','104.1782516924756','TT000012','1'),
	('TTT000024','2017-10-10','31.37609193864025','105.39245497555996','TT000012','1'),
	('TTT000025','2019-06-13','32.36716717357845','104.92149311408284','TT000013','1'),
	('TTT000026','2019-05-19','32.238016669742','104.6453533699857','TT000013','1'),
	('TTT000027','2017-04-02','30.18617832025735','106.08562110505626','TT000014','1'),
	('TTT000028','2017-08-17','32.106064417909685','104.92588172466404','TT000014','1'),
	('TTT000029','2019-03-27','30.337512520131483','105.72798153907719','TT000015','1'),
	('TTT000030','2019-08-26','31.748076828893083','105.32181529312568','TT000015','1'),
	('TTT000031','2018-02-05','30.711634966989912','106.08169975285163','TT000016','1'),
	('TTT000032','2018-10-18','30.957776186438412','104.39617226747761','TT000016','1');

insert into account_set_data values
	('AS000001','账套2017','2017年','2019-01-02','企业会计制度','RMB','人民币','招商银行','33265805054885','RSCC000001','RS000001','GS000001','2019-09-02 01:35:30','1'),
	('AS000002','账套2018','2018年','2019-04-26','小企业会计制度','USD','美元','工商银行','332658050548850002','RSCC000001','RS000001','GS000001','2019-09-15 20:29:57','1'),
	('AS000003','账套2019','2019年','2017-03-18','合伙制会计制度','RMB','人民币','招商银行','332658050548850003','RSCC000001','RS000002','GS000001','2019-09-06 16:05:58','1'),
	('AS000004','账套2017','2017年','2019-01-20','企业会计制度','USD','美元','工商银行','332658050548850004','RSCC000001','RS000002','GS000001','2019-09-02 12:43:02','1'),
	('AS000005','账套2018','2018年','2017-06-21','小企业会计制度','RMB','人民币','招商银行','332658050548850005','RSCC000001','RS000003','GS000001','2019-08-27 20:34:19','1'),
	('AS000006','账套2019','2019年','2017-08-19','合伙制会计制度','USD','美元','工商银行','332658050548850006','RSCC000001','RS000003','GS000001','2019-08-25 22:05:09','1'),
	('AS000007','账套2017','2017年','2018-02-18','企业会计制度','RMB','人民币','招商银行','332658050548850007','RSCC000001','RS000004','GS000001','2019-09-13 19:02:58','1'),
	('AS000008','账套2018','2018年','2017-05-17','小企业会计制度','USD','美元','工商银行','332658050548850008','RSCC000001','RS000004','GS000001','2019-09-05 17:05:12','1'),
	('AS000009','账套2019','2019年','2017-10-08','合伙制会计制度','RMB','人民币','招商银行','332658050548850009','RSCC000001','RS000005','GS000002','2019-09-13 08:30:35','1'),
	('AS000010','账套2017','2017年','2019-07-06','企业会计制度','USD','美元','工商银行','332658050548850010','RSCC000001','RS000005','GS000002','2019-08-31 01:51:13','1'),
	('AS000011','账套2018','2018年','2018-09-09','小企业会计制度','RMB','人民币','招商银行','332658050548850011','RSCC000001','RS000006','GS000002','2019-09-02 07:50:45','1'),
	('AS000012','账套2019','2019年','2017-12-30','合伙制会计制度','USD','美元','工商银行','332658050548850012','RSCC000001','RS000006','GS000002','2019-08-27 13:15:29','1'),
	('AS000013','账套2017','2017年','2017-05-08','企业会计制度','RMB','人民币','招商银行','332658050548850013','RSCC000001','RS000007','GS000002','2019-09-02 02:15:24','1'),
	('AS000014','账套2018','2018年','2019-02-10','小企业会计制度','USD','美元','工商银行','332658050548850014','RSCC000001','RS000007','GS000002','2019-08-26 00:24:06','1'),
	('AS000015','账套2019','2019年','2018-07-09','合伙制会计制度','RMB','人民币','招商银行','332658050548850015','RSCC000001','RS000008','GS000002','2019-09-13 23:17:47','1'),
	('AS000016','账套2017','2017年','2019-04-23','企业会计制度','USD','美元','工商银行','332658050548850016','RSCC000001','RS000008','GS000002','2019-09-14 15:30:50','1');

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
	('AP000001','2017年1月','2018-11-26','2017-07-14','AS000001','1'),
	('AP000002','2017年2月','2016-09-27','2017-01-20','AS000001','1'),
	('AP000003','2017年3月','2016-11-12','2016-10-21','AS000002','1'),
	('AP000004','2017年4月','2019-07-28','2019-02-26','AS000002','1'),
	('AP000005','2017年5月','2019-01-21','2018-08-16','AS000003','1'),
	('AP000006','2017年6月','2018-09-23','2017-07-22','AS000003','1'),
	('AP000007','2017年7月','2017-03-06','2019-09-11','AS000004','1'),
	('AP000008','2017年8月','2019-08-22','2018-07-04','AS000004','1'),
	('AP000009','2017年9月','2016-09-30','2018-04-16','AS000005','1'),
	('AP000010','2017年10月','2018-09-11','2019-05-09','AS000005','1'),
	('AP000011','2017年11月','2018-07-21','2016-12-26','AS000006','1'),
	('AP000012','2017年12月','2017-06-02','2019-01-23','AS000006','1'),
	('AP000013','2017年1月','2018-07-12','2018-01-09','AS000007','1'),
	('AP000014','2017年2月','2017-11-15','2019-07-12','AS000007','1'),
	('AP000015','2017年3月','2018-02-24','2017-06-20','AS000008','1'),
	('AP000016','2017年4月','2017-09-13','2019-07-13','AS000008','1'),
	('AP000017','2017年5月','2018-10-25','2019-03-12','AS000009','1'),
	('AP000018','2017年6月','2016-12-29','2018-11-07','AS000009','1'),
	('AP000019','2017年7月','2019-07-01','2019-08-31','AS000010','1'),
	('AP000020','2017年8月','2018-08-24','2017-11-22','AS000010','1'),
	('AP000021','2017年9月','2017-11-18','2017-04-08','AS000011','1'),
	('AP000022','2017年10月','2017-12-09','2017-09-16','AS000011','1'),
	('AP000023','2017年11月','2018-04-16','2018-09-23','AS000012','1'),
	('AP000024','2017年12月','2018-02-05','2018-03-14','AS000012','1'),
	('AP000025','2017年1月','2018-02-14','2016-12-28','AS000013','1'),
	('AP000026','2017年2月','2017-02-13','2017-08-01','AS000013','1'),
	('AP000027','2017年3月','2019-03-02','2017-08-18','AS000014','1'),
	('AP000028','2017年4月','2017-06-19','2019-03-25','AS000014','1'),
	('AP000029','2017年5月','2017-11-01','2019-07-27','AS000015','1'),
	('AP000030','2017年6月','2018-04-25','2019-02-06','AS000015','1'),
	('AP000031','2017年7月','2017-07-17','2019-08-06','AS000016','1'),
	('AP000032','2017年8月','2016-11-04','2016-12-06','AS000016','1');

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
	('AD000001','记账凭证','2019-08-03','AP000001','ADT000001',NULL,NULL,NULL,NULL,'CREATED','1'),
	('AD000002','记账凭证0002','2017-10-16','AP000001','ADT000001',NULL,NULL,NULL,NULL,'CONFIRMED','1'),
	('AD000003','记账凭证0003','2018-05-22','AP000002','ADT000002',NULL,NULL,NULL,NULL,'AUDITED','1'),
	('AD000004','记账凭证0004','2017-07-14','AP000002','ADT000002',NULL,NULL,NULL,NULL,'POSTED','1'),
	('AD000005','记账凭证0005','2019-06-09','AP000003','ADT000003',NULL,NULL,NULL,NULL,'CREATED','1'),
	('AD000006','记账凭证0006','2018-07-23','AP000003','ADT000003',NULL,NULL,NULL,NULL,'CONFIRMED','1'),
	('AD000007','记账凭证0007','2019-09-07','AP000004','ADT000004',NULL,NULL,NULL,NULL,'AUDITED','1'),
	('AD000008','记账凭证0008','2017-04-21','AP000004','ADT000004',NULL,NULL,NULL,NULL,'POSTED','1'),
	('AD000009','记账凭证0009','2016-12-08','AP000005','ADT000005',NULL,NULL,NULL,NULL,'CREATED','1'),
	('AD000010','记账凭证0010','2017-09-01','AP000005','ADT000005',NULL,NULL,NULL,NULL,'CONFIRMED','1'),
	('AD000011','记账凭证0011','2019-03-03','AP000006','ADT000006',NULL,NULL,NULL,NULL,'AUDITED','1'),
	('AD000012','记账凭证0012','2018-03-16','AP000006','ADT000006',NULL,NULL,NULL,NULL,'POSTED','1'),
	('AD000013','记账凭证0013','2016-12-12','AP000007','ADT000007',NULL,NULL,NULL,NULL,'CREATED','1'),
	('AD000014','记账凭证0014','2017-01-29','AP000007','ADT000007',NULL,NULL,NULL,NULL,'CONFIRMED','1'),
	('AD000015','记账凭证0015','2018-02-02','AP000008','ADT000008',NULL,NULL,NULL,NULL,'AUDITED','1'),
	('AD000016','记账凭证0016','2018-03-15','AP000008','ADT000008',NULL,NULL,NULL,NULL,'POSTED','1'),
	('AD000017','记账凭证0017','2016-12-23','AP000009','ADT000009',NULL,NULL,NULL,NULL,'CREATED','1'),
	('AD000018','记账凭证0018','2018-12-29','AP000009','ADT000009',NULL,NULL,NULL,NULL,'CONFIRMED','1'),
	('AD000019','记账凭证0019','2017-05-24','AP000010','ADT000010',NULL,NULL,NULL,NULL,'AUDITED','1'),
	('AD000020','记账凭证0020','2017-03-16','AP000010','ADT000010',NULL,NULL,NULL,NULL,'POSTED','1'),
	('AD000021','记账凭证0021','2017-09-28','AP000011','ADT000011',NULL,NULL,NULL,NULL,'CREATED','1'),
	('AD000022','记账凭证0022','2018-01-19','AP000011','ADT000011',NULL,NULL,NULL,NULL,'CONFIRMED','1'),
	('AD000023','记账凭证0023','2017-08-06','AP000012','ADT000012',NULL,NULL,NULL,NULL,'AUDITED','1'),
	('AD000024','记账凭证0024','2018-03-20','AP000012','ADT000012',NULL,NULL,NULL,NULL,'POSTED','1'),
	('AD000025','记账凭证0025','2019-02-09','AP000013','ADT000013',NULL,NULL,NULL,NULL,'CREATED','1'),
	('AD000026','记账凭证0026','2016-11-29','AP000013','ADT000013',NULL,NULL,NULL,NULL,'CONFIRMED','1'),
	('AD000027','记账凭证0027','2018-06-18','AP000014','ADT000014',NULL,NULL,NULL,NULL,'AUDITED','1'),
	('AD000028','记账凭证0028','2019-06-05','AP000014','ADT000014',NULL,NULL,NULL,NULL,'POSTED','1'),
	('AD000029','记账凭证0029','2017-10-13','AP000015','ADT000015',NULL,NULL,NULL,NULL,'CREATED','1'),
	('AD000030','记账凭证0030','2018-02-18','AP000015','ADT000015',NULL,NULL,NULL,NULL,'CONFIRMED','1'),
	('AD000031','记账凭证0031','2017-01-07','AP000016','ADT000016',NULL,NULL,NULL,NULL,'AUDITED','1'),
	('AD000032','记账凭证0032','2018-07-22','AP000016','ADT000016',NULL,NULL,NULL,NULL,'POSTED','1'),
	('AD000033','记账凭证0033','2017-11-27','AP000017','ADT000017',NULL,NULL,NULL,NULL,'CREATED','1'),
	('AD000034','记账凭证0034','2018-05-23','AP000017','ADT000017',NULL,NULL,NULL,NULL,'CONFIRMED','1'),
	('AD000035','记账凭证0035','2018-06-19','AP000018','ADT000018',NULL,NULL,NULL,NULL,'AUDITED','1'),
	('AD000036','记账凭证0036','2016-09-23','AP000018','ADT000018',NULL,NULL,NULL,NULL,'POSTED','1'),
	('AD000037','记账凭证0037','2017-02-13','AP000019','ADT000019',NULL,NULL,NULL,NULL,'CREATED','1'),
	('AD000038','记账凭证0038','2019-08-30','AP000019','ADT000019',NULL,NULL,NULL,NULL,'CONFIRMED','1'),
	('AD000039','记账凭证0039','2018-09-16','AP000020','ADT000020',NULL,NULL,NULL,NULL,'AUDITED','1'),
	('AD000040','记账凭证0040','2017-08-26','AP000020','ADT000020',NULL,NULL,NULL,NULL,'POSTED','1'),
	('AD000041','记账凭证0041','2017-12-31','AP000021','ADT000021',NULL,NULL,NULL,NULL,'CREATED','1'),
	('AD000042','记账凭证0042','2017-03-21','AP000021','ADT000021',NULL,NULL,NULL,NULL,'CONFIRMED','1'),
	('AD000043','记账凭证0043','2019-09-11','AP000022','ADT000022',NULL,NULL,NULL,NULL,'AUDITED','1'),
	('AD000044','记账凭证0044','2017-10-25','AP000022','ADT000022',NULL,NULL,NULL,NULL,'POSTED','1'),
	('AD000045','记账凭证0045','2017-06-07','AP000023','ADT000023',NULL,NULL,NULL,NULL,'CREATED','1'),
	('AD000046','记账凭证0046','2018-07-27','AP000023','ADT000023',NULL,NULL,NULL,NULL,'CONFIRMED','1'),
	('AD000047','记账凭证0047','2019-04-25','AP000024','ADT000024',NULL,NULL,NULL,NULL,'AUDITED','1'),
	('AD000048','记账凭证0048','2016-11-13','AP000024','ADT000024',NULL,NULL,NULL,NULL,'POSTED','1'),
	('AD000049','记账凭证0049','2019-05-29','AP000025','ADT000025',NULL,NULL,NULL,NULL,'CREATED','1'),
	('AD000050','记账凭证0050','2018-11-19','AP000025','ADT000025',NULL,NULL,NULL,NULL,'CONFIRMED','1'),
	('AD000051','记账凭证0051','2019-08-08','AP000026','ADT000026',NULL,NULL,NULL,NULL,'AUDITED','1'),
	('AD000052','记账凭证0052','2018-02-08','AP000026','ADT000026',NULL,NULL,NULL,NULL,'POSTED','1'),
	('AD000053','记账凭证0053','2018-09-28','AP000027','ADT000027',NULL,NULL,NULL,NULL,'CREATED','1'),
	('AD000054','记账凭证0054','2019-07-01','AP000027','ADT000027',NULL,NULL,NULL,NULL,'CONFIRMED','1'),
	('AD000055','记账凭证0055','2018-11-13','AP000028','ADT000028',NULL,NULL,NULL,NULL,'AUDITED','1'),
	('AD000056','记账凭证0056','2017-07-18','AP000028','ADT000028',NULL,NULL,NULL,NULL,'POSTED','1'),
	('AD000057','记账凭证0057','2019-08-20','AP000029','ADT000029',NULL,NULL,NULL,NULL,'CREATED','1'),
	('AD000058','记账凭证0058','2018-06-19','AP000029','ADT000029',NULL,NULL,NULL,NULL,'CONFIRMED','1'),
	('AD000059','记账凭证0059','2018-12-03','AP000030','ADT000030',NULL,NULL,NULL,NULL,'AUDITED','1'),
	('AD000060','记账凭证0060','2017-08-29','AP000030','ADT000030',NULL,NULL,NULL,NULL,'POSTED','1'),
	('AD000061','记账凭证0061','2018-05-29','AP000031','ADT000031',NULL,NULL,NULL,NULL,'CREATED','1'),
	('AD000062','记账凭证0062','2019-03-10','AP000031','ADT000031',NULL,NULL,NULL,NULL,'CONFIRMED','1'),
	('AD000063','记账凭证0063','2017-10-20','AP000032','ADT000032',NULL,NULL,NULL,NULL,'AUDITED','1'),
	('AD000064','记账凭证0064','2017-04-19','AP000032','ADT000032',NULL,NULL,NULL,NULL,'POSTED','1');

insert into accounting_document_creation_data values
	('ADC000001','财务会计','确认提交','2019-07-25','1');

insert into accounting_document_confirmation_data values
	('ADC000001','财务会计','确认通过','2018-05-27','1');

insert into accounting_document_auditing_data values
	('ADA000001','财务会计','审核通过，要都审核过了才通过哦','2017-06-04','1');

insert into accounting_document_posting_data values
	('ADP000001','财务会计','审核通过，要都审核过了才通过哦','2019-01-04','1');

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
	('OVC000001','财务会计','确认提交','2019-05-02','1');

insert into original_voucher_confirmation_data values
	('OVC000001','财务会计','确认通过','2016-10-18','1');

insert into original_voucher_auditing_data values
	('OVA000001','财务会计','审核通过，要都审核过了才通过哦','2017-03-30','1');

insert into accounting_document_line_data values
	('ADL000001','收到存款','AS9999','借','938561.69','AD000001','AS000001','1'),
	('ADL000002','收到存款0002','AS99990002','贷','871936.81','AD000001','AS000001','1'),
	('ADL000003','收到存款0003','AS99990003','借','884347.19','AD000002','AS000001','1'),
	('ADL000004','收到存款0004','AS99990004','贷','910692.56','AD000002','AS000001','1'),
	('ADL000005','收到存款0005','AS99990005','借','823052.38','AD000003','AS000002','1'),
	('ADL000006','收到存款0006','AS99990006','贷','757048.06','AD000003','AS000002','1'),
	('ADL000007','收到存款0007','AS99990007','借','889776.19','AD000004','AS000002','1'),
	('ADL000008','收到存款0008','AS99990008','贷','895377.88','AD000004','AS000002','1'),
	('ADL000009','收到存款0009','AS99990009','借','714565.00','AD000005','AS000003','1'),
	('ADL000010','收到存款0010','AS99990010','贷','793575.56','AD000005','AS000003','1'),
	('ADL000011','收到存款0011','AS99990011','借','720103.94','AD000006','AS000003','1'),
	('ADL000012','收到存款0012','AS99990012','贷','901573.12','AD000006','AS000003','1'),
	('ADL000013','收到存款0013','AS99990013','借','692580.81','AD000007','AS000004','1'),
	('ADL000014','收到存款0014','AS99990014','贷','856737.88','AD000007','AS000004','1'),
	('ADL000015','收到存款0015','AS99990015','借','755130.50','AD000008','AS000004','1'),
	('ADL000016','收到存款0016','AS99990016','贷','892706.88','AD000008','AS000004','1'),
	('ADL000017','收到存款0017','AS99990017','借','715222.12','AD000009','AS000005','1'),
	('ADL000018','收到存款0018','AS99990018','贷','933527.50','AD000009','AS000005','1'),
	('ADL000019','收到存款0019','AS99990019','借','844626.81','AD000010','AS000005','1'),
	('ADL000020','收到存款0020','AS99990020','贷','951094.25','AD000010','AS000005','1'),
	('ADL000021','收到存款0021','AS99990021','借','926148.88','AD000011','AS000006','1'),
	('ADL000022','收到存款0022','AS99990022','贷','913004.25','AD000011','AS000006','1'),
	('ADL000023','收到存款0023','AS99990023','借','960410.19','AD000012','AS000006','1'),
	('ADL000024','收到存款0024','AS99990024','贷','784741.25','AD000012','AS000006','1'),
	('ADL000025','收到存款0025','AS99990025','借','819573.00','AD000013','AS000007','1'),
	('ADL000026','收到存款0026','AS99990026','贷','905905.31','AD000013','AS000007','1'),
	('ADL000027','收到存款0027','AS99990027','借','889622.00','AD000014','AS000007','1'),
	('ADL000028','收到存款0028','AS99990028','贷','735594.00','AD000014','AS000007','1'),
	('ADL000029','收到存款0029','AS99990029','借','907808.12','AD000015','AS000008','1'),
	('ADL000030','收到存款0030','AS99990030','贷','736250.31','AD000015','AS000008','1'),
	('ADL000031','收到存款0031','AS99990031','借','735103.75','AD000016','AS000008','1'),
	('ADL000032','收到存款0032','AS99990032','贷','866769.50','AD000016','AS000008','1'),
	('ADL000033','收到存款0033','AS99990033','借','943647.06','AD000017','AS000009','1'),
	('ADL000034','收到存款0034','AS99990034','贷','913676.75','AD000017','AS000009','1'),
	('ADL000035','收到存款0035','AS99990035','借','938794.00','AD000018','AS000009','1'),
	('ADL000036','收到存款0036','AS99990036','贷','723084.38','AD000018','AS000009','1'),
	('ADL000037','收到存款0037','AS99990037','借','773268.38','AD000019','AS000010','1'),
	('ADL000038','收到存款0038','AS99990038','贷','851634.12','AD000019','AS000010','1'),
	('ADL000039','收到存款0039','AS99990039','借','860224.94','AD000020','AS000010','1'),
	('ADL000040','收到存款0040','AS99990040','贷','985331.06','AD000020','AS000010','1'),
	('ADL000041','收到存款0041','AS99990041','借','803994.19','AD000021','AS000011','1'),
	('ADL000042','收到存款0042','AS99990042','贷','939979.00','AD000021','AS000011','1'),
	('ADL000043','收到存款0043','AS99990043','借','701644.31','AD000022','AS000011','1'),
	('ADL000044','收到存款0044','AS99990044','贷','957940.19','AD000022','AS000011','1'),
	('ADL000045','收到存款0045','AS99990045','借','912796.00','AD000023','AS000012','1'),
	('ADL000046','收到存款0046','AS99990046','贷','877350.38','AD000023','AS000012','1'),
	('ADL000047','收到存款0047','AS99990047','借','815391.50','AD000024','AS000012','1'),
	('ADL000048','收到存款0048','AS99990048','贷','832053.25','AD000024','AS000012','1'),
	('ADL000049','收到存款0049','AS99990049','借','790561.12','AD000025','AS000013','1'),
	('ADL000050','收到存款0050','AS99990050','贷','831876.12','AD000025','AS000013','1'),
	('ADL000051','收到存款0051','AS99990051','借','766521.12','AD000026','AS000013','1'),
	('ADL000052','收到存款0052','AS99990052','贷','945226.69','AD000026','AS000013','1'),
	('ADL000053','收到存款0053','AS99990053','借','827947.62','AD000027','AS000014','1'),
	('ADL000054','收到存款0054','AS99990054','贷','818623.25','AD000027','AS000014','1'),
	('ADL000055','收到存款0055','AS99990055','借','951096.00','AD000028','AS000014','1'),
	('ADL000056','收到存款0056','AS99990056','贷','865938.12','AD000028','AS000014','1'),
	('ADL000057','收到存款0057','AS99990057','借','790272.62','AD000029','AS000015','1'),
	('ADL000058','收到存款0058','AS99990058','贷','779290.69','AD000029','AS000015','1'),
	('ADL000059','收到存款0059','AS99990059','借','901118.88','AD000030','AS000015','1'),
	('ADL000060','收到存款0060','AS99990060','贷','786511.56','AD000030','AS000015','1'),
	('ADL000061','收到存款0061','AS99990061','借','823022.31','AD000031','AS000016','1'),
	('ADL000062','收到存款0062','AS99990062','贷','737082.62','AD000031','AS000016','1'),
	('ADL000063','收到存款0063','AS99990063','借','908043.62','AD000032','AS000016','1'),
	('ADL000064','收到存款0064','AS99990064','贷','863100.88','AD000032','AS000016','1'),
	('ADL000065','收到存款0065','AS99990065','借','850213.88','AD000033','AS000017','1'),
	('ADL000066','收到存款0066','AS99990066','贷','727441.06','AD000033','AS000017','1'),
	('ADL000067','收到存款0067','AS99990067','借','977022.44','AD000034','AS000017','1'),
	('ADL000068','收到存款0068','AS99990068','贷','974178.50','AD000034','AS000017','1'),
	('ADL000069','收到存款0069','AS99990069','借','739036.50','AD000035','AS000018','1'),
	('ADL000070','收到存款0070','AS99990070','贷','709253.19','AD000035','AS000018','1'),
	('ADL000071','收到存款0071','AS99990071','借','861644.50','AD000036','AS000018','1'),
	('ADL000072','收到存款0072','AS99990072','贷','733973.50','AD000036','AS000018','1'),
	('ADL000073','收到存款0073','AS99990073','借','966878.88','AD000037','AS000019','1'),
	('ADL000074','收到存款0074','AS99990074','贷','747792.62','AD000037','AS000019','1'),
	('ADL000075','收到存款0075','AS99990075','借','821816.06','AD000038','AS000019','1'),
	('ADL000076','收到存款0076','AS99990076','贷','847718.94','AD000038','AS000019','1'),
	('ADL000077','收到存款0077','AS99990077','借','843163.12','AD000039','AS000020','1'),
	('ADL000078','收到存款0078','AS99990078','贷','836534.75','AD000039','AS000020','1'),
	('ADL000079','收到存款0079','AS99990079','借','819504.44','AD000040','AS000020','1'),
	('ADL000080','收到存款0080','AS99990080','贷','755345.75','AD000040','AS000020','1'),
	('ADL000081','收到存款0081','AS99990081','借','774629.56','AD000041','AS000021','1'),
	('ADL000082','收到存款0082','AS99990082','贷','757484.62','AD000041','AS000021','1'),
	('ADL000083','收到存款0083','AS99990083','借','866123.69','AD000042','AS000021','1'),
	('ADL000084','收到存款0084','AS99990084','贷','982586.75','AD000042','AS000021','1'),
	('ADL000085','收到存款0085','AS99990085','借','713502.81','AD000043','AS000022','1'),
	('ADL000086','收到存款0086','AS99990086','贷','698128.12','AD000043','AS000022','1'),
	('ADL000087','收到存款0087','AS99990087','借','840771.50','AD000044','AS000022','1'),
	('ADL000088','收到存款0088','AS99990088','贷','961073.25','AD000044','AS000022','1'),
	('ADL000089','收到存款0089','AS99990089','借','722536.69','AD000045','AS000023','1'),
	('ADL000090','收到存款0090','AS99990090','贷','870394.75','AD000045','AS000023','1'),
	('ADL000091','收到存款0091','AS99990091','借','927684.75','AD000046','AS000023','1'),
	('ADL000092','收到存款0092','AS99990092','贷','761309.94','AD000046','AS000023','1'),
	('ADL000093','收到存款0093','AS99990093','借','787020.56','AD000047','AS000024','1'),
	('ADL000094','收到存款0094','AS99990094','贷','828298.00','AD000047','AS000024','1'),
	('ADL000095','收到存款0095','AS99990095','借','817674.06','AD000048','AS000024','1'),
	('ADL000096','收到存款0096','AS99990096','贷','844791.88','AD000048','AS000024','1'),
	('ADL000097','收到存款0097','AS99990097','借','913302.00','AD000049','AS000025','1'),
	('ADL000098','收到存款0098','AS99990098','贷','918173.19','AD000049','AS000025','1'),
	('ADL000099','收到存款0099','AS99990099','借','928630.31','AD000050','AS000025','1'),
	('ADL000100','收到存款0100','AS99990100','贷','700150.19','AD000050','AS000025','1'),
	('ADL000101','收到存款0101','AS99990101','借','778452.88','AD000051','AS000026','1'),
	('ADL000102','收到存款0102','AS99990102','贷','713245.00','AD000051','AS000026','1'),
	('ADL000103','收到存款0103','AS99990103','借','759307.94','AD000052','AS000026','1'),
	('ADL000104','收到存款0104','AS99990104','贷','750531.44','AD000052','AS000026','1'),
	('ADL000105','收到存款0105','AS99990105','借','825494.75','AD000053','AS000027','1'),
	('ADL000106','收到存款0106','AS99990106','贷','869514.56','AD000053','AS000027','1'),
	('ADL000107','收到存款0107','AS99990107','借','739695.88','AD000054','AS000027','1'),
	('ADL000108','收到存款0108','AS99990108','贷','929374.88','AD000054','AS000027','1'),
	('ADL000109','收到存款0109','AS99990109','借','973343.94','AD000055','AS000028','1'),
	('ADL000110','收到存款0110','AS99990110','贷','785161.75','AD000055','AS000028','1'),
	('ADL000111','收到存款0111','AS99990111','借','959854.69','AD000056','AS000028','1'),
	('ADL000112','收到存款0112','AS99990112','贷','911644.62','AD000056','AS000028','1'),
	('ADL000113','收到存款0113','AS99990113','借','988983.50','AD000057','AS000029','1'),
	('ADL000114','收到存款0114','AS99990114','贷','834370.44','AD000057','AS000029','1'),
	('ADL000115','收到存款0115','AS99990115','借','721997.69','AD000058','AS000029','1'),
	('ADL000116','收到存款0116','AS99990116','贷','800985.44','AD000058','AS000029','1'),
	('ADL000117','收到存款0117','AS99990117','借','751383.44','AD000059','AS000030','1'),
	('ADL000118','收到存款0118','AS99990118','贷','979944.38','AD000059','AS000030','1'),
	('ADL000119','收到存款0119','AS99990119','借','765749.81','AD000060','AS000030','1'),
	('ADL000120','收到存款0120','AS99990120','贷','849266.88','AD000060','AS000030','1'),
	('ADL000121','收到存款0121','AS99990121','借','784277.81','AD000061','AS000031','1'),
	('ADL000122','收到存款0122','AS99990122','贷','749307.81','AD000061','AS000031','1'),
	('ADL000123','收到存款0123','AS99990123','借','901953.75','AD000062','AS000031','1'),
	('ADL000124','收到存款0124','AS99990124','贷','962704.50','AD000062','AS000031','1'),
	('ADL000125','收到存款0125','AS99990125','借','788312.69','AD000063','AS000032','1'),
	('ADL000126','收到存款0126','AS99990126','贷','813859.44','AD000063','AS000032','1'),
	('ADL000127','收到存款0127','AS99990127','借','813644.06','AD000064','AS000032','1'),
	('ADL000128','收到存款0128','AS99990128','贷','877122.75','AD000064','AS000032','1');

insert into level_one_department_data values
	('LOD000001','RSCC000001','供应链部','主要执行集团信息系统建设，维护，规划','刘强','2019-07-29','1'),
	('LOD000002','RSCC000001','采购部','主要执行集团信息系统建设，维护，规划0002','王德宏','2017-01-28','1');

insert into level_two_department_data values
	('LTD000001','LOD000001','信息系统部大数据部门','主要执行集团信息系统建设，维护，规划','2018-09-02','1'),
	('LTD000002','LOD000001','信息系统部大数据部门0002','主要执行集团信息系统建设，维护，规划0002','2018-01-27','1'),
	('LTD000003','LOD000002','信息系统部大数据部门0003','主要执行集团信息系统建设，维护，规划0003','2018-12-03','1'),
	('LTD000004','LOD000002','信息系统部大数据部门0004','主要执行集团信息系统建设，维护，规划0004','2018-06-18','1');

insert into level_three_department_data values
	('LTD000001','LTD000001','信息系统部大数据清洗组','主要执行集团信息系统建设，维护，规划','2018-11-08','1'),
	('LTD000002','LTD000001','信息系统部大数据运算组','主要执行集团信息系统建设，维护，规划0002','2018-01-17','1'),
	('LTD000003','LTD000002','信息系统部大数据解决方案组','主要执行集团信息系统建设，维护，规划0003','2019-04-04','1'),
	('LTD000004','LTD000002','信息系统部大数据清洗组','主要执行集团信息系统建设，维护，规划0004','2017-04-26','1'),
	('LTD000005','LTD000003','信息系统部大数据运算组','主要执行集团信息系统建设，维护，规划0005','2017-04-22','1'),
	('LTD000006','LTD000003','信息系统部大数据解决方案组','主要执行集团信息系统建设，维护，规划0006','2018-05-05','1'),
	('LTD000007','LTD000004','信息系统部大数据清洗组','主要执行集团信息系统建设，维护，规划0007','2019-08-15','1'),
	('LTD000008','LTD000004','信息系统部大数据运算组','主要执行集团信息系统建设，维护，规划0008','2017-05-19','1');

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
	('V000001','面试官','小伙子不错，值得培养','2017-07-20','1');

insert into employee_data values
	('E000001','RSCC000001','程序员','LTD000001','张','文强','share@163.com','北京','学院路234号','18677778888','OT000001','RT000001','SG000001','6226 7788 9908 ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-10 22:05:05','JOB_APPLIED','1'),
	('E000002','RSCC000001','程序员0002','LTD000001','王','大伟','2@qq.com','天津','学院路234号0002','13900000002','OT000001','RT000001','SG000001','6226 7788 9908 0002',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-08-28 10:12:58','PASSED_WITH_PROFESSION','1'),
	('E000003','RSCC000001','程序员0003','LTD000002','李','字章','3@qq.com','成都','学院路234号0003','13900000003','OT000001','RT000001','SG000001','6226 7788 9908 0003',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-06 00:49:40','PASSED_BY_HR','1'),
	('E000004','RSCC000001','程序员0004','LTD000002','贺','文强','4@qq.com','上海','学院路234号0004','13900000004','OT000001','RT000001','SG000001','6226 7788 9908 0004',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-07 10:23:12','OFFER_APPROVED','1'),
	('E000005','RSCC000001','程序员0005','LTD000003','张','大伟','5@qq.com','深圳','学院路234号0005','13900000005','OT000001','RT000001','SG000001','6226 7788 9908 0005',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-07 23:59:54','OFFER_ACCEPTED','1'),
	('E000006','RSCC000001','程序员0006','LTD000003','王','字章','6@qq.com','广州','学院路234号0006','13900000006','OT000001','RT000001','SG000001','6226 7788 9908 0006',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-12 08:44:26','EMPLOYEE_BOARDED','1'),
	('E000007','RSCC000001','程序员0007','LTD000004','李','文强','7@qq.com','西安','学院路234号0007','13900000007','OT000001','RT000001','SG000001','6226 7788 9908 0007',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-03 17:03:16','TERMINATED','1'),
	('E000008','RSCC000001','程序员0008','LTD000004','贺','大伟','8@qq.com','北京','学院路234号0008','13900000008','OT000001','RT000001','SG000001','6226 7788 9908 0008',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-13 17:04:07','JOB_APPLIED','1'),
	('E000009','RSCC000001','程序员0009','LTD000005','张','字章','9@qq.com','天津','学院路234号0009','13900000009','OT000002','RT000002','SG000002','6226 7788 9908 0009',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-10 11:36:21','PASSED_WITH_PROFESSION','1'),
	('E000010','RSCC000001','程序员0010','LTD000005','王','文强','10@qq.com','成都','学院路234号0010','13900000010','OT000002','RT000002','SG000002','6226 7788 9908 0010',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-01 15:00:47','PASSED_BY_HR','1'),
	('E000011','RSCC000001','程序员0011','LTD000006','李','大伟','11@qq.com','上海','学院路234号0011','13900000011','OT000002','RT000002','SG000002','6226 7788 9908 0011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-02 09:26:46','OFFER_APPROVED','1'),
	('E000012','RSCC000001','程序员0012','LTD000006','贺','字章','12@qq.com','深圳','学院路234号0012','13900000012','OT000002','RT000002','SG000002','6226 7788 9908 0012',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-08 15:45:53','OFFER_ACCEPTED','1'),
	('E000013','RSCC000001','程序员0013','LTD000007','张','文强','13@qq.com','广州','学院路234号0013','13900000013','OT000002','RT000002','SG000002','6226 7788 9908 0013',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-15 15:01:00','EMPLOYEE_BOARDED','1'),
	('E000014','RSCC000001','程序员0014','LTD000007','王','大伟','14@qq.com','西安','学院路234号0014','13900000014','OT000002','RT000002','SG000002','6226 7788 9908 0014',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-11 19:35:38','TERMINATED','1'),
	('E000015','RSCC000001','程序员0015','LTD000008','李','字章','15@qq.com','北京','学院路234号0015','13900000015','OT000002','RT000002','SG000002','6226 7788 9908 0015',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-16 08:10:30','JOB_APPLIED','1'),
	('E000016','RSCC000001','程序员0016','LTD000008','贺','文强','16@qq.com','天津','学院路234号0016','13900000016','OT000002','RT000002','SG000002','6226 7788 9908 0016',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-15 13:33:37','PASSED_WITH_PROFESSION','1');

insert into job_application_data values
	('JA000001','2019-07-02','申请者本人','我觉得我符合职位要求，请给我一个机会为公司发展做出贡献，谢谢！','1');

insert into profession_interview_data values
	('PI000001','技术部','2019-06-20','能力各方面表现不错，进入下一轮','1');

insert into hr_interview_data values
	('HI000001','人力资源部','2017-03-07','软技能，责任感，气质不错啊','1');

insert into offer_approval_data values
	('OA000001','总经理','2017-09-19','该员工发展潜力不错，','1');

insert into offer_acceptance_data values
	('OA000001','申请者','2018-04-10','谢谢，我一个月内上班','1');

insert into employee_boarding_data values
	('EB000001','人力资源部','2019-08-02','欢迎加入植物医生大家庭','1');

insert into instructor_data values
	('I000001','高级讲师','张','文强','18699990000','instructor@gmail.com','RSCC000001','这是一个长长长长长长长长的介绍','2019-08-29 15:59:43','1'),
	('I000002','高级讲师0002','王','大伟','13900000002','2@qq.com','RSCC000001','这是一个长长长长长长长长的介绍0002','2019-09-03 06:54:58','1');

insert into company_training_data values
	('CT000001','入职培训','RSCC000001','I000001','TCT000001','2019-05-21','3','2019-08-31 10:23:32','1'),
	('CT000002','入职培训0002','RSCC000001','I000001','TCT000001','2017-08-06','3','2019-09-12 01:34:09','1'),
	('CT000003','入职培训0003','RSCC000001','I000002','TCT000002','2019-06-18','3','2019-09-12 01:37:50','1'),
	('CT000004','入职培训0004','RSCC000001','I000002','TCT000002','2018-08-09','3','2019-09-07 09:03:11','1');

insert into scoring_data values
	('S000001','王志文','83','这个题做的真不错啊','1');

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
	('EWE000001','E000001','2017-12-21','2017-04-07','丝芙兰化妆品公司','在此期间取得非常好的绩效，赢得了客户的信赖','1'),
	('EWE000002','E000001','2019-08-05','2019-05-29','丝芙兰化妆品公司0002','在此期间取得非常好的绩效，赢得了客户的信赖0002','1'),
	('EWE000003','E000002','2019-06-03','2017-09-07','丝芙兰化妆品公司0003','在此期间取得非常好的绩效，赢得了客户的信赖0003','1'),
	('EWE000004','E000002','2019-01-08','2018-07-18','丝芙兰化妆品公司0004','在此期间取得非常好的绩效，赢得了客户的信赖0004','1'),
	('EWE000005','E000003','2019-04-09','2018-07-27','丝芙兰化妆品公司0005','在此期间取得非常好的绩效，赢得了客户的信赖0005','1'),
	('EWE000006','E000003','2018-07-30','2019-03-10','丝芙兰化妆品公司0006','在此期间取得非常好的绩效，赢得了客户的信赖0006','1'),
	('EWE000007','E000004','2017-07-18','2016-11-11','丝芙兰化妆品公司0007','在此期间取得非常好的绩效，赢得了客户的信赖0007','1'),
	('EWE000008','E000004','2018-06-23','2017-11-19','丝芙兰化妆品公司0008','在此期间取得非常好的绩效，赢得了客户的信赖0008','1'),
	('EWE000009','E000005','2017-08-13','2019-08-25','丝芙兰化妆品公司0009','在此期间取得非常好的绩效，赢得了客户的信赖0009','1'),
	('EWE000010','E000005','2017-03-14','2019-04-25','丝芙兰化妆品公司0010','在此期间取得非常好的绩效，赢得了客户的信赖0010','1'),
	('EWE000011','E000006','2018-04-04','2019-07-14','丝芙兰化妆品公司0011','在此期间取得非常好的绩效，赢得了客户的信赖0011','1'),
	('EWE000012','E000006','2017-08-08','2019-03-17','丝芙兰化妆品公司0012','在此期间取得非常好的绩效，赢得了客户的信赖0012','1'),
	('EWE000013','E000007','2018-08-18','2017-06-07','丝芙兰化妆品公司0013','在此期间取得非常好的绩效，赢得了客户的信赖0013','1'),
	('EWE000014','E000007','2018-06-16','2017-05-04','丝芙兰化妆品公司0014','在此期间取得非常好的绩效，赢得了客户的信赖0014','1'),
	('EWE000015','E000008','2018-04-13','2017-02-16','丝芙兰化妆品公司0015','在此期间取得非常好的绩效，赢得了客户的信赖0015','1'),
	('EWE000016','E000008','2019-04-14','2019-07-12','丝芙兰化妆品公司0016','在此期间取得非常好的绩效，赢得了客户的信赖0016','1'),
	('EWE000017','E000009','2019-06-04','2017-11-10','丝芙兰化妆品公司0017','在此期间取得非常好的绩效，赢得了客户的信赖0017','1'),
	('EWE000018','E000009','2017-08-28','2018-12-04','丝芙兰化妆品公司0018','在此期间取得非常好的绩效，赢得了客户的信赖0018','1'),
	('EWE000019','E000010','2019-02-09','2017-02-21','丝芙兰化妆品公司0019','在此期间取得非常好的绩效，赢得了客户的信赖0019','1'),
	('EWE000020','E000010','2018-07-29','2017-04-10','丝芙兰化妆品公司0020','在此期间取得非常好的绩效，赢得了客户的信赖0020','1'),
	('EWE000021','E000011','2017-02-22','2017-03-15','丝芙兰化妆品公司0021','在此期间取得非常好的绩效，赢得了客户的信赖0021','1'),
	('EWE000022','E000011','2018-11-29','2018-08-11','丝芙兰化妆品公司0022','在此期间取得非常好的绩效，赢得了客户的信赖0022','1'),
	('EWE000023','E000012','2016-11-16','2016-12-18','丝芙兰化妆品公司0023','在此期间取得非常好的绩效，赢得了客户的信赖0023','1'),
	('EWE000024','E000012','2019-03-18','2018-09-23','丝芙兰化妆品公司0024','在此期间取得非常好的绩效，赢得了客户的信赖0024','1'),
	('EWE000025','E000013','2017-01-17','2018-01-09','丝芙兰化妆品公司0025','在此期间取得非常好的绩效，赢得了客户的信赖0025','1'),
	('EWE000026','E000013','2017-06-27','2016-12-04','丝芙兰化妆品公司0026','在此期间取得非常好的绩效，赢得了客户的信赖0026','1'),
	('EWE000027','E000014','2017-04-04','2019-01-23','丝芙兰化妆品公司0027','在此期间取得非常好的绩效，赢得了客户的信赖0027','1'),
	('EWE000028','E000014','2017-11-15','2016-10-24','丝芙兰化妆品公司0028','在此期间取得非常好的绩效，赢得了客户的信赖0028','1'),
	('EWE000029','E000015','2018-07-01','2019-02-27','丝芙兰化妆品公司0029','在此期间取得非常好的绩效，赢得了客户的信赖0029','1'),
	('EWE000030','E000015','2017-04-10','2018-09-27','丝芙兰化妆品公司0030','在此期间取得非常好的绩效，赢得了客户的信赖0030','1'),
	('EWE000031','E000016','2019-07-21','2016-10-16','丝芙兰化妆品公司0031','在此期间取得非常好的绩效，赢得了客户的信赖0031','1'),
	('EWE000032','E000016','2018-05-08','2017-11-17','丝芙兰化妆品公司0032','在此期间取得非常好的绩效，赢得了客户的信赖0032','1');

insert into employee_leave_data values
	('EL000001','E000001','LT000001','8','请年假，出去耍！！！！','1'),
	('EL000002','E000001','LT000001','7','请年假，出去耍！！！！0002','1'),
	('EL000003','E000002','LT000001','7','请年假，出去耍！！！！0003','1'),
	('EL000004','E000002','LT000001','7','请年假，出去耍！！！！0004','1'),
	('EL000005','E000003','LT000001','8','请年假，出去耍！！！！0005','1'),
	('EL000006','E000003','LT000001','7','请年假，出去耍！！！！0006','1'),
	('EL000007','E000004','LT000001','7','请年假，出去耍！！！！0007','1'),
	('EL000008','E000004','LT000001','7','请年假，出去耍！！！！0008','1'),
	('EL000009','E000005','LT000001','8','请年假，出去耍！！！！0009','1'),
	('EL000010','E000005','LT000001','8','请年假，出去耍！！！！0010','1'),
	('EL000011','E000006','LT000001','7','请年假，出去耍！！！！0011','1'),
	('EL000012','E000006','LT000001','8','请年假，出去耍！！！！0012','1'),
	('EL000013','E000007','LT000001','7','请年假，出去耍！！！！0013','1'),
	('EL000014','E000007','LT000001','6','请年假，出去耍！！！！0014','1'),
	('EL000015','E000008','LT000001','7','请年假，出去耍！！！！0015','1'),
	('EL000016','E000008','LT000001','7','请年假，出去耍！！！！0016','1'),
	('EL000017','E000009','LT000002','6','请年假，出去耍！！！！0017','1'),
	('EL000018','E000009','LT000002','7','请年假，出去耍！！！！0018','1'),
	('EL000019','E000010','LT000002','7','请年假，出去耍！！！！0019','1'),
	('EL000020','E000010','LT000002','7','请年假，出去耍！！！！0020','1'),
	('EL000021','E000011','LT000002','8','请年假，出去耍！！！！0021','1'),
	('EL000022','E000011','LT000002','7','请年假，出去耍！！！！0022','1'),
	('EL000023','E000012','LT000002','7','请年假，出去耍！！！！0023','1'),
	('EL000024','E000012','LT000002','7','请年假，出去耍！！！！0024','1'),
	('EL000025','E000013','LT000002','8','请年假，出去耍！！！！0025','1'),
	('EL000026','E000013','LT000002','8','请年假，出去耍！！！！0026','1'),
	('EL000027','E000014','LT000002','7','请年假，出去耍！！！！0027','1'),
	('EL000028','E000014','LT000002','7','请年假，出去耍！！！！0028','1'),
	('EL000029','E000015','LT000002','8','请年假，出去耍！！！！0029','1'),
	('EL000030','E000015','LT000002','8','请年假，出去耍！！！！0030','1'),
	('EL000031','E000016','LT000002','7','请年假，出去耍！！！！0031','1'),
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
	('EA000001','E000001','2017-08-22','2018-09-01','8','今天状态不错啊','1'),
	('EA000002','E000001','2018-05-21','2017-08-09','8','今天状态不错啊0002','1'),
	('EA000003','E000002','2019-06-08','2019-03-26','8','今天状态不错啊0003','1'),
	('EA000004','E000002','2017-04-27','2019-03-26','7','今天状态不错啊0004','1'),
	('EA000005','E000003','2019-03-28','2017-08-22','8','今天状态不错啊0005','1'),
	('EA000006','E000003','2019-02-20','2018-02-05','7','今天状态不错啊0006','1'),
	('EA000007','E000004','2019-01-22','2018-10-15','6','今天状态不错啊0007','1'),
	('EA000008','E000004','2017-10-31','2017-12-24','7','今天状态不错啊0008','1'),
	('EA000009','E000005','2018-02-22','2018-02-28','8','今天状态不错啊0009','1'),
	('EA000010','E000005','2018-07-08','2016-10-05','7','今天状态不错啊0010','1'),
	('EA000011','E000006','2016-09-18','2018-10-20','8','今天状态不错啊0011','1'),
	('EA000012','E000006','2018-09-02','2019-09-10','8','今天状态不错啊0012','1'),
	('EA000013','E000007','2018-10-15','2018-12-24','8','今天状态不错啊0013','1'),
	('EA000014','E000007','2019-04-29','2019-03-11','6','今天状态不错啊0014','1'),
	('EA000015','E000008','2017-08-15','2018-04-08','6','今天状态不错啊0015','1'),
	('EA000016','E000008','2019-06-16','2018-05-30','8','今天状态不错啊0016','1'),
	('EA000017','E000009','2019-07-29','2019-03-02','7','今天状态不错啊0017','1'),
	('EA000018','E000009','2016-12-04','2017-10-26','7','今天状态不错啊0018','1'),
	('EA000019','E000010','2019-04-14','2018-09-06','7','今天状态不错啊0019','1'),
	('EA000020','E000010','2017-06-11','2018-03-30','8','今天状态不错啊0020','1'),
	('EA000021','E000011','2019-07-31','2018-10-21','8','今天状态不错啊0021','1'),
	('EA000022','E000011','2017-08-29','2018-11-22','7','今天状态不错啊0022','1'),
	('EA000023','E000012','2018-12-08','2017-03-25','8','今天状态不错啊0023','1'),
	('EA000024','E000012','2016-11-17','2016-12-24','8','今天状态不错啊0024','1'),
	('EA000025','E000013','2017-04-19','2017-06-09','7','今天状态不错啊0025','1'),
	('EA000026','E000013','2016-10-25','2017-11-12','8','今天状态不错啊0026','1'),
	('EA000027','E000014','2019-07-16','2019-08-09','7','今天状态不错啊0027','1'),
	('EA000028','E000014','2019-07-07','2019-06-04','8','今天状态不错啊0028','1'),
	('EA000029','E000015','2017-06-04','2018-08-19','8','今天状态不错啊0029','1'),
	('EA000030','E000015','2017-01-12','2019-07-21','8','今天状态不错啊0030','1'),
	('EA000031','E000016','2018-12-20','2018-12-15','8','今天状态不错啊0031','1'),
	('EA000032','E000016','2017-03-06','2018-09-18','6','今天状态不错啊0032','1');

insert into employee_qualifier_data values
	('EQ000001','E000001','2018-06-30','认证药剂师','高级','考试成绩当年第一名','1'),
	('EQ000002','E000001','2017-06-15','认证架构师','中级','考试成绩当年第一名0002','1'),
	('EQ000003','E000002','2018-08-08','认证会计师','初级','考试成绩当年第一名0003','1'),
	('EQ000004','E000002','2019-09-09','认证经济师','高级','考试成绩当年第一名0004','1'),
	('EQ000005','E000003','2018-11-23','OCP','中级','考试成绩当年第一名0005','1'),
	('EQ000006','E000003','2017-12-05','CCNA','初级','考试成绩当年第一名0006','1'),
	('EQ000007','E000004','2018-11-17','CCNP','高级','考试成绩当年第一名0007','1'),
	('EQ000008','E000004','2017-11-09','认证药剂师','中级','考试成绩当年第一名0008','1'),
	('EQ000009','E000005','2018-05-23','认证架构师','初级','考试成绩当年第一名0009','1'),
	('EQ000010','E000005','2017-01-21','认证会计师','高级','考试成绩当年第一名0010','1'),
	('EQ000011','E000006','2018-07-27','认证经济师','中级','考试成绩当年第一名0011','1'),
	('EQ000012','E000006','2018-11-08','OCP','初级','考试成绩当年第一名0012','1'),
	('EQ000013','E000007','2017-07-30','CCNA','高级','考试成绩当年第一名0013','1'),
	('EQ000014','E000007','2018-08-12','CCNP','中级','考试成绩当年第一名0014','1'),
	('EQ000015','E000008','2018-01-03','认证药剂师','初级','考试成绩当年第一名0015','1'),
	('EQ000016','E000008','2018-07-18','认证架构师','高级','考试成绩当年第一名0016','1'),
	('EQ000017','E000009','2017-12-10','认证会计师','中级','考试成绩当年第一名0017','1'),
	('EQ000018','E000009','2017-05-19','认证经济师','初级','考试成绩当年第一名0018','1'),
	('EQ000019','E000010','2018-03-11','OCP','高级','考试成绩当年第一名0019','1'),
	('EQ000020','E000010','2017-09-03','CCNA','中级','考试成绩当年第一名0020','1'),
	('EQ000021','E000011','2019-03-14','CCNP','初级','考试成绩当年第一名0021','1'),
	('EQ000022','E000011','2017-11-19','认证药剂师','高级','考试成绩当年第一名0022','1'),
	('EQ000023','E000012','2019-02-02','认证架构师','中级','考试成绩当年第一名0023','1'),
	('EQ000024','E000012','2017-09-16','认证会计师','初级','考试成绩当年第一名0024','1'),
	('EQ000025','E000013','2018-12-07','认证经济师','高级','考试成绩当年第一名0025','1'),
	('EQ000026','E000013','2018-09-17','OCP','中级','考试成绩当年第一名0026','1'),
	('EQ000027','E000014','2019-02-19','CCNA','初级','考试成绩当年第一名0027','1'),
	('EQ000028','E000014','2018-10-28','CCNP','高级','考试成绩当年第一名0028','1'),
	('EQ000029','E000015','2018-11-02','认证药剂师','中级','考试成绩当年第一名0029','1'),
	('EQ000030','E000015','2018-01-15','认证架构师','初级','考试成绩当年第一名0030','1'),
	('EQ000031','E000016','2016-12-02','认证会计师','高级','考试成绩当年第一名0031','1'),
	('EQ000032','E000016','2019-04-09','认证经济师','中级','考试成绩当年第一名0032','1');

insert into employee_education_data values
	('EE000001','E000001','2017-03-23','小学','考试成绩当年第一名','1'),
	('EE000002','E000001','2019-04-26','初中','考试成绩当年第一名0002','1'),
	('EE000003','E000002','2017-03-13','高中','考试成绩当年第一名0003','1'),
	('EE000004','E000002','2018-07-01','大学','考试成绩当年第一名0004','1'),
	('EE000005','E000003','2018-09-10','硕士','考试成绩当年第一名0005','1'),
	('EE000006','E000003','2018-06-20','博士','考试成绩当年第一名0006','1'),
	('EE000007','E000004','2019-02-03','职业教育','考试成绩当年第一名0007','1'),
	('EE000008','E000004','2017-01-27','小学','考试成绩当年第一名0008','1'),
	('EE000009','E000005','2017-03-09','初中','考试成绩当年第一名0009','1'),
	('EE000010','E000005','2017-10-15','高中','考试成绩当年第一名0010','1'),
	('EE000011','E000006','2017-05-08','大学','考试成绩当年第一名0011','1'),
	('EE000012','E000006','2017-11-25','硕士','考试成绩当年第一名0012','1'),
	('EE000013','E000007','2017-10-24','博士','考试成绩当年第一名0013','1'),
	('EE000014','E000007','2017-07-28','职业教育','考试成绩当年第一名0014','1'),
	('EE000015','E000008','2018-03-28','小学','考试成绩当年第一名0015','1'),
	('EE000016','E000008','2017-05-27','初中','考试成绩当年第一名0016','1'),
	('EE000017','E000009','2017-01-31','高中','考试成绩当年第一名0017','1'),
	('EE000018','E000009','2017-09-06','大学','考试成绩当年第一名0018','1'),
	('EE000019','E000010','2017-07-25','硕士','考试成绩当年第一名0019','1'),
	('EE000020','E000010','2019-04-14','博士','考试成绩当年第一名0020','1'),
	('EE000021','E000011','2019-04-03','职业教育','考试成绩当年第一名0021','1'),
	('EE000022','E000011','2017-09-16','小学','考试成绩当年第一名0022','1'),
	('EE000023','E000012','2018-12-27','初中','考试成绩当年第一名0023','1'),
	('EE000024','E000012','2017-12-24','高中','考试成绩当年第一名0024','1'),
	('EE000025','E000013','2018-10-14','大学','考试成绩当年第一名0025','1'),
	('EE000026','E000013','2018-10-28','硕士','考试成绩当年第一名0026','1'),
	('EE000027','E000014','2018-08-24','博士','考试成绩当年第一名0027','1'),
	('EE000028','E000014','2017-05-09','职业教育','考试成绩当年第一名0028','1'),
	('EE000029','E000015','2016-10-21','小学','考试成绩当年第一名0029','1'),
	('EE000030','E000015','2019-06-01','初中','考试成绩当年第一名0030','1'),
	('EE000031','E000016','2019-09-06','高中','考试成绩当年第一名0031','1'),
	('EE000032','E000016','2019-03-01','大学','考试成绩当年第一名0032','1');

insert into employee_award_data values
	('EA000001','E000001','2016-10-08','明星员工','考试成绩当年第一名','1'),
	('EA000002','E000001','2019-06-18','销售之星','考试成绩当年第一名0002','1'),
	('EA000003','E000002','2019-01-27','技术之星','考试成绩当年第一名0003','1'),
	('EA000004','E000002','2018-08-14','管理之星','考试成绩当年第一名0004','1'),
	('EA000005','E000003','2017-04-10','终身成就奖','考试成绩当年第一名0005','1'),
	('EA000006','E000003','2018-12-17','明星员工','考试成绩当年第一名0006','1'),
	('EA000007','E000004','2017-10-04','销售之星','考试成绩当年第一名0007','1'),
	('EA000008','E000004','2017-10-24','技术之星','考试成绩当年第一名0008','1'),
	('EA000009','E000005','2018-04-30','管理之星','考试成绩当年第一名0009','1'),
	('EA000010','E000005','2018-02-26','终身成就奖','考试成绩当年第一名0010','1'),
	('EA000011','E000006','2017-08-04','明星员工','考试成绩当年第一名0011','1'),
	('EA000012','E000006','2017-01-23','销售之星','考试成绩当年第一名0012','1'),
	('EA000013','E000007','2016-12-19','技术之星','考试成绩当年第一名0013','1'),
	('EA000014','E000007','2017-12-23','管理之星','考试成绩当年第一名0014','1'),
	('EA000015','E000008','2018-06-10','终身成就奖','考试成绩当年第一名0015','1'),
	('EA000016','E000008','2019-01-07','明星员工','考试成绩当年第一名0016','1'),
	('EA000017','E000009','2018-06-16','销售之星','考试成绩当年第一名0017','1'),
	('EA000018','E000009','2017-01-19','技术之星','考试成绩当年第一名0018','1'),
	('EA000019','E000010','2017-01-21','管理之星','考试成绩当年第一名0019','1'),
	('EA000020','E000010','2017-03-07','终身成就奖','考试成绩当年第一名0020','1'),
	('EA000021','E000011','2016-11-01','明星员工','考试成绩当年第一名0021','1'),
	('EA000022','E000011','2018-09-24','销售之星','考试成绩当年第一名0022','1'),
	('EA000023','E000012','2018-01-22','技术之星','考试成绩当年第一名0023','1'),
	('EA000024','E000012','2017-08-31','管理之星','考试成绩当年第一名0024','1'),
	('EA000025','E000013','2018-10-14','终身成就奖','考试成绩当年第一名0025','1'),
	('EA000026','E000013','2016-12-12','明星员工','考试成绩当年第一名0026','1'),
	('EA000027','E000014','2017-10-11','销售之星','考试成绩当年第一名0027','1'),
	('EA000028','E000014','2019-04-06','技术之星','考试成绩当年第一名0028','1'),
	('EA000029','E000015','2017-06-04','管理之星','考试成绩当年第一名0029','1'),
	('EA000030','E000015','2018-04-11','终身成就奖','考试成绩当年第一名0030','1'),
	('EA000031','E000016','2018-02-23','明星员工','考试成绩当年第一名0031','1'),
	('EA000032','E000016','2019-07-28','销售之星','考试成绩当年第一名0032','1');

insert into employee_salary_sheet_data values
	('ESS000001','E000001','SG000001','2446.70','739.87','736.03','731.05','779.38','997.41','6.67',NULL,'PAID_OFF','1'),
	('ESS000002','E000001','SG000001','2122.32','918.83','857.86','711.57','1049.10','961.56','6.69',NULL,'PAID_OFF0002','1'),
	('ESS000003','E000001','SG000001','2402.62','950.53','942.10','588.87','951.85','1031.56','8.56',NULL,'PAID_OFF0003','1'),
	('ESS000004','E000001','SG000001','2780.03','895.25','904.09','739.02','982.51','1015.96','7.75',NULL,'PAID_OFF0004','1'),
	('ESS000005','E000002','SG000001','2611.01','981.03','916.81','694.72','937.61','1176.05','6.34',NULL,'PAID_OFF0005','1'),
	('ESS000006','E000002','SG000001','2924.95','753.34','732.91','743.73','808.32','892.36','6.47',NULL,'PAID_OFF0006','1'),
	('ESS000007','E000002','SG000001','2736.34','902.70','793.93','658.66','980.15','929.57','6.97',NULL,'PAID_OFF0007','1'),
	('ESS000008','E000002','SG000001','2447.12','932.70','793.56','567.56','916.03','946.41','6.60',NULL,'PAID_OFF0008','1'),
	('ESS000009','E000003','SG000001','2139.07','793.13','972.48','582.01','838.75','1066.47','7.86',NULL,'PAID_OFF0009','1'),
	('ESS000010','E000003','SG000001','2568.28','807.34','978.75','757.97','959.92','1039.30','6.30',NULL,'PAID_OFF0010','1'),
	('ESS000011','E000003','SG000001','2684.46','846.67','951.14','732.95','826.36','1031.62','8.26',NULL,'PAID_OFF0011','1'),
	('ESS000012','E000003','SG000001','2974.87','990.96','941.27','725.67','806.68','873.26','7.07',NULL,'PAID_OFF0012','1'),
	('ESS000013','E000004','SG000001','2148.84','964.93','768.11','676.49','917.87','933.75','6.57',NULL,'PAID_OFF0013','1'),
	('ESS000014','E000004','SG000001','2528.88','758.68','917.32','587.42','802.14','1166.61','8.05',NULL,'PAID_OFF0014','1'),
	('ESS000015','E000004','SG000001','2160.32','764.18','768.82','589.89','878.06','1081.61','7.72',NULL,'PAID_OFF0015','1'),
	('ESS000016','E000004','SG000001','2541.28','725.81','845.57','739.28','1056.37','1142.88','6.30',NULL,'PAID_OFF0016','1'),
	('ESS000017','E000005','SG000001','2402.56','838.89','979.11','577.38','838.43','865.01','7.32',NULL,'PAID_OFF0017','1'),
	('ESS000018','E000005','SG000001','2832.07','767.43','960.48','773.79','983.64','945.47','6.45',NULL,'PAID_OFF0018','1'),
	('ESS000019','E000005','SG000001','2159.91','860.10','966.79','737.81','1065.26','1008.75','7.01',NULL,'PAID_OFF0019','1'),
	('ESS000020','E000005','SG000001','2684.88','700.24','989.40','687.35','1095.74','1011.77','6.24',NULL,'PAID_OFF0020','1'),
	('ESS000021','E000006','SG000001','2732.80','748.25','887.45','785.69','838.03','886.83','7.47',NULL,'PAID_OFF0021','1'),
	('ESS000022','E000006','SG000001','2518.05','898.36','835.93','566.82','827.65','924.93','7.71',NULL,'PAID_OFF0022','1'),
	('ESS000023','E000006','SG000001','2452.83','758.87','858.27','699.69','1013.88','923.62','6.91',NULL,'PAID_OFF0023','1'),
	('ESS000024','E000006','SG000001','2311.33','701.03','960.83','740.82','936.26','965.73','8.53',NULL,'PAID_OFF0024','1'),
	('ESS000025','E000007','SG000001','2792.13','838.54','716.19','589.96','1030.45','894.26','6.79',NULL,'PAID_OFF0025','1'),
	('ESS000026','E000007','SG000001','2974.90','838.03','913.01','635.69','1071.51','935.12','7.11',NULL,'PAID_OFF0026','1'),
	('ESS000027','E000007','SG000001','2148.80','711.86','742.80','703.98','881.72','990.99','8.06',NULL,'PAID_OFF0027','1'),
	('ESS000028','E000007','SG000001','2186.39','836.91','840.04','601.80','961.11','874.46','6.57',NULL,'PAID_OFF0028','1'),
	('ESS000029','E000008','SG000001','2185.48','925.38','977.54','587.85','983.36','988.58','7.42',NULL,'PAID_OFF0029','1'),
	('ESS000030','E000008','SG000001','2322.71','858.34','749.46','611.79','1081.08','958.56','7.59',NULL,'PAID_OFF0030','1'),
	('ESS000031','E000008','SG000001','2771.11','912.40','967.60','580.77','772.96','917.05','6.36',NULL,'PAID_OFF0031','1'),
	('ESS000032','E000008','SG000001','2524.75','788.40','972.73','702.51','972.05','1105.72','7.65',NULL,'PAID_OFF0032','1'),
	('ESS000033','E000009','SG000002','2780.12','830.76','986.28','591.74','1082.46','1070.35','6.29',NULL,'PAID_OFF0033','1'),
	('ESS000034','E000009','SG000002','2470.29','896.17','928.36','596.87','804.36','1153.32','8.29',NULL,'PAID_OFF0034','1'),
	('ESS000035','E000009','SG000002','2923.34','817.65','886.49','606.83','795.80','1148.69','6.90',NULL,'PAID_OFF0035','1'),
	('ESS000036','E000009','SG000002','2929.26','971.85','808.37','783.85','894.88','997.59','7.95',NULL,'PAID_OFF0036','1'),
	('ESS000037','E000010','SG000002','2938.40','877.65','988.52','724.45','1072.15','877.46','8.68',NULL,'PAID_OFF0037','1'),
	('ESS000038','E000010','SG000002','2591.22','709.13','746.92','630.04','863.05','1066.72','7.62',NULL,'PAID_OFF0038','1'),
	('ESS000039','E000010','SG000002','2158.55','975.02','942.15','757.26','867.99','944.20','8.08',NULL,'PAID_OFF0039','1'),
	('ESS000040','E000010','SG000002','2919.16','792.76','836.97','672.95','1042.27','1092.86','8.79',NULL,'PAID_OFF0040','1'),
	('ESS000041','E000011','SG000002','2686.48','706.95','974.04','754.78','854.04','1122.72','7.87',NULL,'PAID_OFF0041','1'),
	('ESS000042','E000011','SG000002','2685.24','829.21','861.20','611.13','965.83','1031.73','6.61',NULL,'PAID_OFF0042','1'),
	('ESS000043','E000011','SG000002','2945.84','745.36','864.27','607.19','841.15','1222.47','7.83',NULL,'PAID_OFF0043','1'),
	('ESS000044','E000011','SG000002','2111.55','799.78','808.58','605.50','991.50','910.58','8.02',NULL,'PAID_OFF0044','1'),
	('ESS000045','E000012','SG000002','2313.13','913.10','783.27','578.24','792.01','1138.57','8.06',NULL,'PAID_OFF0045','1'),
	('ESS000046','E000012','SG000002','2297.61','769.14','876.60','599.54','858.79','1017.17','8.27',NULL,'PAID_OFF0046','1'),
	('ESS000047','E000012','SG000002','2782.01','708.82','717.56','576.25','803.57','1166.39','8.52',NULL,'PAID_OFF0047','1'),
	('ESS000048','E000012','SG000002','2786.12','906.44','769.43','695.32','975.88','1103.07','8.58',NULL,'PAID_OFF0048','1'),
	('ESS000049','E000013','SG000002','2391.55','971.25','982.90','629.19','810.46','857.23','8.88',NULL,'PAID_OFF0049','1'),
	('ESS000050','E000013','SG000002','2668.77','843.22','910.12','590.71','1054.08','957.88','6.24',NULL,'PAID_OFF0050','1'),
	('ESS000051','E000013','SG000002','2615.54','827.04','944.27','601.95','844.96','1059.01','6.53',NULL,'PAID_OFF0051','1'),
	('ESS000052','E000013','SG000002','2469.21','828.25','993.29','674.70','1048.17','1213.80','6.93',NULL,'PAID_OFF0052','1'),
	('ESS000053','E000014','SG000002','2630.42','856.02','768.87','615.41','899.78','1016.74','7.08',NULL,'PAID_OFF0053','1'),
	('ESS000054','E000014','SG000002','2975.28','740.03','730.50','768.21','1081.55','1002.68','7.27',NULL,'PAID_OFF0054','1'),
	('ESS000055','E000014','SG000002','2231.98','922.43','730.06','604.40','774.07','977.87','6.93',NULL,'PAID_OFF0055','1'),
	('ESS000056','E000014','SG000002','2322.02','782.68','728.97','624.18','859.58','889.15','6.36',NULL,'PAID_OFF0056','1'),
	('ESS000057','E000015','SG000002','2489.75','722.01','763.80','673.85','1017.93','1048.03','7.49',NULL,'PAID_OFF0057','1'),
	('ESS000058','E000015','SG000002','2103.64','835.47','811.42','703.34','990.22','1099.26','7.72',NULL,'PAID_OFF0058','1'),
	('ESS000059','E000015','SG000002','2501.17','817.76','778.00','669.75','961.97','885.82','8.74',NULL,'PAID_OFF0059','1'),
	('ESS000060','E000015','SG000002','2703.31','922.36','924.90','605.51','961.96','932.47','8.46',NULL,'PAID_OFF0060','1'),
	('ESS000061','E000016','SG000002','2941.79','736.17','903.36','638.01','982.68','1187.57','6.60',NULL,'PAID_OFF0061','1'),
	('ESS000062','E000016','SG000002','2768.94','754.47','907.12','679.72','880.88','1015.91','8.00',NULL,'PAID_OFF0062','1'),
	('ESS000063','E000016','SG000002','2100.66','758.90','801.70','569.94','1018.51','1061.87','8.38',NULL,'PAID_OFF0063','1'),
	('ESS000064','E000016','SG000002','2907.22','916.88','825.87','705.93','1026.15','1014.30','8.59',NULL,'PAID_OFF0064','1');

insert into paying_off_data values
	('PO000001','出纳','E000001','2018-08-26','3747.90','1'),
	('PO000002','出纳0002','E000001','2018-02-15','5219.57','1'),
	('PO000003','出纳0003','E000002','2018-09-09','3676.05','1'),
	('PO000004','出纳0004','E000002','2017-04-09','4441.56','1'),
	('PO000005','出纳0005','E000003','2016-11-15','4089.95','1'),
	('PO000006','出纳0006','E000003','2017-03-14','4776.96','1'),
	('PO000007','出纳0007','E000004','2018-09-17','4152.45','1'),
	('PO000008','出纳0008','E000004','2017-01-02','4286.22','1'),
	('PO000009','出纳0009','E000005','2019-03-20','4458.82','1'),
	('PO000010','出纳0010','E000005','2018-08-12','4123.41','1'),
	('PO000011','出纳0011','E000006','2017-12-01','3735.05','1'),
	('PO000012','出纳0012','E000006','2018-01-23','4035.52','1'),
	('PO000013','出纳0013','E000007','2018-10-16','5125.87','1'),
	('PO000014','出纳0014','E000007','2018-10-23','4357.29','1'),
	('PO000015','出纳0015','E000008','2018-11-09','3929.63','1'),
	('PO000016','出纳0016','E000008','2018-08-05','3832.27','1'),
	('PO000017','出纳0017','E000009','2019-07-21','4367.39','1'),
	('PO000018','出纳0018','E000009','2019-01-28','4131.66','1'),
	('PO000019','出纳0019','E000010','2017-09-12','4709.23','1'),
	('PO000020','出纳0020','E000010','2018-02-19','5048.27','1'),
	('PO000021','出纳0021','E000011','2018-03-12','3717.19','1'),
	('PO000022','出纳0022','E000011','2019-04-15','4013.39','1'),
	('PO000023','出纳0023','E000012','2019-04-19','4736.65','1'),
	('PO000024','出纳0024','E000012','2019-04-20','4222.54','1'),
	('PO000025','出纳0025','E000013','2019-07-02','4265.57','1'),
	('PO000026','出纳0026','E000013','2019-08-24','4501.41','1'),
	('PO000027','出纳0027','E000014','2019-09-11','4004.62','1'),
	('PO000028','出纳0028','E000014','2016-11-20','3930.31','1'),
	('PO000029','出纳0029','E000015','2018-07-02','3720.09','1'),
	('PO000030','出纳0030','E000015','2018-09-08','4578.48','1'),
	('PO000031','出纳0031','E000016','2017-02-23','5091.97','1'),
	('PO000032','出纳0032','E000016','2018-07-03','4164.51','1');

insert into user_domain_data values
	('UD000001','用户区域','1');

insert into user_white_list_data values
	('UWL000001','clariones','tester;ios-spokesperson','UD000001','1'),
	('UWL000002','13808188512','tester;ios-spokesperson0002','UD000001','1');

insert into sec_user_data values
	('SU000001','login','13900000001','','C183EC89F92A462CF45B95504792EC4625E847C90536EEFE512D1C9DB8602E95','wx123456789abcdefghijklmn','wxapp12098410239840','jwt_token_12345678','0','2019-09-07 07:07:06','2019-08-27 07:23:00','UD000001',NULL,'BLOCKED','1'),
	('SU000002','login0002','13900000002','suddy_chang@163.com','AC2F95628244C6975EB2C36942EA879ED93D93F5895EF3157733E4629FA86B92','wx123456789abcdefghijklmn0002','wxapp120984102398400002','jwt_token_123456780002','9999999','2019-08-31 15:08:02','2019-09-09 21:47:39','UD000001',NULL,'BLOCKED0002','1');

insert into sec_user_blocking_data values
	('SUB000001','currentUser()','2019-09-02 04:10:37','这个用户多次发送违反社区的帖子，现在把他给屏蔽了','1');

insert into user_app_data values
	('UA000001','审车平台','SU000001','users','1','MXWR','CarInspectionPlatform','CIP000001','/link/to/app','1'),
	('UA000002','账户管理','SU000001','bank','1','MXWR','UserDomain','UD000001','/link/to/app0002','1'),
	('UA000003','接车公司','SU000002','wechat','1','MXWR','CarReceivingServiceCompany','CRSC000001','/link/to/app0003','1'),
	('UA000004','审车公司','SU000002','bar-chart','1','MXWR','CarInspectionServiceCompany','CISC000001','/link/to/app0004','1');

insert into quick_link_data values
	('QL000001','列表','facebook','https://demo.doublechaintech.com/demodata/imageManager/genImage/y00/200/200/red/','列表','2019-09-09 23:15:27','UA000001','1'),
	('QL000002','列表0002','google','https://demo.doublechaintech.com/demodata/imageManager/genImage/y00/200/200/red/','列表0002','2019-09-08 17:03:12','UA000001','1'),
	('QL000003','列表0003','facebook','https://demo.doublechaintech.com/demodata/imageManager/genImage/y00/200/200/red/','列表0003','2019-08-31 15:33:53','UA000002','1'),
	('QL000004','列表0004','google','https://demo.doublechaintech.com/demodata/imageManager/genImage/y00/200/200/red/','列表0004','2019-09-13 12:55:20','UA000002','1'),
	('QL000005','列表0005','facebook','https://demo.doublechaintech.com/demodata/imageManager/genImage/y00/200/200/red/','列表0005','2019-09-14 13:32:15','UA000003','1'),
	('QL000006','列表0006','google','https://demo.doublechaintech.com/demodata/imageManager/genImage/y00/200/200/red/','列表0006','2019-08-27 20:20:44','UA000003','1'),
	('QL000007','列表0007','facebook','https://demo.doublechaintech.com/demodata/imageManager/genImage/y00/200/200/red/','列表0007','2019-09-13 11:18:39','UA000004','1'),
	('QL000008','列表0008','google','https://demo.doublechaintech.com/demodata/imageManager/genImage/y00/200/200/red/','列表0008','2019-08-28 04:39:01','UA000004','1');

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
	('LH000001','2019-09-03 19:17:34','192.168.1.1','登陆成功','SU000001','1'),
	('LH000002','2019-09-15 14:37:43','192.168.1.2','登陆成功0002','SU000001','1'),
	('LH000003','2019-09-12 20:40:00','192.168.1.1','登陆成功0003','SU000002','1'),
	('LH000004','2019-09-01 22:58:28','192.168.1.2','登陆成功0004','SU000002','1');

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

