<<<<<<< HEAD
-- BUILD WITH MODEL TIME 190712T2334



=======

-- BUILD WITH MODEL TIME 191114T1246
-- Turn off safe mode
SET SQL_SAFE_UPDATES = 0;
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe


drop database  if exists retailscm;
create database retailscm;
-- alter  database retailscm  character set = utf8mb4  collate = utf8mb4_unicode_ci; -- 支持表情符号
use retailscm;
<<<<<<< HEAD
=======
set SESSION sql_mode='';
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

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
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "双链小超全国运营中心";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "双链小超全国运营中心";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists catalog_data;
create table catalog_data (
	id                            	varchar(48)          not null            comment '序号',
<<<<<<< HEAD
	name                          	varchar(16)                              comment '名称',
	owner                         	varchar(48)                              comment '业主',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "目录";
=======
	name                          	varchar(201)                             comment '名称',
	owner                         	varchar(48)                              comment '业主',
	sub_count                     	int                                      comment '子数',
	amount                        	numeric(6,2)                             comment '金额',
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "目录";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists level_one_category_data;
create table level_one_category_data (
	id                            	varchar(48)          not null            comment '序号',
	catalog                       	varchar(48)                              comment '目录',
	name                          	varchar(16)                              comment '名称',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "一级分类";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "一级分类";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists level_two_category_data;
create table level_two_category_data (
	id                            	varchar(48)          not null            comment '序号',
	parent_category               	varchar(48)                              comment '父类',
	name                          	varchar(16)                              comment '名称',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "二级分类";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "二级分类";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists level_three_category_data;
create table level_three_category_data (
	id                            	varchar(48)          not null            comment '序号',
	parent_category               	varchar(48)                              comment '父类',
	name                          	varchar(16)                              comment '名称',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "三级分类";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "三级分类";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists product_data;
create table product_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(12)                              comment '名称',
	parent_category               	varchar(48)                              comment '父类',
	origin                        	varchar(8)                               comment '产地',
	remark                        	varchar(88)                              comment '备注',
	brand                         	varchar(92)                              comment '品牌',
	picture                       	varchar(512) CHARACTER SET ascii COLLATE ascii_general_ci                     comment '图片',
	last_update_time              	datetime                                 comment '最后更新时间',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "产品";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "产品";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

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
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "SKU";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "SKU";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists retail_store_province_center_data;
create table retail_store_province_center_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(44)                              comment '名称',
	founded                       	date                                     comment '成立',
	country                       	varchar(48)                              comment '国',
	last_update_time              	datetime                                 comment '最后更新时间',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "双链小超省中心";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "双链小超省中心";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists province_center_department_data;
create table province_center_department_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(20)                              comment '名称',
	founded                       	date                                     comment '成立',
	province_center               	varchar(48)                              comment '省中心',
<<<<<<< HEAD
	manager                       	varchar(12)                              comment '经理',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "省中心";
=======
	manager_name                  	varchar(12)                              comment '经理的名字',
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "省中心";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists province_center_employee_data;
create table province_center_employee_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(12)                              comment '名称',
	mobile                        	varchar(44)                              comment '手机',
	email                         	varchar(256)                             comment '电子邮件',
	founded                       	date                                     comment '成立',
	department                    	varchar(48)                              comment '部门',
	province_center               	varchar(48)                              comment '省中心',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "省中心员工";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "省中心员工";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists retail_store_city_service_center_data;
create table retail_store_city_service_center_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(36)                              comment '名称',
	founded                       	date                                     comment '成立',
	belongs_to                    	varchar(48)                              comment '属于',
	last_update_time              	datetime                                 comment '最后更新时间',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "双链小超城市服务中心";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "双链小超城市服务中心";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists city_partner_data;
create table city_partner_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(12)                              comment '名称',
	mobile                        	varchar(44)                              comment '手机',
	city_service_center           	varchar(48)                              comment '城市服务中心',
	description                   	varchar(64)                              comment '描述',
	last_update_time              	datetime                                 comment '最后更新时间',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "城市合伙人";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "城市合伙人";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists potential_customer_data;
create table potential_customer_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(12)                              comment '名称',
	mobile                        	varchar(44)                              comment '手机',
	city_service_center           	varchar(48)                              comment '城市服务中心',
	city_partner                  	varchar(48)                              comment '城市合伙人',
	description                   	varchar(64)                              comment '描述',
	last_update_time              	datetime                                 comment '最后更新时间',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "潜在的客户";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "潜在的客户";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists potential_customer_contact_person_data;
create table potential_customer_contact_person_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(12)                              comment '名称',
	mobile                        	varchar(44)                              comment '手机',
	potential_customer            	varchar(48)                              comment '潜在的客户',
	description                   	varchar(96)                              comment '描述',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "潜在客户联络人";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "潜在客户联络人";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

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
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "潜在客户联系";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "潜在客户联系";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists city_event_data;
create table city_event_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(28)                              comment '名称',
	mobile                        	varchar(44)                              comment '手机',
	city_service_center           	varchar(48)                              comment '城市服务中心',
	description                   	varchar(48)                              comment '描述',
	last_update_time              	datetime                                 comment '最后更新时间',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "城市活动";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "城市活动";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists event_attendance_data;
create table event_attendance_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(36)                              comment '名称',
	potential_customer            	varchar(48)                              comment '潜在的客户',
	city_event                    	varchar(48)                              comment '城市活动',
	description                   	varchar(36)                              comment '描述',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "活动的参与情况";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "活动的参与情况";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists retail_store_data;
create table retail_store_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(24)                              comment '名称',
<<<<<<< HEAD
	telephone                     	varchar(44)                              comment '电话',
=======
	telephone                     	bigint                                   comment '电话',
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
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
<<<<<<< HEAD
	current_status                	varchar(72)                              comment '当前状态',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "双链小超";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "双链小超";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists retail_store_creation_data;
create table retail_store_creation_data (
	id                            	varchar(48)          not null            comment '序号',
	comment                       	varchar(20)                              comment '评论',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "双链小超的创作";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "双链小超的创作";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists retail_store_investment_invitation_data;
create table retail_store_investment_invitation_data (
	id                            	varchar(48)          not null            comment '序号',
	comment                       	varchar(24)                              comment '评论',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "生超招商";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "生超招商";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists retail_store_franchising_data;
create table retail_store_franchising_data (
	id                            	varchar(48)          not null            comment '序号',
	comment                       	varchar(16)                              comment '评论',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "生超的特许经营";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "生超的特许经营";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists retail_store_decoration_data;
create table retail_store_decoration_data (
	id                            	varchar(48)          not null            comment '序号',
	comment                       	varchar(8)                               comment '评论',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "生超装修";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "生超装修";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists retail_store_opening_data;
create table retail_store_opening_data (
	id                            	varchar(48)          not null            comment '序号',
	comment                       	varchar(8)                               comment '评论',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "生超开业";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "生超开业";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists retail_store_closing_data;
create table retail_store_closing_data (
	id                            	varchar(48)          not null            comment '序号',
	comment                       	varchar(8)                               comment '评论',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "商店关闭";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "门店关闭";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists retail_store_member_data;
create table retail_store_member_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(12)                              comment '名称',
	mobile_phone                  	varchar(44)                              comment '移动电话',
	owner                         	varchar(48)                              comment '业主',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "生超会员";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "生超会员";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

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
<<<<<<< HEAD
	current_status                	varchar(36)                              comment '当前状态',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "消费者订单";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "消费者订单";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists consumer_order_confirmation_data;
create table consumer_order_confirmation_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(12)                              comment '谁',
	confirm_time                  	date                                     comment '确认时间',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "客户订单确认";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "客户订单确认";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists consumer_order_approval_data;
create table consumer_order_approval_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(12)                              comment '谁',
	approve_time                  	date                                     comment '批准时间',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "消费者的订单审批";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "消费者的订单审批";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists consumer_order_processing_data;
create table consumer_order_processing_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(12)                              comment '谁',
	process_time                  	date                                     comment '过程的时间',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "消费者的订单处理";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "消费者的订单处理";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists consumer_order_shipment_data;
create table consumer_order_shipment_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(12)                              comment '谁',
	ship_time                     	date                                     comment '船的时间',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "消费者的订单发货";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "消费者的订单发货";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists consumer_order_delivery_data;
create table consumer_order_delivery_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(12)                              comment '谁',
	delivery_time                 	date                                     comment '交货时间',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "消费者订单交货";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "消费者订单交货";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

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
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "消费者订单行项目";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "消费者订单行项目";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists consumer_order_shipping_group_data;
create table consumer_order_shipping_group_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(24)                              comment '名称',
	biz_order                     	varchar(48)                              comment '订单',
	amount                        	numeric(7,2)                             comment '金额',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "消费订单送货分组";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "消费订单送货分组";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists consumer_order_payment_group_data;
create table consumer_order_payment_group_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(16)                              comment '名称',
	biz_order                     	varchar(48)                              comment '订单',
	card_number                   	varchar(68)                              comment '卡号码',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "消费者订单付款组";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "消费者订单付款组";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists consumer_order_price_adjustment_data;
create table consumer_order_price_adjustment_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(16)                              comment '名称',
	biz_order                     	varchar(48)                              comment '订单',
	amount                        	numeric(7,2)                             comment '金额',
	provider                      	varchar(16)                              comment '供应商',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "消费品价格调整";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "消费品价格调整";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists retail_store_member_coupon_data;
create table retail_store_member_coupon_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(12)                              comment '名称',
	owner                         	varchar(48)                              comment '业主',
	number                        	varchar(28)                              comment '数',
	last_update_time              	datetime                                 comment '最后更新时间',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "生超会员优惠券";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "生超会员优惠券";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists member_wishlist_data;
create table member_wishlist_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(24)                              comment '名称',
	owner                         	varchar(48)                              comment '业主',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "会员收藏";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "会员收藏";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists member_reward_point_data;
create table member_reward_point_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(24)                              comment '名称',
	point                         	int                                      comment '点',
	owner                         	varchar(48)                              comment '业主',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "会员奖励点";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "会员奖励点";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists member_reward_point_redemption_data;
create table member_reward_point_redemption_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(16)                              comment '名称',
	point                         	int                                      comment '点',
	owner                         	varchar(48)                              comment '业主',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "会员奖励点赎回";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "会员奖励点赎回";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists member_wishlist_product_data;
create table member_wishlist_product_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(20)                              comment '名称',
	owner                         	varchar(48)                              comment '业主',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "会员收藏产品";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "会员收藏产品";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists retail_store_member_address_data;
create table retail_store_member_address_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(24)                              comment '名称',
	owner                         	varchar(48)                              comment '业主',
	mobile_phone                  	varchar(44)                              comment '移动电话',
	address                       	varchar(56)                              comment '地址',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "零售店会员地址";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "零售店会员地址";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists retail_store_member_gift_card_data;
create table retail_store_member_gift_card_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(12)                              comment '名称',
	owner                         	varchar(48)                              comment '业主',
	number                        	varchar(28)                              comment '数',
	remain                        	numeric(7,2)                             comment '保持',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "零售店会员礼品卡";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "零售店会员礼品卡";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists retail_store_member_gift_card_consume_record_data;
create table retail_store_member_gift_card_consume_record_data (
	id                            	varchar(48)          not null            comment '序号',
	occure_time                   	date                                     comment '发生时间',
	owner                         	varchar(48)                              comment '业主',
	biz_order                     	varchar(48)                              comment '订单',
	number                        	varchar(28)                              comment '数',
	amount                        	numeric(6,2)                             comment '金额',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "零售商店会员卡消费记录";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "零售门店会员卡消费记录";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists goods_supplier_data;
create table goods_supplier_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(12)                              comment '名称',
	supply_product                	varchar(16)                              comment '供应产品',
	belong_to                     	varchar(48)                              comment '属于',
	contact_number                	varchar(44)                              comment '联系电话',
	description                   	varchar(72)                              comment '描述',
	last_update_time              	datetime                                 comment '最后更新时间',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "产品供应商";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "产品供应商";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists supplier_product_data;
create table supplier_product_data (
	id                            	varchar(48)          not null            comment '序号',
	product_name                  	varchar(16)                              comment '品名',
	product_description           	varchar(52)                              comment '产品描述',
	product_unit                  	varchar(8)                               comment '产品单元',
	supplier                      	varchar(48)                              comment '供应商',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "供应商的产品";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "供应商的产品";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists product_supply_duration_data;
create table product_supply_duration_data (
	id                            	varchar(48)          not null            comment '序号',
	quantity                      	int                                      comment '数量',
	duration                      	varchar(8)                               comment '持续时间',
	price                         	numeric(8,2)                             comment '价格',
	product                       	varchar(48)                              comment '产品',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "产品供应时间";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "产品供应时间";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

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
<<<<<<< HEAD
	current_status                	varchar(36)                              comment '当前状态',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "供应订单";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "供应订单";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists supply_order_confirmation_data;
create table supply_order_confirmation_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(12)                              comment '谁',
	confirm_time                  	date                                     comment '确认时间',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "供应订单确认";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "供应订单确认";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists supply_order_approval_data;
create table supply_order_approval_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(12)                              comment '谁',
	approve_time                  	date                                     comment '批准时间',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "供应订单审批";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "供应订单审批";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists supply_order_processing_data;
create table supply_order_processing_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(12)                              comment '谁',
	process_time                  	date                                     comment '过程的时间',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "供应订单处理";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "供应订单处理";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists supply_order_picking_data;
create table supply_order_picking_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(12)                              comment '谁',
	process_time                  	date                                     comment '过程的时间',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "供应订单拣货";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "供应订单拣货";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists supply_order_shipment_data;
create table supply_order_shipment_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(12)                              comment '谁',
	ship_time                     	date                                     comment '船的时间',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "供应货";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "供应货";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists supply_order_delivery_data;
create table supply_order_delivery_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(12)                              comment '谁',
	delivery_time                 	date                                     comment '交货时间',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "供应订单交货";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "供应订单交货";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists supply_order_line_item_data;
create table supply_order_line_item_data (
	id                            	varchar(48)          not null            comment '序号',
	biz_order                     	varchar(48)                              comment '订单',
	sku_id                        	varchar(12)                              comment '产品ID',
	sku_name                      	varchar(16)                              comment '产品名称',
	amount                        	numeric(5,2)                             comment '金额',
	quantity                      	int                                      comment '数量',
	unit_of_measurement           	varchar(8)                               comment '测量单位',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "供应订单行项目";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "供应订单行项目";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists supply_order_shipping_group_data;
create table supply_order_shipping_group_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(40)                              comment '名称',
	biz_order                     	varchar(48)                              comment '订单',
	amount                        	numeric(5,2)                             comment '金额',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "供应订单送货分组";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "供应订单送货分组";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists supply_order_payment_group_data;
create table supply_order_payment_group_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(16)                              comment '名称',
	biz_order                     	varchar(48)                              comment '订单',
	card_number                   	varchar(68)                              comment '卡号码',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "供应订单付款组";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "供应订单付款组";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

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
<<<<<<< HEAD
	current_status                	varchar(36)                              comment '当前状态',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "生超的订单";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "生超的订单";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists retail_store_order_confirmation_data;
create table retail_store_order_confirmation_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(12)                              comment '谁',
	confirm_time                  	date                                     comment '确认时间',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "生超订单确认";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "生超订单确认";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists retail_store_order_approval_data;
create table retail_store_order_approval_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(12)                              comment '谁',
	approve_time                  	date                                     comment '批准时间',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "生超订单批准";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "生超订单批准";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists retail_store_order_processing_data;
create table retail_store_order_processing_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(12)                              comment '谁',
	process_time                  	date                                     comment '过程的时间',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "生超订单处理";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "生超订单处理";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists retail_store_order_picking_data;
create table retail_store_order_picking_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(12)                              comment '谁',
	process_time                  	date                                     comment '过程的时间',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "生超订单拣货";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "生超订单拣货";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists retail_store_order_shipment_data;
create table retail_store_order_shipment_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(12)                              comment '谁',
	ship_time                     	date                                     comment '船的时间',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "生超订单出货";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "生超订单出货";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists retail_store_order_delivery_data;
create table retail_store_order_delivery_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(12)                              comment '谁',
	delivery_time                 	date                                     comment '交货时间',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "生超订单交付";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "生超订单交付";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists retail_store_order_line_item_data;
create table retail_store_order_line_item_data (
	id                            	varchar(48)          not null            comment '序号',
	biz_order                     	varchar(48)                              comment '订单',
	sku_id                        	varchar(12)                              comment '产品ID',
	sku_name                      	varchar(16)                              comment '产品名称',
	amount                        	numeric(5,2)                             comment '金额',
	quantity                      	int                                      comment '数量',
	unit_of_measurement           	varchar(8)                               comment '测量单位',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "双链小超订单行项目";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "双链小超订单行项目";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists retail_store_order_shipping_group_data;
create table retail_store_order_shipping_group_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(40)                              comment '名称',
	biz_order                     	varchar(48)                              comment '订单',
	amount                        	numeric(5,2)                             comment '金额',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "生超订单送货分组";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "生超订单送货分组";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists retail_store_order_payment_group_data;
create table retail_store_order_payment_group_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(16)                              comment '名称',
	biz_order                     	varchar(48)                              comment '订单',
	card_number                   	varchar(68)                              comment '卡号码',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "生超订单付款组";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "生超订单付款组";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists warehouse_data;
create table warehouse_data (
	id                            	varchar(48)          not null            comment '序号',
	location                      	varchar(44)                              comment '位置',
<<<<<<< HEAD
	contact_number                	varchar(44)                              comment '联系电话',
=======
	contact_number                	bigint                                   comment '联系电话',
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
	total_area                    	varchar(36)                              comment '总面积',
	owner                         	varchar(48)                              comment '业主',
	latitude                      	numeric(9,6)                             comment '纬度',
	longitude                     	numeric(10,6)                            comment '经度',
	last_update_time              	datetime                                 comment '最后更新时间',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "仓库";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "仓库";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists storage_space_data;
create table storage_space_data (
	id                            	varchar(48)          not null            comment '序号',
	location                      	varchar(56)                              comment '位置',
<<<<<<< HEAD
	contact_number                	varchar(44)                              comment '联系电话',
=======
	contact_number                	bigint                                   comment '联系电话',
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
	total_area                    	varchar(28)                              comment '总面积',
	warehouse                     	varchar(48)                              comment '仓库',
	latitude                      	numeric(9,6)                             comment '纬度',
	longitude                     	numeric(10,6)                            comment '经度',
	last_update_time              	datetime                                 comment '最后更新时间',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "存货区";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "存货区";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists smart_pallet_data;
create table smart_pallet_data (
	id                            	varchar(48)          not null            comment '序号',
	location                      	varchar(104)                             comment '位置',
<<<<<<< HEAD
	contact_number                	varchar(44)                              comment '联系电话',
=======
	contact_number                	bigint                                   comment '联系电话',
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
	total_area                    	varchar(28)                              comment '总面积',
	latitude                      	numeric(9,6)                             comment '纬度',
	longitude                     	numeric(10,6)                            comment '经度',
	warehouse                     	varchar(48)                              comment '仓库',
	last_update_time              	datetime                                 comment '最后更新时间',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "智能托盘";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "智能托盘";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists goods_shelf_data;
create table goods_shelf_data (
	id                            	varchar(48)          not null            comment '序号',
	location                      	varchar(64)                              comment '位置',
	storage_space                 	varchar(48)                              comment '存货区',
	supplier_space                	varchar(48)                              comment '供应商的空间',
	damage_space                  	varchar(48)                              comment '残次货物存放区',
	last_update_time              	datetime                                 comment '最后更新时间',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "货架";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "货架";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists goods_shelf_stock_count_data;
create table goods_shelf_stock_count_data (
	id                            	varchar(48)          not null            comment '序号',
	title                         	varchar(16)                              comment '头衔',
	count_time                    	date                                     comment '计数时间',
	summary                       	varchar(72)                              comment '概览',
	shelf                         	varchar(48)                              comment '架',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "货架库存盘点";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "货架库存盘点";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists stock_count_issue_track_data;
create table stock_count_issue_track_data (
	id                            	varchar(48)          not null            comment '序号',
	title                         	varchar(16)                              comment '头衔',
	count_time                    	date                                     comment '计数时间',
	summary                       	varchar(40)                              comment '概览',
	stock_count                   	varchar(48)                              comment '盘点',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "库存计数问题跟踪";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "库存计数问题跟踪";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists goods_allocation_data;
create table goods_allocation_data (
	id                            	varchar(48)          not null            comment '序号',
	location                      	varchar(84)                              comment '位置',
	latitude                      	numeric(9,6)                             comment '纬度',
	longitude                     	numeric(10,6)                            comment '经度',
	goods_shelf                   	varchar(48)                              comment '货架',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "货位";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "货位";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

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
<<<<<<< HEAD
	current_status                	varchar(24)                              comment '当前状态',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "货物";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "货物";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists goods_packaging_data;
create table goods_packaging_data (
	id                            	varchar(48)          not null            comment '序号',
	package_name                  	varchar(12)                              comment '包的名字',
	rfid                          	varchar(28)                              comment 'RFID',
	package_time                  	date                                     comment '包的时间',
	description                   	varchar(36)                              comment '描述',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "货物包装";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "货物包装";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

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
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "货物移动";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "货物移动";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists supplier_space_data;
create table supplier_space_data (
	id                            	varchar(48)          not null            comment '序号',
	location                      	varchar(76)                              comment '位置',
<<<<<<< HEAD
	contact_number                	varchar(44)                              comment '联系电话',
=======
	contact_number                	bigint                                   comment '联系电话',
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
	total_area                    	varchar(28)                              comment '总面积',
	warehouse                     	varchar(48)                              comment '仓库',
	latitude                      	numeric(9,6)                             comment '纬度',
	longitude                     	numeric(10,6)                            comment '经度',
	last_update_time              	datetime                                 comment '最后更新时间',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "供应商的空间";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "供应商的空间";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists receiving_space_data;
create table receiving_space_data (
	id                            	varchar(48)          not null            comment '序号',
	location                      	varchar(64)                              comment '位置',
<<<<<<< HEAD
	contact_number                	varchar(44)                              comment '联系电话',
=======
	contact_number                	bigint                                   comment '联系电话',
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
	description                   	varchar(52)                              comment '描述',
	total_area                    	varchar(28)                              comment '总面积',
	warehouse                     	varchar(48)                              comment '仓库',
	latitude                      	numeric(9,6)                             comment '纬度',
	longitude                     	numeric(10,6)                            comment '经度',
	last_update_time              	datetime                                 comment '最后更新时间',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "收货区";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "收货区";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists shipping_space_data;
create table shipping_space_data (
	id                            	varchar(48)          not null            comment '序号',
	location                      	varchar(56)                              comment '位置',
<<<<<<< HEAD
	contact_number                	varchar(44)                              comment '联系电话',
=======
	contact_number                	bigint                                   comment '联系电话',
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
	total_area                    	varchar(28)                              comment '总面积',
	warehouse                     	varchar(48)                              comment '仓库',
	latitude                      	numeric(9,6)                             comment '纬度',
	longitude                     	numeric(10,6)                            comment '经度',
	description                   	varchar(52)                              comment '描述',
	last_update_time              	datetime                                 comment '最后更新时间',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "发货区";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "发货区";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists damage_space_data;
create table damage_space_data (
	id                            	varchar(48)          not null            comment '序号',
	location                      	varchar(80)                              comment '位置',
<<<<<<< HEAD
	contact_number                	varchar(44)                              comment '联系电话',
=======
	contact_number                	bigint                                   comment '联系电话',
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
	total_area                    	varchar(28)                              comment '总面积',
	latitude                      	numeric(9,6)                             comment '纬度',
	longitude                     	numeric(10,6)                            comment '经度',
	warehouse                     	varchar(48)                              comment '仓库',
	last_update_time              	datetime                                 comment '最后更新时间',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "残次货物存放区";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "残次货物存放区";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists warehouse_asset_data;
create table warehouse_asset_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(20)                              comment '名称',
	position                      	varchar(40)                              comment '位置',
	owner                         	varchar(48)                              comment '业主',
	last_update_time              	datetime                                 comment '最后更新时间',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "仓库资产";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "仓库资产";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists transport_fleet_data;
create table transport_fleet_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(28)                              comment '名称',
<<<<<<< HEAD
	contact_number                	varchar(44)                              comment '联系电话',
	owner                         	varchar(48)                              comment '业主',
	last_update_time              	datetime                                 comment '最后更新时间',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "运输车队";
=======
	contact_number                	bigint                                   comment '联系电话',
	owner                         	varchar(48)                              comment '业主',
	last_update_time              	datetime                                 comment '最后更新时间',
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "运输车队";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists transport_truck_data;
create table transport_truck_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(16)                              comment '名称',
	plate_number                  	varchar(16)                              comment '车牌号码',
<<<<<<< HEAD
	contact_number                	varchar(44)                              comment '联系电话',
=======
	contact_number                	bigint                                   comment '联系电话',
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
	vehicle_license_number        	varchar(24)                              comment '汽车牌照号码',
	engine_number                 	varchar(28)                              comment '发动机号',
	make_date                     	date                                     comment '制造日期',
	mileage                       	varchar(24)                              comment '里程',
	body_color                    	varchar(8)                               comment '车身颜色',
	owner                         	varchar(48)                              comment '业主',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "运输车";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "运输车";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists truck_driver_data;
create table truck_driver_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(24)                              comment '名称',
<<<<<<< HEAD
	driver_license_number         	varchar(44)                              comment '驾驶执照号码',
	contact_number                	varchar(44)                              comment '联系电话',
	belongs_to                    	varchar(48)                              comment '属于',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "卡车司机";
=======
	driver_license_number         	bigint                                   comment '驾驶执照号码',
	contact_number                	varchar(44)                              comment '联系电话',
	belongs_to                    	varchar(48)                              comment '属于',
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "卡车司机";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

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
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "运输任务";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "运输任务";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists transport_task_track_data;
create table transport_task_track_data (
	id                            	varchar(48)          not null            comment '序号',
	track_time                    	date                                     comment '跟踪时间',
	latitude                      	numeric(9,6)                             comment '纬度',
	longitude                     	numeric(10,6)                            comment '经度',
	movement                      	varchar(48)                              comment '运动',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "运输任务跟踪";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "运输任务跟踪";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

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
<<<<<<< HEAD
	account_number                	varchar(56)                              comment '帐户号码',
=======
	account_number                	bigint                                   comment '帐户号码',
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
	country_center                	varchar(48)                              comment '全国运营中心',
	retail_store                  	varchar(48)                              comment '双链小超',
	goods_supplier                	varchar(48)                              comment '产品供应商',
	last_update_time              	datetime                                 comment '最后更新时间',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "账套";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "账套";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists accounting_subject_data;
create table accounting_subject_data (
	id                            	varchar(48)          not null            comment '序号',
	accounting_subject_code       	varchar(24)                              comment '会计科目代码',
	accounting_subject_name       	varchar(16)                              comment '会计科目名称',
	accounting_subject_class_code 	int                                      comment '会计科目类别代码',
	accounting_subject_class_name 	varchar(24)                              comment '会计科目类别名称',
	account_set                   	varchar(48)                              comment '账套',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "会计科目";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "会计科目";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists accounting_period_data;
create table accounting_period_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(32)                              comment '名称',
	start_date                    	date                                     comment '开始日期',
	end_date                      	date                                     comment '结束日期',
	account_set                   	varchar(48)                              comment '账套',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "会计期间";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "会计期间";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists accounting_document_type_data;
create table accounting_document_type_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(16)                              comment '名称',
	description                   	varchar(280)                             comment '描述',
	accounting_period             	varchar(48)                              comment '会计期间',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "会计凭证类型";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "会计凭证类型";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

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
<<<<<<< HEAD
	current_status                	varchar(36)                              comment '当前状态',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "会计凭证";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "会计凭证";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists accounting_document_creation_data;
create table accounting_document_creation_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(16)                              comment '谁',
	comments                      	varchar(16)                              comment '评论',
	make_date                     	date                                     comment '制造日期',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "会计文件的创建";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "会计文件的创建";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists accounting_document_confirmation_data;
create table accounting_document_confirmation_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(16)                              comment '谁',
	comments                      	varchar(16)                              comment '评论',
	make_date                     	date                                     comment '制造日期',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "会计的确认文件";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "会计的确认文件";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists accounting_document_auditing_data;
create table accounting_document_auditing_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(16)                              comment '谁',
	comments                      	varchar(60)                              comment '评论',
	make_date                     	date                                     comment '制造日期',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "会计凭证的审核";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "会计凭证的审核";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists accounting_document_posting_data;
create table accounting_document_posting_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(16)                              comment '谁',
	comments                      	varchar(60)                              comment '评论',
	make_date                     	date                                     comment '制造日期',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "会计凭证过帐";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "会计凭证过帐";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

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
<<<<<<< HEAD
	current_status                	varchar(36)                              comment '当前状态',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "原始凭证";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "原始凭证";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists original_voucher_creation_data;
create table original_voucher_creation_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(16)                              comment '谁',
	comments                      	varchar(16)                              comment '评论',
	make_date                     	date                                     comment '制造日期',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "原始凭证制作";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "原始凭证制作";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists original_voucher_confirmation_data;
create table original_voucher_confirmation_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(16)                              comment '谁',
	comments                      	varchar(16)                              comment '评论',
	make_date                     	date                                     comment '制造日期',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "原始凭证的确认";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "原始凭证的确认";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists original_voucher_auditing_data;
create table original_voucher_auditing_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(16)                              comment '谁',
	comments                      	varchar(60)                              comment '评论',
	make_date                     	date                                     comment '制造日期',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "原始凭证的审核";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "原始凭证的审核";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists accounting_document_line_data;
create table accounting_document_line_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(16)                              comment '名称',
	code                          	varchar(24)                              comment '代码',
	direct                        	varchar(4)                               comment '直接',
	amount                        	numeric(10,2)                            comment '金额',
	belongs_to                    	varchar(48)                              comment '属于',
	accounting_subject            	varchar(48)                              comment '会计科目',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "会计凭证行";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "会计凭证行";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists level_one_department_data;
create table level_one_department_data (
	id                            	varchar(48)          not null            comment '序号',
	belongs_to                    	varchar(48)                              comment '属于',
	name                          	varchar(20)                              comment '名称',
	description                   	varchar(72)                              comment '描述',
<<<<<<< HEAD
	manager                       	varchar(12)                              comment '经理',
	founded                       	date                                     comment '成立',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "一级部门";
=======
	manager_name                  	varchar(12)                              comment '经理的名字',
	founded                       	date                                     comment '成立',
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "一级部门";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists level_two_department_data;
create table level_two_department_data (
	id                            	varchar(48)          not null            comment '序号',
	belongs_to                    	varchar(48)                              comment '属于',
	name                          	varchar(40)                              comment '名称',
	description                   	varchar(72)                              comment '描述',
	founded                       	date                                     comment '成立',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "二级部门";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "二级部门";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists level_three_department_data;
create table level_three_department_data (
	id                            	varchar(48)          not null            comment '序号',
	belongs_to                    	varchar(48)                              comment '属于',
	name                          	varchar(52)                              comment '名称',
	description                   	varchar(72)                              comment '描述',
	founded                       	date                                     comment '成立',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "三级部门";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "三级部门";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists skill_type_data;
create table skill_type_data (
	id                            	varchar(48)          not null            comment '序号',
	code                          	varchar(20)                              comment '代码',
	company                       	varchar(48)                              comment '公司',
	description                   	varchar(24)                              comment '描述',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "技能类型";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "技能类型";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists responsibility_type_data;
create table responsibility_type_data (
	id                            	varchar(48)          not null            comment '序号',
	code                          	varchar(20)                              comment '代码',
	company                       	varchar(48)                              comment '公司',
	base_description              	varchar(16)                              comment '基本描述',
	detail_description            	varchar(116)                             comment '详细描述',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "责任类型";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "责任类型";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists termination_reason_data;
create table termination_reason_data (
	id                            	varchar(48)          not null            comment '序号',
	code                          	varchar(28)                              comment '代码',
	company                       	varchar(48)                              comment '公司',
	description                   	varchar(36)                              comment '描述',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "雇佣终止的原因";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "雇佣终止的原因";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists termination_type_data;
create table termination_type_data (
	id                            	varchar(48)          not null            comment '序号',
	code                          	varchar(28)                              comment '代码',
	company                       	varchar(48)                              comment '公司',
	base_description              	varchar(16)                              comment '基本描述',
	detail_description            	varchar(248)                             comment '详细描述',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "雇佣终止类型";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "雇佣终止类型";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists occupation_type_data;
create table occupation_type_data (
	id                            	varchar(48)          not null            comment '序号',
	code                          	varchar(24)                              comment '代码',
	company                       	varchar(48)                              comment '公司',
	description                   	varchar(28)                              comment '描述',
	detail_description            	varchar(244)                             comment '详细描述',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "职位类型";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "职位类型";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists leave_type_data;
create table leave_type_data (
	id                            	varchar(48)          not null            comment '序号',
	code                          	varchar(24)                              comment '代码',
	company                       	varchar(48)                              comment '公司',
	description                   	varchar(16)                              comment '描述',
	detail_description            	varchar(244)                             comment '详细描述',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "请假类型";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "请假类型";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists salary_grade_data;
create table salary_grade_data (
	id                            	varchar(48)          not null            comment '序号',
	code                          	varchar(24)                              comment '代码',
	company                       	varchar(48)                              comment '公司',
	name                          	varchar(16)                              comment '名称',
	detail_description            	varchar(244)                             comment '详细描述',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "工资等级";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "工资等级";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists interview_type_data;
create table interview_type_data (
	id                            	varchar(48)          not null            comment '序号',
	code                          	varchar(32)                              comment '代码',
	company                       	varchar(48)                              comment '公司',
	description                   	varchar(24)                              comment '描述',
	detail_description            	varchar(244)                             comment '详细描述',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "面试类型";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "面试类型";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists training_course_type_data;
create table training_course_type_data (
	id                            	varchar(48)          not null            comment '序号',
	code                          	varchar(16)                              comment '代码',
	company                       	varchar(48)                              comment '公司',
	name                          	varchar(16)                              comment '名称',
	description                   	varchar(64)                              comment '描述',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "培训课程类型";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "培训课程类型";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists public_holiday_data;
create table public_holiday_data (
	id                            	varchar(48)          not null            comment '序号',
	code                          	varchar(16)                              comment '代码',
	company                       	varchar(48)                              comment '公司',
	name                          	varchar(12)                              comment '名称',
	description                   	varchar(40)                              comment '描述',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "公共假日";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "公共假日";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists termination_data;
create table termination_data (
	id                            	varchar(48)          not null            comment '序号',
	reason                        	varchar(48)                              comment '原因',
	type                          	varchar(48)                              comment '类型',
	comment                       	varchar(16)                              comment '评论',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "雇佣终止";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "雇佣终止";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists view_data;
create table view_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(12)                              comment '谁',
	assessment                    	varchar(40)                              comment '评估',
	interview_time                	date                                     comment '面试时间',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "观";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "观";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

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
<<<<<<< HEAD
	current_status                	varchar(88)                              comment '当前状态',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "员工";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "员工";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists job_application_data;
create table job_application_data (
	id                            	varchar(48)          not null            comment '序号',
	application_time              	date                                     comment '申请时间',
	who                           	varchar(20)                              comment '谁',
	comments                      	varchar(124)                             comment '评论',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "工作申请";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "工作申请";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists profession_interview_data;
create table profession_interview_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(12)                              comment '谁',
	interview_time                	date                                     comment '面试时间',
	comments                      	varchar(60)                              comment '评论',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "专业面试";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "专业面试";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists hr_interview_data;
create table hr_interview_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(20)                              comment '谁',
	interview_time                	date                                     comment '面试时间',
	comments                      	varchar(52)                              comment '评论',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "人力资源部面试";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "人力资源部面试";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists offer_approval_data;
create table offer_approval_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(12)                              comment '谁',
	approve_time                  	date                                     comment '批准时间',
	comments                      	varchar(40)                              comment '评论',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "审批工作要约";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "审批工作要约";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists offer_acceptance_data;
create table offer_acceptance_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(12)                              comment '谁',
	accept_time                   	date                                     comment '接受时间',
	comments                      	varchar(40)                              comment '评论',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "接受工作要约";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "接受工作要约";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists employee_boarding_data;
create table employee_boarding_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(20)                              comment '谁',
	employ_time                   	date                                     comment '使用时间',
	comments                      	varchar(44)                              comment '评论',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "员工入职";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "员工入职";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

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
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "讲师";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "讲师";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

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
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "公司培训";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "公司培训";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists scoring_data;
create table scoring_data (
	id                            	varchar(48)          not null            comment '序号',
	scored_by                     	varchar(12)                              comment '由谁打分',
	score                         	int                                      comment '分数',
	comment                       	varchar(36)                              comment '评论',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "评分";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "评分";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists employee_company_training_data;
create table employee_company_training_data (
	id                            	varchar(48)          not null            comment '序号',
	employee                      	varchar(48)                              comment '员工',
	training                      	varchar(48)                              comment '训练',
	scoring                       	varchar(48)                              comment '评分',
<<<<<<< HEAD
	current_status                	varchar(24)                              comment '当前状态',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "员工参与的公司培训";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "员工参与的公司培训";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists employee_skill_data;
create table employee_skill_data (
	id                            	varchar(48)          not null            comment '序号',
	employee                      	varchar(48)                              comment '员工',
	skill_type                    	varchar(48)                              comment '技能类型',
	description                   	varchar(28)                              comment '描述',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "员工技能";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "员工技能";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists employee_performance_data;
create table employee_performance_data (
	id                            	varchar(48)          not null            comment '序号',
	employee                      	varchar(48)                              comment '员工',
	performance_comment           	varchar(28)                              comment '绩效评价',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "员工绩效";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "员工绩效";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists employee_work_experience_data;
create table employee_work_experience_data (
	id                            	varchar(48)          not null            comment '序号',
	employee                      	varchar(48)                              comment '员工',
	start                         	date                                     comment '开始',
	end                           	date                                     comment '结束',
	company                       	varchar(32)                              comment '公司',
	description                   	varchar(84)                              comment '描述',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "员工工作经验";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "员工工作经验";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists employee_leave_data;
create table employee_leave_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(48)                              comment '谁',
	type                          	varchar(48)                              comment '类型',
	leave_duration_hour           	int                                      comment '请假时长',
	remark                        	varchar(44)                              comment '备注',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "请假记录";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "请假记录";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists employee_interview_data;
create table employee_interview_data (
	id                            	varchar(48)          not null            comment '序号',
	employee                      	varchar(48)                              comment '员工',
	interview_type                	varchar(48)                              comment '面试类型',
	remark                        	varchar(40)                              comment '备注',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "员工面试";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "员工面试";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists employee_attendance_data;
create table employee_attendance_data (
	id                            	varchar(48)          not null            comment '序号',
	employee                      	varchar(48)                              comment '员工',
	enter_time                    	date                                     comment '进入时间',
	leave_time                    	date                                     comment '离开的时候',
	duration_hours                	int                                      comment '持续时间',
	remark                        	varchar(28)                              comment '备注',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "员工考勤";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "员工考勤";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists employee_qualifier_data;
create table employee_qualifier_data (
	id                            	varchar(48)          not null            comment '序号',
	employee                      	varchar(48)                              comment '员工',
	qualified_time                	date                                     comment '合格的时间',
	type                          	varchar(20)                              comment '类型',
	level                         	varchar(8)                               comment '水平',
	remark                        	varchar(36)                              comment '备注',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "员工资质";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "员工资质";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists employee_education_data;
create table employee_education_data (
	id                            	varchar(48)          not null            comment '序号',
	employee                      	varchar(48)                              comment '员工',
	complete_time                 	date                                     comment '完成时间',
	type                          	varchar(16)                              comment '类型',
	remark                        	varchar(36)                              comment '备注',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "员工教育";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "员工教育";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists employee_award_data;
create table employee_award_data (
	id                            	varchar(48)          not null            comment '序号',
	employee                      	varchar(48)                              comment '员工',
	complete_time                 	date                                     comment '完成时间',
	type                          	varchar(20)                              comment '类型',
	remark                        	varchar(36)                              comment '备注',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "员工嘉奖";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "员工嘉奖";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

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
<<<<<<< HEAD
	current_status                	varchar(32)                              comment '当前状态',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "工资单";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "工资单";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

drop table  if exists paying_off_data;
create table paying_off_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(8)                               comment '谁',
	paid_for                      	varchar(48)                              comment '支付',
	paid_time                     	date                                     comment '支付时间',
	amount                        	numeric(8,2)                             comment '金额',
<<<<<<< HEAD
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
	user_identity                 	varchar(40)                              comment '用户标识',
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
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "工资支付";
-- primary key will be created later for better import performance

drop table  if exists user_domain_data;
create table user_domain_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(16)                              comment '名称',
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "用户域";
-- primary key will be created later for better import performance

drop table  if exists user_white_list_data;
create table user_white_list_data (
	id                            	varchar(48)          not null            comment '序号',
	user_identity                 	varchar(40)                              comment '用户身份',
	user_special_functions        	varchar(200)                             comment '用户特殊功能',
	domain                        	varchar(48)                              comment '域',
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "用户白名单";
-- primary key will be created later for better import performance

drop table  if exists sec_user_data;
create table sec_user_data (
	id                            	varchar(48)          not null            comment '序号',
	login                         	varchar(256)                             comment '登录',
	mobile                        	varchar(11)                              comment '手机',
	email                         	varchar(256)                             comment '电子邮件',
	pwd                           	varchar(64)                              comment 'PWD',
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
	weixin_openid                 	varchar(128)                             comment '微信openid',
	weixin_appid                  	varchar(128)                             comment '微信Appid',
	access_token                  	varchar(128)                             comment '访问令牌',
	verification_code             	int                                      comment '验证码',
	verification_code_expire      	datetime                                 comment '验证码过期',
	last_login_time               	datetime                                 comment '最后登录时间',
	domain                        	varchar(48)                              comment '域',
	blocking                      	varchar(48)                              comment '屏蔽',
<<<<<<< HEAD
	current_status                	varchar(28)                              comment '当前状态',
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "安全用户";

drop table  if exists sec_user_blocking_data;
create table sec_user_blocking_data (
	id                            	varchar(48)          not null            comment 'ID',
	who                           	varchar(52)                              comment '谁',
	block_time                    	datetime                                 comment '时间',
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
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "SEC的用户";
-- primary key will be created later for better import performance

drop table  if exists sec_user_blocking_data;
create table sec_user_blocking_data (
	id                            	varchar(48)          not null            comment '序号',
	who                           	varchar(52)                              comment '谁',
	block_time                    	datetime                                 comment '块时间',
	comments                      	varchar(96)                              comment '评论',
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "用户屏蔽";
-- primary key will be created later for better import performance

drop table  if exists user_app_data;
create table user_app_data (
	id                            	varchar(48)          not null            comment '序号',
	title                         	varchar(300)                             comment '头衔',
	sec_user                      	varchar(48)                              comment 'SEC的用户',
	app_icon                      	varchar(36)                              comment '应用程序图标',
	full_access                   	tinyint                                  comment '完全访问',
	permission                    	varchar(16)                              comment '许可',
	object_type                   	varchar(100)                             comment '对象类型',
	object_id                     	varchar(40)                              comment '对象ID',
	location                      	varchar(48)                              comment '位置',
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "用户应用程序";
-- primary key will be created later for better import performance

drop table  if exists quick_link_data;
create table quick_link_data (
	id                            	varchar(48)          not null            comment '序号',
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
	name                          	varchar(200)                             comment '名称',
	icon                          	varchar(200)                             comment '图标',
	image_path                    	varchar(512) CHARACTER SET ascii COLLATE ascii_general_ci                     comment '图片路径',
	link_target                   	varchar(200)                             comment '链接的目标',
	create_time                   	datetime                                 comment '创建时间',
	app                           	varchar(48)                              comment '应用程序',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "快速链接";

drop table  if exists list_access_data;
create table list_access_data (
	id                            	varchar(48)          not null            comment 'ID',
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "快速链接";
-- primary key will be created later for better import performance

drop table  if exists list_access_data;
create table list_access_data (
	id                            	varchar(48)          not null            comment '序号',
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
	name                          	varchar(200)                             comment '名称',
	internal_name                 	varchar(200)                             comment '内部名称',
	read_permission               	tinyint                                  comment '读权限',
	create_permission             	tinyint                                  comment '创建权限',
	delete_permission             	tinyint                                  comment '删除权限',
	update_permission             	tinyint                                  comment '更新权限',
	execution_permission          	tinyint                                  comment '执行权限',
	app                           	varchar(48)                              comment '应用程序',
<<<<<<< HEAD
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
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "访问列表";
-- primary key will be created later for better import performance

drop table  if exists object_access_data;
create table object_access_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(28)                              comment '名称',
	object_type                   	varchar(112)                             comment '对象类型',
	list1                         	varchar(80)                              comment '表',
	list2                         	varchar(80)                              comment '清单',
	list3                         	varchar(80)                              comment '目录3',
	list4                         	varchar(80)                              comment '清单',
	list5                         	varchar(80)                              comment '列表6',
	list6                         	varchar(80)                              comment 'list6',
	list7                         	varchar(80)                              comment 'list7',
	list8                         	varchar(80)                              comment 'list8',
	list9                         	varchar(80)                              comment 'list9',
	app                           	varchar(48)                              comment '应用程序',
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "对象访问";
-- primary key will be created later for better import performance

drop table  if exists login_history_data;
create table login_history_data (
	id                            	varchar(48)          not null            comment '序号',
	login_time                    	datetime                                 comment '登录时间',
	from_ip                       	varchar(44)                              comment '从IP',
	description                   	varchar(16)                              comment '描述',
	sec_user                      	varchar(48)                              comment 'SEC的用户',
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "登录历史";
-- primary key will be created later for better import performance

drop table  if exists generic_form_data;
create table generic_form_data (
	id                            	varchar(48)          not null            comment '序号',
	title                         	varchar(20)                              comment '头衔',
	description                   	varchar(48)                              comment '描述',
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "通用的形式";
-- primary key will be created later for better import performance

drop table  if exists form_message_data;
create table form_message_data (
	id                            	varchar(48)          not null            comment '序号',
	title                         	varchar(24)                              comment '头衔',
	form                          	varchar(48)                              comment '形式',
	level                         	varchar(28)                              comment '水平',
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "表单信息";
-- primary key will be created later for better import performance

drop table  if exists form_field_message_data;
create table form_field_message_data (
	id                            	varchar(48)          not null            comment '序号',
	title                         	varchar(16)                              comment '头衔',
	parameter_name                	varchar(16)                              comment '参数名称',
	form                          	varchar(48)                              comment '形式',
	level                         	varchar(28)                              comment '水平',
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "表单字段的信息";
-- primary key will be created later for better import performance

drop table  if exists form_field_data;
create table form_field_data (
	id                            	varchar(48)          not null            comment '序号',
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
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
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "表单字段";

drop table  if exists form_action_data;
create table form_action_data (
	id                            	varchar(48)          not null            comment 'ID',
	label                         	varchar(8)                               comment '标签',
	locale_key                    	varchar(16)                              comment '语言环境的关键',
	action_key                    	varchar(24)                              comment '操作',
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
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "表单字段";
-- primary key will be created later for better import performance

drop table  if exists form_action_data;
create table form_action_data (
	id                            	varchar(48)          not null            comment '序号',
	label                         	varchar(8)                               comment '标签',
	locale_key                    	varchar(16)                              comment '语言环境的关键',
	action_key                    	varchar(24)                              comment '行动的关键',
	level                         	varchar(28)                              comment '水平',
	url                           	varchar(168)                             comment 'url',
	form                          	varchar(48)                              comment '形式',
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "表单动作";
-- primary key will be created later for better import performance

drop table  if exists candidate_container_data;
create table candidate_container_data (
	id                            	varchar(48)          not null            comment '序号',
	name                          	varchar(28)                              comment '名称',
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "候选人容器";
-- primary key will be created later for better import performance

drop table  if exists candidate_element_data;
create table candidate_element_data (
	id                            	varchar(48)          not null            comment '序号',
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
	name                          	varchar(200)                             comment '名称',
	type                          	varchar(200)                             comment '类型',
	image                         	varchar(512) CHARACTER SET ascii COLLATE ascii_general_ci                     comment '图片',
	container                     	varchar(48)                              comment '容器',
<<<<<<< HEAD
	version                       	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "候选人元素";
=======
	version                       	int                                      comment '版本'
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = "候选人元素";
-- primary key will be created later for better import performance
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe




insert into retail_store_country_center_data values
<<<<<<< HEAD
	('RSCC000001','双链小超中国国运营中心','4000-800-','2017-02-21','https://www.doublechaintech.com/','四川省成都市天府新区双链大厦','双链集团','张喜来','中国中心正式成立，恭喜恭喜','1');

insert into catalog_data values
	('C000001','水果蔬菜','RSCC000001','1'),
	('C000002','肉禽蛋奶','RSCC000001','1');
=======
	('RSCC000001','双链小超中国国运营中心','4000-800-','2017-12-26','https://www.doublechaintech.com/','四川省成都市天府新区双链大厦','双链集团','张喜来','中国中心正式成立，恭喜恭喜','1');

insert into catalog_data values
	('C000001','水果蔬菜','RSCC000001','9','9.68','1'),
	('C000002','肉禽蛋奶','RSCC000001','10','7.85','1');
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

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
<<<<<<< HEAD
	('P000001','啤酒','LTC000001','四川','可口可乐，销售百年的糖水，获得了全世界额青睐','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-10-10 13:45:19','1'),
	('P000002','可乐','LTC000001','广东','可口可乐，销售百年的糖水，获得了全世界额青睐0002','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0002','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-09-30 04:28:14','1'),
	('P000003','久久鸭','LTC000002','江苏','可口可乐，销售百年的糖水，获得了全世界额青睐0003','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0003','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-09-27 19:13:00','1'),
	('P000004','啤酒','LTC000002','安徽','可口可乐，销售百年的糖水，获得了全世界额青睐0004','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0004','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-10-05 15:23:47','1'),
	('P000005','可乐','LTC000003','日本','可口可乐，销售百年的糖水，获得了全世界额青睐0005','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0005','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-10-13 19:44:56','1'),
	('P000006','久久鸭','LTC000003','法国','可口可乐，销售百年的糖水，获得了全世界额青睐0006','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0006','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-09-30 20:19:33','1'),
	('P000007','啤酒','LTC000004','四川','可口可乐，销售百年的糖水，获得了全世界额青睐0007','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0007','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-10-02 16:17:34','1'),
	('P000008','可乐','LTC000004','广东','可口可乐，销售百年的糖水，获得了全世界额青睐0008','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0008','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-09-30 01:44:43','1'),
	('P000009','久久鸭','LTC000005','江苏','可口可乐，销售百年的糖水，获得了全世界额青睐0009','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0009','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-10-11 07:30:24','1'),
	('P000010','啤酒','LTC000005','安徽','可口可乐，销售百年的糖水，获得了全世界额青睐0010','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0010','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-10-06 02:18:59','1'),
	('P000011','可乐','LTC000006','日本','可口可乐，销售百年的糖水，获得了全世界额青睐0011','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0011','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-10-10 12:18:26','1'),
	('P000012','久久鸭','LTC000006','法国','可口可乐，销售百年的糖水，获得了全世界额青睐0012','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0012','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-10-08 00:46:17','1'),
	('P000013','啤酒','LTC000007','四川','可口可乐，销售百年的糖水，获得了全世界额青睐0013','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0013','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-10-10 00:33:43','1'),
	('P000014','可乐','LTC000007','广东','可口可乐，销售百年的糖水，获得了全世界额青睐0014','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0014','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-10-13 21:22:12','1'),
	('P000015','久久鸭','LTC000008','江苏','可口可乐，销售百年的糖水，获得了全世界额青睐0015','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0015','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-09-30 01:33:01','1'),
	('P000016','啤酒','LTC000008','安徽','可口可乐，销售百年的糖水，获得了全世界额青睐0016','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0016','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-10-15 14:37:02','1'),
	('P000017','可乐','LTC000009','日本','可口可乐，销售百年的糖水，获得了全世界额青睐0017','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0017','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-10-09 03:16:33','1'),
	('P000018','久久鸭','LTC000009','法国','可口可乐，销售百年的糖水，获得了全世界额青睐0018','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0018','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-10-10 04:30:47','1'),
	('P000019','啤酒','LTC000010','四川','可口可乐，销售百年的糖水，获得了全世界额青睐0019','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0019','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-10-09 08:32:02','1'),
	('P000020','可乐','LTC000010','广东','可口可乐，销售百年的糖水，获得了全世界额青睐0020','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0020','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-10-10 04:41:36','1'),
	('P000021','久久鸭','LTC000011','江苏','可口可乐，销售百年的糖水，获得了全世界额青睐0021','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0021','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-10-10 03:11:30','1'),
	('P000022','啤酒','LTC000011','安徽','可口可乐，销售百年的糖水，获得了全世界额青睐0022','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0022','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-10-13 06:14:48','1'),
	('P000023','可乐','LTC000012','日本','可口可乐，销售百年的糖水，获得了全世界额青睐0023','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0023','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-10-13 08:19:47','1'),
	('P000024','久久鸭','LTC000012','法国','可口可乐，销售百年的糖水，获得了全世界额青睐0024','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0024','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-10-07 05:20:54','1'),
	('P000025','啤酒','LTC000013','四川','可口可乐，销售百年的糖水，获得了全世界额青睐0025','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0025','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-09-29 15:16:28','1'),
	('P000026','可乐','LTC000013','广东','可口可乐，销售百年的糖水，获得了全世界额青睐0026','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0026','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-10-16 15:10:30','1'),
	('P000027','久久鸭','LTC000014','江苏','可口可乐，销售百年的糖水，获得了全世界额青睐0027','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0027','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-09-29 06:16:23','1'),
	('P000028','啤酒','LTC000014','安徽','可口可乐，销售百年的糖水，获得了全世界额青睐0028','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0028','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-10-05 10:30:03','1'),
	('P000029','可乐','LTC000015','日本','可口可乐，销售百年的糖水，获得了全世界额青睐0029','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0029','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-09-29 09:24:55','1'),
	('P000030','久久鸭','LTC000015','法国','可口可乐，销售百年的糖水，获得了全世界额青睐0030','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0030','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-10-14 08:21:06','1'),
	('P000031','啤酒','LTC000016','四川','可口可乐，销售百年的糖水，获得了全世界额青睐0031','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0031','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-10-12 15:07:50','1'),
	('P000032','可乐','LTC000016','广东','可口可乐，销售百年的糖水，获得了全世界额青睐0032','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0032','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-10-05 05:24:00','1');

insert into sku_data values
	('S000001','可乐-大罐的','大','P000001','TM00000000001','包装类型','包装数量等信息,包装数量等信息,包装数量等信息','1044.19','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000002','可乐-大罐的0002','中','P000001','TM000000000010002','包装类型0002','包装数量等信息,包装数量等信息,包装数量等信息0002','1312.29','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000003','可乐-大罐的0003','小','P000002','TM000000000010003','包装类型0003','包装数量等信息,包装数量等信息,包装数量等信息0003','927.44','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000004','可乐-大罐的0004','大','P000002','TM000000000010004','包装类型0004','包装数量等信息,包装数量等信息,包装数量等信息0004','946.34','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000005','可乐-大罐的0005','中','P000003','TM000000000010005','包装类型0005','包装数量等信息,包装数量等信息,包装数量等信息0005','1184.96','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000006','可乐-大罐的0006','小','P000003','TM000000000010006','包装类型0006','包装数量等信息,包装数量等信息,包装数量等信息0006','1071.56','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000007','可乐-大罐的0007','大','P000004','TM000000000010007','包装类型0007','包装数量等信息,包装数量等信息,包装数量等信息0007','948.77','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000008','可乐-大罐的0008','中','P000004','TM000000000010008','包装类型0008','包装数量等信息,包装数量等信息,包装数量等信息0008','1154.84','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000009','可乐-大罐的0009','小','P000005','TM000000000010009','包装类型0009','包装数量等信息,包装数量等信息,包装数量等信息0009','1024.95','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000010','可乐-大罐的0010','大','P000005','TM000000000010010','包装类型0010','包装数量等信息,包装数量等信息,包装数量等信息0010','1191.79','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000011','可乐-大罐的0011','中','P000006','TM000000000010011','包装类型0011','包装数量等信息,包装数量等信息,包装数量等信息0011','1301.64','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000012','可乐-大罐的0012','小','P000006','TM000000000010012','包装类型0012','包装数量等信息,包装数量等信息,包装数量等信息0012','1162.82','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000013','可乐-大罐的0013','大','P000007','TM000000000010013','包装类型0013','包装数量等信息,包装数量等信息,包装数量等信息0013','1155.13','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000014','可乐-大罐的0014','中','P000007','TM000000000010014','包装类型0014','包装数量等信息,包装数量等信息,包装数量等信息0014','1115.18','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000015','可乐-大罐的0015','小','P000008','TM000000000010015','包装类型0015','包装数量等信息,包装数量等信息,包装数量等信息0015','1045.07','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000016','可乐-大罐的0016','大','P000008','TM000000000010016','包装类型0016','包装数量等信息,包装数量等信息,包装数量等信息0016','1205.97','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000017','可乐-大罐的0017','中','P000009','TM000000000010017','包装类型0017','包装数量等信息,包装数量等信息,包装数量等信息0017','1013.58','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000018','可乐-大罐的0018','小','P000009','TM000000000010018','包装类型0018','包装数量等信息,包装数量等信息,包装数量等信息0018','968.59','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000019','可乐-大罐的0019','大','P000010','TM000000000010019','包装类型0019','包装数量等信息,包装数量等信息,包装数量等信息0019','1271.69','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000020','可乐-大罐的0020','中','P000010','TM000000000010020','包装类型0020','包装数量等信息,包装数量等信息,包装数量等信息0020','1108.01','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000021','可乐-大罐的0021','小','P000011','TM000000000010021','包装类型0021','包装数量等信息,包装数量等信息,包装数量等信息0021','1022.47','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000022','可乐-大罐的0022','大','P000011','TM000000000010022','包装类型0022','包装数量等信息,包装数量等信息,包装数量等信息0022','1181.75','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000023','可乐-大罐的0023','中','P000012','TM000000000010023','包装类型0023','包装数量等信息,包装数量等信息,包装数量等信息0023','1216.99','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000024','可乐-大罐的0024','小','P000012','TM000000000010024','包装类型0024','包装数量等信息,包装数量等信息,包装数量等信息0024','1042.38','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000025','可乐-大罐的0025','大','P000013','TM000000000010025','包装类型0025','包装数量等信息,包装数量等信息,包装数量等信息0025','1109.41','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000026','可乐-大罐的0026','中','P000013','TM000000000010026','包装类型0026','包装数量等信息,包装数量等信息,包装数量等信息0026','939.71','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000027','可乐-大罐的0027','小','P000014','TM000000000010027','包装类型0027','包装数量等信息,包装数量等信息,包装数量等信息0027','1140.29','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000028','可乐-大罐的0028','大','P000014','TM000000000010028','包装类型0028','包装数量等信息,包装数量等信息,包装数量等信息0028','1192.44','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000029','可乐-大罐的0029','中','P000015','TM000000000010029','包装类型0029','包装数量等信息,包装数量等信息,包装数量等信息0029','970.62','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000030','可乐-大罐的0030','小','P000015','TM000000000010030','包装类型0030','包装数量等信息,包装数量等信息,包装数量等信息0030','1069.34','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000031','可乐-大罐的0031','大','P000016','TM000000000010031','包装类型0031','包装数量等信息,包装数量等信息,包装数量等信息0031','1274.60','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000032','可乐-大罐的0032','中','P000016','TM000000000010032','包装类型0032','包装数量等信息,包装数量等信息,包装数量等信息0032','1193.86','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000033','可乐-大罐的0033','小','P000017','TM000000000010033','包装类型0033','包装数量等信息,包装数量等信息,包装数量等信息0033','1065.30','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000034','可乐-大罐的0034','大','P000017','TM000000000010034','包装类型0034','包装数量等信息,包装数量等信息,包装数量等信息0034','1196.61','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000035','可乐-大罐的0035','中','P000018','TM000000000010035','包装类型0035','包装数量等信息,包装数量等信息,包装数量等信息0035','1057.81','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000036','可乐-大罐的0036','小','P000018','TM000000000010036','包装类型0036','包装数量等信息,包装数量等信息,包装数量等信息0036','1147.55','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000037','可乐-大罐的0037','大','P000019','TM000000000010037','包装类型0037','包装数量等信息,包装数量等信息,包装数量等信息0037','1317.36','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000038','可乐-大罐的0038','中','P000019','TM000000000010038','包装类型0038','包装数量等信息,包装数量等信息,包装数量等信息0038','1264.76','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000039','可乐-大罐的0039','小','P000020','TM000000000010039','包装类型0039','包装数量等信息,包装数量等信息,包装数量等信息0039','1284.42','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000040','可乐-大罐的0040','大','P000020','TM000000000010040','包装类型0040','包装数量等信息,包装数量等信息,包装数量等信息0040','1029.39','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000041','可乐-大罐的0041','中','P000021','TM000000000010041','包装类型0041','包装数量等信息,包装数量等信息,包装数量等信息0041','1208.99','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000042','可乐-大罐的0042','小','P000021','TM000000000010042','包装类型0042','包装数量等信息,包装数量等信息,包装数量等信息0042','1120.29','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000043','可乐-大罐的0043','大','P000022','TM000000000010043','包装类型0043','包装数量等信息,包装数量等信息,包装数量等信息0043','1299.70','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000044','可乐-大罐的0044','中','P000022','TM000000000010044','包装类型0044','包装数量等信息,包装数量等信息,包装数量等信息0044','1165.16','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000045','可乐-大罐的0045','小','P000023','TM000000000010045','包装类型0045','包装数量等信息,包装数量等信息,包装数量等信息0045','927.44','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000046','可乐-大罐的0046','大','P000023','TM000000000010046','包装类型0046','包装数量等信息,包装数量等信息,包装数量等信息0046','1184.21','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000047','可乐-大罐的0047','中','P000024','TM000000000010047','包装类型0047','包装数量等信息,包装数量等信息,包装数量等信息0047','1212.97','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000048','可乐-大罐的0048','小','P000024','TM000000000010048','包装类型0048','包装数量等信息,包装数量等信息,包装数量等信息0048','1253.51','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000049','可乐-大罐的0049','大','P000025','TM000000000010049','包装类型0049','包装数量等信息,包装数量等信息,包装数量等信息0049','1175.68','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000050','可乐-大罐的0050','中','P000025','TM000000000010050','包装类型0050','包装数量等信息,包装数量等信息,包装数量等信息0050','942.06','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000051','可乐-大罐的0051','小','P000026','TM000000000010051','包装类型0051','包装数量等信息,包装数量等信息,包装数量等信息0051','1021.52','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000052','可乐-大罐的0052','大','P000026','TM000000000010052','包装类型0052','包装数量等信息,包装数量等信息,包装数量等信息0052','1039.10','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000053','可乐-大罐的0053','中','P000027','TM000000000010053','包装类型0053','包装数量等信息,包装数量等信息,包装数量等信息0053','1165.01','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000054','可乐-大罐的0054','小','P000027','TM000000000010054','包装类型0054','包装数量等信息,包装数量等信息,包装数量等信息0054','1073.08','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000055','可乐-大罐的0055','大','P000028','TM000000000010055','包装类型0055','包装数量等信息,包装数量等信息,包装数量等信息0055','1205.93','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000056','可乐-大罐的0056','中','P000028','TM000000000010056','包装类型0056','包装数量等信息,包装数量等信息,包装数量等信息0056','1122.62','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000057','可乐-大罐的0057','小','P000029','TM000000000010057','包装类型0057','包装数量等信息,包装数量等信息,包装数量等信息0057','966.12','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000058','可乐-大罐的0058','大','P000029','TM000000000010058','包装类型0058','包装数量等信息,包装数量等信息,包装数量等信息0058','988.86','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000059','可乐-大罐的0059','中','P000030','TM000000000010059','包装类型0059','包装数量等信息,包装数量等信息,包装数量等信息0059','1172.18','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000060','可乐-大罐的0060','小','P000030','TM000000000010060','包装类型0060','包装数量等信息,包装数量等信息,包装数量等信息0060','1041.78','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000061','可乐-大罐的0061','大','P000031','TM000000000010061','包装类型0061','包装数量等信息,包装数量等信息,包装数量等信息0061','1191.25','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000062','可乐-大罐的0062','中','P000031','TM000000000010062','包装类型0062','包装数量等信息,包装数量等信息,包装数量等信息0062','1149.11','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000063','可乐-大罐的0063','小','P000032','TM000000000010063','包装类型0063','包装数量等信息,包装数量等信息,包装数量等信息0063','987.79','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000064','可乐-大罐的0064','大','P000032','TM000000000010064','包装类型0064','包装数量等信息,包装数量等信息,包装数量等信息0064','1210.41','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1');

insert into retail_store_province_center_data values
	('RSPC000001','双链小超四川省运营中心','2017-09-15','RSCC000001','2019-09-27 10:00:06','1'),
	('RSPC000002','双链小超北京运营中心','2017-03-22','RSCC000001','2019-10-11 12:57:59','1');

insert into province_center_department_data values
	('PCD000001','供应链部','2017-02-14','RSPC000001','刘强','1'),
	('PCD000002','采购部','2019-03-21','RSPC000001','王德宏','1'),
	('PCD000003','管理部','2018-03-21','RSPC000002','刘强','1'),
	('PCD000004','财务部','2019-02-16','RSPC000002','王德宏','1');

insert into province_center_employee_data values
	('PCE000001','刘强','13999998888','wangdehong@yatang.cn','2019-09-02','PCD000001','RSPC000001','1'),
	('PCE000002','王德宏','13900000002','liuqiang@yatang.cn','2017-04-18','PCD000001','RSPC000001','1'),
	('PCE000003','刘强','13900000003','wangdehong@yatang.cn','2018-10-18','PCD000002','RSPC000001','1'),
	('PCE000004','王德宏','13900000004','liuqiang@yatang.cn','2017-03-23','PCD000002','RSPC000001','1'),
	('PCE000005','刘强','13900000005','wangdehong@yatang.cn','2019-08-19','PCD000003','RSPC000002','1'),
	('PCE000006','王德宏','13900000006','liuqiang@yatang.cn','2019-06-07','PCD000003','RSPC000002','1'),
	('PCE000007','刘强','13900000007','wangdehong@yatang.cn','2019-09-27','PCD000004','RSPC000002','1'),
	('PCE000008','王德宏','13900000008','liuqiang@yatang.cn','2017-06-07','PCD000004','RSPC000002','1');

insert into retail_store_city_service_center_data values
	('RSCSC000001','双链小超成都办事处','2017-06-07','RSPC000001','2019-10-16 05:03:25','1'),
	('RSCSC000002','双链小超绵阳办事处','2019-05-22','RSPC000001','2019-10-13 07:38:35','1'),
	('RSCSC000003','双链小超巴中办事处','2017-06-29','RSPC000002','2019-10-02 14:09:32','1'),
	('RSCSC000004','双链小超成都办事处','2019-09-08','RSPC000002','2019-10-10 12:59:53','1');

insert into city_partner_data values
	('CP000001','曾倩','13677778888','RSCSC000001','负责开拓市场，具有极强的开拓能力','2019-10-07 17:51:56','1'),
	('CP000002','黄风格','13900000002','RSCSC000001','负责开拓市场，具有极强的开拓能力0002','2019-10-08 07:24:49','1'),
	('CP000003','郭超','13900000003','RSCSC000002','负责开拓市场，具有极强的开拓能力0003','2019-10-08 09:13:48','1'),
	('CP000004','曾倩','13900000004','RSCSC000002','负责开拓市场，具有极强的开拓能力0004','2019-10-11 17:40:08','1'),
	('CP000005','黄风格','13900000005','RSCSC000003','负责开拓市场，具有极强的开拓能力0005','2019-09-27 14:20:21','1'),
	('CP000006','郭超','13900000006','RSCSC000003','负责开拓市场，具有极强的开拓能力0006','2019-10-16 19:55:07','1'),
	('CP000007','曾倩','13900000007','RSCSC000004','负责开拓市场，具有极强的开拓能力0007','2019-10-03 00:18:18','1'),
	('CP000008','黄风格','13900000008','RSCSC000004','负责开拓市场，具有极强的开拓能力0008','2019-10-08 23:03:32','1');

insert into potential_customer_data values
	('PC000001','曾倩','13677778888','RSCSC000001','CP000001','负责开拓市场，具有极强的开拓能力','2019-10-16 10:28:08','1'),
	('PC000002','黄风格','13900000002','RSCSC000001','CP000001','负责开拓市场，具有极强的开拓能力0002','2019-10-09 07:05:09','1'),
	('PC000003','郭超','13900000003','RSCSC000001','CP000002','负责开拓市场，具有极强的开拓能力0003','2019-09-28 14:41:34','1'),
	('PC000004','曾倩','13900000004','RSCSC000001','CP000002','负责开拓市场，具有极强的开拓能力0004','2019-10-05 11:14:56','1'),
	('PC000005','黄风格','13900000005','RSCSC000002','CP000003','负责开拓市场，具有极强的开拓能力0005','2019-10-04 04:38:21','1'),
	('PC000006','郭超','13900000006','RSCSC000002','CP000003','负责开拓市场，具有极强的开拓能力0006','2019-10-11 00:44:14','1'),
	('PC000007','曾倩','13900000007','RSCSC000002','CP000004','负责开拓市场，具有极强的开拓能力0007','2019-09-26 04:47:16','1'),
	('PC000008','黄风格','13900000008','RSCSC000002','CP000004','负责开拓市场，具有极强的开拓能力0008','2019-10-02 15:31:50','1'),
	('PC000009','郭超','13900000009','RSCSC000003','CP000005','负责开拓市场，具有极强的开拓能力0009','2019-09-27 08:16:05','1'),
	('PC000010','曾倩','13900000010','RSCSC000003','CP000005','负责开拓市场，具有极强的开拓能力0010','2019-10-12 01:05:30','1'),
	('PC000011','黄风格','13900000011','RSCSC000003','CP000006','负责开拓市场，具有极强的开拓能力0011','2019-10-05 22:47:22','1'),
	('PC000012','郭超','13900000012','RSCSC000003','CP000006','负责开拓市场，具有极强的开拓能力0012','2019-09-30 23:56:01','1'),
	('PC000013','曾倩','13900000013','RSCSC000004','CP000007','负责开拓市场，具有极强的开拓能力0013','2019-09-27 01:19:36','1'),
	('PC000014','黄风格','13900000014','RSCSC000004','CP000007','负责开拓市场，具有极强的开拓能力0014','2019-10-11 12:16:38','1'),
	('PC000015','郭超','13900000015','RSCSC000004','CP000008','负责开拓市场，具有极强的开拓能力0015','2019-10-11 23:49:08','1'),
	('PC000016','曾倩','13900000016','RSCSC000004','CP000008','负责开拓市场，具有极强的开拓能力0016','2019-10-06 13:02:22','1');
=======
	('P000001','啤酒','LTC000001','四川','可口可乐，销售百年的糖水，获得了全世界额青睐','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-12-02 13:22:27','1'),
	('P000002','可乐','LTC000001','广东','可口可乐，销售百年的糖水，获得了全世界额青睐0002','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0002','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-11-25 09:53:39','1'),
	('P000003','久久鸭','LTC000002','江苏','可口可乐，销售百年的糖水，获得了全世界额青睐0003','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0003','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-11-27 18:02:15','1'),
	('P000004','啤酒','LTC000002','安徽','可口可乐，销售百年的糖水，获得了全世界额青睐0004','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0004','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-11-18 11:58:33','1'),
	('P000005','可乐','LTC000003','日本','可口可乐，销售百年的糖水，获得了全世界额青睐0005','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0005','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-11-28 06:38:19','1'),
	('P000006','久久鸭','LTC000003','法国','可口可乐，销售百年的糖水，获得了全世界额青睐0006','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0006','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-11-27 08:00:53','1'),
	('P000007','啤酒','LTC000004','四川','可口可乐，销售百年的糖水，获得了全世界额青睐0007','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0007','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-11-30 17:06:17','1'),
	('P000008','可乐','LTC000004','广东','可口可乐，销售百年的糖水，获得了全世界额青睐0008','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0008','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-11-21 19:44:49','1'),
	('P000009','久久鸭','LTC000005','江苏','可口可乐，销售百年的糖水，获得了全世界额青睐0009','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0009','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-12-04 15:52:35','1'),
	('P000010','啤酒','LTC000005','安徽','可口可乐，销售百年的糖水，获得了全世界额青睐0010','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0010','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-11-25 21:29:52','1'),
	('P000011','可乐','LTC000006','日本','可口可乐，销售百年的糖水，获得了全世界额青睐0011','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0011','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-11-19 02:43:58','1'),
	('P000012','久久鸭','LTC000006','法国','可口可乐，销售百年的糖水，获得了全世界额青睐0012','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0012','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-11-20 08:18:25','1'),
	('P000013','啤酒','LTC000007','四川','可口可乐，销售百年的糖水，获得了全世界额青睐0013','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0013','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-11-26 04:36:02','1'),
	('P000014','可乐','LTC000007','广东','可口可乐，销售百年的糖水，获得了全世界额青睐0014','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0014','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-12-05 13:13:08','1'),
	('P000015','久久鸭','LTC000008','江苏','可口可乐，销售百年的糖水，获得了全世界额青睐0015','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0015','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-11-19 19:42:23','1'),
	('P000016','啤酒','LTC000008','安徽','可口可乐，销售百年的糖水，获得了全世界额青睐0016','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0016','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-12-02 00:54:13','1'),
	('P000017','可乐','LTC000009','日本','可口可乐，销售百年的糖水，获得了全世界额青睐0017','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0017','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-11-24 22:32:22','1'),
	('P000018','久久鸭','LTC000009','法国','可口可乐，销售百年的糖水，获得了全世界额青睐0018','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0018','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-11-29 16:20:03','1'),
	('P000019','啤酒','LTC000010','四川','可口可乐，销售百年的糖水，获得了全世界额青睐0019','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0019','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-12-05 11:15:15','1'),
	('P000020','可乐','LTC000010','广东','可口可乐，销售百年的糖水，获得了全世界额青睐0020','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0020','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-11-26 03:06:18','1'),
	('P000021','久久鸭','LTC000011','江苏','可口可乐，销售百年的糖水，获得了全世界额青睐0021','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0021','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-11-25 06:13:28','1'),
	('P000022','啤酒','LTC000011','安徽','可口可乐，销售百年的糖水，获得了全世界额青睐0022','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0022','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-11-26 02:17:45','1'),
	('P000023','可乐','LTC000012','日本','可口可乐，销售百年的糖水，获得了全世界额青睐0023','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0023','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-11-27 08:25:51','1'),
	('P000024','久久鸭','LTC000012','法国','可口可乐，销售百年的糖水，获得了全世界额青睐0024','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0024','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-11-14 19:23:44','1'),
	('P000025','啤酒','LTC000013','四川','可口可乐，销售百年的糖水，获得了全世界额青睐0025','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0025','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-11-28 11:30:16','1'),
	('P000026','可乐','LTC000013','广东','可口可乐，销售百年的糖水，获得了全世界额青睐0026','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0026','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-11-29 02:29:29','1'),
	('P000027','久久鸭','LTC000014','江苏','可口可乐，销售百年的糖水，获得了全世界额青睐0027','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0027','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-11-25 02:32:48','1'),
	('P000028','啤酒','LTC000014','安徽','可口可乐，销售百年的糖水，获得了全世界额青睐0028','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0028','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-11-23 14:08:17','1'),
	('P000029','可乐','LTC000015','日本','可口可乐，销售百年的糖水，获得了全世界额青睐0029','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0029','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-11-30 15:01:29','1'),
	('P000030','久久鸭','LTC000015','法国','可口可乐，销售百年的糖水，获得了全世界额青睐0030','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0030','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-11-26 06:41:20','1'),
	('P000031','啤酒','LTC000016','四川','可口可乐，销售百年的糖水，获得了全世界额青睐0031','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0031','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-11-27 02:42:08','1'),
	('P000032','可乐','LTC000016','广东','可口可乐，销售百年的糖水，获得了全世界额青睐0032','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0032','https://demo.doublechaintech.com/demodata/imageManager/genImage/this is a looooooooooog00/400/200/grey/','2019-11-16 14:38:04','1');

insert into sku_data values
	('S000001','可乐-大罐的','大','P000001','TM00000000001','包装类型','包装数量等信息,包装数量等信息,包装数量等信息','1262.34','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000002','可乐-大罐的0002','中','P000001','TM000000000010002','包装类型0002','包装数量等信息,包装数量等信息,包装数量等信息0002','961.81','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000003','可乐-大罐的0003','小','P000002','TM000000000010003','包装类型0003','包装数量等信息,包装数量等信息,包装数量等信息0003','1040.06','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000004','可乐-大罐的0004','大','P000002','TM000000000010004','包装类型0004','包装数量等信息,包装数量等信息,包装数量等信息0004','1284.66','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000005','可乐-大罐的0005','中','P000003','TM000000000010005','包装类型0005','包装数量等信息,包装数量等信息,包装数量等信息0005','1112.24','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000006','可乐-大罐的0006','小','P000003','TM000000000010006','包装类型0006','包装数量等信息,包装数量等信息,包装数量等信息0006','1181.24','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000007','可乐-大罐的0007','大','P000004','TM000000000010007','包装类型0007','包装数量等信息,包装数量等信息,包装数量等信息0007','1279.19','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000008','可乐-大罐的0008','中','P000004','TM000000000010008','包装类型0008','包装数量等信息,包装数量等信息,包装数量等信息0008','1286.66','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000009','可乐-大罐的0009','小','P000005','TM000000000010009','包装类型0009','包装数量等信息,包装数量等信息,包装数量等信息0009','1313.75','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000010','可乐-大罐的0010','大','P000005','TM000000000010010','包装类型0010','包装数量等信息,包装数量等信息,包装数量等信息0010','1021.71','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000011','可乐-大罐的0011','中','P000006','TM000000000010011','包装类型0011','包装数量等信息,包装数量等信息,包装数量等信息0011','1247.68','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000012','可乐-大罐的0012','小','P000006','TM000000000010012','包装类型0012','包装数量等信息,包装数量等信息,包装数量等信息0012','1036.86','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000013','可乐-大罐的0013','大','P000007','TM000000000010013','包装类型0013','包装数量等信息,包装数量等信息,包装数量等信息0013','1168.16','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000014','可乐-大罐的0014','中','P000007','TM000000000010014','包装类型0014','包装数量等信息,包装数量等信息,包装数量等信息0014','1303.02','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000015','可乐-大罐的0015','小','P000008','TM000000000010015','包装类型0015','包装数量等信息,包装数量等信息,包装数量等信息0015','1101.30','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000016','可乐-大罐的0016','大','P000008','TM000000000010016','包装类型0016','包装数量等信息,包装数量等信息,包装数量等信息0016','1321.59','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000017','可乐-大罐的0017','中','P000009','TM000000000010017','包装类型0017','包装数量等信息,包装数量等信息,包装数量等信息0017','1105.29','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000018','可乐-大罐的0018','小','P000009','TM000000000010018','包装类型0018','包装数量等信息,包装数量等信息,包装数量等信息0018','1035.58','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000019','可乐-大罐的0019','大','P000010','TM000000000010019','包装类型0019','包装数量等信息,包装数量等信息,包装数量等信息0019','1225.28','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000020','可乐-大罐的0020','中','P000010','TM000000000010020','包装类型0020','包装数量等信息,包装数量等信息,包装数量等信息0020','1082.99','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000021','可乐-大罐的0021','小','P000011','TM000000000010021','包装类型0021','包装数量等信息,包装数量等信息,包装数量等信息0021','1245.35','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000022','可乐-大罐的0022','大','P000011','TM000000000010022','包装类型0022','包装数量等信息,包装数量等信息,包装数量等信息0022','965.20','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000023','可乐-大罐的0023','中','P000012','TM000000000010023','包装类型0023','包装数量等信息,包装数量等信息,包装数量等信息0023','934.84','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000024','可乐-大罐的0024','小','P000012','TM000000000010024','包装类型0024','包装数量等信息,包装数量等信息,包装数量等信息0024','1205.84','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000025','可乐-大罐的0025','大','P000013','TM000000000010025','包装类型0025','包装数量等信息,包装数量等信息,包装数量等信息0025','1302.46','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000026','可乐-大罐的0026','中','P000013','TM000000000010026','包装类型0026','包装数量等信息,包装数量等信息,包装数量等信息0026','1220.32','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000027','可乐-大罐的0027','小','P000014','TM000000000010027','包装类型0027','包装数量等信息,包装数量等信息,包装数量等信息0027','1188.73','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000028','可乐-大罐的0028','大','P000014','TM000000000010028','包装类型0028','包装数量等信息,包装数量等信息,包装数量等信息0028','1247.69','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000029','可乐-大罐的0029','中','P000015','TM000000000010029','包装类型0029','包装数量等信息,包装数量等信息,包装数量等信息0029','1074.17','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000030','可乐-大罐的0030','小','P000015','TM000000000010030','包装类型0030','包装数量等信息,包装数量等信息,包装数量等信息0030','1228.19','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000031','可乐-大罐的0031','大','P000016','TM000000000010031','包装类型0031','包装数量等信息,包装数量等信息,包装数量等信息0031','1053.88','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000032','可乐-大罐的0032','中','P000016','TM000000000010032','包装类型0032','包装数量等信息,包装数量等信息,包装数量等信息0032','1026.66','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000033','可乐-大罐的0033','小','P000017','TM000000000010033','包装类型0033','包装数量等信息,包装数量等信息,包装数量等信息0033','1198.23','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000034','可乐-大罐的0034','大','P000017','TM000000000010034','包装类型0034','包装数量等信息,包装数量等信息,包装数量等信息0034','959.42','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000035','可乐-大罐的0035','中','P000018','TM000000000010035','包装类型0035','包装数量等信息,包装数量等信息,包装数量等信息0035','1065.85','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000036','可乐-大罐的0036','小','P000018','TM000000000010036','包装类型0036','包装数量等信息,包装数量等信息,包装数量等信息0036','1233.72','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000037','可乐-大罐的0037','大','P000019','TM000000000010037','包装类型0037','包装数量等信息,包装数量等信息,包装数量等信息0037','1305.05','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000038','可乐-大罐的0038','中','P000019','TM000000000010038','包装类型0038','包装数量等信息,包装数量等信息,包装数量等信息0038','1084.27','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000039','可乐-大罐的0039','小','P000020','TM000000000010039','包装类型0039','包装数量等信息,包装数量等信息,包装数量等信息0039','1194.09','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000040','可乐-大罐的0040','大','P000020','TM000000000010040','包装类型0040','包装数量等信息,包装数量等信息,包装数量等信息0040','1212.01','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000041','可乐-大罐的0041','中','P000021','TM000000000010041','包装类型0041','包装数量等信息,包装数量等信息,包装数量等信息0041','1046.21','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000042','可乐-大罐的0042','小','P000021','TM000000000010042','包装类型0042','包装数量等信息,包装数量等信息,包装数量等信息0042','1012.45','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000043','可乐-大罐的0043','大','P000022','TM000000000010043','包装类型0043','包装数量等信息,包装数量等信息,包装数量等信息0043','929.68','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000044','可乐-大罐的0044','中','P000022','TM000000000010044','包装类型0044','包装数量等信息,包装数量等信息,包装数量等信息0044','1071.19','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000045','可乐-大罐的0045','小','P000023','TM000000000010045','包装类型0045','包装数量等信息,包装数量等信息,包装数量等信息0045','946.72','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000046','可乐-大罐的0046','大','P000023','TM000000000010046','包装类型0046','包装数量等信息,包装数量等信息,包装数量等信息0046','1219.75','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000047','可乐-大罐的0047','中','P000024','TM000000000010047','包装类型0047','包装数量等信息,包装数量等信息,包装数量等信息0047','1020.71','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000048','可乐-大罐的0048','小','P000024','TM000000000010048','包装类型0048','包装数量等信息,包装数量等信息,包装数量等信息0048','1191.88','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000049','可乐-大罐的0049','大','P000025','TM000000000010049','包装类型0049','包装数量等信息,包装数量等信息,包装数量等信息0049','1209.95','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000050','可乐-大罐的0050','中','P000025','TM000000000010050','包装类型0050','包装数量等信息,包装数量等信息,包装数量等信息0050','1153.23','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000051','可乐-大罐的0051','小','P000026','TM000000000010051','包装类型0051','包装数量等信息,包装数量等信息,包装数量等信息0051','1153.45','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000052','可乐-大罐的0052','大','P000026','TM000000000010052','包装类型0052','包装数量等信息,包装数量等信息,包装数量等信息0052','977.49','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000053','可乐-大罐的0053','中','P000027','TM000000000010053','包装类型0053','包装数量等信息,包装数量等信息,包装数量等信息0053','1147.74','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000054','可乐-大罐的0054','小','P000027','TM000000000010054','包装类型0054','包装数量等信息,包装数量等信息,包装数量等信息0054','1139.48','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000055','可乐-大罐的0055','大','P000028','TM000000000010055','包装类型0055','包装数量等信息,包装数量等信息,包装数量等信息0055','1297.72','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000056','可乐-大罐的0056','中','P000028','TM000000000010056','包装类型0056','包装数量等信息,包装数量等信息,包装数量等信息0056','1048.76','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000057','可乐-大罐的0057','小','P000029','TM000000000010057','包装类型0057','包装数量等信息,包装数量等信息,包装数量等信息0057','1079.32','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000058','可乐-大罐的0058','大','P000029','TM000000000010058','包装类型0058','包装数量等信息,包装数量等信息,包装数量等信息0058','989.04','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000059','可乐-大罐的0059','中','P000030','TM000000000010059','包装类型0059','包装数量等信息,包装数量等信息,包装数量等信息0059','1243.78','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000060','可乐-大罐的0060','小','P000030','TM000000000010060','包装类型0060','包装数量等信息,包装数量等信息,包装数量等信息0060','1010.84','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000061','可乐-大罐的0061','大','P000031','TM000000000010061','包装类型0061','包装数量等信息,包装数量等信息,包装数量等信息0061','1151.79','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000062','可乐-大罐的0062','中','P000031','TM000000000010062','包装类型0062','包装数量等信息,包装数量等信息,包装数量等信息0062','929.23','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000063','可乐-大罐的0063','小','P000032','TM000000000010063','包装类型0063','包装数量等信息,包装数量等信息,包装数量等信息0063','1091.73','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1'),
	('S000064','可乐-大罐的0064','大','P000032','TM000000000010064','包装类型0064','包装数量等信息,包装数量等信息,包装数量等信息0064','932.64','https://demo.doublechaintech.com/demodata/imageManager/genImage/coco00/400/200/grey/','1');

insert into retail_store_province_center_data values
	('RSPC000001','双链小超四川省运营中心','2019-05-08','RSCC000001','2019-11-15 22:19:19','1'),
	('RSPC000002','双链小超北京运营中心','2019-07-30','RSCC000001','2019-11-21 01:58:33','1');

insert into province_center_department_data values
	('PCD000001','供应链部','2018-04-28','RSPC000001','刘强','1'),
	('PCD000002','采购部','2019-08-14','RSPC000001','王德宏','1'),
	('PCD000003','管理部','2019-11-14','RSPC000002','刘强','1'),
	('PCD000004','财务部','2017-06-16','RSPC000002','王德宏','1');

insert into province_center_employee_data values
	('PCE000001','刘强','13999998888','wangdehong@yatang.cn','2017-06-10','PCD000001','RSPC000001','1'),
	('PCE000002','王德宏','13900000002','liuqiang@yatang.cn','2018-09-13','PCD000001','RSPC000001','1'),
	('PCE000003','刘强','13900000003','wangdehong@yatang.cn','2019-07-09','PCD000002','RSPC000001','1'),
	('PCE000004','王德宏','13900000004','liuqiang@yatang.cn','2018-05-15','PCD000002','RSPC000001','1'),
	('PCE000005','刘强','13900000005','wangdehong@yatang.cn','2018-03-06','PCD000003','RSPC000002','1'),
	('PCE000006','王德宏','13900000006','liuqiang@yatang.cn','2018-05-04','PCD000003','RSPC000002','1'),
	('PCE000007','刘强','13900000007','wangdehong@yatang.cn','2018-06-13','PCD000004','RSPC000002','1'),
	('PCE000008','王德宏','13900000008','liuqiang@yatang.cn','2019-04-23','PCD000004','RSPC000002','1');

insert into retail_store_city_service_center_data values
	('RSCSC000001','双链小超成都办事处','2018-09-10','RSPC000001','2019-11-24 05:03:33','1'),
	('RSCSC000002','双链小超绵阳办事处','2018-07-31','RSPC000001','2019-11-26 04:05:59','1'),
	('RSCSC000003','双链小超巴中办事处','2018-05-06','RSPC000002','2019-12-03 01:44:00','1'),
	('RSCSC000004','双链小超成都办事处','2017-01-12','RSPC000002','2019-11-30 16:30:03','1');

insert into city_partner_data values
	('CP000001','曾倩','13677778888','RSCSC000001','负责开拓市场，具有极强的开拓能力','2019-11-19 18:12:04','1'),
	('CP000002','黄风格','13900000002','RSCSC000001','负责开拓市场，具有极强的开拓能力0002','2019-11-14 05:56:36','1'),
	('CP000003','郭超','13900000003','RSCSC000002','负责开拓市场，具有极强的开拓能力0003','2019-12-04 04:34:38','1'),
	('CP000004','曾倩','13900000004','RSCSC000002','负责开拓市场，具有极强的开拓能力0004','2019-11-21 04:42:54','1'),
	('CP000005','黄风格','13900000005','RSCSC000003','负责开拓市场，具有极强的开拓能力0005','2019-11-15 21:52:45','1'),
	('CP000006','郭超','13900000006','RSCSC000003','负责开拓市场，具有极强的开拓能力0006','2019-12-03 08:36:08','1'),
	('CP000007','曾倩','13900000007','RSCSC000004','负责开拓市场，具有极强的开拓能力0007','2019-11-27 02:50:43','1'),
	('CP000008','黄风格','13900000008','RSCSC000004','负责开拓市场，具有极强的开拓能力0008','2019-12-05 03:30:06','1');

insert into potential_customer_data values
	('PC000001','曾倩','13677778888','RSCSC000001','CP000001','负责开拓市场，具有极强的开拓能力','2019-11-27 00:30:49','1'),
	('PC000002','黄风格','13900000002','RSCSC000001','CP000001','负责开拓市场，具有极强的开拓能力0002','2019-11-25 06:08:34','1'),
	('PC000003','郭超','13900000003','RSCSC000001','CP000002','负责开拓市场，具有极强的开拓能力0003','2019-11-19 20:45:52','1'),
	('PC000004','曾倩','13900000004','RSCSC000001','CP000002','负责开拓市场，具有极强的开拓能力0004','2019-12-03 16:20:23','1'),
	('PC000005','黄风格','13900000005','RSCSC000002','CP000003','负责开拓市场，具有极强的开拓能力0005','2019-12-02 06:17:46','1'),
	('PC000006','郭超','13900000006','RSCSC000002','CP000003','负责开拓市场，具有极强的开拓能力0006','2019-12-02 10:07:15','1'),
	('PC000007','曾倩','13900000007','RSCSC000002','CP000004','负责开拓市场，具有极强的开拓能力0007','2019-11-22 20:03:17','1'),
	('PC000008','黄风格','13900000008','RSCSC000002','CP000004','负责开拓市场，具有极强的开拓能力0008','2019-11-15 19:20:12','1'),
	('PC000009','郭超','13900000009','RSCSC000003','CP000005','负责开拓市场，具有极强的开拓能力0009','2019-11-22 03:46:02','1'),
	('PC000010','曾倩','13900000010','RSCSC000003','CP000005','负责开拓市场，具有极强的开拓能力0010','2019-12-05 19:21:35','1'),
	('PC000011','黄风格','13900000011','RSCSC000003','CP000006','负责开拓市场，具有极强的开拓能力0011','2019-11-21 22:16:22','1'),
	('PC000012','郭超','13900000012','RSCSC000003','CP000006','负责开拓市场，具有极强的开拓能力0012','2019-11-22 04:14:17','1'),
	('PC000013','曾倩','13900000013','RSCSC000004','CP000007','负责开拓市场，具有极强的开拓能力0013','2019-11-23 13:23:57','1'),
	('PC000014','黄风格','13900000014','RSCSC000004','CP000007','负责开拓市场，具有极强的开拓能力0014','2019-11-27 03:49:47','1'),
	('PC000015','郭超','13900000015','RSCSC000004','CP000008','负责开拓市场，具有极强的开拓能力0015','2019-11-28 18:19:59','1'),
	('PC000016','曾倩','13900000016','RSCSC000004','CP000008','负责开拓市场，具有极强的开拓能力0016','2019-11-17 18:14:37','1');
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

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
<<<<<<< HEAD
	('PCC000001','和连载客户的联系记录','2017-12-30','电话','PC000001','CP000001','PCCP000001','转化希望很大','2019-10-05 09:58:23','1'),
	('PCC000002','和连载客户的联系记录0002','2016-10-29','短信','PC000001','CP000001','PCCP000001','转化希望很大0002','2019-09-27 19:21:32','1'),
	('PCC000003','和连载客户的联系记录0003','2019-03-11','登门拜访','PC000001','CP000001','PCCP000002','转化希望很大0003','2019-10-12 17:47:44','1'),
	('PCC000004','和连载客户的联系记录0004','2016-11-19','活动聊天','PC000001','CP000001','PCCP000002','转化希望很大0004','2019-10-08 08:10:17','1'),
	('PCC000005','和连载客户的联系记录0005','2017-03-15','电话','PC000002','CP000001','PCCP000003','转化希望很大0005','2019-10-14 04:03:22','1'),
	('PCC000006','和连载客户的联系记录0006','2017-08-11','短信','PC000002','CP000001','PCCP000003','转化希望很大0006','2019-09-25 23:45:16','1'),
	('PCC000007','和连载客户的联系记录0007','2017-08-22','登门拜访','PC000002','CP000001','PCCP000004','转化希望很大0007','2019-10-09 13:22:57','1'),
	('PCC000008','和连载客户的联系记录0008','2018-11-21','活动聊天','PC000002','CP000001','PCCP000004','转化希望很大0008','2019-09-25 10:00:00','1'),
	('PCC000009','和连载客户的联系记录0009','2018-08-02','电话','PC000003','CP000002','PCCP000005','转化希望很大0009','2019-10-16 05:33:41','1'),
	('PCC000010','和连载客户的联系记录0010','2019-03-08','短信','PC000003','CP000002','PCCP000005','转化希望很大0010','2019-10-09 12:30:08','1'),
	('PCC000011','和连载客户的联系记录0011','2018-08-07','登门拜访','PC000003','CP000002','PCCP000006','转化希望很大0011','2019-09-29 11:39:53','1'),
	('PCC000012','和连载客户的联系记录0012','2018-04-01','活动聊天','PC000003','CP000002','PCCP000006','转化希望很大0012','2019-09-28 18:42:31','1'),
	('PCC000013','和连载客户的联系记录0013','2018-01-22','电话','PC000004','CP000002','PCCP000007','转化希望很大0013','2019-10-11 19:02:48','1'),
	('PCC000014','和连载客户的联系记录0014','2019-09-30','短信','PC000004','CP000002','PCCP000007','转化希望很大0014','2019-09-29 17:40:38','1'),
	('PCC000015','和连载客户的联系记录0015','2018-02-11','登门拜访','PC000004','CP000002','PCCP000008','转化希望很大0015','2019-10-13 10:09:10','1'),
	('PCC000016','和连载客户的联系记录0016','2018-03-26','活动聊天','PC000004','CP000002','PCCP000008','转化希望很大0016','2019-10-05 14:07:49','1'),
	('PCC000017','和连载客户的联系记录0017','2018-04-25','电话','PC000005','CP000003','PCCP000009','转化希望很大0017','2019-09-28 15:39:06','1'),
	('PCC000018','和连载客户的联系记录0018','2018-11-26','短信','PC000005','CP000003','PCCP000009','转化希望很大0018','2019-09-29 10:29:42','1'),
	('PCC000019','和连载客户的联系记录0019','2016-11-01','登门拜访','PC000005','CP000003','PCCP000010','转化希望很大0019','2019-09-27 12:12:28','1'),
	('PCC000020','和连载客户的联系记录0020','2018-01-28','活动聊天','PC000005','CP000003','PCCP000010','转化希望很大0020','2019-10-13 09:50:00','1'),
	('PCC000021','和连载客户的联系记录0021','2017-02-09','电话','PC000006','CP000003','PCCP000011','转化希望很大0021','2019-10-07 20:49:56','1'),
	('PCC000022','和连载客户的联系记录0022','2017-05-14','短信','PC000006','CP000003','PCCP000011','转化希望很大0022','2019-10-02 16:47:34','1'),
	('PCC000023','和连载客户的联系记录0023','2017-10-04','登门拜访','PC000006','CP000003','PCCP000012','转化希望很大0023','2019-10-09 14:24:31','1'),
	('PCC000024','和连载客户的联系记录0024','2018-04-22','活动聊天','PC000006','CP000003','PCCP000012','转化希望很大0024','2019-10-01 02:59:06','1'),
	('PCC000025','和连载客户的联系记录0025','2019-10-02','电话','PC000007','CP000004','PCCP000013','转化希望很大0025','2019-10-08 21:03:20','1'),
	('PCC000026','和连载客户的联系记录0026','2017-06-15','短信','PC000007','CP000004','PCCP000013','转化希望很大0026','2019-10-11 06:16:46','1'),
	('PCC000027','和连载客户的联系记录0027','2019-01-20','登门拜访','PC000007','CP000004','PCCP000014','转化希望很大0027','2019-10-16 15:05:50','1'),
	('PCC000028','和连载客户的联系记录0028','2018-10-20','活动聊天','PC000007','CP000004','PCCP000014','转化希望很大0028','2019-10-13 00:00:54','1'),
	('PCC000029','和连载客户的联系记录0029','2019-03-11','电话','PC000008','CP000004','PCCP000015','转化希望很大0029','2019-10-02 09:08:15','1'),
	('PCC000030','和连载客户的联系记录0030','2018-12-21','短信','PC000008','CP000004','PCCP000015','转化希望很大0030','2019-09-28 17:16:23','1'),
	('PCC000031','和连载客户的联系记录0031','2017-09-11','登门拜访','PC000008','CP000004','PCCP000016','转化希望很大0031','2019-10-08 02:16:38','1'),
	('PCC000032','和连载客户的联系记录0032','2019-07-20','活动聊天','PC000008','CP000004','PCCP000016','转化希望很大0032','2019-10-10 09:30:44','1'),
	('PCC000033','和连载客户的联系记录0033','2016-10-21','电话','PC000009','CP000005','PCCP000017','转化希望很大0033','2019-10-11 14:30:02','1'),
	('PCC000034','和连载客户的联系记录0034','2017-10-03','短信','PC000009','CP000005','PCCP000017','转化希望很大0034','2019-09-27 06:03:46','1'),
	('PCC000035','和连载客户的联系记录0035','2019-05-26','登门拜访','PC000009','CP000005','PCCP000018','转化希望很大0035','2019-10-07 15:14:53','1'),
	('PCC000036','和连载客户的联系记录0036','2019-10-11','活动聊天','PC000009','CP000005','PCCP000018','转化希望很大0036','2019-10-05 03:34:52','1'),
	('PCC000037','和连载客户的联系记录0037','2016-11-04','电话','PC000010','CP000005','PCCP000019','转化希望很大0037','2019-10-16 12:01:36','1'),
	('PCC000038','和连载客户的联系记录0038','2018-01-05','短信','PC000010','CP000005','PCCP000019','转化希望很大0038','2019-10-13 08:36:55','1'),
	('PCC000039','和连载客户的联系记录0039','2018-03-12','登门拜访','PC000010','CP000005','PCCP000020','转化希望很大0039','2019-10-08 01:45:01','1'),
	('PCC000040','和连载客户的联系记录0040','2017-12-04','活动聊天','PC000010','CP000005','PCCP000020','转化希望很大0040','2019-10-08 16:16:59','1'),
	('PCC000041','和连载客户的联系记录0041','2018-02-01','电话','PC000011','CP000006','PCCP000021','转化希望很大0041','2019-10-12 08:11:22','1'),
	('PCC000042','和连载客户的联系记录0042','2019-03-20','短信','PC000011','CP000006','PCCP000021','转化希望很大0042','2019-10-10 04:09:42','1'),
	('PCC000043','和连载客户的联系记录0043','2017-07-20','登门拜访','PC000011','CP000006','PCCP000022','转化希望很大0043','2019-10-14 03:00:02','1'),
	('PCC000044','和连载客户的联系记录0044','2018-08-26','活动聊天','PC000011','CP000006','PCCP000022','转化希望很大0044','2019-10-15 04:47:53','1'),
	('PCC000045','和连载客户的联系记录0045','2018-02-26','电话','PC000012','CP000006','PCCP000023','转化希望很大0045','2019-10-07 07:20:15','1'),
	('PCC000046','和连载客户的联系记录0046','2017-03-14','短信','PC000012','CP000006','PCCP000023','转化希望很大0046','2019-10-02 07:11:10','1'),
	('PCC000047','和连载客户的联系记录0047','2018-11-21','登门拜访','PC000012','CP000006','PCCP000024','转化希望很大0047','2019-10-10 03:11:43','1'),
	('PCC000048','和连载客户的联系记录0048','2017-10-22','活动聊天','PC000012','CP000006','PCCP000024','转化希望很大0048','2019-10-02 00:43:28','1'),
	('PCC000049','和连载客户的联系记录0049','2019-08-06','电话','PC000013','CP000007','PCCP000025','转化希望很大0049','2019-09-28 04:24:43','1'),
	('PCC000050','和连载客户的联系记录0050','2017-09-18','短信','PC000013','CP000007','PCCP000025','转化希望很大0050','2019-10-07 23:20:56','1'),
	('PCC000051','和连载客户的联系记录0051','2017-12-19','登门拜访','PC000013','CP000007','PCCP000026','转化希望很大0051','2019-10-04 03:27:34','1'),
	('PCC000052','和连载客户的联系记录0052','2018-02-08','活动聊天','PC000013','CP000007','PCCP000026','转化希望很大0052','2019-10-01 03:09:24','1'),
	('PCC000053','和连载客户的联系记录0053','2018-08-19','电话','PC000014','CP000007','PCCP000027','转化希望很大0053','2019-10-12 12:58:19','1'),
	('PCC000054','和连载客户的联系记录0054','2019-07-23','短信','PC000014','CP000007','PCCP000027','转化希望很大0054','2019-10-03 01:04:13','1'),
	('PCC000055','和连载客户的联系记录0055','2017-05-23','登门拜访','PC000014','CP000007','PCCP000028','转化希望很大0055','2019-09-28 13:13:14','1'),
	('PCC000056','和连载客户的联系记录0056','2017-12-04','活动聊天','PC000014','CP000007','PCCP000028','转化希望很大0056','2019-10-16 19:45:25','1'),
	('PCC000057','和连载客户的联系记录0057','2018-03-10','电话','PC000015','CP000008','PCCP000029','转化希望很大0057','2019-10-04 14:24:38','1'),
	('PCC000058','和连载客户的联系记录0058','2018-02-04','短信','PC000015','CP000008','PCCP000029','转化希望很大0058','2019-10-04 20:18:11','1'),
	('PCC000059','和连载客户的联系记录0059','2019-04-11','登门拜访','PC000015','CP000008','PCCP000030','转化希望很大0059','2019-10-05 18:35:04','1'),
	('PCC000060','和连载客户的联系记录0060','2018-06-06','活动聊天','PC000015','CP000008','PCCP000030','转化希望很大0060','2019-10-08 01:27:38','1'),
	('PCC000061','和连载客户的联系记录0061','2017-08-19','电话','PC000016','CP000008','PCCP000031','转化希望很大0061','2019-10-10 18:26:09','1'),
	('PCC000062','和连载客户的联系记录0062','2017-09-18','短信','PC000016','CP000008','PCCP000031','转化希望很大0062','2019-10-03 09:01:19','1'),
	('PCC000063','和连载客户的联系记录0063','2016-10-30','登门拜访','PC000016','CP000008','PCCP000032','转化希望很大0063','2019-10-13 22:41:30','1'),
	('PCC000064','和连载客户的联系记录0064','2016-12-18','活动聊天','PC000016','CP000008','PCCP000032','转化希望很大0064','2019-10-05 20:38:01','1');

insert into city_event_data values
	('CE000001','小超见面会','13677778888','RSCSC000001','给大家讲解小超的发展蓝图','2019-10-13 09:04:34','1'),
	('CE000002','双链小超说明会','13900000002','RSCSC000001','给大家讲解小超的发展蓝图0002','2019-10-12 13:53:49','1'),
	('CE000003','小超见面会','13900000003','RSCSC000002','给大家讲解小超的发展蓝图0003','2019-10-08 07:10:21','1'),
	('CE000004','双链小超说明会','13900000004','RSCSC000002','给大家讲解小超的发展蓝图0004','2019-10-10 05:21:38','1'),
	('CE000005','小超见面会','13900000005','RSCSC000003','给大家讲解小超的发展蓝图0005','2019-10-13 12:41:40','1'),
	('CE000006','双链小超说明会','13900000006','RSCSC000003','给大家讲解小超的发展蓝图0006','2019-10-10 02:50:01','1'),
	('CE000007','小超见面会','13900000007','RSCSC000004','给大家讲解小超的发展蓝图0007','2019-10-07 03:47:08','1'),
	('CE000008','双链小超说明会','13900000008','RSCSC000004','给大家讲解小超的发展蓝图0008','2019-10-03 21:55:01','1');
=======
	('PCC000001','和连载客户的联系记录','2018-03-18','电话','PC000001','CP000001','PCCP000001','转化希望很大','2019-11-20 15:14:14','1'),
	('PCC000002','和连载客户的联系记录0002','2017-10-04','短信','PC000001','CP000001','PCCP000001','转化希望很大0002','2019-11-22 02:30:58','1'),
	('PCC000003','和连载客户的联系记录0003','2017-09-30','登门拜访','PC000001','CP000001','PCCP000002','转化希望很大0003','2019-11-15 14:52:31','1'),
	('PCC000004','和连载客户的联系记录0004','2018-12-25','活动聊天','PC000001','CP000001','PCCP000002','转化希望很大0004','2019-11-15 05:39:41','1'),
	('PCC000005','和连载客户的联系记录0005','2018-05-20','电话','PC000002','CP000001','PCCP000003','转化希望很大0005','2019-12-04 23:30:13','1'),
	('PCC000006','和连载客户的联系记录0006','2018-11-10','短信','PC000002','CP000001','PCCP000003','转化希望很大0006','2019-11-20 19:29:47','1'),
	('PCC000007','和连载客户的联系记录0007','2017-07-15','登门拜访','PC000002','CP000001','PCCP000004','转化希望很大0007','2019-12-02 09:16:08','1'),
	('PCC000008','和连载客户的联系记录0008','2019-07-31','活动聊天','PC000002','CP000001','PCCP000004','转化希望很大0008','2019-11-27 08:51:29','1'),
	('PCC000009','和连载客户的联系记录0009','2019-07-08','电话','PC000003','CP000002','PCCP000005','转化希望很大0009','2019-11-24 23:31:49','1'),
	('PCC000010','和连载客户的联系记录0010','2017-02-03','短信','PC000003','CP000002','PCCP000005','转化希望很大0010','2019-12-01 14:41:42','1'),
	('PCC000011','和连载客户的联系记录0011','2018-05-26','登门拜访','PC000003','CP000002','PCCP000006','转化希望很大0011','2019-11-29 11:45:04','1'),
	('PCC000012','和连载客户的联系记录0012','2019-10-17','活动聊天','PC000003','CP000002','PCCP000006','转化希望很大0012','2019-11-22 00:58:31','1'),
	('PCC000013','和连载客户的联系记录0013','2017-09-06','电话','PC000004','CP000002','PCCP000007','转化希望很大0013','2019-11-20 12:55:51','1'),
	('PCC000014','和连载客户的联系记录0014','2019-09-19','短信','PC000004','CP000002','PCCP000007','转化希望很大0014','2019-11-28 03:04:31','1'),
	('PCC000015','和连载客户的联系记录0015','2017-06-25','登门拜访','PC000004','CP000002','PCCP000008','转化希望很大0015','2019-11-21 01:58:53','1'),
	('PCC000016','和连载客户的联系记录0016','2017-08-23','活动聊天','PC000004','CP000002','PCCP000008','转化希望很大0016','2019-11-16 10:15:47','1'),
	('PCC000017','和连载客户的联系记录0017','2019-03-21','电话','PC000005','CP000003','PCCP000009','转化希望很大0017','2019-11-14 17:01:39','1'),
	('PCC000018','和连载客户的联系记录0018','2017-02-23','短信','PC000005','CP000003','PCCP000009','转化希望很大0018','2019-11-18 22:27:42','1'),
	('PCC000019','和连载客户的联系记录0019','2017-10-12','登门拜访','PC000005','CP000003','PCCP000010','转化希望很大0019','2019-11-17 16:35:18','1'),
	('PCC000020','和连载客户的联系记录0020','2019-07-31','活动聊天','PC000005','CP000003','PCCP000010','转化希望很大0020','2019-11-21 21:41:22','1'),
	('PCC000021','和连载客户的联系记录0021','2019-08-05','电话','PC000006','CP000003','PCCP000011','转化希望很大0021','2019-11-21 18:48:56','1'),
	('PCC000022','和连载客户的联系记录0022','2018-10-23','短信','PC000006','CP000003','PCCP000011','转化希望很大0022','2019-11-22 08:59:10','1'),
	('PCC000023','和连载客户的联系记录0023','2018-03-03','登门拜访','PC000006','CP000003','PCCP000012','转化希望很大0023','2019-11-25 22:24:19','1'),
	('PCC000024','和连载客户的联系记录0024','2018-08-12','活动聊天','PC000006','CP000003','PCCP000012','转化希望很大0024','2019-12-03 21:29:45','1'),
	('PCC000025','和连载客户的联系记录0025','2017-05-05','电话','PC000007','CP000004','PCCP000013','转化希望很大0025','2019-11-23 06:51:10','1'),
	('PCC000026','和连载客户的联系记录0026','2017-10-06','短信','PC000007','CP000004','PCCP000013','转化希望很大0026','2019-12-05 08:50:55','1'),
	('PCC000027','和连载客户的联系记录0027','2019-10-19','登门拜访','PC000007','CP000004','PCCP000014','转化希望很大0027','2019-11-22 18:25:17','1'),
	('PCC000028','和连载客户的联系记录0028','2019-01-02','活动聊天','PC000007','CP000004','PCCP000014','转化希望很大0028','2019-12-01 21:04:54','1'),
	('PCC000029','和连载客户的联系记录0029','2018-04-14','电话','PC000008','CP000004','PCCP000015','转化希望很大0029','2019-11-20 06:42:02','1'),
	('PCC000030','和连载客户的联系记录0030','2019-06-17','短信','PC000008','CP000004','PCCP000015','转化希望很大0030','2019-11-29 21:16:15','1'),
	('PCC000031','和连载客户的联系记录0031','2019-05-30','登门拜访','PC000008','CP000004','PCCP000016','转化希望很大0031','2019-11-15 21:46:14','1'),
	('PCC000032','和连载客户的联系记录0032','2018-05-25','活动聊天','PC000008','CP000004','PCCP000016','转化希望很大0032','2019-11-25 20:47:38','1'),
	('PCC000033','和连载客户的联系记录0033','2019-01-14','电话','PC000009','CP000005','PCCP000017','转化希望很大0033','2019-11-21 16:08:58','1'),
	('PCC000034','和连载客户的联系记录0034','2018-10-22','短信','PC000009','CP000005','PCCP000017','转化希望很大0034','2019-11-16 02:54:59','1'),
	('PCC000035','和连载客户的联系记录0035','2017-12-01','登门拜访','PC000009','CP000005','PCCP000018','转化希望很大0035','2019-11-22 19:41:50','1'),
	('PCC000036','和连载客户的联系记录0036','2017-10-12','活动聊天','PC000009','CP000005','PCCP000018','转化希望很大0036','2019-11-16 00:48:03','1'),
	('PCC000037','和连载客户的联系记录0037','2019-06-08','电话','PC000010','CP000005','PCCP000019','转化希望很大0037','2019-11-22 15:51:02','1'),
	('PCC000038','和连载客户的联系记录0038','2017-05-26','短信','PC000010','CP000005','PCCP000019','转化希望很大0038','2019-11-19 21:03:38','1'),
	('PCC000039','和连载客户的联系记录0039','2019-04-23','登门拜访','PC000010','CP000005','PCCP000020','转化希望很大0039','2019-11-25 04:48:51','1'),
	('PCC000040','和连载客户的联系记录0040','2019-08-22','活动聊天','PC000010','CP000005','PCCP000020','转化希望很大0040','2019-11-22 06:25:37','1'),
	('PCC000041','和连载客户的联系记录0041','2018-05-11','电话','PC000011','CP000006','PCCP000021','转化希望很大0041','2019-12-02 22:23:12','1'),
	('PCC000042','和连载客户的联系记录0042','2017-07-29','短信','PC000011','CP000006','PCCP000021','转化希望很大0042','2019-11-24 04:35:11','1'),
	('PCC000043','和连载客户的联系记录0043','2019-09-13','登门拜访','PC000011','CP000006','PCCP000022','转化希望很大0043','2019-11-26 23:11:33','1'),
	('PCC000044','和连载客户的联系记录0044','2017-04-06','活动聊天','PC000011','CP000006','PCCP000022','转化希望很大0044','2019-11-17 10:43:40','1'),
	('PCC000045','和连载客户的联系记录0045','2017-03-02','电话','PC000012','CP000006','PCCP000023','转化希望很大0045','2019-11-22 15:48:32','1'),
	('PCC000046','和连载客户的联系记录0046','2017-08-23','短信','PC000012','CP000006','PCCP000023','转化希望很大0046','2019-11-18 07:41:00','1'),
	('PCC000047','和连载客户的联系记录0047','2017-02-16','登门拜访','PC000012','CP000006','PCCP000024','转化希望很大0047','2019-11-20 20:12:07','1'),
	('PCC000048','和连载客户的联系记录0048','2017-12-16','活动聊天','PC000012','CP000006','PCCP000024','转化希望很大0048','2019-11-19 18:53:00','1'),
	('PCC000049','和连载客户的联系记录0049','2019-08-28','电话','PC000013','CP000007','PCCP000025','转化希望很大0049','2019-12-02 00:15:59','1'),
	('PCC000050','和连载客户的联系记录0050','2018-06-29','短信','PC000013','CP000007','PCCP000025','转化希望很大0050','2019-11-17 23:43:45','1'),
	('PCC000051','和连载客户的联系记录0051','2019-05-12','登门拜访','PC000013','CP000007','PCCP000026','转化希望很大0051','2019-11-24 10:02:11','1'),
	('PCC000052','和连载客户的联系记录0052','2017-09-20','活动聊天','PC000013','CP000007','PCCP000026','转化希望很大0052','2019-12-05 16:47:14','1'),
	('PCC000053','和连载客户的联系记录0053','2018-04-15','电话','PC000014','CP000007','PCCP000027','转化希望很大0053','2019-11-16 14:09:30','1'),
	('PCC000054','和连载客户的联系记录0054','2019-05-20','短信','PC000014','CP000007','PCCP000027','转化希望很大0054','2019-12-05 18:13:50','1'),
	('PCC000055','和连载客户的联系记录0055','2018-11-15','登门拜访','PC000014','CP000007','PCCP000028','转化希望很大0055','2019-11-23 14:15:01','1'),
	('PCC000056','和连载客户的联系记录0056','2019-08-05','活动聊天','PC000014','CP000007','PCCP000028','转化希望很大0056','2019-12-01 20:48:35','1'),
	('PCC000057','和连载客户的联系记录0057','2017-01-30','电话','PC000015','CP000008','PCCP000029','转化希望很大0057','2019-12-05 20:50:10','1'),
	('PCC000058','和连载客户的联系记录0058','2017-08-13','短信','PC000015','CP000008','PCCP000029','转化希望很大0058','2019-11-29 16:18:14','1'),
	('PCC000059','和连载客户的联系记录0059','2018-09-29','登门拜访','PC000015','CP000008','PCCP000030','转化希望很大0059','2019-11-17 03:38:01','1'),
	('PCC000060','和连载客户的联系记录0060','2017-09-28','活动聊天','PC000015','CP000008','PCCP000030','转化希望很大0060','2019-12-03 02:42:50','1'),
	('PCC000061','和连载客户的联系记录0061','2019-06-02','电话','PC000016','CP000008','PCCP000031','转化希望很大0061','2019-11-17 13:29:01','1'),
	('PCC000062','和连载客户的联系记录0062','2018-06-15','短信','PC000016','CP000008','PCCP000031','转化希望很大0062','2019-11-17 02:46:17','1'),
	('PCC000063','和连载客户的联系记录0063','2017-02-05','登门拜访','PC000016','CP000008','PCCP000032','转化希望很大0063','2019-12-03 05:09:14','1'),
	('PCC000064','和连载客户的联系记录0064','2016-12-29','活动聊天','PC000016','CP000008','PCCP000032','转化希望很大0064','2019-12-02 00:42:09','1');

insert into city_event_data values
	('CE000001','小超见面会','13677778888','RSCSC000001','给大家讲解小超的发展蓝图','2019-11-19 18:05:32','1'),
	('CE000002','双链小超说明会','13900000002','RSCSC000001','给大家讲解小超的发展蓝图0002','2019-11-22 14:24:12','1'),
	('CE000003','小超见面会','13900000003','RSCSC000002','给大家讲解小超的发展蓝图0003','2019-11-17 17:43:49','1'),
	('CE000004','双链小超说明会','13900000004','RSCSC000002','给大家讲解小超的发展蓝图0004','2019-11-20 13:57:05','1'),
	('CE000005','小超见面会','13900000005','RSCSC000003','给大家讲解小超的发展蓝图0005','2019-11-17 07:12:43','1'),
	('CE000006','双链小超说明会','13900000006','RSCSC000003','给大家讲解小超的发展蓝图0006','2019-11-15 16:41:39','1'),
	('CE000007','小超见面会','13900000007','RSCSC000004','给大家讲解小超的发展蓝图0007','2019-11-17 07:12:25','1'),
	('CE000008','双链小超说明会','13900000008','RSCSC000004','给大家讲解小超的发展蓝图0008','2019-11-14 23:46:19','1');
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

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
<<<<<<< HEAD
	('RS000001','中和社区小超','02887654321','吕刚','RSCC000001','RSCSC000001',NULL,NULL,NULL,NULL,NULL,NULL,'2017-10-26','42.04722342532692','131.3875519961614','啤酒饮料矿泉水，香肠瓜子方便面, 请让一让','2019-09-27 09:55:08','CREATED','1'),
	('RS000002','华阳社区小超','028876543210002','吕刚0002','RSCC000001','RSCSC000001',NULL,NULL,NULL,NULL,NULL,NULL,'2016-10-29','40.30332252669696','131.70784324391846','啤酒饮料矿泉水，香肠瓜子方便面, 请让一让0002','2019-10-10 12:46:58','INVESTMENT_INVITED','1'),
	('RS000003','大源社区小超','028876543210003','吕刚0003','RSCC000001','RSCSC000002',NULL,NULL,NULL,NULL,NULL,NULL,'2019-07-28','42.599686151672216','129.38947129034284','啤酒饮料矿泉水，香肠瓜子方便面, 请让一让0003','2019-10-07 12:58:26','FRANCHISED','1'),
	('RS000004','中和社区小超','028876543210004','吕刚0004','RSCC000001','RSCSC000002',NULL,NULL,NULL,NULL,NULL,NULL,'2019-06-20','40.88013846430438','129.8746223406565','啤酒饮料矿泉水，香肠瓜子方便面, 请让一让0004','2019-09-28 12:13:50','DECORATED','1'),
	('RS000005','华阳社区小超','028876543210005','吕刚0005','RSCC000001','RSCSC000003',NULL,NULL,NULL,NULL,NULL,NULL,'2018-03-04','42.426703324400854','129.70601534424713','啤酒饮料矿泉水，香肠瓜子方便面, 请让一让0005','2019-09-29 07:55:13','OPENNED','1'),
	('RS000006','大源社区小超','028876543210006','吕刚0006','RSCC000001','RSCSC000003',NULL,NULL,NULL,NULL,NULL,NULL,'2019-05-13','39.96197512280178','130.4082951814485','啤酒饮料矿泉水，香肠瓜子方便面, 请让一让0006','2019-09-28 16:15:15','CLOSED','1'),
	('RS000007','中和社区小超','028876543210007','吕刚0007','RSCC000001','RSCSC000004',NULL,NULL,NULL,NULL,NULL,NULL,'2019-07-28','41.077939222082','130.35706135681838','啤酒饮料矿泉水，香肠瓜子方便面, 请让一让0007','2019-10-05 15:16:07','CREATED','1'),
	('RS000008','华阳社区小超','028876543210008','吕刚0008','RSCC000001','RSCSC000004',NULL,NULL,NULL,NULL,NULL,NULL,'2017-05-13','41.17126523162358','131.3973422994099','啤酒饮料矿泉水，香肠瓜子方便面, 请让一让0008','2019-09-27 02:54:08','INVESTMENT_INVITED','1');
=======
	('RS000001','中和社区小超','447662078','吕刚','RSCC000001','RSCSC000001','RSC000001','RSII000001','RSF000001','RSD000001','RSO000001','RSC000001','2019-11-08','42.682641067165825','130.27663384933757','啤酒饮料矿泉水，香肠瓜子方便面, 请让一让','2019-11-25 08:30:39','1'),
	('RS000002','华阳社区小超','563605622','吕刚0002','RSCC000001','RSCSC000001','RSC000001','RSII000001','RSF000001','RSD000001','RSO000001','RSC000001','2019-10-18','40.63563724024236','132.00903008952184','啤酒饮料矿泉水，香肠瓜子方便面, 请让一让0002','2019-11-19 00:03:11','1'),
	('RS000003','大源社区小超','554493162','吕刚0003','RSCC000001','RSCSC000002','RSC000001','RSII000001','RSF000001','RSD000001','RSO000001','RSC000001','2017-02-28','40.64614223809905','131.56282546151547','啤酒饮料矿泉水，香肠瓜子方便面, 请让一让0003','2019-11-16 15:59:11','1'),
	('RS000004','中和社区小超','2174936498','吕刚0004','RSCC000001','RSCSC000002','RSC000001','RSII000001','RSF000001','RSD000001','RSO000001','RSC000001','2017-12-06','42.52751810313362','132.0175417879252','啤酒饮料矿泉水，香肠瓜子方便面, 请让一让0004','2019-11-29 22:16:30','1'),
	('RS000005','华阳社区小超','1389213829','吕刚0005','RSCC000001','RSCSC000003','RSC000001','RSII000001','RSF000001','RSD000001','RSO000001','RSC000001','2019-06-09','42.5945057003062','131.13068905001785','啤酒饮料矿泉水，香肠瓜子方便面, 请让一让0005','2019-11-30 03:53:42','1'),
	('RS000006','大源社区小超','2501595714','吕刚0006','RSCC000001','RSCSC000003','RSC000001','RSII000001','RSF000001','RSD000001','RSO000001','RSC000001','2019-10-06','41.37772076449531','130.5993422023483','啤酒饮料矿泉水，香肠瓜子方便面, 请让一让0006','2019-11-28 20:51:30','1'),
	('RS000007','中和社区小超','1073324409','吕刚0007','RSCC000001','RSCSC000004','RSC000001','RSII000001','RSF000001','RSD000001','RSO000001','RSC000001','2018-12-09','41.469098690626176','131.3273412767473','啤酒饮料矿泉水，香肠瓜子方便面, 请让一让0007','2019-11-24 18:35:14','1'),
	('RS000008','华阳社区小超','1252287892','吕刚0008','RSCC000001','RSCSC000004','RSC000001','RSII000001','RSF000001','RSD000001','RSO000001','RSC000001','2018-02-03','42.06026477195512','129.36291513084817','啤酒饮料矿泉水，香肠瓜子方便面, 请让一让0008','2019-11-22 20:19:59','1');
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

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
<<<<<<< HEAD
	('CO000001','消费订单','RSM000001',NULL,NULL,NULL,NULL,NULL,'RS000001','2019-09-26 20:17:50','CONFIRMED','1'),
	('CO000002','消费订单0002','RSM000001',NULL,NULL,NULL,NULL,NULL,'RS000001','2019-09-30 04:23:27','APPROVED','1'),
	('CO000003','消费订单0003','RSM000001',NULL,NULL,NULL,NULL,NULL,'RS000002','2019-10-15 10:45:36','PROCESSED','1'),
	('CO000004','消费订单0004','RSM000001',NULL,NULL,NULL,NULL,NULL,'RS000002','2019-10-03 18:31:41','SHIPPED','1'),
	('CO000005','消费订单0005','RSM000001',NULL,NULL,NULL,NULL,NULL,'RS000003','2019-10-04 09:22:37','DELIVERED','1'),
	('CO000006','消费订单0006','RSM000001',NULL,NULL,NULL,NULL,NULL,'RS000003','2019-10-12 09:45:13','CONFIRMED','1'),
	('CO000007','消费订单0007','RSM000001',NULL,NULL,NULL,NULL,NULL,'RS000004','2019-09-30 18:10:25','APPROVED','1'),
	('CO000008','消费订单0008','RSM000001',NULL,NULL,NULL,NULL,NULL,'RS000004','2019-10-02 06:22:05','PROCESSED','1'),
	('CO000009','消费订单0009','RSM000002',NULL,NULL,NULL,NULL,NULL,'RS000005','2019-09-30 10:21:40','SHIPPED','1'),
	('CO000010','消费订单0010','RSM000002',NULL,NULL,NULL,NULL,NULL,'RS000005','2019-10-12 17:37:49','DELIVERED','1'),
	('CO000011','消费订单0011','RSM000002',NULL,NULL,NULL,NULL,NULL,'RS000006','2019-10-04 15:11:32','CONFIRMED','1'),
	('CO000012','消费订单0012','RSM000002',NULL,NULL,NULL,NULL,NULL,'RS000006','2019-09-28 12:42:24','APPROVED','1'),
	('CO000013','消费订单0013','RSM000002',NULL,NULL,NULL,NULL,NULL,'RS000007','2019-09-27 14:13:23','PROCESSED','1'),
	('CO000014','消费订单0014','RSM000002',NULL,NULL,NULL,NULL,NULL,'RS000007','2019-09-29 19:11:57','SHIPPED','1'),
	('CO000015','消费订单0015','RSM000002',NULL,NULL,NULL,NULL,NULL,'RS000008','2019-10-05 10:34:52','DELIVERED','1'),
	('CO000016','消费订单0016','RSM000002',NULL,NULL,NULL,NULL,NULL,'RS000008','2019-09-26 12:55:44','CONFIRMED','1');

insert into consumer_order_confirmation_data values
	('COC000001','确认者','2017-10-07','1');

insert into consumer_order_approval_data values
	('COA000001','批准者','2019-01-16','1');

insert into consumer_order_processing_data values
	('COP000001','处理者','2018-12-25','1');

insert into consumer_order_shipment_data values
	('COS000001','运货者','2019-04-27','1');

insert into consumer_order_delivery_data values
	('COD000001','送货者','2017-07-01','1');

insert into consumer_order_line_item_data values
	('COLI000001','CO000001','SKU','大瓶可乐','4.57','777.71','9792.81','2019-10-05 18:03:11','1'),
	('COLI000002','CO000001','SKU0002','大瓶可乐0002','4.42','750.21','9609.67','2019-10-11 22:38:54','1'),
	('COLI000003','CO000002','SKU0003','大瓶可乐0003','5.52','840.45','7570.55','2019-09-28 06:48:47','1'),
	('COLI000004','CO000002','SKU0004','大瓶可乐0004','5.47','847.19','7486.88','2019-10-01 02:14:30','1'),
	('COLI000005','CO000003','SKU0005','大瓶可乐0005','5.92','735.17','7531.93','2019-09-25 05:58:16','1'),
	('COLI000006','CO000003','SKU0006','大瓶可乐0006','4.66','879.36','9940.80','2019-10-01 01:46:34','1'),
	('COLI000007','CO000004','SKU0007','大瓶可乐0007','5.03','923.70','9640.00','2019-10-05 04:08:36','1'),
	('COLI000008','CO000004','SKU0008','大瓶可乐0008','4.65','711.28','7637.93','2019-10-15 04:17:43','1'),
	('COLI000009','CO000005','SKU0009','大瓶可乐0009','4.68','960.19','7066.92','2019-10-08 02:17:09','1'),
	('COLI000010','CO000005','SKU0010','大瓶可乐0010','5.59','817.80','9483.57','2019-10-01 13:21:07','1'),
	('COLI000011','CO000006','SKU0011','大瓶可乐0011','4.73','725.11','8405.94','2019-10-06 00:30:10','1'),
	('COLI000012','CO000006','SKU0012','大瓶可乐0012','4.61','762.39','8094.57','2019-09-29 07:57:05','1'),
	('COLI000013','CO000007','SKU0013','大瓶可乐0013','5.15','727.32','7269.04','2019-10-11 05:01:56','1'),
	('COLI000014','CO000007','SKU0014','大瓶可乐0014','4.47','718.07','9792.26','2019-10-01 16:07:15','1'),
	('COLI000015','CO000008','SKU0015','大瓶可乐0015','5.39','854.49','7352.10','2019-09-27 00:46:02','1'),
	('COLI000016','CO000008','SKU0016','大瓶可乐0016','5.40','873.55','8822.93','2019-09-27 10:58:07','1'),
	('COLI000017','CO000009','SKU0017','大瓶可乐0017','4.89','776.83','9299.72','2019-10-16 18:51:44','1'),
	('COLI000018','CO000009','SKU0018','大瓶可乐0018','5.53','992.11','9762.49','2019-09-25 11:40:35','1'),
	('COLI000019','CO000010','SKU0019','大瓶可乐0019','5.10','934.29','8951.68','2019-09-30 13:10:47','1'),
	('COLI000020','CO000010','SKU0020','大瓶可乐0020','4.38','815.85','9312.71','2019-10-03 22:29:15','1'),
	('COLI000021','CO000011','SKU0021','大瓶可乐0021','5.52','862.21','7803.09','2019-10-15 19:31:39','1'),
	('COLI000022','CO000011','SKU0022','大瓶可乐0022','5.56','732.81','9945.82','2019-10-08 22:56:06','1'),
	('COLI000023','CO000012','SKU0023','大瓶可乐0023','5.51','835.64','8760.26','2019-10-09 05:26:44','1'),
	('COLI000024','CO000012','SKU0024','大瓶可乐0024','4.90','849.65','8104.65','2019-10-01 17:58:14','1'),
	('COLI000025','CO000013','SKU0025','大瓶可乐0025','5.36','737.22','8524.31','2019-10-01 08:05:14','1'),
	('COLI000026','CO000013','SKU0026','大瓶可乐0026','5.82','737.36','9915.19','2019-09-29 12:02:27','1'),
	('COLI000027','CO000014','SKU0027','大瓶可乐0027','4.97','778.88','9184.53','2019-10-03 12:21:22','1'),
	('COLI000028','CO000014','SKU0028','大瓶可乐0028','4.39','842.68','9618.82','2019-10-10 22:34:13','1'),
	('COLI000029','CO000015','SKU0029','大瓶可乐0029','5.26','832.31','7853.64','2019-10-04 19:14:47','1'),
	('COLI000030','CO000015','SKU0030','大瓶可乐0030','4.64','782.68','9181.02','2019-10-12 07:41:51','1'),
	('COLI000031','CO000016','SKU0031','大瓶可乐0031','4.35','748.40','9426.76','2019-10-09 14:32:26','1'),
	('COLI000032','CO000016','SKU0032','大瓶可乐0032','5.68','765.22','9783.70','2019-10-05 02:31:30','1');

insert into consumer_order_shipping_group_data values
	('COSG000001','送货到刘强家','CO000001','531.67','1'),
	('COSG000002','送货到刘强家0002','CO000001','582.32','1'),
	('COSG000003','送货到刘强家0003','CO000002','467.77','1'),
	('COSG000004','送货到刘强家0004','CO000002','532.88','1'),
	('COSG000005','送货到刘强家0005','CO000003','588.47','1'),
	('COSG000006','送货到刘强家0006','CO000003','541.63','1'),
	('COSG000007','送货到刘强家0007','CO000004','429.49','1'),
	('COSG000008','送货到刘强家0008','CO000004','451.34','1'),
	('COSG000009','送货到刘强家0009','CO000005','507.14','1'),
	('COSG000010','送货到刘强家0010','CO000005','523.27','1'),
	('COSG000011','送货到刘强家0011','CO000006','546.29','1'),
	('COSG000012','送货到刘强家0012','CO000006','462.57','1'),
	('COSG000013','送货到刘强家0013','CO000007','425.17','1'),
	('COSG000014','送货到刘强家0014','CO000007','547.25','1'),
	('COSG000015','送货到刘强家0015','CO000008','597.95','1'),
	('COSG000016','送货到刘强家0016','CO000008','448.51','1'),
	('COSG000017','送货到刘强家0017','CO000009','564.72','1'),
	('COSG000018','送货到刘强家0018','CO000009','523.78','1'),
	('COSG000019','送货到刘强家0019','CO000010','472.10','1'),
	('COSG000020','送货到刘强家0020','CO000010','442.37','1'),
	('COSG000021','送货到刘强家0021','CO000011','421.06','1'),
	('COSG000022','送货到刘强家0022','CO000011','490.70','1'),
	('COSG000023','送货到刘强家0023','CO000012','581.02','1'),
	('COSG000024','送货到刘强家0024','CO000012','565.75','1'),
	('COSG000025','送货到刘强家0025','CO000013','543.21','1'),
	('COSG000026','送货到刘强家0026','CO000013','489.15','1'),
	('COSG000027','送货到刘强家0027','CO000014','542.96','1'),
	('COSG000028','送货到刘强家0028','CO000014','441.85','1'),
	('COSG000029','送货到刘强家0029','CO000015','570.38','1'),
	('COSG000030','送货到刘强家0030','CO000015','481.04','1'),
	('COSG000031','送货到刘强家0031','CO000016','582.06','1'),
	('COSG000032','送货到刘强家0032','CO000016','533.97','1');
=======
	('CO000001','消费订单','RSM000001','SOC000001','SOA000001','SOP000001','SOS000001','SOD000001','RS000001','2019-11-14 20:31:50','1'),
	('CO000002','消费订单0002','RSM000001','SOC000001','SOA000001','SOP000001','SOS000001','SOD000001','RS000001','2019-11-15 11:09:23','1'),
	('CO000003','消费订单0003','RSM000001','SOC000001','SOA000001','SOP000001','SOS000001','SOD000001','RS000002','2019-12-03 02:06:45','1'),
	('CO000004','消费订单0004','RSM000001','SOC000001','SOA000001','SOP000001','SOS000001','SOD000001','RS000002','2019-11-27 15:06:35','1'),
	('CO000005','消费订单0005','RSM000001','SOC000001','SOA000001','SOP000001','SOS000001','SOD000001','RS000003','2019-11-17 15:42:44','1'),
	('CO000006','消费订单0006','RSM000001','SOC000001','SOA000001','SOP000001','SOS000001','SOD000001','RS000003','2019-12-05 01:47:59','1'),
	('CO000007','消费订单0007','RSM000001','SOC000001','SOA000001','SOP000001','SOS000001','SOD000001','RS000004','2019-11-15 01:24:52','1'),
	('CO000008','消费订单0008','RSM000001','SOC000001','SOA000001','SOP000001','SOS000001','SOD000001','RS000004','2019-11-29 16:29:37','1'),
	('CO000009','消费订单0009','RSM000002','SOC000001','SOA000001','SOP000001','SOS000001','SOD000001','RS000005','2019-11-30 12:21:34','1'),
	('CO000010','消费订单0010','RSM000002','SOC000001','SOA000001','SOP000001','SOS000001','SOD000001','RS000005','2019-11-30 19:30:34','1'),
	('CO000011','消费订单0011','RSM000002','SOC000001','SOA000001','SOP000001','SOS000001','SOD000001','RS000006','2019-11-23 19:13:48','1'),
	('CO000012','消费订单0012','RSM000002','SOC000001','SOA000001','SOP000001','SOS000001','SOD000001','RS000006','2019-11-14 21:53:59','1'),
	('CO000013','消费订单0013','RSM000002','SOC000001','SOA000001','SOP000001','SOS000001','SOD000001','RS000007','2019-11-16 22:06:59','1'),
	('CO000014','消费订单0014','RSM000002','SOC000001','SOA000001','SOP000001','SOS000001','SOD000001','RS000007','2019-11-23 15:52:22','1'),
	('CO000015','消费订单0015','RSM000002','SOC000001','SOA000001','SOP000001','SOS000001','SOD000001','RS000008','2019-12-02 16:27:21','1'),
	('CO000016','消费订单0016','RSM000002','SOC000001','SOA000001','SOP000001','SOS000001','SOD000001','RS000008','2019-11-20 23:52:40','1');

insert into consumer_order_confirmation_data values
	('COC000001','确认者','2018-09-26','1');

insert into consumer_order_approval_data values
	('COA000001','批准者','2017-10-20','1');

insert into consumer_order_processing_data values
	('COP000001','处理者','2018-12-22','1');

insert into consumer_order_shipment_data values
	('COS000001','运货者','2017-05-30','1');

insert into consumer_order_delivery_data values
	('COD000001','送货者','2018-05-04','1');

insert into consumer_order_line_item_data values
	('COLI000001','CO000001','SKU','大瓶可乐','4.96','842.06','9494.65','2019-11-21 09:13:25','1'),
	('COLI000002','CO000001','SKU0002','大瓶可乐0002','5.52','780.83','8880.95','2019-11-20 01:04:30','1'),
	('COLI000003','CO000002','SKU0003','大瓶可乐0003','5.66','766.01','7805.46','2019-11-26 17:43:30','1'),
	('COLI000004','CO000002','SKU0004','大瓶可乐0004','5.50','918.00','9763.50','2019-11-21 17:44:16','1'),
	('COLI000005','CO000003','SKU0005','大瓶可乐0005','5.74','776.75','9017.43','2019-11-27 01:52:40','1'),
	('COLI000006','CO000003','SKU0006','大瓶可乐0006','4.71','731.06','9475.47','2019-11-16 16:02:44','1'),
	('COLI000007','CO000004','SKU0007','大瓶可乐0007','5.48','937.58','8860.37','2019-12-02 05:28:35','1'),
	('COLI000008','CO000004','SKU0008','大瓶可乐0008','5.10','918.53','7740.38','2019-12-01 23:58:29','1'),
	('COLI000009','CO000005','SKU0009','大瓶可乐0009','5.70','793.27','8914.74','2019-12-05 22:14:32','1'),
	('COLI000010','CO000005','SKU0010','大瓶可乐0010','5.39','755.90','9720.50','2019-12-03 02:03:44','1'),
	('COLI000011','CO000006','SKU0011','大瓶可乐0011','5.93','957.90','8059.27','2019-11-23 18:38:13','1'),
	('COLI000012','CO000006','SKU0012','大瓶可乐0012','5.58','793.42','9330.08','2019-11-19 16:55:48','1'),
	('COLI000013','CO000007','SKU0013','大瓶可乐0013','5.87','912.92','7998.47','2019-12-02 21:02:59','1'),
	('COLI000014','CO000007','SKU0014','大瓶可乐0014','5.67','910.46','8232.06','2019-11-17 23:18:48','1'),
	('COLI000015','CO000008','SKU0015','大瓶可乐0015','4.46','739.46','9889.58','2019-11-29 04:04:02','1'),
	('COLI000016','CO000008','SKU0016','大瓶可乐0016','5.49','812.79','8162.61','2019-11-21 09:47:43','1'),
	('COLI000017','CO000009','SKU0017','大瓶可乐0017','5.09','933.39','8338.50','2019-11-30 23:55:27','1'),
	('COLI000018','CO000009','SKU0018','大瓶可乐0018','4.62','984.11','9478.25','2019-11-27 17:15:01','1'),
	('COLI000019','CO000010','SKU0019','大瓶可乐0019','4.23','977.32','9284.11','2019-11-14 23:02:19','1'),
	('COLI000020','CO000010','SKU0020','大瓶可乐0020','4.95','828.06','9069.93','2019-11-16 15:59:58','1'),
	('COLI000021','CO000011','SKU0021','大瓶可乐0021','5.04','868.06','7540.75','2019-11-21 14:56:20','1'),
	('COLI000022','CO000011','SKU0022','大瓶可乐0022','4.83','862.18','8038.65','2019-11-26 13:28:48','1'),
	('COLI000023','CO000012','SKU0023','大瓶可乐0023','5.59','723.65','9018.13','2019-11-29 23:52:46','1'),
	('COLI000024','CO000012','SKU0024','大瓶可乐0024','4.43','750.12','8777.11','2019-12-02 10:02:10','1'),
	('COLI000025','CO000013','SKU0025','大瓶可乐0025','5.84','718.49','7888.41','2019-11-29 07:15:10','1'),
	('COLI000026','CO000013','SKU0026','大瓶可乐0026','5.23','783.28','7352.05','2019-12-05 03:01:46','1'),
	('COLI000027','CO000014','SKU0027','大瓶可乐0027','5.51','820.67','8219.83','2019-11-21 05:06:00','1'),
	('COLI000028','CO000014','SKU0028','大瓶可乐0028','5.77','848.40','7331.61','2019-12-01 20:28:21','1'),
	('COLI000029','CO000015','SKU0029','大瓶可乐0029','5.54','930.14','7846.50','2019-11-19 16:25:20','1'),
	('COLI000030','CO000015','SKU0030','大瓶可乐0030','4.80','742.37','8452.43','2019-11-25 03:59:37','1'),
	('COLI000031','CO000016','SKU0031','大瓶可乐0031','5.89','741.65','8493.94','2019-12-03 10:59:43','1'),
	('COLI000032','CO000016','SKU0032','大瓶可乐0032','5.70','820.47','9770.92','2019-11-14 20:19:51','1');

insert into consumer_order_shipping_group_data values
	('COSG000001','送货到刘强家','CO000001','442.03','1'),
	('COSG000002','送货到刘强家0002','CO000001','588.74','1'),
	('COSG000003','送货到刘强家0003','CO000002','445.77','1'),
	('COSG000004','送货到刘强家0004','CO000002','538.31','1'),
	('COSG000005','送货到刘强家0005','CO000003','547.65','1'),
	('COSG000006','送货到刘强家0006','CO000003','593.73','1'),
	('COSG000007','送货到刘强家0007','CO000004','551.59','1'),
	('COSG000008','送货到刘强家0008','CO000004','459.15','1'),
	('COSG000009','送货到刘强家0009','CO000005','463.78','1'),
	('COSG000010','送货到刘强家0010','CO000005','594.10','1'),
	('COSG000011','送货到刘强家0011','CO000006','549.52','1'),
	('COSG000012','送货到刘强家0012','CO000006','586.21','1'),
	('COSG000013','送货到刘强家0013','CO000007','434.80','1'),
	('COSG000014','送货到刘强家0014','CO000007','469.45','1'),
	('COSG000015','送货到刘强家0015','CO000008','451.70','1'),
	('COSG000016','送货到刘强家0016','CO000008','434.73','1'),
	('COSG000017','送货到刘强家0017','CO000009','595.29','1'),
	('COSG000018','送货到刘强家0018','CO000009','452.99','1'),
	('COSG000019','送货到刘强家0019','CO000010','476.00','1'),
	('COSG000020','送货到刘强家0020','CO000010','592.64','1'),
	('COSG000021','送货到刘强家0021','CO000011','426.64','1'),
	('COSG000022','送货到刘强家0022','CO000011','464.75','1'),
	('COSG000023','送货到刘强家0023','CO000012','567.59','1'),
	('COSG000024','送货到刘强家0024','CO000012','461.74','1'),
	('COSG000025','送货到刘强家0025','CO000013','458.02','1'),
	('COSG000026','送货到刘强家0026','CO000013','424.60','1'),
	('COSG000027','送货到刘强家0027','CO000014','485.78','1'),
	('COSG000028','送货到刘强家0028','CO000014','435.62','1'),
	('COSG000029','送货到刘强家0029','CO000015','422.54','1'),
	('COSG000030','送货到刘强家0030','CO000015','438.00','1'),
	('COSG000031','送货到刘强家0031','CO000016','424.68','1'),
	('COSG000032','送货到刘强家0032','CO000016','471.38','1');
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

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
<<<<<<< HEAD
	('COPA000001','端午促销','CO000001','543.81','供货商','1'),
	('COPA000002','端午促销0002','CO000001','482.05','小超老板','1'),
	('COPA000003','端午促销0003','CO000002','505.06','广告赞助','1'),
	('COPA000004','端午促销0004','CO000002','584.08','供货商','1'),
	('COPA000005','端午促销0005','CO000003','439.86','小超老板','1'),
	('COPA000006','端午促销0006','CO000003','579.52','广告赞助','1'),
	('COPA000007','端午促销0007','CO000004','455.14','供货商','1'),
	('COPA000008','端午促销0008','CO000004','505.92','小超老板','1'),
	('COPA000009','端午促销0009','CO000005','544.99','广告赞助','1'),
	('COPA000010','端午促销0010','CO000005','443.20','供货商','1'),
	('COPA000011','端午促销0011','CO000006','466.42','小超老板','1'),
	('COPA000012','端午促销0012','CO000006','540.92','广告赞助','1'),
	('COPA000013','端午促销0013','CO000007','497.98','供货商','1'),
	('COPA000014','端午促销0014','CO000007','481.28','小超老板','1'),
	('COPA000015','端午促销0015','CO000008','583.51','广告赞助','1'),
	('COPA000016','端午促销0016','CO000008','453.88','供货商','1'),
	('COPA000017','端午促销0017','CO000009','598.46','小超老板','1'),
	('COPA000018','端午促销0018','CO000009','421.67','广告赞助','1'),
	('COPA000019','端午促销0019','CO000010','532.30','供货商','1'),
	('COPA000020','端午促销0020','CO000010','508.01','小超老板','1'),
	('COPA000021','端午促销0021','CO000011','484.22','广告赞助','1'),
	('COPA000022','端午促销0022','CO000011','471.29','供货商','1'),
	('COPA000023','端午促销0023','CO000012','588.10','小超老板','1'),
	('COPA000024','端午促销0024','CO000012','556.09','广告赞助','1'),
	('COPA000025','端午促销0025','CO000013','452.41','供货商','1'),
	('COPA000026','端午促销0026','CO000013','582.92','小超老板','1'),
	('COPA000027','端午促销0027','CO000014','427.37','广告赞助','1'),
	('COPA000028','端午促销0028','CO000014','496.19','供货商','1'),
	('COPA000029','端午促销0029','CO000015','481.60','小超老板','1'),
	('COPA000030','端午促销0030','CO000015','560.25','广告赞助','1'),
	('COPA000031','端午促销0031','CO000016','528.37','供货商','1'),
	('COPA000032','端午促销0032','CO000016','546.10','小超老板','1');

insert into retail_store_member_coupon_data values
	('RSMC000001','优惠券','RSM000001','CP00001','2019-10-11 14:48:45','1'),
	('RSMC000002','优惠券0002','RSM000001','CP000010002','2019-09-27 16:46:55','1'),
	('RSMC000003','优惠券0003','RSM000002','CP000010003','2019-10-06 14:00:24','1'),
	('RSMC000004','优惠券0004','RSM000002','CP000010004','2019-09-28 11:44:59','1');
=======
	('COPA000001','端午促销','CO000001','482.69','供货商','1'),
	('COPA000002','端午促销0002','CO000001','566.84','小超老板','1'),
	('COPA000003','端午促销0003','CO000002','451.69','广告赞助','1'),
	('COPA000004','端午促销0004','CO000002','451.74','供货商','1'),
	('COPA000005','端午促销0005','CO000003','461.09','小超老板','1'),
	('COPA000006','端午促销0006','CO000003','532.15','广告赞助','1'),
	('COPA000007','端午促销0007','CO000004','532.25','供货商','1'),
	('COPA000008','端午促销0008','CO000004','557.67','小超老板','1'),
	('COPA000009','端午促销0009','CO000005','534.51','广告赞助','1'),
	('COPA000010','端午促销0010','CO000005','503.37','供货商','1'),
	('COPA000011','端午促销0011','CO000006','582.98','小超老板','1'),
	('COPA000012','端午促销0012','CO000006','519.86','广告赞助','1'),
	('COPA000013','端午促销0013','CO000007','470.30','供货商','1'),
	('COPA000014','端午促销0014','CO000007','432.16','小超老板','1'),
	('COPA000015','端午促销0015','CO000008','498.94','广告赞助','1'),
	('COPA000016','端午促销0016','CO000008','589.89','供货商','1'),
	('COPA000017','端午促销0017','CO000009','564.47','小超老板','1'),
	('COPA000018','端午促销0018','CO000009','505.57','广告赞助','1'),
	('COPA000019','端午促销0019','CO000010','553.05','供货商','1'),
	('COPA000020','端午促销0020','CO000010','508.70','小超老板','1'),
	('COPA000021','端午促销0021','CO000011','420.80','广告赞助','1'),
	('COPA000022','端午促销0022','CO000011','505.05','供货商','1'),
	('COPA000023','端午促销0023','CO000012','447.98','小超老板','1'),
	('COPA000024','端午促销0024','CO000012','491.20','广告赞助','1'),
	('COPA000025','端午促销0025','CO000013','569.43','供货商','1'),
	('COPA000026','端午促销0026','CO000013','423.72','小超老板','1'),
	('COPA000027','端午促销0027','CO000014','511.92','广告赞助','1'),
	('COPA000028','端午促销0028','CO000014','591.60','供货商','1'),
	('COPA000029','端午促销0029','CO000015','481.99','小超老板','1'),
	('COPA000030','端午促销0030','CO000015','434.53','广告赞助','1'),
	('COPA000031','端午促销0031','CO000016','550.87','供货商','1'),
	('COPA000032','端午促销0032','CO000016','563.88','小超老板','1');

insert into retail_store_member_coupon_data values
	('RSMC000001','优惠券','RSM000001','CP00001','2019-11-24 03:35:53','1'),
	('RSMC000002','优惠券0002','RSM000001','CP000010002','2019-11-24 07:51:32','1'),
	('RSMC000003','优惠券0003','RSM000002','CP000010003','2019-11-16 16:28:04','1'),
	('RSMC000004','优惠券0004','RSM000002','CP000010004','2019-12-05 08:13:05','1');
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

insert into member_wishlist_data values
	('MW000001','每周购买清单','RSM000001','1'),
	('MW000002','每月购买清单','RSM000001','1'),
	('MW000003','每周购买清单','RSM000002','1'),
	('MW000004','每月购买清单','RSM000002','1');

insert into member_reward_point_data values
<<<<<<< HEAD
	('MRP000001','购买积分','20','RSM000001','1'),
	('MRP000002','每月购买清单','15','RSM000001','1'),
	('MRP000003','购买积分','20','RSM000002','1'),
	('MRP000004','每月购买清单','16','RSM000002','1');

insert into member_reward_point_redemption_data values
	('MRPR000001','积分换锅','20','RSM000001','1'),
	('MRPR000002','积分换刀','17','RSM000001','1'),
	('MRPR000003','积分换锅','16','RSM000002','1'),
	('MRPR000004','积分换刀','17','RSM000002','1');
=======
	('MRP000001','购买积分','19','RSM000001','1'),
	('MRP000002','每月购买清单','16','RSM000001','1'),
	('MRP000003','购买积分','16','RSM000002','1'),
	('MRP000004','每月购买清单','16','RSM000002','1');

insert into member_reward_point_redemption_data values
	('MRPR000001','积分换锅','17','RSM000001','1'),
	('MRPR000002','积分换刀','15','RSM000001','1'),
	('MRPR000003','积分换锅','20','RSM000002','1'),
	('MRPR000004','积分换刀','16','RSM000002','1');
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

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
<<<<<<< HEAD
	('RSMGC000001','礼品卡','RSM000001','CP00001','165.76','1'),
	('RSMGC000002','礼品卡0002','RSM000001','CP000010002','192.47','1'),
	('RSMGC000003','礼品卡0003','RSM000002','CP000010003','168.58','1'),
	('RSMGC000004','礼品卡0004','RSM000002','CP000010004','159.30','1');

insert into retail_store_member_gift_card_consume_record_data values
	('RSMGCCR000001','2017-07-11','RSMGC000001','CO000001','GF00001','16.56','1'),
	('RSMGCCR000002','2019-03-25','RSMGC000001','CO000001','GF000010002','19.00','1'),
	('RSMGCCR000003','2019-07-11','RSMGC000001','CO000002','GF000010003','15.97','1'),
	('RSMGCCR000004','2018-09-29','RSMGC000001','CO000002','GF000010004','16.71','1'),
	('RSMGCCR000005','2017-01-21','RSMGC000001','CO000003','GF000010005','15.99','1'),
	('RSMGCCR000006','2016-12-10','RSMGC000001','CO000003','GF000010006','19.55','1'),
	('RSMGCCR000007','2017-05-01','RSMGC000001','CO000004','GF000010007','18.70','1'),
	('RSMGCCR000008','2018-10-26','RSMGC000001','CO000004','GF000010008','15.25','1'),
	('RSMGCCR000009','2018-03-30','RSMGC000002','CO000005','GF000010009','18.96','1'),
	('RSMGCCR000010','2017-07-21','RSMGC000002','CO000005','GF000010010','18.71','1'),
	('RSMGCCR000011','2018-02-12','RSMGC000002','CO000006','GF000010011','18.34','1'),
	('RSMGCCR000012','2019-07-03','RSMGC000002','CO000006','GF000010012','17.71','1'),
	('RSMGCCR000013','2019-01-22','RSMGC000002','CO000007','GF000010013','20.50','1'),
	('RSMGCCR000014','2017-12-05','RSMGC000002','CO000007','GF000010014','17.82','1'),
	('RSMGCCR000015','2019-09-26','RSMGC000002','CO000008','GF000010015','19.39','1'),
	('RSMGCCR000016','2017-05-02','RSMGC000002','CO000008','GF000010016','18.86','1'),
	('RSMGCCR000017','2018-08-14','RSMGC000003','CO000009','GF000010017','17.57','1'),
	('RSMGCCR000018','2018-02-15','RSMGC000003','CO000009','GF000010018','19.52','1'),
	('RSMGCCR000019','2017-11-19','RSMGC000003','CO000010','GF000010019','14.76','1'),
	('RSMGCCR000020','2017-06-08','RSMGC000003','CO000010','GF000010020','20.24','1'),
	('RSMGCCR000021','2018-02-05','RSMGC000003','CO000011','GF000010021','20.20','1'),
	('RSMGCCR000022','2017-06-28','RSMGC000003','CO000011','GF000010022','18.91','1'),
	('RSMGCCR000023','2018-07-29','RSMGC000003','CO000012','GF000010023','19.86','1'),
	('RSMGCCR000024','2018-09-21','RSMGC000003','CO000012','GF000010024','18.64','1'),
	('RSMGCCR000025','2019-01-21','RSMGC000004','CO000013','GF000010025','18.08','1'),
	('RSMGCCR000026','2017-01-02','RSMGC000004','CO000013','GF000010026','15.05','1'),
	('RSMGCCR000027','2017-09-17','RSMGC000004','CO000014','GF000010027','18.00','1'),
	('RSMGCCR000028','2017-12-24','RSMGC000004','CO000014','GF000010028','17.70','1'),
	('RSMGCCR000029','2018-11-04','RSMGC000004','CO000015','GF000010029','18.61','1'),
	('RSMGCCR000030','2017-04-06','RSMGC000004','CO000015','GF000010030','20.12','1'),
	('RSMGCCR000031','2016-12-10','RSMGC000004','CO000016','GF000010031','20.53','1'),
	('RSMGCCR000032','2019-07-19','RSMGC000004','CO000016','GF000010032','20.48','1');

insert into goods_supplier_data values
	('GS000001','宝洁','洗护用品','RSCC000001','18677889999','啤酒饮料矿泉水，香肠瓜子方便面都提供','2019-10-07 22:30:16','1'),
	('GS000002','中粮','食品','RSCC000001','13900000002','啤酒饮料矿泉水，香肠瓜子方便面都提供0002','2019-10-01 16:56:35','1');
=======
	('RSMGC000001','礼品卡','RSM000001','CP00001','178.49','1'),
	('RSMGC000002','礼品卡0002','RSM000001','CP000010002','192.56','1'),
	('RSMGC000003','礼品卡0003','RSM000002','CP000010003','171.55','1'),
	('RSMGC000004','礼品卡0004','RSM000002','CP000010004','187.47','1');

insert into retail_store_member_gift_card_consume_record_data values
	('RSMGCCR000001','2017-09-05','RSMGC000001','CO000001','GF00001','19.70','1'),
	('RSMGCCR000002','2017-08-01','RSMGC000001','CO000001','GF000010002','20.14','1'),
	('RSMGCCR000003','2018-07-29','RSMGC000001','CO000002','GF000010003','18.95','1'),
	('RSMGCCR000004','2018-05-24','RSMGC000001','CO000002','GF000010004','15.79','1'),
	('RSMGCCR000005','2019-09-14','RSMGC000001','CO000003','GF000010005','15.21','1'),
	('RSMGCCR000006','2018-11-06','RSMGC000001','CO000003','GF000010006','15.45','1'),
	('RSMGCCR000007','2018-11-23','RSMGC000001','CO000004','GF000010007','19.65','1'),
	('RSMGCCR000008','2018-10-07','RSMGC000001','CO000004','GF000010008','20.91','1'),
	('RSMGCCR000009','2018-04-09','RSMGC000002','CO000005','GF000010009','20.48','1'),
	('RSMGCCR000010','2017-04-08','RSMGC000002','CO000005','GF000010010','15.91','1'),
	('RSMGCCR000011','2019-08-20','RSMGC000002','CO000006','GF000010011','16.39','1'),
	('RSMGCCR000012','2019-09-10','RSMGC000002','CO000006','GF000010012','14.79','1'),
	('RSMGCCR000013','2018-01-07','RSMGC000002','CO000007','GF000010013','18.60','1'),
	('RSMGCCR000014','2018-10-16','RSMGC000002','CO000007','GF000010014','18.93','1'),
	('RSMGCCR000015','2018-10-24','RSMGC000002','CO000008','GF000010015','15.06','1'),
	('RSMGCCR000016','2018-08-18','RSMGC000002','CO000008','GF000010016','17.33','1'),
	('RSMGCCR000017','2019-03-27','RSMGC000003','CO000009','GF000010017','15.94','1'),
	('RSMGCCR000018','2019-08-24','RSMGC000003','CO000009','GF000010018','16.61','1'),
	('RSMGCCR000019','2019-02-17','RSMGC000003','CO000010','GF000010019','15.44','1'),
	('RSMGCCR000020','2019-01-20','RSMGC000003','CO000010','GF000010020','19.72','1'),
	('RSMGCCR000021','2019-03-31','RSMGC000003','CO000011','GF000010021','19.10','1'),
	('RSMGCCR000022','2019-06-11','RSMGC000003','CO000011','GF000010022','17.53','1'),
	('RSMGCCR000023','2019-01-08','RSMGC000003','CO000012','GF000010023','20.14','1'),
	('RSMGCCR000024','2019-12-01','RSMGC000003','CO000012','GF000010024','15.79','1'),
	('RSMGCCR000025','2019-09-20','RSMGC000004','CO000013','GF000010025','15.01','1'),
	('RSMGCCR000026','2018-06-22','RSMGC000004','CO000013','GF000010026','19.05','1'),
	('RSMGCCR000027','2019-05-30','RSMGC000004','CO000014','GF000010027','20.96','1'),
	('RSMGCCR000028','2019-05-26','RSMGC000004','CO000014','GF000010028','14.83','1'),
	('RSMGCCR000029','2017-09-02','RSMGC000004','CO000015','GF000010029','18.89','1'),
	('RSMGCCR000030','2017-08-25','RSMGC000004','CO000015','GF000010030','19.65','1'),
	('RSMGCCR000031','2018-05-08','RSMGC000004','CO000016','GF000010031','20.23','1'),
	('RSMGCCR000032','2018-10-28','RSMGC000004','CO000016','GF000010032','17.14','1');

insert into goods_supplier_data values
	('GS000001','宝洁','洗护用品','RSCC000001','18677889999','啤酒饮料矿泉水，香肠瓜子方便面都提供','2019-11-27 05:03:51','1'),
	('GS000002','中粮','食品','RSCC000001','13900000002','啤酒饮料矿泉水，香肠瓜子方便面都提供0002','2019-11-18 03:33:26','1');
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

insert into supplier_product_data values
	('SP000001','黑人牙膏','最好的黑人牙膏，只卖3块喽','件','GS000001','1'),
	('SP000002','黑人牙膏0002','最好的黑人牙膏，只卖3块喽0002','公斤','GS000001','1'),
	('SP000003','黑人牙膏0003','最好的黑人牙膏，只卖3块喽0003','米','GS000002','1'),
	('SP000004','黑人牙膏0004','最好的黑人牙膏，只卖3块喽0004','件','GS000002','1');

insert into product_supply_duration_data values
<<<<<<< HEAD
	('PSD000001','100','现货','9531.38','SP000001','1'),
	('PSD000002','200','两天','7801.61','SP000001','1'),
	('PSD000003','500','三天','7198.75','SP000002','1'),
	('PSD000004','100','一周','7363.08','SP000002','1'),
	('PSD000005','200','现货','9592.75','SP000003','1'),
	('PSD000006','500','两天','7275.78','SP000003','1'),
	('PSD000007','100','三天','8881.86','SP000004','1'),
	('PSD000008','200','一周','9257.61','SP000004','1');

insert into supply_order_data values
	('SO000001','RSCC000001','GS000001','双链给供货商下的订单','2948858624.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-06 11:12:09','CONFIRMED','1'),
	('SO000002','RSCC000001','GS000001','双链给供货商下的订单0002','2841506048.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-07 16:57:50','APPROVED','1'),
	('SO000003','RSCC000001','GS000002','双链给供货商下的订单0003','2781174528.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-11 15:26:24','PROCESSED','1'),
	('SO000004','RSCC000001','GS000002','双链给供货商下的订单0004','2125496576.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-07 07:46:49','PICKED','1');

insert into supply_order_confirmation_data values
	('SOC000001','确认者','2018-03-21','1');

insert into supply_order_approval_data values
	('SOA000001','批准者','2017-09-05','1');

insert into supply_order_processing_data values
	('SOP000001','处理者','2017-10-25','1');

insert into supply_order_picking_data values
	('SOP000001','处理者','2017-01-06','1');

insert into supply_order_shipment_data values
	('SOS000001','运货者','2018-10-10','1');

insert into supply_order_delivery_data values
	('SOD000001','送货者','2018-10-12','1');

insert into supply_order_line_item_data values
	('SOLI000001','SO000001','SKU','大瓶可乐','5.81','9388','件','1'),
	('SOLI000002','SO000001','SKU0002','大瓶可乐0002','4.33','9309','公斤','1'),
	('SOLI000003','SO000002','SKU0003','大瓶可乐0003','5.43','7226','米','1'),
	('SOLI000004','SO000002','SKU0004','大瓶可乐0004','4.60','7498','件','1'),
	('SOLI000005','SO000003','SKU0005','大瓶可乐0005','5.58','9557','公斤','1'),
	('SOLI000006','SO000003','SKU0006','大瓶可乐0006','4.76','8159','米','1'),
	('SOLI000007','SO000004','SKU0007','大瓶可乐0007','5.62','7554','件','1'),
	('SOLI000008','SO000004','SKU0008','大瓶可乐0008','5.55','9410','公斤','1');

insert into supply_order_shipping_group_data values
	('SOSG000001','送货到双链成都2号仓','SO000001','5.23','1'),
	('SOSG000002','送货到双链成都2号仓0002','SO000001','5.72','1'),
	('SOSG000003','送货到双链成都2号仓0003','SO000002','5.23','1'),
	('SOSG000004','送货到双链成都2号仓0004','SO000002','4.28','1'),
	('SOSG000005','送货到双链成都2号仓0005','SO000003','4.28','1'),
	('SOSG000006','送货到双链成都2号仓0006','SO000003','5.68','1'),
	('SOSG000007','送货到双链成都2号仓0007','SO000004','5.77','1'),
	('SOSG000008','送货到双链成都2号仓0008','SO000004','4.73','1');
=======
	('PSD000001','100','现货','7636.95','SP000001','1'),
	('PSD000002','200','两天','9746.95','SP000001','1'),
	('PSD000003','500','三天','9464.87','SP000002','1'),
	('PSD000004','100','一周','8020.30','SP000002','1'),
	('PSD000005','200','现货','7585.02','SP000003','1'),
	('PSD000006','500','两天','9760.42','SP000003','1'),
	('PSD000007','100','三天','8080.45','SP000004','1'),
	('PSD000008','200','一周','8529.88','SP000004','1');

insert into supply_order_data values
	('SO000001','RSCC000001','GS000001','双链给供货商下的订单','2434626560.00','SOC000001','SOA000001','SOP000001','SOP000001','SOS000001','SOD000001','2019-11-17 00:06:42','1'),
	('SO000002','RSCC000001','GS000001','双链给供货商下的订单0002','2126111488.00','SOC000001','SOA000001','SOP000001','SOP000001','SOS000001','SOD000001','2019-11-25 09:53:00','1'),
	('SO000003','RSCC000001','GS000002','双链给供货商下的订单0003','2149031680.00','SOC000001','SOA000001','SOP000001','SOP000001','SOS000001','SOD000001','2019-11-28 09:36:16','1'),
	('SO000004','RSCC000001','GS000002','双链给供货商下的订单0004','2425807360.00','SOC000001','SOA000001','SOP000001','SOP000001','SOS000001','SOD000001','2019-11-28 15:33:02','1');

insert into supply_order_confirmation_data values
	('SOC000001','确认者','2016-12-10','1');

insert into supply_order_approval_data values
	('SOA000001','批准者','2017-11-29','1');

insert into supply_order_processing_data values
	('SOP000001','处理者','2017-10-31','1');

insert into supply_order_picking_data values
	('SOP000001','处理者','2017-02-02','1');

insert into supply_order_shipment_data values
	('SOS000001','运货者','2018-08-01','1');

insert into supply_order_delivery_data values
	('SOD000001','送货者','2017-08-24','1');

insert into supply_order_line_item_data values
	('SOLI000001','SO000001','SKU','大瓶可乐','4.76','8896','件','1'),
	('SOLI000002','SO000001','SKU0002','大瓶可乐0002','5.91','9206','公斤','1'),
	('SOLI000003','SO000002','SKU0003','大瓶可乐0003','5.40','8837','米','1'),
	('SOLI000004','SO000002','SKU0004','大瓶可乐0004','5.27','8994','件','1'),
	('SOLI000005','SO000003','SKU0005','大瓶可乐0005','5.54','9368','公斤','1'),
	('SOLI000006','SO000003','SKU0006','大瓶可乐0006','5.52','8732','米','1'),
	('SOLI000007','SO000004','SKU0007','大瓶可乐0007','5.14','9413','件','1'),
	('SOLI000008','SO000004','SKU0008','大瓶可乐0008','5.75','9204','公斤','1');

insert into supply_order_shipping_group_data values
	('SOSG000001','送货到双链成都2号仓','SO000001','5.73','1'),
	('SOSG000002','送货到双链成都2号仓0002','SO000001','5.36','1'),
	('SOSG000003','送货到双链成都2号仓0003','SO000002','5.59','1'),
	('SOSG000004','送货到双链成都2号仓0004','SO000002','5.47','1'),
	('SOSG000005','送货到双链成都2号仓0005','SO000003','4.83','1'),
	('SOSG000006','送货到双链成都2号仓0006','SO000003','4.98','1'),
	('SOSG000007','送货到双链成都2号仓0007','SO000004','4.38','1'),
	('SOSG000008','送货到双链成都2号仓0008','SO000004','5.50','1');
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

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
<<<<<<< HEAD
	('RSO000001','RS000001','RSCC000001','双链小超给双链供应链下的订单','2525344256.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-27 06:34:36','CONFIRMED','1'),
	('RSO000002','RS000001','RSCC000001','双链小超给双链供应链下的订单0002','2472694784.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-14 08:26:44','APPROVED','1'),
	('RSO000003','RS000002','RSCC000001','双链小超给双链供应链下的订单0003','2890748672.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-03 15:22:32','PROCESSED','1'),
	('RSO000004','RS000002','RSCC000001','双链小超给双链供应链下的订单0004','2127671424.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-16 07:29:42','PICKED','1'),
	('RSO000005','RS000003','RSCC000001','双链小超给双链供应链下的订单0005','2439582720.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-07 15:13:31','SHIPPED','1'),
	('RSO000006','RS000003','RSCC000001','双链小超给双链供应链下的订单0006','2911042816.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-06 05:29:34','DELIVERED','1'),
	('RSO000007','RS000004','RSCC000001','双链小超给双链供应链下的订单0007','2927102720.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-04 01:56:28','CONFIRMED','1'),
	('RSO000008','RS000004','RSCC000001','双链小超给双链供应链下的订单0008','2456092672.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-26 10:58:33','APPROVED','1'),
	('RSO000009','RS000005','RSCC000001','双链小超给双链供应链下的订单0009','2975234560.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-02 14:52:19','PROCESSED','1'),
	('RSO000010','RS000005','RSCC000001','双链小超给双链供应链下的订单0010','2812954368.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-26 01:07:41','PICKED','1'),
	('RSO000011','RS000006','RSCC000001','双链小超给双链供应链下的订单0011','2208759552.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-05 09:44:25','SHIPPED','1'),
	('RSO000012','RS000006','RSCC000001','双链小超给双链供应链下的订单0012','2605993472.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-30 19:44:15','DELIVERED','1'),
	('RSO000013','RS000007','RSCC000001','双链小超给双链供应链下的订单0013','2857831936.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-25 03:34:40','CONFIRMED','1'),
	('RSO000014','RS000007','RSCC000001','双链小超给双链供应链下的订单0014','2741714688.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-14 01:31:36','APPROVED','1'),
	('RSO000015','RS000008','RSCC000001','双链小超给双链供应链下的订单0015','2752022272.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-03 03:31:46','PROCESSED','1'),
	('RSO000016','RS000008','RSCC000001','双链小超给双链供应链下的订单0016','2671238656.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-30 15:17:47','PICKED','1');

insert into retail_store_order_confirmation_data values
	('RSOC000001','确认者','2019-08-01','1');

insert into retail_store_order_approval_data values
	('RSOA000001','批准者','2019-08-05','1');

insert into retail_store_order_processing_data values
	('RSOP000001','处理者','2019-07-12','1');

insert into retail_store_order_picking_data values
	('RSOP000001','处理者','2018-01-14','1');

insert into retail_store_order_shipment_data values
	('RSOS000001','运货者','2019-01-07','1');

insert into retail_store_order_delivery_data values
	('RSOD000001','送货者','2018-07-01','1');

insert into retail_store_order_line_item_data values
	('RSOLI000001','RSO000001','SKU','大瓶可乐','3.22','9604','件','1'),
	('RSOLI000002','RSO000001','SKU0002','大瓶可乐0002','3.23','9339','公斤','1'),
	('RSOLI000003','RSO000002','SKU0003','大瓶可乐0003','3.19','8553','米','1'),
	('RSOLI000004','RSO000002','SKU0004','大瓶可乐0004','3.41','7361','件','1'),
	('RSOLI000005','RSO000003','SKU0005','大瓶可乐0005','3.71','7053','公斤','1'),
	('RSOLI000006','RSO000003','SKU0006','大瓶可乐0006','3.57','8916','米','1'),
	('RSOLI000007','RSO000004','SKU0007','大瓶可乐0007','3.59','7354','件','1'),
	('RSOLI000008','RSO000004','SKU0008','大瓶可乐0008','3.17','7962','公斤','1'),
	('RSOLI000009','RSO000005','SKU0009','大瓶可乐0009','3.15','9665','米','1'),
	('RSOLI000010','RSO000005','SKU0010','大瓶可乐0010','3.34','7698','件','1'),
	('RSOLI000011','RSO000006','SKU0011','大瓶可乐0011','3.27','8471','公斤','1'),
	('RSOLI000012','RSO000006','SKU0012','大瓶可乐0012','3.16','7583','米','1'),
	('RSOLI000013','RSO000007','SKU0013','大瓶可乐0013','3.41','9739','件','1'),
	('RSOLI000014','RSO000007','SKU0014','大瓶可乐0014','3.77','8726','公斤','1'),
	('RSOLI000015','RSO000008','SKU0015','大瓶可乐0015','3.54','9226','米','1'),
	('RSOLI000016','RSO000008','SKU0016','大瓶可乐0016','3.11','8154','件','1'),
	('RSOLI000017','RSO000009','SKU0017','大瓶可乐0017','3.96','9532','公斤','1'),
	('RSOLI000018','RSO000009','SKU0018','大瓶可乐0018','3.34','9193','米','1'),
	('RSOLI000019','RSO000010','SKU0019','大瓶可乐0019','3.87','8864','件','1'),
	('RSOLI000020','RSO000010','SKU0020','大瓶可乐0020','3.70','7367','公斤','1'),
	('RSOLI000021','RSO000011','SKU0021','大瓶可乐0021','3.53','7668','米','1'),
	('RSOLI000022','RSO000011','SKU0022','大瓶可乐0022','3.12','9746','件','1'),
	('RSOLI000023','RSO000012','SKU0023','大瓶可乐0023','3.90','9463','公斤','1'),
	('RSOLI000024','RSO000012','SKU0024','大瓶可乐0024','3.72','8657','米','1'),
	('RSOLI000025','RSO000013','SKU0025','大瓶可乐0025','3.84','9202','件','1'),
	('RSOLI000026','RSO000013','SKU0026','大瓶可乐0026','3.48','7006','公斤','1'),
	('RSOLI000027','RSO000014','SKU0027','大瓶可乐0027','3.40','9457','米','1'),
	('RSOLI000028','RSO000014','SKU0028','大瓶可乐0028','2.82','7269','件','1'),
	('RSOLI000029','RSO000015','SKU0029','大瓶可乐0029','3.30','7567','公斤','1'),
	('RSOLI000030','RSO000015','SKU0030','大瓶可乐0030','3.57','7347','米','1'),
	('RSOLI000031','RSO000016','SKU0031','大瓶可乐0031','3.40','9632','件','1'),
	('RSOLI000032','RSO000016','SKU0032','大瓶可乐0032','3.80','8087','公斤','1');

insert into retail_store_order_shipping_group_data values
	('RSOSG000001','送货到双链中和社区店','RSO000001','4.47','1'),
	('RSOSG000002','送货到双链中和社区店0002','RSO000001','5.33','1'),
	('RSOSG000003','送货到双链中和社区店0003','RSO000002','4.94','1'),
	('RSOSG000004','送货到双链中和社区店0004','RSO000002','5.55','1'),
	('RSOSG000005','送货到双链中和社区店0005','RSO000003','4.62','1'),
	('RSOSG000006','送货到双链中和社区店0006','RSO000003','5.22','1'),
	('RSOSG000007','送货到双链中和社区店0007','RSO000004','5.97','1'),
	('RSOSG000008','送货到双链中和社区店0008','RSO000004','4.28','1'),
	('RSOSG000009','送货到双链中和社区店0009','RSO000005','5.66','1'),
	('RSOSG000010','送货到双链中和社区店0010','RSO000005','5.69','1'),
	('RSOSG000011','送货到双链中和社区店0011','RSO000006','4.65','1'),
	('RSOSG000012','送货到双链中和社区店0012','RSO000006','5.28','1'),
	('RSOSG000013','送货到双链中和社区店0013','RSO000007','5.32','1'),
	('RSOSG000014','送货到双链中和社区店0014','RSO000007','5.95','1'),
	('RSOSG000015','送货到双链中和社区店0015','RSO000008','5.32','1'),
	('RSOSG000016','送货到双链中和社区店0016','RSO000008','5.41','1'),
	('RSOSG000017','送货到双链中和社区店0017','RSO000009','5.21','1'),
	('RSOSG000018','送货到双链中和社区店0018','RSO000009','4.40','1'),
	('RSOSG000019','送货到双链中和社区店0019','RSO000010','5.30','1'),
	('RSOSG000020','送货到双链中和社区店0020','RSO000010','4.22','1'),
	('RSOSG000021','送货到双链中和社区店0021','RSO000011','4.69','1'),
	('RSOSG000022','送货到双链中和社区店0022','RSO000011','4.83','1'),
	('RSOSG000023','送货到双链中和社区店0023','RSO000012','5.08','1'),
	('RSOSG000024','送货到双链中和社区店0024','RSO000012','4.51','1'),
	('RSOSG000025','送货到双链中和社区店0025','RSO000013','4.35','1'),
	('RSOSG000026','送货到双链中和社区店0026','RSO000013','4.78','1'),
	('RSOSG000027','送货到双链中和社区店0027','RSO000014','5.12','1'),
	('RSOSG000028','送货到双链中和社区店0028','RSO000014','5.61','1'),
	('RSOSG000029','送货到双链中和社区店0029','RSO000015','5.98','1'),
	('RSOSG000030','送货到双链中和社区店0030','RSO000015','4.23','1'),
	('RSOSG000031','送货到双链中和社区店0031','RSO000016','5.88','1'),
	('RSOSG000032','送货到双链中和社区店0032','RSO000016','5.53','1');
=======
	('RSO000001','RS000001','RSCC000001','双链小超给双链供应链下的订单','2752371968.00','RSOC000001','RSOA000001','RSOP000001','RSOP000001','RSOS000001','RSOD000001','2019-11-29 08:10:18','1'),
	('RSO000002','RS000001','RSCC000001','双链小超给双链供应链下的订单0002','2834736640.00','RSOC000001','RSOA000001','RSOP000001','RSOP000001','RSOS000001','RSOD000001','2019-12-02 11:45:48','1'),
	('RSO000003','RS000002','RSCC000001','双链小超给双链供应链下的订单0003','2656241408.00','RSOC000001','RSOA000001','RSOP000001','RSOP000001','RSOS000001','RSOD000001','2019-11-23 06:53:50','1'),
	('RSO000004','RS000002','RSCC000001','双链小超给双链供应链下的订单0004','2959026944.00','RSOC000001','RSOA000001','RSOP000001','RSOP000001','RSOS000001','RSOD000001','2019-11-15 22:55:19','1'),
	('RSO000005','RS000003','RSCC000001','双链小超给双链供应链下的订单0005','2438912512.00','RSOC000001','RSOA000001','RSOP000001','RSOP000001','RSOS000001','RSOD000001','2019-11-20 14:12:43','1'),
	('RSO000006','RS000003','RSCC000001','双链小超给双链供应链下的订单0006','2256526592.00','RSOC000001','RSOA000001','RSOP000001','RSOP000001','RSOS000001','RSOD000001','2019-11-17 15:29:03','1'),
	('RSO000007','RS000004','RSCC000001','双链小超给双链供应链下的订单0007','2359245056.00','RSOC000001','RSOA000001','RSOP000001','RSOP000001','RSOS000001','RSOD000001','2019-11-24 04:58:37','1'),
	('RSO000008','RS000004','RSCC000001','双链小超给双链供应链下的订单0008','2915517184.00','RSOC000001','RSOA000001','RSOP000001','RSOP000001','RSOS000001','RSOD000001','2019-12-04 08:03:08','1'),
	('RSO000009','RS000005','RSCC000001','双链小超给双链供应链下的订单0009','2507672576.00','RSOC000001','RSOA000001','RSOP000001','RSOP000001','RSOS000001','RSOD000001','2019-11-16 05:51:33','1'),
	('RSO000010','RS000005','RSCC000001','双链小超给双链供应链下的订单0010','2405690368.00','RSOC000001','RSOA000001','RSOP000001','RSOP000001','RSOS000001','RSOD000001','2019-11-22 22:18:26','1'),
	('RSO000011','RS000006','RSCC000001','双链小超给双链供应链下的订单0011','2251817984.00','RSOC000001','RSOA000001','RSOP000001','RSOP000001','RSOS000001','RSOD000001','2019-11-29 18:50:15','1'),
	('RSO000012','RS000006','RSCC000001','双链小超给双链供应链下的订单0012','2434364416.00','RSOC000001','RSOA000001','RSOP000001','RSOP000001','RSOS000001','RSOD000001','2019-11-17 08:19:28','1'),
	('RSO000013','RS000007','RSCC000001','双链小超给双链供应链下的订单0013','2714514688.00','RSOC000001','RSOA000001','RSOP000001','RSOP000001','RSOS000001','RSOD000001','2019-11-17 08:03:33','1'),
	('RSO000014','RS000007','RSCC000001','双链小超给双链供应链下的订单0014','2449494784.00','RSOC000001','RSOA000001','RSOP000001','RSOP000001','RSOS000001','RSOD000001','2019-11-18 21:56:23','1'),
	('RSO000015','RS000008','RSCC000001','双链小超给双链供应链下的订单0015','2421777152.00','RSOC000001','RSOA000001','RSOP000001','RSOP000001','RSOS000001','RSOD000001','2019-11-15 17:42:03','1'),
	('RSO000016','RS000008','RSCC000001','双链小超给双链供应链下的订单0016','2241038592.00','RSOC000001','RSOA000001','RSOP000001','RSOP000001','RSOS000001','RSOD000001','2019-12-04 20:18:22','1');

insert into retail_store_order_confirmation_data values
	('RSOC000001','确认者','2017-11-08','1');

insert into retail_store_order_approval_data values
	('RSOA000001','批准者','2019-07-08','1');

insert into retail_store_order_processing_data values
	('RSOP000001','处理者','2019-03-15','1');

insert into retail_store_order_picking_data values
	('RSOP000001','处理者','2018-02-01','1');

insert into retail_store_order_shipment_data values
	('RSOS000001','运货者','2019-02-08','1');

insert into retail_store_order_delivery_data values
	('RSOD000001','送货者','2018-04-27','1');

insert into retail_store_order_line_item_data values
	('RSOLI000001','RSO000001','SKU','大瓶可乐','3.06','7584','件','1'),
	('RSOLI000002','RSO000001','SKU0002','大瓶可乐0002','3.47','9721','公斤','1'),
	('RSOLI000003','RSO000002','SKU0003','大瓶可乐0003','3.53','8905','米','1'),
	('RSOLI000004','RSO000002','SKU0004','大瓶可乐0004','3.45','8379','件','1'),
	('RSOLI000005','RSO000003','SKU0005','大瓶可乐0005','3.42','7947','公斤','1'),
	('RSOLI000006','RSO000003','SKU0006','大瓶可乐0006','3.24','7180','米','1'),
	('RSOLI000007','RSO000004','SKU0007','大瓶可乐0007','3.18','7412','件','1'),
	('RSOLI000008','RSO000004','SKU0008','大瓶可乐0008','3.83','7064','公斤','1'),
	('RSOLI000009','RSO000005','SKU0009','大瓶可乐0009','3.06','9827','米','1'),
	('RSOLI000010','RSO000005','SKU0010','大瓶可乐0010','3.27','8053','件','1'),
	('RSOLI000011','RSO000006','SKU0011','大瓶可乐0011','2.85','7769','公斤','1'),
	('RSOLI000012','RSO000006','SKU0012','大瓶可乐0012','3.23','7565','米','1'),
	('RSOLI000013','RSO000007','SKU0013','大瓶可乐0013','3.67','9040','件','1'),
	('RSOLI000014','RSO000007','SKU0014','大瓶可乐0014','3.97','9898','公斤','1'),
	('RSOLI000015','RSO000008','SKU0015','大瓶可乐0015','2.82','7494','米','1'),
	('RSOLI000016','RSO000008','SKU0016','大瓶可乐0016','3.19','8816','件','1'),
	('RSOLI000017','RSO000009','SKU0017','大瓶可乐0017','3.20','9388','公斤','1'),
	('RSOLI000018','RSO000009','SKU0018','大瓶可乐0018','2.90','9383','米','1'),
	('RSOLI000019','RSO000010','SKU0019','大瓶可乐0019','2.96','8659','件','1'),
	('RSOLI000020','RSO000010','SKU0020','大瓶可乐0020','3.24','7318','公斤','1'),
	('RSOLI000021','RSO000011','SKU0021','大瓶可乐0021','3.09','9502','米','1'),
	('RSOLI000022','RSO000011','SKU0022','大瓶可乐0022','2.83','8193','件','1'),
	('RSOLI000023','RSO000012','SKU0023','大瓶可乐0023','3.07','7984','公斤','1'),
	('RSOLI000024','RSO000012','SKU0024','大瓶可乐0024','2.83','8722','米','1'),
	('RSOLI000025','RSO000013','SKU0025','大瓶可乐0025','3.36','7200','件','1'),
	('RSOLI000026','RSO000013','SKU0026','大瓶可乐0026','2.79','8257','公斤','1'),
	('RSOLI000027','RSO000014','SKU0027','大瓶可乐0027','3.84','7640','米','1'),
	('RSOLI000028','RSO000014','SKU0028','大瓶可乐0028','3.66','9331','件','1'),
	('RSOLI000029','RSO000015','SKU0029','大瓶可乐0029','3.73','8055','公斤','1'),
	('RSOLI000030','RSO000015','SKU0030','大瓶可乐0030','3.11','9796','米','1'),
	('RSOLI000031','RSO000016','SKU0031','大瓶可乐0031','3.68','9051','件','1'),
	('RSOLI000032','RSO000016','SKU0032','大瓶可乐0032','3.40','8620','公斤','1');

insert into retail_store_order_shipping_group_data values
	('RSOSG000001','送货到双链中和社区店','RSO000001','5.42','1'),
	('RSOSG000002','送货到双链中和社区店0002','RSO000001','5.44','1'),
	('RSOSG000003','送货到双链中和社区店0003','RSO000002','4.77','1'),
	('RSOSG000004','送货到双链中和社区店0004','RSO000002','5.94','1'),
	('RSOSG000005','送货到双链中和社区店0005','RSO000003','4.88','1'),
	('RSOSG000006','送货到双链中和社区店0006','RSO000003','4.95','1'),
	('RSOSG000007','送货到双链中和社区店0007','RSO000004','5.81','1'),
	('RSOSG000008','送货到双链中和社区店0008','RSO000004','4.88','1'),
	('RSOSG000009','送货到双链中和社区店0009','RSO000005','4.31','1'),
	('RSOSG000010','送货到双链中和社区店0010','RSO000005','5.22','1'),
	('RSOSG000011','送货到双链中和社区店0011','RSO000006','4.35','1'),
	('RSOSG000012','送货到双链中和社区店0012','RSO000006','4.64','1'),
	('RSOSG000013','送货到双链中和社区店0013','RSO000007','5.86','1'),
	('RSOSG000014','送货到双链中和社区店0014','RSO000007','4.58','1'),
	('RSOSG000015','送货到双链中和社区店0015','RSO000008','5.56','1'),
	('RSOSG000016','送货到双链中和社区店0016','RSO000008','5.09','1'),
	('RSOSG000017','送货到双链中和社区店0017','RSO000009','4.64','1'),
	('RSOSG000018','送货到双链中和社区店0018','RSO000009','5.71','1'),
	('RSOSG000019','送货到双链中和社区店0019','RSO000010','4.77','1'),
	('RSOSG000020','送货到双链中和社区店0020','RSO000010','5.60','1'),
	('RSOSG000021','送货到双链中和社区店0021','RSO000011','4.77','1'),
	('RSOSG000022','送货到双链中和社区店0022','RSO000011','4.22','1'),
	('RSOSG000023','送货到双链中和社区店0023','RSO000012','4.62','1'),
	('RSOSG000024','送货到双链中和社区店0024','RSO000012','5.40','1'),
	('RSOSG000025','送货到双链中和社区店0025','RSO000013','4.60','1'),
	('RSOSG000026','送货到双链中和社区店0026','RSO000013','5.62','1'),
	('RSOSG000027','送货到双链中和社区店0027','RSO000014','5.17','1'),
	('RSOSG000028','送货到双链中和社区店0028','RSO000014','5.94','1'),
	('RSOSG000029','送货到双链中和社区店0029','RSO000015','5.66','1'),
	('RSOSG000030','送货到双链中和社区店0030','RSO000015','5.18','1'),
	('RSOSG000031','送货到双链中和社区店0031','RSO000016','5.86','1'),
	('RSOSG000032','送货到双链中和社区店0032','RSO000016','5.17','1');
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

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
<<<<<<< HEAD
	('W000001','成都龙泉驿飞鹤路20号','02887654321','187672平方米','RSCC000001','42.133208816319716','131.0126492364692','2019-10-11 12:59:50','1'),
	('W000002','成都龙泉驿飞鹤路20号0002','028876543210002','187672平方米0002','RSCC000001','40.63422608411162','130.92067764720582','2019-10-01 23:30:25','1');

insert into storage_space_data values
	('SS000001','成都龙泉驿飞鹤路20号存货区','02887654321','1876平方米','W000001','42.28220558699819','131.1147510299518','2019-10-10 22:55:07','1'),
	('SS000002','成都龙泉驿飞鹤路20号存货区0002','028876543210002','1876平方米0002','W000001','40.18649738827829','132.23199696025458','2019-10-15 14:21:09','1'),
	('SS000003','成都龙泉驿飞鹤路20号存货区0003','028876543210003','1876平方米0003','W000002','41.906540262516636','130.96119177048047','2019-10-12 17:20:40','1'),
	('SS000004','成都龙泉驿飞鹤路20号存货区0004','028876543210004','1876平方米0004','W000002','42.53827112531903','131.2535602799453','2019-09-26 10:56:54','1');

insert into smart_pallet_data values
	('SP000001','成都龙泉驿飞鹤路20号移动区域，比如过道，货运通道等','02887654321','1876平方米','42.29509461365775','129.47738477892764','W000001','2019-10-04 11:34:50','1'),
	('SP000002','成都龙泉驿飞鹤路20号移动区域，比如过道，货运通道等0002','028876543210002','1876平方米0002','41.89670869242531','131.91609790353957','W000001','2019-10-06 04:28:45','1'),
	('SP000003','成都龙泉驿飞鹤路20号移动区域，比如过道，货运通道等0003','028876543210003','1876平方米0003','41.612754832247894','130.5264001424786','W000002','2019-10-11 17:12:20','1'),
	('SP000004','成都龙泉驿飞鹤路20号移动区域，比如过道，货运通道等0004','028876543210004','1876平方米0004','42.1662767410363','131.0173066989595','W000002','2019-09-29 23:23:31','1');

insert into goods_shelf_data values
	('GS000001','成都龙泉驿飞鹤路20号存货区货架','SS000001','SS000001','DS000001','2019-09-28 06:23:15','1'),
	('GS000002','成都龙泉驿飞鹤路20号存货区货架0002','SS000001','SS000001','DS000001','2019-10-01 09:11:14','1'),
	('GS000003','成都龙泉驿飞鹤路20号存货区货架0003','SS000002','SS000002','DS000002','2019-09-28 05:40:45','1'),
	('GS000004','成都龙泉驿飞鹤路20号存货区货架0004','SS000002','SS000002','DS000002','2019-10-07 16:18:34','1'),
	('GS000005','成都龙泉驿飞鹤路20号存货区货架0005','SS000003','SS000003','DS000003','2019-10-15 00:40:02','1'),
	('GS000006','成都龙泉驿飞鹤路20号存货区货架0006','SS000003','SS000003','DS000003','2019-10-07 21:18:33','1'),
	('GS000007','成都龙泉驿飞鹤路20号存货区货架0007','SS000004','SS000004','DS000004','2019-10-07 00:55:38','1'),
	('GS000008','成都龙泉驿飞鹤路20号存货区货架0008','SS000004','SS000004','DS000004','2019-10-15 20:26:26','1');

insert into goods_shelf_stock_count_data values
	('GSSC000001','每日盘点','2019-02-18','使用先进的rfid技术，没有任何错误','GS000001','1'),
	('GSSC000002','每周盘点','2018-08-25','使用先进的rfid技术，没有任何错误0002','GS000001','1'),
	('GSSC000003','每月盘点','2019-06-09','使用先进的rfid技术，没有任何错误0003','GS000002','1'),
	('GSSC000004','年终盘点','2019-09-29','使用先进的rfid技术，没有任何错误0004','GS000002','1'),
	('GSSC000005','每日盘点','2017-07-23','使用先进的rfid技术，没有任何错误0005','GS000003','1'),
	('GSSC000006','每周盘点','2017-04-03','使用先进的rfid技术，没有任何错误0006','GS000003','1'),
	('GSSC000007','每月盘点','2019-07-11','使用先进的rfid技术，没有任何错误0007','GS000004','1'),
	('GSSC000008','年终盘点','2017-09-22','使用先进的rfid技术，没有任何错误0008','GS000004','1'),
	('GSSC000009','每日盘点','2018-11-18','使用先进的rfid技术，没有任何错误0009','GS000005','1'),
	('GSSC000010','每周盘点','2019-01-28','使用先进的rfid技术，没有任何错误0010','GS000005','1'),
	('GSSC000011','每月盘点','2019-08-27','使用先进的rfid技术，没有任何错误0011','GS000006','1'),
	('GSSC000012','年终盘点','2018-02-19','使用先进的rfid技术，没有任何错误0012','GS000006','1'),
	('GSSC000013','每日盘点','2017-07-10','使用先进的rfid技术，没有任何错误0013','GS000007','1'),
	('GSSC000014','每周盘点','2017-07-15','使用先进的rfid技术，没有任何错误0014','GS000007','1'),
	('GSSC000015','每月盘点','2016-10-25','使用先进的rfid技术，没有任何错误0015','GS000008','1'),
	('GSSC000016','年终盘点','2017-02-02','使用先进的rfid技术，没有任何错误0016','GS000008','1');

insert into stock_count_issue_track_data values
	('SCIT000001','盘点差错','2018-10-25','发现错误已经修正完成','GSSC000001','1'),
	('SCIT000002','盘点差错0002','2017-03-10','发现错误已经修正完成0002','GSSC000001','1'),
	('SCIT000003','盘点差错0003','2018-07-14','发现错误已经修正完成0003','GSSC000002','1'),
	('SCIT000004','盘点差错0004','2018-02-18','发现错误已经修正完成0004','GSSC000002','1'),
	('SCIT000005','盘点差错0005','2019-02-09','发现错误已经修正完成0005','GSSC000003','1'),
	('SCIT000006','盘点差错0006','2018-11-14','发现错误已经修正完成0006','GSSC000003','1'),
	('SCIT000007','盘点差错0007','2019-02-16','发现错误已经修正完成0007','GSSC000004','1'),
	('SCIT000008','盘点差错0008','2017-03-10','发现错误已经修正完成0008','GSSC000004','1'),
	('SCIT000009','盘点差错0009','2018-08-11','发现错误已经修正完成0009','GSSC000005','1'),
	('SCIT000010','盘点差错0010','2018-12-17','发现错误已经修正完成0010','GSSC000005','1'),
	('SCIT000011','盘点差错0011','2019-10-14','发现错误已经修正完成0011','GSSC000006','1'),
	('SCIT000012','盘点差错0012','2019-03-18','发现错误已经修正完成0012','GSSC000006','1'),
	('SCIT000013','盘点差错0013','2017-08-05','发现错误已经修正完成0013','GSSC000007','1'),
	('SCIT000014','盘点差错0014','2017-04-10','发现错误已经修正完成0014','GSSC000007','1'),
	('SCIT000015','盘点差错0015','2017-07-01','发现错误已经修正完成0015','GSSC000008','1'),
	('SCIT000016','盘点差错0016','2018-01-11','发现错误已经修正完成0016','GSSC000008','1'),
	('SCIT000017','盘点差错0017','2019-09-10','发现错误已经修正完成0017','GSSC000009','1'),
	('SCIT000018','盘点差错0018','2018-02-17','发现错误已经修正完成0018','GSSC000009','1'),
	('SCIT000019','盘点差错0019','2018-01-17','发现错误已经修正完成0019','GSSC000010','1'),
	('SCIT000020','盘点差错0020','2018-06-24','发现错误已经修正完成0020','GSSC000010','1'),
	('SCIT000021','盘点差错0021','2017-01-27','发现错误已经修正完成0021','GSSC000011','1'),
	('SCIT000022','盘点差错0022','2018-06-10','发现错误已经修正完成0022','GSSC000011','1'),
	('SCIT000023','盘点差错0023','2017-11-04','发现错误已经修正完成0023','GSSC000012','1'),
	('SCIT000024','盘点差错0024','2018-11-15','发现错误已经修正完成0024','GSSC000012','1'),
	('SCIT000025','盘点差错0025','2019-02-12','发现错误已经修正完成0025','GSSC000013','1'),
	('SCIT000026','盘点差错0026','2017-09-30','发现错误已经修正完成0026','GSSC000013','1'),
	('SCIT000027','盘点差错0027','2019-04-22','发现错误已经修正完成0027','GSSC000014','1'),
	('SCIT000028','盘点差错0028','2016-11-01','发现错误已经修正完成0028','GSSC000014','1'),
	('SCIT000029','盘点差错0029','2018-12-01','发现错误已经修正完成0029','GSSC000015','1'),
	('SCIT000030','盘点差错0030','2016-11-10','发现错误已经修正完成0030','GSSC000015','1'),
	('SCIT000031','盘点差错0031','2017-09-22','发现错误已经修正完成0031','GSSC000016','1'),
	('SCIT000032','盘点差错0032','2018-07-05','发现错误已经修正完成0032','GSSC000016','1');

insert into goods_allocation_data values
	('GA000001','成都龙泉驿飞鹤路20号存货区货架20号货位','41.53388303837697','131.29124678757034','GS000001','1'),
	('GA000002','成都龙泉驿飞鹤路20号存货区货架20号货位0002','42.15473804971826','129.87520255724954','GS000001','1'),
	('GA000003','成都龙泉驿飞鹤路20号存货区货架20号货位0003','40.32036897430554','129.30841323360931','GS000002','1'),
	('GA000004','成都龙泉驿飞鹤路20号存货区货架20号货位0004','40.875089337233305','130.70989431953495','GS000002','1'),
	('GA000005','成都龙泉驿飞鹤路20号存货区货架20号货位0005','40.63941449916409','131.82265233293901','GS000003','1'),
	('GA000006','成都龙泉驿飞鹤路20号存货区货架20号货位0006','41.0142804245866','130.21166280091663','GS000003','1'),
	('GA000007','成都龙泉驿飞鹤路20号存货区货架20号货位0007','39.875815790121585','131.5678454915666','GS000004','1'),
	('GA000008','成都龙泉驿飞鹤路20号存货区货架20号货位0008','41.98403392033239','129.88975682401497','GS000004','1'),
	('GA000009','成都龙泉驿飞鹤路20号存货区货架20号货位0009','42.03842949781832','129.44769511187013','GS000005','1'),
	('GA000010','成都龙泉驿飞鹤路20号存货区货架20号货位0010','40.89592273943291','131.68477453621713','GS000005','1'),
	('GA000011','成都龙泉驿飞鹤路20号存货区货架20号货位0011','41.340445173437836','130.0245051460274','GS000006','1'),
	('GA000012','成都龙泉驿飞鹤路20号存货区货架20号货位0012','40.72413701092297','131.80464389635037','GS000006','1'),
	('GA000013','成都龙泉驿飞鹤路20号存货区货架20号货位0013','41.64993037335767','130.28453773921692','GS000007','1'),
	('GA000014','成都龙泉驿飞鹤路20号存货区货架20号货位0014','41.543403180294256','129.84174197372215','GS000007','1'),
	('GA000015','成都龙泉驿飞鹤路20号存货区货架20号货位0015','42.17426559931305','130.71909996553154','GS000008','1'),
	('GA000016','成都龙泉驿飞鹤路20号存货区货架20号货位0016','40.18760613697325','130.06333306854108','GS000008','1');

insert into goods_data values
	('G000001','可口可乐','RF99192','件','8','2019-04-05','S000001','RS000001','GA000001','SP000001','SS000001','TT000001','RS000001','SO000001','RSO000001',NULL,'PACKED','1'),
	('G000002','可口可乐0002','RF991920002','箱','8','2019-03-10','S000001','RS000001','GA000001','SP000001','SS000001','TT000001','RS000001','SO000001','RSO000001',NULL,'PACKED0002','1'),
	('G000003','可口可乐0003','RF991920003','件','9','2018-07-16','S000002','RS000001','GA000001','SP000001','SS000001','TT000001','RS000001','SO000001','RSO000001',NULL,'PACKED0003','1'),
	('G000004','可口可乐0004','RF991920004','箱','8','2018-04-28','S000002','RS000001','GA000001','SP000001','SS000001','TT000001','RS000001','SO000001','RSO000001',NULL,'PACKED0004','1'),
	('G000005','可口可乐0005','RF991920005','件','10','2019-01-17','S000003','RS000001','GA000001','SP000001','SS000001','TT000001','RS000001','SO000001','RSO000001',NULL,'PACKED0005','1'),
	('G000006','可口可乐0006','RF991920006','箱','10','2019-09-20','S000003','RS000001','GA000001','SP000001','SS000001','TT000001','RS000001','SO000001','RSO000001',NULL,'PACKED0006','1'),
	('G000007','可口可乐0007','RF991920007','件','9','2017-04-04','S000004','RS000001','GA000001','SP000001','SS000001','TT000001','RS000001','SO000001','RSO000001',NULL,'PACKED0007','1'),
	('G000008','可口可乐0008','RF991920008','箱','9','2019-01-17','S000004','RS000001','GA000001','SP000001','SS000001','TT000001','RS000001','SO000001','RSO000001',NULL,'PACKED0008','1'),
	('G000009','可口可乐0009','RF991920009','件','10','2019-06-29','S000005','RS000001','GA000002','SP000001','SS000001','TT000002','RS000001','SO000001','RSO000002',NULL,'PACKED0009','1'),
	('G000010','可口可乐0010','RF991920010','箱','9','2018-04-08','S000005','RS000001','GA000002','SP000001','SS000001','TT000002','RS000001','SO000001','RSO000002',NULL,'PACKED0010','1'),
	('G000011','可口可乐0011','RF991920011','件','10','2019-02-09','S000006','RS000001','GA000002','SP000001','SS000001','TT000002','RS000001','SO000001','RSO000002',NULL,'PACKED0011','1'),
	('G000012','可口可乐0012','RF991920012','箱','9','2018-10-01','S000006','RS000001','GA000002','SP000001','SS000001','TT000002','RS000001','SO000001','RSO000002',NULL,'PACKED0012','1'),
	('G000013','可口可乐0013','RF991920013','件','10','2017-12-25','S000007','RS000001','GA000002','SP000001','SS000001','TT000002','RS000001','SO000001','RSO000002',NULL,'PACKED0013','1'),
	('G000014','可口可乐0014','RF991920014','箱','8','2017-04-13','S000007','RS000001','GA000002','SP000001','SS000001','TT000002','RS000001','SO000001','RSO000002',NULL,'PACKED0014','1'),
	('G000015','可口可乐0015','RF991920015','件','9','2018-10-05','S000008','RS000001','GA000002','SP000001','SS000001','TT000002','RS000001','SO000001','RSO000002',NULL,'PACKED0015','1'),
	('G000016','可口可乐0016','RF991920016','箱','8','2017-09-16','S000008','RS000001','GA000002','SP000001','SS000001','TT000002','RS000001','SO000001','RSO000002',NULL,'PACKED0016','1'),
	('G000017','可口可乐0017','RF991920017','件','9','2017-01-30','S000009','RS000001','GA000003','SP000001','SS000001','TT000003','RS000002','SO000001','RSO000003',NULL,'PACKED0017','1'),
	('G000018','可口可乐0018','RF991920018','箱','10','2019-08-08','S000009','RS000001','GA000003','SP000001','SS000001','TT000003','RS000002','SO000001','RSO000003',NULL,'PACKED0018','1'),
	('G000019','可口可乐0019','RF991920019','件','8','2019-05-20','S000010','RS000001','GA000003','SP000001','SS000001','TT000003','RS000002','SO000001','RSO000003',NULL,'PACKED0019','1'),
	('G000020','可口可乐0020','RF991920020','箱','10','2017-01-24','S000010','RS000001','GA000003','SP000001','SS000001','TT000003','RS000002','SO000001','RSO000003',NULL,'PACKED0020','1'),
	('G000021','可口可乐0021','RF991920021','件','8','2019-09-06','S000011','RS000001','GA000003','SP000001','SS000001','TT000003','RS000002','SO000001','RSO000003',NULL,'PACKED0021','1'),
	('G000022','可口可乐0022','RF991920022','箱','8','2019-08-16','S000011','RS000001','GA000003','SP000001','SS000001','TT000003','RS000002','SO000001','RSO000003',NULL,'PACKED0022','1'),
	('G000023','可口可乐0023','RF991920023','件','9','2018-05-28','S000012','RS000001','GA000003','SP000001','SS000001','TT000003','RS000002','SO000001','RSO000003',NULL,'PACKED0023','1'),
	('G000024','可口可乐0024','RF991920024','箱','8','2017-02-18','S000012','RS000001','GA000003','SP000001','SS000001','TT000003','RS000002','SO000001','RSO000003',NULL,'PACKED0024','1'),
	('G000025','可口可乐0025','RF991920025','件','8','2017-04-01','S000013','RS000001','GA000004','SP000001','SS000001','TT000004','RS000002','SO000001','RSO000004',NULL,'PACKED0025','1'),
	('G000026','可口可乐0026','RF991920026','箱','8','2017-08-10','S000013','RS000001','GA000004','SP000001','SS000001','TT000004','RS000002','SO000001','RSO000004',NULL,'PACKED0026','1'),
	('G000027','可口可乐0027','RF991920027','件','8','2016-12-13','S000014','RS000001','GA000004','SP000001','SS000001','TT000004','RS000002','SO000001','RSO000004',NULL,'PACKED0027','1'),
	('G000028','可口可乐0028','RF991920028','箱','9','2016-12-30','S000014','RS000001','GA000004','SP000001','SS000001','TT000004','RS000002','SO000001','RSO000004',NULL,'PACKED0028','1'),
	('G000029','可口可乐0029','RF991920029','件','9','2018-12-22','S000015','RS000001','GA000004','SP000001','SS000001','TT000004','RS000002','SO000001','RSO000004',NULL,'PACKED0029','1'),
	('G000030','可口可乐0030','RF991920030','箱','8','2018-03-15','S000015','RS000001','GA000004','SP000001','SS000001','TT000004','RS000002','SO000001','RSO000004',NULL,'PACKED0030','1'),
	('G000031','可口可乐0031','RF991920031','件','8','2017-02-12','S000016','RS000001','GA000004','SP000001','SS000001','TT000004','RS000002','SO000001','RSO000004',NULL,'PACKED0031','1'),
	('G000032','可口可乐0032','RF991920032','箱','9','2018-11-09','S000016','RS000001','GA000004','SP000001','SS000001','TT000004','RS000002','SO000001','RSO000004',NULL,'PACKED0032','1'),
	('G000033','可口可乐0033','RF991920033','件','9','2017-06-10','S000017','RS000002','GA000005','SP000002','SS000002','TT000005','RS000003','SO000002','RSO000005',NULL,'PACKED0033','1'),
	('G000034','可口可乐0034','RF991920034','箱','10','2016-11-16','S000017','RS000002','GA000005','SP000002','SS000002','TT000005','RS000003','SO000002','RSO000005',NULL,'PACKED0034','1'),
	('G000035','可口可乐0035','RF991920035','件','9','2017-01-28','S000018','RS000002','GA000005','SP000002','SS000002','TT000005','RS000003','SO000002','RSO000005',NULL,'PACKED0035','1'),
	('G000036','可口可乐0036','RF991920036','箱','9','2017-03-16','S000018','RS000002','GA000005','SP000002','SS000002','TT000005','RS000003','SO000002','RSO000005',NULL,'PACKED0036','1'),
	('G000037','可口可乐0037','RF991920037','件','9','2018-01-24','S000019','RS000002','GA000005','SP000002','SS000002','TT000005','RS000003','SO000002','RSO000005',NULL,'PACKED0037','1'),
	('G000038','可口可乐0038','RF991920038','箱','10','2017-10-26','S000019','RS000002','GA000005','SP000002','SS000002','TT000005','RS000003','SO000002','RSO000005',NULL,'PACKED0038','1'),
	('G000039','可口可乐0039','RF991920039','件','9','2017-09-03','S000020','RS000002','GA000005','SP000002','SS000002','TT000005','RS000003','SO000002','RSO000005',NULL,'PACKED0039','1'),
	('G000040','可口可乐0040','RF991920040','箱','10','2019-09-30','S000020','RS000002','GA000005','SP000002','SS000002','TT000005','RS000003','SO000002','RSO000005',NULL,'PACKED0040','1'),
	('G000041','可口可乐0041','RF991920041','件','9','2017-06-26','S000021','RS000002','GA000006','SP000002','SS000002','TT000006','RS000003','SO000002','RSO000006',NULL,'PACKED0041','1'),
	('G000042','可口可乐0042','RF991920042','箱','9','2019-07-19','S000021','RS000002','GA000006','SP000002','SS000002','TT000006','RS000003','SO000002','RSO000006',NULL,'PACKED0042','1'),
	('G000043','可口可乐0043','RF991920043','件','10','2019-01-03','S000022','RS000002','GA000006','SP000002','SS000002','TT000006','RS000003','SO000002','RSO000006',NULL,'PACKED0043','1'),
	('G000044','可口可乐0044','RF991920044','箱','8','2018-09-16','S000022','RS000002','GA000006','SP000002','SS000002','TT000006','RS000003','SO000002','RSO000006',NULL,'PACKED0044','1'),
	('G000045','可口可乐0045','RF991920045','件','8','2017-08-09','S000023','RS000002','GA000006','SP000002','SS000002','TT000006','RS000003','SO000002','RSO000006',NULL,'PACKED0045','1'),
	('G000046','可口可乐0046','RF991920046','箱','8','2019-03-29','S000023','RS000002','GA000006','SP000002','SS000002','TT000006','RS000003','SO000002','RSO000006',NULL,'PACKED0046','1'),
	('G000047','可口可乐0047','RF991920047','件','10','2019-02-18','S000024','RS000002','GA000006','SP000002','SS000002','TT000006','RS000003','SO000002','RSO000006',NULL,'PACKED0047','1'),
	('G000048','可口可乐0048','RF991920048','箱','8','2017-11-23','S000024','RS000002','GA000006','SP000002','SS000002','TT000006','RS000003','SO000002','RSO000006',NULL,'PACKED0048','1'),
	('G000049','可口可乐0049','RF991920049','件','8','2018-12-23','S000025','RS000002','GA000007','SP000002','SS000002','TT000007','RS000004','SO000002','RSO000007',NULL,'PACKED0049','1'),
	('G000050','可口可乐0050','RF991920050','箱','10','2018-07-25','S000025','RS000002','GA000007','SP000002','SS000002','TT000007','RS000004','SO000002','RSO000007',NULL,'PACKED0050','1'),
	('G000051','可口可乐0051','RF991920051','件','9','2018-11-30','S000026','RS000002','GA000007','SP000002','SS000002','TT000007','RS000004','SO000002','RSO000007',NULL,'PACKED0051','1'),
	('G000052','可口可乐0052','RF991920052','箱','10','2017-08-22','S000026','RS000002','GA000007','SP000002','SS000002','TT000007','RS000004','SO000002','RSO000007',NULL,'PACKED0052','1'),
	('G000053','可口可乐0053','RF991920053','件','10','2018-10-06','S000027','RS000002','GA000007','SP000002','SS000002','TT000007','RS000004','SO000002','RSO000007',NULL,'PACKED0053','1'),
	('G000054','可口可乐0054','RF991920054','箱','9','2017-06-26','S000027','RS000002','GA000007','SP000002','SS000002','TT000007','RS000004','SO000002','RSO000007',NULL,'PACKED0054','1'),
	('G000055','可口可乐0055','RF991920055','件','9','2019-08-22','S000028','RS000002','GA000007','SP000002','SS000002','TT000007','RS000004','SO000002','RSO000007',NULL,'PACKED0055','1'),
	('G000056','可口可乐0056','RF991920056','箱','8','2019-07-26','S000028','RS000002','GA000007','SP000002','SS000002','TT000007','RS000004','SO000002','RSO000007',NULL,'PACKED0056','1'),
	('G000057','可口可乐0057','RF991920057','件','9','2018-05-26','S000029','RS000002','GA000008','SP000002','SS000002','TT000008','RS000004','SO000002','RSO000008',NULL,'PACKED0057','1'),
	('G000058','可口可乐0058','RF991920058','箱','8','2019-05-11','S000029','RS000002','GA000008','SP000002','SS000002','TT000008','RS000004','SO000002','RSO000008',NULL,'PACKED0058','1'),
	('G000059','可口可乐0059','RF991920059','件','8','2018-12-03','S000030','RS000002','GA000008','SP000002','SS000002','TT000008','RS000004','SO000002','RSO000008',NULL,'PACKED0059','1'),
	('G000060','可口可乐0060','RF991920060','箱','9','2017-09-28','S000030','RS000002','GA000008','SP000002','SS000002','TT000008','RS000004','SO000002','RSO000008',NULL,'PACKED0060','1'),
	('G000061','可口可乐0061','RF991920061','件','8','2019-10-08','S000031','RS000002','GA000008','SP000002','SS000002','TT000008','RS000004','SO000002','RSO000008',NULL,'PACKED0061','1'),
	('G000062','可口可乐0062','RF991920062','箱','8','2017-04-13','S000031','RS000002','GA000008','SP000002','SS000002','TT000008','RS000004','SO000002','RSO000008',NULL,'PACKED0062','1'),
	('G000063','可口可乐0063','RF991920063','件','9','2017-01-20','S000032','RS000002','GA000008','SP000002','SS000002','TT000008','RS000004','SO000002','RSO000008',NULL,'PACKED0063','1'),
	('G000064','可口可乐0064','RF991920064','箱','8','2018-09-03','S000032','RS000002','GA000008','SP000002','SS000002','TT000008','RS000004','SO000002','RSO000008',NULL,'PACKED0064','1'),
	('G000065','可口可乐0065','RF991920065','件','10','2019-06-16','S000033','RS000003','GA000009','SP000003','SS000003','TT000009','RS000005','SO000003','RSO000009',NULL,'PACKED0065','1'),
	('G000066','可口可乐0066','RF991920066','箱','10','2019-06-20','S000033','RS000003','GA000009','SP000003','SS000003','TT000009','RS000005','SO000003','RSO000009',NULL,'PACKED0066','1'),
	('G000067','可口可乐0067','RF991920067','件','10','2019-09-28','S000034','RS000003','GA000009','SP000003','SS000003','TT000009','RS000005','SO000003','RSO000009',NULL,'PACKED0067','1'),
	('G000068','可口可乐0068','RF991920068','箱','9','2019-03-18','S000034','RS000003','GA000009','SP000003','SS000003','TT000009','RS000005','SO000003','RSO000009',NULL,'PACKED0068','1'),
	('G000069','可口可乐0069','RF991920069','件','10','2017-06-05','S000035','RS000003','GA000009','SP000003','SS000003','TT000009','RS000005','SO000003','RSO000009',NULL,'PACKED0069','1'),
	('G000070','可口可乐0070','RF991920070','箱','9','2019-03-14','S000035','RS000003','GA000009','SP000003','SS000003','TT000009','RS000005','SO000003','RSO000009',NULL,'PACKED0070','1'),
	('G000071','可口可乐0071','RF991920071','件','10','2017-12-21','S000036','RS000003','GA000009','SP000003','SS000003','TT000009','RS000005','SO000003','RSO000009',NULL,'PACKED0071','1'),
	('G000072','可口可乐0072','RF991920072','箱','8','2019-04-26','S000036','RS000003','GA000009','SP000003','SS000003','TT000009','RS000005','SO000003','RSO000009',NULL,'PACKED0072','1'),
	('G000073','可口可乐0073','RF991920073','件','9','2018-03-01','S000037','RS000003','GA000010','SP000003','SS000003','TT000010','RS000005','SO000003','RSO000010',NULL,'PACKED0073','1'),
	('G000074','可口可乐0074','RF991920074','箱','9','2019-07-20','S000037','RS000003','GA000010','SP000003','SS000003','TT000010','RS000005','SO000003','RSO000010',NULL,'PACKED0074','1'),
	('G000075','可口可乐0075','RF991920075','件','9','2019-05-31','S000038','RS000003','GA000010','SP000003','SS000003','TT000010','RS000005','SO000003','RSO000010',NULL,'PACKED0075','1'),
	('G000076','可口可乐0076','RF991920076','箱','8','2018-04-17','S000038','RS000003','GA000010','SP000003','SS000003','TT000010','RS000005','SO000003','RSO000010',NULL,'PACKED0076','1'),
	('G000077','可口可乐0077','RF991920077','件','10','2018-02-18','S000039','RS000003','GA000010','SP000003','SS000003','TT000010','RS000005','SO000003','RSO000010',NULL,'PACKED0077','1'),
	('G000078','可口可乐0078','RF991920078','箱','10','2016-12-12','S000039','RS000003','GA000010','SP000003','SS000003','TT000010','RS000005','SO000003','RSO000010',NULL,'PACKED0078','1'),
	('G000079','可口可乐0079','RF991920079','件','8','2017-07-28','S000040','RS000003','GA000010','SP000003','SS000003','TT000010','RS000005','SO000003','RSO000010',NULL,'PACKED0079','1'),
	('G000080','可口可乐0080','RF991920080','箱','10','2018-11-07','S000040','RS000003','GA000010','SP000003','SS000003','TT000010','RS000005','SO000003','RSO000010',NULL,'PACKED0080','1'),
	('G000081','可口可乐0081','RF991920081','件','9','2019-02-20','S000041','RS000003','GA000011','SP000003','SS000003','TT000011','RS000006','SO000003','RSO000011',NULL,'PACKED0081','1'),
	('G000082','可口可乐0082','RF991920082','箱','8','2019-04-26','S000041','RS000003','GA000011','SP000003','SS000003','TT000011','RS000006','SO000003','RSO000011',NULL,'PACKED0082','1'),
	('G000083','可口可乐0083','RF991920083','件','10','2019-08-29','S000042','RS000003','GA000011','SP000003','SS000003','TT000011','RS000006','SO000003','RSO000011',NULL,'PACKED0083','1'),
	('G000084','可口可乐0084','RF991920084','箱','8','2019-03-14','S000042','RS000003','GA000011','SP000003','SS000003','TT000011','RS000006','SO000003','RSO000011',NULL,'PACKED0084','1'),
	('G000085','可口可乐0085','RF991920085','件','9','2017-11-07','S000043','RS000003','GA000011','SP000003','SS000003','TT000011','RS000006','SO000003','RSO000011',NULL,'PACKED0085','1'),
	('G000086','可口可乐0086','RF991920086','箱','9','2019-04-26','S000043','RS000003','GA000011','SP000003','SS000003','TT000011','RS000006','SO000003','RSO000011',NULL,'PACKED0086','1'),
	('G000087','可口可乐0087','RF991920087','件','8','2017-11-02','S000044','RS000003','GA000011','SP000003','SS000003','TT000011','RS000006','SO000003','RSO000011',NULL,'PACKED0087','1'),
	('G000088','可口可乐0088','RF991920088','箱','10','2018-12-28','S000044','RS000003','GA000011','SP000003','SS000003','TT000011','RS000006','SO000003','RSO000011',NULL,'PACKED0088','1'),
	('G000089','可口可乐0089','RF991920089','件','8','2018-08-27','S000045','RS000003','GA000012','SP000003','SS000003','TT000012','RS000006','SO000003','RSO000012',NULL,'PACKED0089','1'),
	('G000090','可口可乐0090','RF991920090','箱','8','2017-11-30','S000045','RS000003','GA000012','SP000003','SS000003','TT000012','RS000006','SO000003','RSO000012',NULL,'PACKED0090','1'),
	('G000091','可口可乐0091','RF991920091','件','10','2017-05-05','S000046','RS000003','GA000012','SP000003','SS000003','TT000012','RS000006','SO000003','RSO000012',NULL,'PACKED0091','1'),
	('G000092','可口可乐0092','RF991920092','箱','9','2017-10-19','S000046','RS000003','GA000012','SP000003','SS000003','TT000012','RS000006','SO000003','RSO000012',NULL,'PACKED0092','1'),
	('G000093','可口可乐0093','RF991920093','件','10','2018-07-29','S000047','RS000003','GA000012','SP000003','SS000003','TT000012','RS000006','SO000003','RSO000012',NULL,'PACKED0093','1'),
	('G000094','可口可乐0094','RF991920094','箱','8','2017-05-05','S000047','RS000003','GA000012','SP000003','SS000003','TT000012','RS000006','SO000003','RSO000012',NULL,'PACKED0094','1'),
	('G000095','可口可乐0095','RF991920095','件','9','2019-08-15','S000048','RS000003','GA000012','SP000003','SS000003','TT000012','RS000006','SO000003','RSO000012',NULL,'PACKED0095','1'),
	('G000096','可口可乐0096','RF991920096','箱','8','2018-06-25','S000048','RS000003','GA000012','SP000003','SS000003','TT000012','RS000006','SO000003','RSO000012',NULL,'PACKED0096','1'),
	('G000097','可口可乐0097','RF991920097','件','9','2018-11-24','S000049','RS000004','GA000013','SP000004','SS000004','TT000013','RS000007','SO000004','RSO000013',NULL,'PACKED0097','1'),
	('G000098','可口可乐0098','RF991920098','箱','9','2017-03-07','S000049','RS000004','GA000013','SP000004','SS000004','TT000013','RS000007','SO000004','RSO000013',NULL,'PACKED0098','1'),
	('G000099','可口可乐0099','RF991920099','件','9','2018-07-06','S000050','RS000004','GA000013','SP000004','SS000004','TT000013','RS000007','SO000004','RSO000013',NULL,'PACKED0099','1'),
	('G000100','可口可乐0100','RF991920100','箱','10','2018-08-10','S000050','RS000004','GA000013','SP000004','SS000004','TT000013','RS000007','SO000004','RSO000013',NULL,'PACKED0100','1'),
	('G000101','可口可乐0101','RF991920101','件','8','2019-10-14','S000051','RS000004','GA000013','SP000004','SS000004','TT000013','RS000007','SO000004','RSO000013',NULL,'PACKED0101','1'),
	('G000102','可口可乐0102','RF991920102','箱','9','2018-01-27','S000051','RS000004','GA000013','SP000004','SS000004','TT000013','RS000007','SO000004','RSO000013',NULL,'PACKED0102','1'),
	('G000103','可口可乐0103','RF991920103','件','9','2017-01-26','S000052','RS000004','GA000013','SP000004','SS000004','TT000013','RS000007','SO000004','RSO000013',NULL,'PACKED0103','1'),
	('G000104','可口可乐0104','RF991920104','箱','10','2018-10-15','S000052','RS000004','GA000013','SP000004','SS000004','TT000013','RS000007','SO000004','RSO000013',NULL,'PACKED0104','1'),
	('G000105','可口可乐0105','RF991920105','件','9','2017-12-21','S000053','RS000004','GA000014','SP000004','SS000004','TT000014','RS000007','SO000004','RSO000014',NULL,'PACKED0105','1'),
	('G000106','可口可乐0106','RF991920106','箱','8','2017-05-07','S000053','RS000004','GA000014','SP000004','SS000004','TT000014','RS000007','SO000004','RSO000014',NULL,'PACKED0106','1'),
	('G000107','可口可乐0107','RF991920107','件','8','2019-08-01','S000054','RS000004','GA000014','SP000004','SS000004','TT000014','RS000007','SO000004','RSO000014',NULL,'PACKED0107','1'),
	('G000108','可口可乐0108','RF991920108','箱','8','2017-08-01','S000054','RS000004','GA000014','SP000004','SS000004','TT000014','RS000007','SO000004','RSO000014',NULL,'PACKED0108','1'),
	('G000109','可口可乐0109','RF991920109','件','10','2019-05-13','S000055','RS000004','GA000014','SP000004','SS000004','TT000014','RS000007','SO000004','RSO000014',NULL,'PACKED0109','1'),
	('G000110','可口可乐0110','RF991920110','箱','8','2017-07-20','S000055','RS000004','GA000014','SP000004','SS000004','TT000014','RS000007','SO000004','RSO000014',NULL,'PACKED0110','1'),
	('G000111','可口可乐0111','RF991920111','件','10','2016-11-27','S000056','RS000004','GA000014','SP000004','SS000004','TT000014','RS000007','SO000004','RSO000014',NULL,'PACKED0111','1'),
	('G000112','可口可乐0112','RF991920112','箱','10','2017-05-06','S000056','RS000004','GA000014','SP000004','SS000004','TT000014','RS000007','SO000004','RSO000014',NULL,'PACKED0112','1'),
	('G000113','可口可乐0113','RF991920113','件','8','2019-02-12','S000057','RS000004','GA000015','SP000004','SS000004','TT000015','RS000008','SO000004','RSO000015',NULL,'PACKED0113','1'),
	('G000114','可口可乐0114','RF991920114','箱','8','2018-08-26','S000057','RS000004','GA000015','SP000004','SS000004','TT000015','RS000008','SO000004','RSO000015',NULL,'PACKED0114','1'),
	('G000115','可口可乐0115','RF991920115','件','10','2017-02-06','S000058','RS000004','GA000015','SP000004','SS000004','TT000015','RS000008','SO000004','RSO000015',NULL,'PACKED0115','1'),
	('G000116','可口可乐0116','RF991920116','箱','8','2018-03-06','S000058','RS000004','GA000015','SP000004','SS000004','TT000015','RS000008','SO000004','RSO000015',NULL,'PACKED0116','1'),
	('G000117','可口可乐0117','RF991920117','件','8','2019-07-05','S000059','RS000004','GA000015','SP000004','SS000004','TT000015','RS000008','SO000004','RSO000015',NULL,'PACKED0117','1'),
	('G000118','可口可乐0118','RF991920118','箱','9','2019-06-11','S000059','RS000004','GA000015','SP000004','SS000004','TT000015','RS000008','SO000004','RSO000015',NULL,'PACKED0118','1'),
	('G000119','可口可乐0119','RF991920119','件','10','2018-01-25','S000060','RS000004','GA000015','SP000004','SS000004','TT000015','RS000008','SO000004','RSO000015',NULL,'PACKED0119','1'),
	('G000120','可口可乐0120','RF991920120','箱','9','2016-11-01','S000060','RS000004','GA000015','SP000004','SS000004','TT000015','RS000008','SO000004','RSO000015',NULL,'PACKED0120','1'),
	('G000121','可口可乐0121','RF991920121','件','9','2018-09-06','S000061','RS000004','GA000016','SP000004','SS000004','TT000016','RS000008','SO000004','RSO000016',NULL,'PACKED0121','1'),
	('G000122','可口可乐0122','RF991920122','箱','8','2018-05-16','S000061','RS000004','GA000016','SP000004','SS000004','TT000016','RS000008','SO000004','RSO000016',NULL,'PACKED0122','1'),
	('G000123','可口可乐0123','RF991920123','件','8','2017-08-13','S000062','RS000004','GA000016','SP000004','SS000004','TT000016','RS000008','SO000004','RSO000016',NULL,'PACKED0123','1'),
	('G000124','可口可乐0124','RF991920124','箱','8','2019-03-29','S000062','RS000004','GA000016','SP000004','SS000004','TT000016','RS000008','SO000004','RSO000016',NULL,'PACKED0124','1'),
	('G000125','可口可乐0125','RF991920125','件','8','2018-02-10','S000063','RS000004','GA000016','SP000004','SS000004','TT000016','RS000008','SO000004','RSO000016',NULL,'PACKED0125','1'),
	('G000126','可口可乐0126','RF991920126','箱','8','2016-11-06','S000063','RS000004','GA000016','SP000004','SS000004','TT000016','RS000008','SO000004','RSO000016',NULL,'PACKED0126','1'),
	('G000127','可口可乐0127','RF991920127','件','9','2019-03-10','S000064','RS000004','GA000016','SP000004','SS000004','TT000016','RS000008','SO000004','RSO000016',NULL,'PACKED0127','1'),
	('G000128','可口可乐0128','RF991920128','箱','8','2019-01-08','S000064','RS000004','GA000016','SP000004','SS000004','TT000016','RS000008','SO000004','RSO000016',NULL,'PACKED0128','1');

insert into goods_packaging_data values
	('GP000001','王煜东','RF99192','2018-07-01','打包完成，准备起运','1');

insert into goods_movement_data values
	('GM000001','2019-10-13 07:28:00','仓库货位','仓库货位','192.168.20.1','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B405','FTYUIOLJYT^*(PLKJYT)','41.480568763671606','132.2515405209467','G000001','1'),
	('GM000002','2019-09-28 16:52:19','卡车','卡车','192.168.20.10002','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050002','FTYUIOLJYT^*(PLKJYT)0002','42.148168654255116','131.21201848681798','G000001','1'),
	('GM000003','2019-10-04 21:44:21','小超','小超','192.168.20.10003','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050003','FTYUIOLJYT^*(PLKJYT)0003','39.86704365274732','129.6156111113098','G000002','1'),
	('GM000004','2019-10-06 14:45:57','仓库货位','仓库货位','192.168.20.10004','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050004','FTYUIOLJYT^*(PLKJYT)0004','42.75044066727043','129.84994225972747','G000002','1'),
	('GM000005','2019-10-14 10:19:43','卡车','卡车','192.168.20.10005','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050005','FTYUIOLJYT^*(PLKJYT)0005','41.03338437411415','132.1081688639714','G000003','1'),
	('GM000006','2019-10-12 02:57:09','小超','小超','192.168.20.10006','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050006','FTYUIOLJYT^*(PLKJYT)0006','41.81341848514569','131.77283846241374','G000003','1'),
	('GM000007','2019-10-07 03:40:21','仓库货位','仓库货位','192.168.20.10007','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050007','FTYUIOLJYT^*(PLKJYT)0007','41.3724463668094','129.34029070673196','G000004','1'),
	('GM000008','2019-10-11 05:09:49','卡车','卡车','192.168.20.10008','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050008','FTYUIOLJYT^*(PLKJYT)0008','41.77953921363455','129.74775977500838','G000004','1'),
	('GM000009','2019-10-14 09:38:13','小超','小超','192.168.20.10009','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050009','FTYUIOLJYT^*(PLKJYT)0009','41.09707649625728','131.20396989068354','G000005','1'),
	('GM000010','2019-10-05 12:52:57','仓库货位','仓库货位','192.168.20.10010','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050010','FTYUIOLJYT^*(PLKJYT)0010','40.29764622369974','131.84295453751304','G000005','1'),
	('GM000011','2019-10-01 20:14:10','卡车','卡车','192.168.20.10011','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050011','FTYUIOLJYT^*(PLKJYT)0011','40.19337105463047','130.95014117376184','G000006','1'),
	('GM000012','2019-10-15 15:51:25','小超','小超','192.168.20.10012','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050012','FTYUIOLJYT^*(PLKJYT)0012','41.67948308193673','129.45887858827908','G000006','1'),
	('GM000013','2019-10-11 16:45:46','仓库货位','仓库货位','192.168.20.10013','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050013','FTYUIOLJYT^*(PLKJYT)0013','41.761543446329824','131.27893241902157','G000007','1'),
	('GM000014','2019-10-05 18:35:47','卡车','卡车','192.168.20.10014','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050014','FTYUIOLJYT^*(PLKJYT)0014','41.66949730650273','131.1114813163651','G000007','1'),
	('GM000015','2019-10-04 11:48:49','小超','小超','192.168.20.10015','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050015','FTYUIOLJYT^*(PLKJYT)0015','40.1650563125933','129.98648003013514','G000008','1'),
	('GM000016','2019-10-12 22:21:00','仓库货位','仓库货位','192.168.20.10016','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050016','FTYUIOLJYT^*(PLKJYT)0016','40.23425168815552','129.74969427202632','G000008','1'),
	('GM000017','2019-10-08 17:38:05','卡车','卡车','192.168.20.10017','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050017','FTYUIOLJYT^*(PLKJYT)0017','40.48778655316872','130.5488058205331','G000009','1'),
	('GM000018','2019-10-02 22:14:36','小超','小超','192.168.20.10018','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050018','FTYUIOLJYT^*(PLKJYT)0018','41.76613575783273','130.96560220757047','G000009','1'),
	('GM000019','2019-10-15 07:23:49','仓库货位','仓库货位','192.168.20.10019','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050019','FTYUIOLJYT^*(PLKJYT)0019','40.28490158937551','131.97959689999243','G000010','1'),
	('GM000020','2019-10-08 22:01:59','卡车','卡车','192.168.20.10020','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050020','FTYUIOLJYT^*(PLKJYT)0020','40.56187332450427','130.81607578235625','G000010','1'),
	('GM000021','2019-10-03 19:53:17','小超','小超','192.168.20.10021','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050021','FTYUIOLJYT^*(PLKJYT)0021','40.28220703925289','131.3938007972991','G000011','1'),
	('GM000022','2019-10-09 06:47:42','仓库货位','仓库货位','192.168.20.10022','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050022','FTYUIOLJYT^*(PLKJYT)0022','42.24495576086661','131.98881961170548','G000011','1'),
	('GM000023','2019-10-12 01:20:30','卡车','卡车','192.168.20.10023','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050023','FTYUIOLJYT^*(PLKJYT)0023','41.57296096324262','129.85193677332552','G000012','1'),
	('GM000024','2019-10-01 18:31:01','小超','小超','192.168.20.10024','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050024','FTYUIOLJYT^*(PLKJYT)0024','41.65865721846754','131.34957124944205','G000012','1'),
	('GM000025','2019-10-03 01:49:37','仓库货位','仓库货位','192.168.20.10025','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050025','FTYUIOLJYT^*(PLKJYT)0025','42.03816491756688','130.8007259597002','G000013','1'),
	('GM000026','2019-10-15 09:35:29','卡车','卡车','192.168.20.10026','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050026','FTYUIOLJYT^*(PLKJYT)0026','40.25938016824683','131.6519482321335','G000013','1'),
	('GM000027','2019-10-13 11:09:30','小超','小超','192.168.20.10027','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050027','FTYUIOLJYT^*(PLKJYT)0027','39.99937245427316','131.70449521411587','G000014','1'),
	('GM000028','2019-10-06 22:45:35','仓库货位','仓库货位','192.168.20.10028','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050028','FTYUIOLJYT^*(PLKJYT)0028','41.4260487175108','129.79417654260675','G000014','1'),
	('GM000029','2019-10-09 05:13:50','卡车','卡车','192.168.20.10029','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050029','FTYUIOLJYT^*(PLKJYT)0029','40.84097327499436','131.35986034159941','G000015','1'),
	('GM000030','2019-09-29 23:25:29','小超','小超','192.168.20.10030','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050030','FTYUIOLJYT^*(PLKJYT)0030','40.99803495829124','131.9002529529969','G000015','1'),
	('GM000031','2019-10-12 20:51:53','仓库货位','仓库货位','192.168.20.10031','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050031','FTYUIOLJYT^*(PLKJYT)0031','42.11620441802775','131.87512838159512','G000016','1'),
	('GM000032','2019-10-06 17:14:18','卡车','卡车','192.168.20.10032','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050032','FTYUIOLJYT^*(PLKJYT)0032','41.53023597759904','131.88524873553283','G000016','1'),
	('GM000033','2019-10-02 14:32:40','小超','小超','192.168.20.10033','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050033','FTYUIOLJYT^*(PLKJYT)0033','42.09793008598479','131.9879795174004','G000017','1'),
	('GM000034','2019-10-06 21:14:47','仓库货位','仓库货位','192.168.20.10034','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050034','FTYUIOLJYT^*(PLKJYT)0034','41.868579811048455','131.74931003319836','G000017','1'),
	('GM000035','2019-10-15 20:29:53','卡车','卡车','192.168.20.10035','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050035','FTYUIOLJYT^*(PLKJYT)0035','40.2372554179904','130.29322166926897','G000018','1'),
	('GM000036','2019-10-14 23:44:26','小超','小超','192.168.20.10036','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050036','FTYUIOLJYT^*(PLKJYT)0036','40.002253069685274','129.61195348890007','G000018','1'),
	('GM000037','2019-09-30 09:37:43','仓库货位','仓库货位','192.168.20.10037','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050037','FTYUIOLJYT^*(PLKJYT)0037','41.45167099762963','132.200319673736','G000019','1'),
	('GM000038','2019-10-02 14:43:09','卡车','卡车','192.168.20.10038','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050038','FTYUIOLJYT^*(PLKJYT)0038','41.430717296038935','130.4426000602307','G000019','1'),
	('GM000039','2019-09-27 17:19:41','小超','小超','192.168.20.10039','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050039','FTYUIOLJYT^*(PLKJYT)0039','41.746649270563864','132.07215459971152','G000020','1'),
	('GM000040','2019-10-01 10:19:43','仓库货位','仓库货位','192.168.20.10040','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050040','FTYUIOLJYT^*(PLKJYT)0040','42.32519234994202','130.32568832425875','G000020','1'),
	('GM000041','2019-10-13 18:17:40','卡车','卡车','192.168.20.10041','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050041','FTYUIOLJYT^*(PLKJYT)0041','42.56305426935314','129.68688050780443','G000021','1'),
	('GM000042','2019-09-26 23:16:38','小超','小超','192.168.20.10042','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050042','FTYUIOLJYT^*(PLKJYT)0042','40.28739631795333','131.1955224777521','G000021','1'),
	('GM000043','2019-10-12 21:19:57','仓库货位','仓库货位','192.168.20.10043','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050043','FTYUIOLJYT^*(PLKJYT)0043','41.38561997158066','130.97924030468525','G000022','1'),
	('GM000044','2019-10-08 19:54:08','卡车','卡车','192.168.20.10044','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050044','FTYUIOLJYT^*(PLKJYT)0044','40.87525567390604','130.82922913204249','G000022','1'),
	('GM000045','2019-09-25 00:26:13','小超','小超','192.168.20.10045','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050045','FTYUIOLJYT^*(PLKJYT)0045','42.008970523836126','130.16233716972891','G000023','1'),
	('GM000046','2019-10-11 17:02:41','仓库货位','仓库货位','192.168.20.10046','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050046','FTYUIOLJYT^*(PLKJYT)0046','40.028966060339016','131.05344918140432','G000023','1'),
	('GM000047','2019-10-11 15:47:29','卡车','卡车','192.168.20.10047','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050047','FTYUIOLJYT^*(PLKJYT)0047','42.166687937462626','129.9023109236992','G000024','1'),
	('GM000048','2019-10-15 09:31:00','小超','小超','192.168.20.10048','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050048','FTYUIOLJYT^*(PLKJYT)0048','41.98474162824842','130.92490222199422','G000024','1'),
	('GM000049','2019-09-28 17:59:19','仓库货位','仓库货位','192.168.20.10049','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050049','FTYUIOLJYT^*(PLKJYT)0049','42.73089783917616','131.95394536763163','G000025','1'),
	('GM000050','2019-10-03 13:33:03','卡车','卡车','192.168.20.10050','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050050','FTYUIOLJYT^*(PLKJYT)0050','41.99203010951576','129.92561586580004','G000025','1'),
	('GM000051','2019-09-27 05:25:21','小超','小超','192.168.20.10051','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050051','FTYUIOLJYT^*(PLKJYT)0051','41.89548169362292','131.6928621722178','G000026','1'),
	('GM000052','2019-10-05 08:13:57','仓库货位','仓库货位','192.168.20.10052','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050052','FTYUIOLJYT^*(PLKJYT)0052','40.57768235020935','132.07488851769762','G000026','1'),
	('GM000053','2019-10-05 20:14:13','卡车','卡车','192.168.20.10053','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050053','FTYUIOLJYT^*(PLKJYT)0053','41.691704942866004','129.56819504127952','G000027','1'),
	('GM000054','2019-10-16 05:01:00','小超','小超','192.168.20.10054','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050054','FTYUIOLJYT^*(PLKJYT)0054','42.04299239538332','129.42207842218644','G000027','1'),
	('GM000055','2019-10-01 10:07:57','仓库货位','仓库货位','192.168.20.10055','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050055','FTYUIOLJYT^*(PLKJYT)0055','40.14276590878542','131.80766313033007','G000028','1'),
	('GM000056','2019-10-09 14:09:14','卡车','卡车','192.168.20.10056','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050056','FTYUIOLJYT^*(PLKJYT)0056','41.292712235423515','130.53282110185452','G000028','1'),
	('GM000057','2019-10-03 00:37:19','小超','小超','192.168.20.10057','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050057','FTYUIOLJYT^*(PLKJYT)0057','41.65113161884534','130.53458063462998','G000029','1'),
	('GM000058','2019-10-14 19:43:49','仓库货位','仓库货位','192.168.20.10058','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050058','FTYUIOLJYT^*(PLKJYT)0058','40.82577803589467','129.71764229078084','G000029','1'),
	('GM000059','2019-10-01 04:34:06','卡车','卡车','192.168.20.10059','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050059','FTYUIOLJYT^*(PLKJYT)0059','41.90278959408095','129.99397776513283','G000030','1'),
	('GM000060','2019-10-16 17:41:07','小超','小超','192.168.20.10060','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050060','FTYUIOLJYT^*(PLKJYT)0060','40.25286582023564','129.54314214601465','G000030','1'),
	('GM000061','2019-10-08 05:23:36','仓库货位','仓库货位','192.168.20.10061','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050061','FTYUIOLJYT^*(PLKJYT)0061','41.25455833721681','130.16372730433025','G000031','1'),
	('GM000062','2019-10-03 13:36:48','卡车','卡车','192.168.20.10062','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050062','FTYUIOLJYT^*(PLKJYT)0062','41.923955308238654','129.2946017325963','G000031','1'),
	('GM000063','2019-09-25 21:03:24','小超','小超','192.168.20.10063','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050063','FTYUIOLJYT^*(PLKJYT)0063','42.098873439741354','129.86803962029887','G000032','1'),
	('GM000064','2019-09-27 07:27:59','仓库货位','仓库货位','192.168.20.10064','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050064','FTYUIOLJYT^*(PLKJYT)0064','42.16837100896061','131.9732403523568','G000032','1'),
	('GM000065','2019-10-03 15:38:13','卡车','卡车','192.168.20.10065','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050065','FTYUIOLJYT^*(PLKJYT)0065','39.94510449227716','131.47722719101904','G000033','1'),
	('GM000066','2019-10-01 12:10:13','小超','小超','192.168.20.10066','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050066','FTYUIOLJYT^*(PLKJYT)0066','40.179476931183174','130.07530573790348','G000033','1'),
	('GM000067','2019-09-26 02:34:51','仓库货位','仓库货位','192.168.20.10067','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050067','FTYUIOLJYT^*(PLKJYT)0067','42.55321095121885','129.62216024719922','G000034','1'),
	('GM000068','2019-09-29 15:09:36','卡车','卡车','192.168.20.10068','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050068','FTYUIOLJYT^*(PLKJYT)0068','42.26612145897921','131.04319405473083','G000034','1'),
	('GM000069','2019-10-01 03:47:05','小超','小超','192.168.20.10069','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050069','FTYUIOLJYT^*(PLKJYT)0069','42.55577618895191','131.46790709384197','G000035','1'),
	('GM000070','2019-10-01 00:08:55','仓库货位','仓库货位','192.168.20.10070','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050070','FTYUIOLJYT^*(PLKJYT)0070','39.98350047893911','131.1459975534972','G000035','1'),
	('GM000071','2019-09-26 04:23:55','卡车','卡车','192.168.20.10071','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050071','FTYUIOLJYT^*(PLKJYT)0071','40.02516136488313','131.26284693642702','G000036','1'),
	('GM000072','2019-09-28 11:39:48','小超','小超','192.168.20.10072','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050072','FTYUIOLJYT^*(PLKJYT)0072','42.62837587838683','130.64899981493488','G000036','1'),
	('GM000073','2019-09-25 11:00:29','仓库货位','仓库货位','192.168.20.10073','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050073','FTYUIOLJYT^*(PLKJYT)0073','39.81631171217327','132.03186772125892','G000037','1'),
	('GM000074','2019-10-08 09:40:51','卡车','卡车','192.168.20.10074','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050074','FTYUIOLJYT^*(PLKJYT)0074','41.709240130201785','129.99505317466316','G000037','1'),
	('GM000075','2019-09-26 16:06:41','小超','小超','192.168.20.10075','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050075','FTYUIOLJYT^*(PLKJYT)0075','41.440867786143556','131.73054536309576','G000038','1'),
	('GM000076','2019-10-03 04:21:48','仓库货位','仓库货位','192.168.20.10076','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050076','FTYUIOLJYT^*(PLKJYT)0076','39.89335448088302','132.13747219986416','G000038','1'),
	('GM000077','2019-10-02 18:50:58','卡车','卡车','192.168.20.10077','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050077','FTYUIOLJYT^*(PLKJYT)0077','41.41855588530383','131.37750009149872','G000039','1'),
	('GM000078','2019-09-28 03:21:45','小超','小超','192.168.20.10078','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050078','FTYUIOLJYT^*(PLKJYT)0078','41.59254544433648','129.9416759298857','G000039','1'),
	('GM000079','2019-10-09 04:54:09','仓库货位','仓库货位','192.168.20.10079','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050079','FTYUIOLJYT^*(PLKJYT)0079','42.48683824714786','131.9811159304783','G000040','1'),
	('GM000080','2019-10-12 10:48:28','卡车','卡车','192.168.20.10080','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050080','FTYUIOLJYT^*(PLKJYT)0080','40.921764032357785','130.2845534571079','G000040','1'),
	('GM000081','2019-10-05 06:40:44','小超','小超','192.168.20.10081','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050081','FTYUIOLJYT^*(PLKJYT)0081','42.72462077659229','129.46180256946857','G000041','1'),
	('GM000082','2019-09-26 12:18:39','仓库货位','仓库货位','192.168.20.10082','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050082','FTYUIOLJYT^*(PLKJYT)0082','40.282892219691945','130.21528170849845','G000041','1'),
	('GM000083','2019-09-26 06:01:28','卡车','卡车','192.168.20.10083','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050083','FTYUIOLJYT^*(PLKJYT)0083','40.32118284111007','130.61989495051395','G000042','1'),
	('GM000084','2019-10-03 04:58:03','小超','小超','192.168.20.10084','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050084','FTYUIOLJYT^*(PLKJYT)0084','39.965905209641335','131.65357720640455','G000042','1'),
	('GM000085','2019-10-01 19:16:24','仓库货位','仓库货位','192.168.20.10085','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050085','FTYUIOLJYT^*(PLKJYT)0085','40.67377225323611','130.03068995015494','G000043','1'),
	('GM000086','2019-10-16 18:41:18','卡车','卡车','192.168.20.10086','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050086','FTYUIOLJYT^*(PLKJYT)0086','39.9857161426606','131.96124044557547','G000043','1'),
	('GM000087','2019-10-06 02:03:36','小超','小超','192.168.20.10087','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050087','FTYUIOLJYT^*(PLKJYT)0087','42.26850376068486','129.9711834258398','G000044','1'),
	('GM000088','2019-10-02 15:21:39','仓库货位','仓库货位','192.168.20.10088','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050088','FTYUIOLJYT^*(PLKJYT)0088','41.09188037515749','130.4660860204247','G000044','1'),
	('GM000089','2019-10-14 15:11:18','卡车','卡车','192.168.20.10089','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050089','FTYUIOLJYT^*(PLKJYT)0089','41.94691094903575','131.14760129405707','G000045','1'),
	('GM000090','2019-10-11 04:18:44','小超','小超','192.168.20.10090','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050090','FTYUIOLJYT^*(PLKJYT)0090','41.596509050458295','131.29531926701108','G000045','1'),
	('GM000091','2019-09-29 14:48:08','仓库货位','仓库货位','192.168.20.10091','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050091','FTYUIOLJYT^*(PLKJYT)0091','40.007990435505896','131.539248884446','G000046','1'),
	('GM000092','2019-10-09 18:52:06','卡车','卡车','192.168.20.10092','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050092','FTYUIOLJYT^*(PLKJYT)0092','42.10053748292334','129.60510517025676','G000046','1'),
	('GM000093','2019-10-01 05:03:48','小超','小超','192.168.20.10093','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050093','FTYUIOLJYT^*(PLKJYT)0093','41.981694717844036','129.68358250408676','G000047','1'),
	('GM000094','2019-10-07 20:57:23','仓库货位','仓库货位','192.168.20.10094','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050094','FTYUIOLJYT^*(PLKJYT)0094','41.48784178387084','129.4071011662371','G000047','1'),
	('GM000095','2019-10-09 12:23:51','卡车','卡车','192.168.20.10095','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050095','FTYUIOLJYT^*(PLKJYT)0095','39.93907643623924','129.67141709552064','G000048','1'),
	('GM000096','2019-10-01 13:42:32','小超','小超','192.168.20.10096','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050096','FTYUIOLJYT^*(PLKJYT)0096','40.96915372104089','131.38933172652685','G000048','1'),
	('GM000097','2019-09-25 18:43:11','仓库货位','仓库货位','192.168.20.10097','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050097','FTYUIOLJYT^*(PLKJYT)0097','40.99678210609496','130.11213557427757','G000049','1'),
	('GM000098','2019-10-08 10:38:54','卡车','卡车','192.168.20.10098','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050098','FTYUIOLJYT^*(PLKJYT)0098','41.65246902000382','129.62183430039465','G000049','1'),
	('GM000099','2019-10-08 22:27:23','小超','小超','192.168.20.10099','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050099','FTYUIOLJYT^*(PLKJYT)0099','40.11506910452544','130.8695738268989','G000050','1'),
	('GM000100','2019-10-11 22:33:28','仓库货位','仓库货位','192.168.20.10100','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050100','FTYUIOLJYT^*(PLKJYT)0100','39.893478785982225','129.3065017237821','G000050','1'),
	('GM000101','2019-10-11 15:19:49','卡车','卡车','192.168.20.10101','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050101','FTYUIOLJYT^*(PLKJYT)0101','41.78035242242974','131.10349391125513','G000051','1'),
	('GM000102','2019-10-05 15:35:36','小超','小超','192.168.20.10102','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050102','FTYUIOLJYT^*(PLKJYT)0102','42.72891381506167','131.2705952359656','G000051','1'),
	('GM000103','2019-10-14 23:11:23','仓库货位','仓库货位','192.168.20.10103','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050103','FTYUIOLJYT^*(PLKJYT)0103','42.37246952809418','129.61338842507377','G000052','1'),
	('GM000104','2019-10-11 23:22:51','卡车','卡车','192.168.20.10104','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050104','FTYUIOLJYT^*(PLKJYT)0104','41.34862599556177','129.97525237102508','G000052','1'),
	('GM000105','2019-10-08 16:00:24','小超','小超','192.168.20.10105','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050105','FTYUIOLJYT^*(PLKJYT)0105','42.6259905748349','130.84560016277086','G000053','1'),
	('GM000106','2019-10-13 07:24:02','仓库货位','仓库货位','192.168.20.10106','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050106','FTYUIOLJYT^*(PLKJYT)0106','40.04042164637791','132.19033064274106','G000053','1'),
	('GM000107','2019-09-29 13:38:29','卡车','卡车','192.168.20.10107','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050107','FTYUIOLJYT^*(PLKJYT)0107','41.05225105917485','131.7568126513991','G000054','1'),
	('GM000108','2019-10-07 09:36:55','小超','小超','192.168.20.10108','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050108','FTYUIOLJYT^*(PLKJYT)0108','41.2074154442786','130.21710288972966','G000054','1'),
	('GM000109','2019-10-10 05:43:31','仓库货位','仓库货位','192.168.20.10109','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050109','FTYUIOLJYT^*(PLKJYT)0109','42.4582038380767','130.73293074598814','G000055','1'),
	('GM000110','2019-10-10 20:22:36','卡车','卡车','192.168.20.10110','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050110','FTYUIOLJYT^*(PLKJYT)0110','41.163915923651544','130.67827030850808','G000055','1'),
	('GM000111','2019-10-04 03:59:21','小超','小超','192.168.20.10111','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050111','FTYUIOLJYT^*(PLKJYT)0111','40.009174092465706','130.5389012340239','G000056','1'),
	('GM000112','2019-09-28 14:52:13','仓库货位','仓库货位','192.168.20.10112','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050112','FTYUIOLJYT^*(PLKJYT)0112','40.856141199419575','130.2637298214772','G000056','1'),
	('GM000113','2019-10-05 05:31:47','卡车','卡车','192.168.20.10113','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050113','FTYUIOLJYT^*(PLKJYT)0113','40.88026614639539','131.0594276952705','G000057','1'),
	('GM000114','2019-09-26 23:26:02','小超','小超','192.168.20.10114','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050114','FTYUIOLJYT^*(PLKJYT)0114','42.71257986746457','130.75938448473335','G000057','1'),
	('GM000115','2019-10-15 06:26:49','仓库货位','仓库货位','192.168.20.10115','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050115','FTYUIOLJYT^*(PLKJYT)0115','40.43626633374286','131.0107427590673','G000058','1'),
	('GM000116','2019-09-28 15:32:03','卡车','卡车','192.168.20.10116','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050116','FTYUIOLJYT^*(PLKJYT)0116','42.4303518490624','131.79951906418665','G000058','1'),
	('GM000117','2019-09-26 02:51:32','小超','小超','192.168.20.10117','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050117','FTYUIOLJYT^*(PLKJYT)0117','42.59876664176543','129.62816627186865','G000059','1'),
	('GM000118','2019-09-30 06:24:14','仓库货位','仓库货位','192.168.20.10118','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050118','FTYUIOLJYT^*(PLKJYT)0118','40.96393033352817','129.69098877707683','G000059','1'),
	('GM000119','2019-10-07 23:21:17','卡车','卡车','192.168.20.10119','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050119','FTYUIOLJYT^*(PLKJYT)0119','42.39390287989076','130.22228082657304','G000060','1'),
	('GM000120','2019-10-08 01:09:46','小超','小超','192.168.20.10120','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050120','FTYUIOLJYT^*(PLKJYT)0120','41.757100499203204','131.7454309420657','G000060','1'),
	('GM000121','2019-09-30 08:26:27','仓库货位','仓库货位','192.168.20.10121','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050121','FTYUIOLJYT^*(PLKJYT)0121','40.43216857618606','130.74800358214932','G000061','1'),
	('GM000122','2019-10-04 09:17:05','卡车','卡车','192.168.20.10122','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050122','FTYUIOLJYT^*(PLKJYT)0122','40.694742734631326','129.7252789461939','G000061','1'),
	('GM000123','2019-10-14 03:57:21','小超','小超','192.168.20.10123','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050123','FTYUIOLJYT^*(PLKJYT)0123','40.82647677113685','130.83604856378707','G000062','1'),
	('GM000124','2019-09-25 03:40:59','仓库货位','仓库货位','192.168.20.10124','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050124','FTYUIOLJYT^*(PLKJYT)0124','42.33523782835311','130.42751892738755','G000062','1'),
	('GM000125','2019-10-15 23:14:06','卡车','卡车','192.168.20.10125','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050125','FTYUIOLJYT^*(PLKJYT)0125','39.89486392146919','129.92632066736573','G000063','1'),
	('GM000126','2019-10-05 08:44:09','小超','小超','192.168.20.10126','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050126','FTYUIOLJYT^*(PLKJYT)0126','41.094927850969434','130.27850729097568','G000063','1'),
	('GM000127','2019-10-06 00:45:36','仓库货位','仓库货位','192.168.20.10127','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050127','FTYUIOLJYT^*(PLKJYT)0127','42.27445317037731','131.9393312675179','G000064','1'),
	('GM000128','2019-09-28 23:53:22','卡车','卡车','192.168.20.10128','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050128','FTYUIOLJYT^*(PLKJYT)0128','41.711688971219495','132.04199913424887','G000064','1'),
	('GM000129','2019-10-04 01:14:46','小超','小超','192.168.20.10129','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050129','FTYUIOLJYT^*(PLKJYT)0129','41.1636386288733','129.68708797762199','G000065','1'),
	('GM000130','2019-09-25 18:13:30','仓库货位','仓库货位','192.168.20.10130','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050130','FTYUIOLJYT^*(PLKJYT)0130','41.92445366091676','130.81469326805166','G000065','1'),
	('GM000131','2019-09-30 06:39:12','卡车','卡车','192.168.20.10131','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050131','FTYUIOLJYT^*(PLKJYT)0131','41.44565643817048','130.71201432923777','G000066','1'),
	('GM000132','2019-10-01 13:49:20','小超','小超','192.168.20.10132','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050132','FTYUIOLJYT^*(PLKJYT)0132','40.91927181850965','131.12856861718313','G000066','1'),
	('GM000133','2019-09-25 04:26:33','仓库货位','仓库货位','192.168.20.10133','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050133','FTYUIOLJYT^*(PLKJYT)0133','42.0801442083553','131.3448509762662','G000067','1'),
	('GM000134','2019-10-11 02:10:19','卡车','卡车','192.168.20.10134','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050134','FTYUIOLJYT^*(PLKJYT)0134','41.15064675905073','129.94218909828183','G000067','1'),
	('GM000135','2019-10-03 15:04:22','小超','小超','192.168.20.10135','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050135','FTYUIOLJYT^*(PLKJYT)0135','40.29694396434857','131.27436569768878','G000068','1'),
	('GM000136','2019-10-01 01:36:15','仓库货位','仓库货位','192.168.20.10136','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050136','FTYUIOLJYT^*(PLKJYT)0136','41.230481636833765','130.09473053833565','G000068','1'),
	('GM000137','2019-10-12 21:17:01','卡车','卡车','192.168.20.10137','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050137','FTYUIOLJYT^*(PLKJYT)0137','40.72089994452723','132.24785013486218','G000069','1'),
	('GM000138','2019-10-10 03:03:50','小超','小超','192.168.20.10138','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050138','FTYUIOLJYT^*(PLKJYT)0138','42.15770171969172','131.44310204514233','G000069','1'),
	('GM000139','2019-09-25 07:10:08','仓库货位','仓库货位','192.168.20.10139','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050139','FTYUIOLJYT^*(PLKJYT)0139','41.29597444821639','130.4872441775868','G000070','1'),
	('GM000140','2019-09-28 23:34:30','卡车','卡车','192.168.20.10140','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050140','FTYUIOLJYT^*(PLKJYT)0140','41.3517853569896','130.69618320987874','G000070','1'),
	('GM000141','2019-10-03 17:19:46','小超','小超','192.168.20.10141','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050141','FTYUIOLJYT^*(PLKJYT)0141','39.975529718150284','131.96735656613936','G000071','1'),
	('GM000142','2019-09-30 22:37:11','仓库货位','仓库货位','192.168.20.10142','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050142','FTYUIOLJYT^*(PLKJYT)0142','41.2559673691576','131.20850439571552','G000071','1'),
	('GM000143','2019-09-26 11:59:02','卡车','卡车','192.168.20.10143','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050143','FTYUIOLJYT^*(PLKJYT)0143','41.082583847658796','130.70671743071335','G000072','1'),
	('GM000144','2019-09-28 07:30:12','小超','小超','192.168.20.10144','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050144','FTYUIOLJYT^*(PLKJYT)0144','40.334333086164264','131.7718898675687','G000072','1'),
	('GM000145','2019-10-13 13:49:48','仓库货位','仓库货位','192.168.20.10145','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050145','FTYUIOLJYT^*(PLKJYT)0145','42.51436854991448','131.1554217628691','G000073','1'),
	('GM000146','2019-10-16 00:26:57','卡车','卡车','192.168.20.10146','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050146','FTYUIOLJYT^*(PLKJYT)0146','40.635571489248235','131.336541228832','G000073','1'),
	('GM000147','2019-10-02 03:26:22','小超','小超','192.168.20.10147','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050147','FTYUIOLJYT^*(PLKJYT)0147','39.830336895069166','131.50581520674194','G000074','1'),
	('GM000148','2019-09-27 09:28:08','仓库货位','仓库货位','192.168.20.10148','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050148','FTYUIOLJYT^*(PLKJYT)0148','40.9096154562536','131.45724644673962','G000074','1'),
	('GM000149','2019-10-14 12:06:01','卡车','卡车','192.168.20.10149','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050149','FTYUIOLJYT^*(PLKJYT)0149','41.498250905291734','129.3196071409411','G000075','1'),
	('GM000150','2019-09-27 22:42:55','小超','小超','192.168.20.10150','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050150','FTYUIOLJYT^*(PLKJYT)0150','40.10718878117758','129.96597642610462','G000075','1'),
	('GM000151','2019-09-29 17:46:19','仓库货位','仓库货位','192.168.20.10151','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050151','FTYUIOLJYT^*(PLKJYT)0151','40.221125860134244','130.16813641013852','G000076','1'),
	('GM000152','2019-10-12 21:41:31','卡车','卡车','192.168.20.10152','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050152','FTYUIOLJYT^*(PLKJYT)0152','40.67245897675855','130.55482277972698','G000076','1'),
	('GM000153','2019-10-01 04:16:20','小超','小超','192.168.20.10153','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050153','FTYUIOLJYT^*(PLKJYT)0153','42.38622595602862','129.57087610150165','G000077','1'),
	('GM000154','2019-10-02 12:13:19','仓库货位','仓库货位','192.168.20.10154','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050154','FTYUIOLJYT^*(PLKJYT)0154','41.95224757579487','130.76439737141075','G000077','1'),
	('GM000155','2019-10-07 17:46:23','卡车','卡车','192.168.20.10155','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050155','FTYUIOLJYT^*(PLKJYT)0155','40.08924407659776','129.33126948542656','G000078','1'),
	('GM000156','2019-10-02 11:57:23','小超','小超','192.168.20.10156','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050156','FTYUIOLJYT^*(PLKJYT)0156','42.528871161725654','131.7294548344509','G000078','1'),
	('GM000157','2019-10-13 13:52:06','仓库货位','仓库货位','192.168.20.10157','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050157','FTYUIOLJYT^*(PLKJYT)0157','41.23112182368343','130.48969902393466','G000079','1'),
	('GM000158','2019-09-30 12:57:22','卡车','卡车','192.168.20.10158','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050158','FTYUIOLJYT^*(PLKJYT)0158','41.96561343164437','129.36822749874895','G000079','1'),
	('GM000159','2019-10-15 19:47:22','小超','小超','192.168.20.10159','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050159','FTYUIOLJYT^*(PLKJYT)0159','40.46616584237903','129.51247888047294','G000080','1'),
	('GM000160','2019-10-15 12:06:27','仓库货位','仓库货位','192.168.20.10160','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050160','FTYUIOLJYT^*(PLKJYT)0160','40.10261399466614','129.71302116599247','G000080','1'),
	('GM000161','2019-09-27 16:34:26','卡车','卡车','192.168.20.10161','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050161','FTYUIOLJYT^*(PLKJYT)0161','39.91831174942275','129.62553801176236','G000081','1'),
	('GM000162','2019-10-15 06:23:28','小超','小超','192.168.20.10162','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050162','FTYUIOLJYT^*(PLKJYT)0162','40.31578103139682','131.48087579071438','G000081','1'),
	('GM000163','2019-10-12 07:54:07','仓库货位','仓库货位','192.168.20.10163','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050163','FTYUIOLJYT^*(PLKJYT)0163','41.963318750907526','131.38485231584232','G000082','1'),
	('GM000164','2019-10-07 15:25:08','卡车','卡车','192.168.20.10164','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050164','FTYUIOLJYT^*(PLKJYT)0164','41.35199989264034','129.7540426613277','G000082','1'),
	('GM000165','2019-10-12 14:35:49','小超','小超','192.168.20.10165','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050165','FTYUIOLJYT^*(PLKJYT)0165','40.899714598842586','129.7962460641306','G000083','1'),
	('GM000166','2019-10-02 11:48:10','仓库货位','仓库货位','192.168.20.10166','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050166','FTYUIOLJYT^*(PLKJYT)0166','42.17084600375996','130.7757832765878','G000083','1'),
	('GM000167','2019-09-27 10:15:11','卡车','卡车','192.168.20.10167','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050167','FTYUIOLJYT^*(PLKJYT)0167','40.16744007620926','131.58909532056973','G000084','1'),
	('GM000168','2019-09-25 04:48:40','小超','小超','192.168.20.10168','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050168','FTYUIOLJYT^*(PLKJYT)0168','40.48727382692809','132.12829671982183','G000084','1'),
	('GM000169','2019-09-26 17:52:34','仓库货位','仓库货位','192.168.20.10169','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050169','FTYUIOLJYT^*(PLKJYT)0169','40.102992445450425','130.28653231183944','G000085','1'),
	('GM000170','2019-09-30 22:52:50','卡车','卡车','192.168.20.10170','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050170','FTYUIOLJYT^*(PLKJYT)0170','40.14302261469698','131.22280410456892','G000085','1'),
	('GM000171','2019-10-12 06:42:24','小超','小超','192.168.20.10171','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050171','FTYUIOLJYT^*(PLKJYT)0171','40.991662251791716','131.5644019743884','G000086','1'),
	('GM000172','2019-09-26 07:58:17','仓库货位','仓库货位','192.168.20.10172','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050172','FTYUIOLJYT^*(PLKJYT)0172','40.39906096392291','130.638944124618','G000086','1'),
	('GM000173','2019-10-01 14:58:04','卡车','卡车','192.168.20.10173','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050173','FTYUIOLJYT^*(PLKJYT)0173','41.85508663353772','130.25851162003062','G000087','1'),
	('GM000174','2019-10-06 18:48:50','小超','小超','192.168.20.10174','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050174','FTYUIOLJYT^*(PLKJYT)0174','42.49021319498927','131.95929024308325','G000087','1'),
	('GM000175','2019-09-27 14:55:23','仓库货位','仓库货位','192.168.20.10175','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050175','FTYUIOLJYT^*(PLKJYT)0175','42.72527871580696','129.36132362119366','G000088','1'),
	('GM000176','2019-10-01 17:21:17','卡车','卡车','192.168.20.10176','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050176','FTYUIOLJYT^*(PLKJYT)0176','42.20972633639479','129.67822035020993','G000088','1'),
	('GM000177','2019-10-06 10:03:49','小超','小超','192.168.20.10177','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050177','FTYUIOLJYT^*(PLKJYT)0177','41.84966311447647','130.18247567834078','G000089','1'),
	('GM000178','2019-10-07 18:12:43','仓库货位','仓库货位','192.168.20.10178','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050178','FTYUIOLJYT^*(PLKJYT)0178','41.68013004390122','130.36142786404864','G000089','1'),
	('GM000179','2019-09-30 08:17:49','卡车','卡车','192.168.20.10179','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050179','FTYUIOLJYT^*(PLKJYT)0179','39.856194317951235','130.660297582594','G000090','1'),
	('GM000180','2019-10-11 14:04:13','小超','小超','192.168.20.10180','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050180','FTYUIOLJYT^*(PLKJYT)0180','42.24211150795362','131.5975481495685','G000090','1'),
	('GM000181','2019-10-16 18:42:16','仓库货位','仓库货位','192.168.20.10181','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050181','FTYUIOLJYT^*(PLKJYT)0181','42.4097199022378','129.8723873256772','G000091','1'),
	('GM000182','2019-10-14 13:03:57','卡车','卡车','192.168.20.10182','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050182','FTYUIOLJYT^*(PLKJYT)0182','40.37070986562102','130.5368029269352','G000091','1'),
	('GM000183','2019-10-04 16:27:23','小超','小超','192.168.20.10183','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050183','FTYUIOLJYT^*(PLKJYT)0183','40.60237124964027','130.2614932480972','G000092','1'),
	('GM000184','2019-09-30 01:56:00','仓库货位','仓库货位','192.168.20.10184','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050184','FTYUIOLJYT^*(PLKJYT)0184','41.66397870558165','130.83898233269957','G000092','1'),
	('GM000185','2019-09-25 09:19:58','卡车','卡车','192.168.20.10185','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050185','FTYUIOLJYT^*(PLKJYT)0185','40.549536425748464','131.76821949969047','G000093','1'),
	('GM000186','2019-10-03 04:16:56','小超','小超','192.168.20.10186','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050186','FTYUIOLJYT^*(PLKJYT)0186','41.090055285099375','131.05585372931296','G000093','1'),
	('GM000187','2019-10-08 22:20:00','仓库货位','仓库货位','192.168.20.10187','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050187','FTYUIOLJYT^*(PLKJYT)0187','41.48213339570723','130.13487127985877','G000094','1'),
	('GM000188','2019-10-03 14:44:16','卡车','卡车','192.168.20.10188','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050188','FTYUIOLJYT^*(PLKJYT)0188','42.31161154616188','130.518203503756','G000094','1'),
	('GM000189','2019-09-29 16:29:28','小超','小超','192.168.20.10189','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050189','FTYUIOLJYT^*(PLKJYT)0189','40.62432544238136','129.44612596451196','G000095','1'),
	('GM000190','2019-09-27 12:07:40','仓库货位','仓库货位','192.168.20.10190','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050190','FTYUIOLJYT^*(PLKJYT)0190','41.90987893570736','131.3677973398106','G000095','1'),
	('GM000191','2019-10-15 10:25:04','卡车','卡车','192.168.20.10191','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050191','FTYUIOLJYT^*(PLKJYT)0191','42.17800028907591','130.7238473500972','G000096','1'),
	('GM000192','2019-09-26 09:13:58','小超','小超','192.168.20.10192','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050192','FTYUIOLJYT^*(PLKJYT)0192','42.7223871933374','130.9178306507658','G000096','1'),
	('GM000193','2019-10-12 23:47:37','仓库货位','仓库货位','192.168.20.10193','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050193','FTYUIOLJYT^*(PLKJYT)0193','42.671377966923195','131.9575486211419','G000097','1'),
	('GM000194','2019-09-29 03:47:37','卡车','卡车','192.168.20.10194','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050194','FTYUIOLJYT^*(PLKJYT)0194','41.19841801957674','131.0057970287723','G000097','1'),
	('GM000195','2019-10-08 09:52:21','小超','小超','192.168.20.10195','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050195','FTYUIOLJYT^*(PLKJYT)0195','41.40477275559542','129.5816914172126','G000098','1'),
	('GM000196','2019-10-04 22:24:33','仓库货位','仓库货位','192.168.20.10196','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050196','FTYUIOLJYT^*(PLKJYT)0196','41.21375425631603','131.64962909445114','G000098','1'),
	('GM000197','2019-10-06 08:01:07','卡车','卡车','192.168.20.10197','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050197','FTYUIOLJYT^*(PLKJYT)0197','40.89317170488188','129.49973323962277','G000099','1'),
	('GM000198','2019-09-29 07:50:18','小超','小超','192.168.20.10198','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050198','FTYUIOLJYT^*(PLKJYT)0198','41.11203008438941','130.3765668699271','G000099','1'),
	('GM000199','2019-10-08 13:43:54','仓库货位','仓库货位','192.168.20.10199','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050199','FTYUIOLJYT^*(PLKJYT)0199','42.47989990137835','131.5867878158692','G000100','1'),
	('GM000200','2019-10-01 05:40:53','卡车','卡车','192.168.20.10200','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050200','FTYUIOLJYT^*(PLKJYT)0200','39.934914639357196','131.07524280090823','G000100','1'),
	('GM000201','2019-10-14 16:08:30','小超','小超','192.168.20.10201','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050201','FTYUIOLJYT^*(PLKJYT)0201','40.110841433407174','130.10274307780546','G000101','1'),
	('GM000202','2019-09-27 13:53:54','仓库货位','仓库货位','192.168.20.10202','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050202','FTYUIOLJYT^*(PLKJYT)0202','39.83917148965','129.65128988295555','G000101','1'),
	('GM000203','2019-10-03 15:49:27','卡车','卡车','192.168.20.10203','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050203','FTYUIOLJYT^*(PLKJYT)0203','40.81271009898796','131.9311218037505','G000102','1'),
	('GM000204','2019-10-04 22:25:05','小超','小超','192.168.20.10204','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050204','FTYUIOLJYT^*(PLKJYT)0204','40.187628207805965','131.9373866278329','G000102','1'),
	('GM000205','2019-10-15 02:05:26','仓库货位','仓库货位','192.168.20.10205','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050205','FTYUIOLJYT^*(PLKJYT)0205','42.425591950590366','129.48192596704845','G000103','1'),
	('GM000206','2019-10-12 21:45:15','卡车','卡车','192.168.20.10206','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050206','FTYUIOLJYT^*(PLKJYT)0206','40.74620432844857','132.02765617025156','G000103','1'),
	('GM000207','2019-10-10 15:09:47','小超','小超','192.168.20.10207','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050207','FTYUIOLJYT^*(PLKJYT)0207','40.57889449244925','129.80585128948374','G000104','1'),
	('GM000208','2019-10-15 17:00:59','仓库货位','仓库货位','192.168.20.10208','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050208','FTYUIOLJYT^*(PLKJYT)0208','39.96392336614385','130.04698786587988','G000104','1'),
	('GM000209','2019-10-02 20:14:04','卡车','卡车','192.168.20.10209','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050209','FTYUIOLJYT^*(PLKJYT)0209','42.76606180789793','130.94990925271188','G000105','1'),
	('GM000210','2019-09-27 05:48:48','小超','小超','192.168.20.10210','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050210','FTYUIOLJYT^*(PLKJYT)0210','41.49146724666163','129.4170055938901','G000105','1'),
	('GM000211','2019-09-28 10:54:02','仓库货位','仓库货位','192.168.20.10211','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050211','FTYUIOLJYT^*(PLKJYT)0211','42.4276850787104','131.2185651331144','G000106','1'),
	('GM000212','2019-09-26 08:31:11','卡车','卡车','192.168.20.10212','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050212','FTYUIOLJYT^*(PLKJYT)0212','41.581116604956','129.2965711660218','G000106','1'),
	('GM000213','2019-10-12 06:07:39','小超','小超','192.168.20.10213','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050213','FTYUIOLJYT^*(PLKJYT)0213','42.471326874088106','131.30856235243937','G000107','1'),
	('GM000214','2019-10-08 23:19:29','仓库货位','仓库货位','192.168.20.10214','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050214','FTYUIOLJYT^*(PLKJYT)0214','40.872290405808634','129.42599087112814','G000107','1'),
	('GM000215','2019-10-14 12:48:29','卡车','卡车','192.168.20.10215','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050215','FTYUIOLJYT^*(PLKJYT)0215','42.18147488168467','130.66882045549653','G000108','1'),
	('GM000216','2019-10-11 10:28:22','小超','小超','192.168.20.10216','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050216','FTYUIOLJYT^*(PLKJYT)0216','41.50840814406282','130.22623535873132','G000108','1'),
	('GM000217','2019-10-03 15:48:23','仓库货位','仓库货位','192.168.20.10217','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050217','FTYUIOLJYT^*(PLKJYT)0217','40.56216202418315','129.9489856564107','G000109','1'),
	('GM000218','2019-10-02 09:10:05','卡车','卡车','192.168.20.10218','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050218','FTYUIOLJYT^*(PLKJYT)0218','42.64912475479788','130.34885653189983','G000109','1'),
	('GM000219','2019-10-06 16:08:37','小超','小超','192.168.20.10219','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050219','FTYUIOLJYT^*(PLKJYT)0219','40.13118256626181','130.481794571145','G000110','1'),
	('GM000220','2019-10-14 15:16:18','仓库货位','仓库货位','192.168.20.10220','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050220','FTYUIOLJYT^*(PLKJYT)0220','40.9744413164938','131.85587669369528','G000110','1'),
	('GM000221','2019-10-09 20:36:06','卡车','卡车','192.168.20.10221','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050221','FTYUIOLJYT^*(PLKJYT)0221','39.88735909439356','131.9764503801754','G000111','1'),
	('GM000222','2019-10-14 22:03:07','小超','小超','192.168.20.10222','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050222','FTYUIOLJYT^*(PLKJYT)0222','41.851699258517726','129.764357247936','G000111','1'),
	('GM000223','2019-09-28 02:10:45','仓库货位','仓库货位','192.168.20.10223','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050223','FTYUIOLJYT^*(PLKJYT)0223','40.70546755195183','129.45437844715565','G000112','1'),
	('GM000224','2019-10-13 04:54:10','卡车','卡车','192.168.20.10224','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050224','FTYUIOLJYT^*(PLKJYT)0224','41.7215772490737','131.5158658316076','G000112','1'),
	('GM000225','2019-09-27 00:09:17','小超','小超','192.168.20.10225','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050225','FTYUIOLJYT^*(PLKJYT)0225','39.89732902276217','132.0473310838781','G000113','1'),
	('GM000226','2019-09-30 02:50:39','仓库货位','仓库货位','192.168.20.10226','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050226','FTYUIOLJYT^*(PLKJYT)0226','41.11411217319862','132.24052093005804','G000113','1'),
	('GM000227','2019-10-09 21:42:58','卡车','卡车','192.168.20.10227','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050227','FTYUIOLJYT^*(PLKJYT)0227','40.99795740835834','130.1037820120556','G000114','1'),
	('GM000228','2019-09-26 13:28:28','小超','小超','192.168.20.10228','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050228','FTYUIOLJYT^*(PLKJYT)0228','40.330256842971245','129.95819193967964','G000114','1'),
	('GM000229','2019-10-06 02:56:03','仓库货位','仓库货位','192.168.20.10229','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050229','FTYUIOLJYT^*(PLKJYT)0229','40.393895448087356','129.7564415622137','G000115','1'),
	('GM000230','2019-09-25 01:05:50','卡车','卡车','192.168.20.10230','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050230','FTYUIOLJYT^*(PLKJYT)0230','40.409002786804145','131.59089009827466','G000115','1'),
	('GM000231','2019-10-10 13:04:20','小超','小超','192.168.20.10231','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050231','FTYUIOLJYT^*(PLKJYT)0231','39.873953650007756','132.22571196258633','G000116','1'),
	('GM000232','2019-10-03 16:44:31','仓库货位','仓库货位','192.168.20.10232','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050232','FTYUIOLJYT^*(PLKJYT)0232','41.87568616702533','132.11114138365417','G000116','1'),
	('GM000233','2019-10-10 01:26:05','卡车','卡车','192.168.20.10233','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050233','FTYUIOLJYT^*(PLKJYT)0233','41.233116681651666','129.84579947351514','G000117','1'),
	('GM000234','2019-10-11 03:03:48','小超','小超','192.168.20.10234','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050234','FTYUIOLJYT^*(PLKJYT)0234','42.1554449182244','132.097555125298','G000117','1'),
	('GM000235','2019-10-07 12:38:17','仓库货位','仓库货位','192.168.20.10235','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050235','FTYUIOLJYT^*(PLKJYT)0235','42.14663620317871','129.6674274983408','G000118','1'),
	('GM000236','2019-10-12 19:04:59','卡车','卡车','192.168.20.10236','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050236','FTYUIOLJYT^*(PLKJYT)0236','40.29920094973125','131.45288349822783','G000118','1'),
	('GM000237','2019-10-14 04:47:39','小超','小超','192.168.20.10237','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050237','FTYUIOLJYT^*(PLKJYT)0237','41.617153836197986','130.21971457820095','G000119','1'),
	('GM000238','2019-10-11 11:59:36','仓库货位','仓库货位','192.168.20.10238','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050238','FTYUIOLJYT^*(PLKJYT)0238','40.06094332519735','132.11922356277407','G000119','1'),
	('GM000239','2019-10-15 23:59:40','卡车','卡车','192.168.20.10239','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050239','FTYUIOLJYT^*(PLKJYT)0239','40.612593072160955','130.20046877439765','G000120','1'),
	('GM000240','2019-10-10 15:31:14','小超','小超','192.168.20.10240','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050240','FTYUIOLJYT^*(PLKJYT)0240','40.77803146000719','132.12289036906483','G000120','1'),
	('GM000241','2019-09-28 22:23:41','仓库货位','仓库货位','192.168.20.10241','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050241','FTYUIOLJYT^*(PLKJYT)0241','41.301630300594404','129.74621005102563','G000121','1'),
	('GM000242','2019-10-16 16:29:13','卡车','卡车','192.168.20.10242','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050242','FTYUIOLJYT^*(PLKJYT)0242','41.224907635445405','129.5367474834318','G000121','1'),
	('GM000243','2019-10-04 03:09:22','小超','小超','192.168.20.10243','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050243','FTYUIOLJYT^*(PLKJYT)0243','41.56755360481983','130.13859708242632','G000122','1'),
	('GM000244','2019-10-10 21:24:08','仓库货位','仓库货位','192.168.20.10244','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050244','FTYUIOLJYT^*(PLKJYT)0244','42.559807810120574','130.56492218828066','G000122','1'),
	('GM000245','2019-10-05 09:19:49','卡车','卡车','192.168.20.10245','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050245','FTYUIOLJYT^*(PLKJYT)0245','42.76660995685521','130.1011571493578','G000123','1'),
	('GM000246','2019-10-11 22:19:10','小超','小超','192.168.20.10246','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050246','FTYUIOLJYT^*(PLKJYT)0246','40.97922003465998','129.5539624511235','G000123','1'),
	('GM000247','2019-09-28 09:32:43','仓库货位','仓库货位','192.168.20.10247','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050247','FTYUIOLJYT^*(PLKJYT)0247','41.7855117527688','131.88847725158055','G000124','1'),
	('GM000248','2019-09-27 11:38:26','卡车','卡车','192.168.20.10248','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050248','FTYUIOLJYT^*(PLKJYT)0248','41.19201035447236','130.7013644619802','G000124','1'),
	('GM000249','2019-10-02 13:11:17','小超','小超','192.168.20.10249','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050249','FTYUIOLJYT^*(PLKJYT)0249','42.15224983146022','129.46911661356802','G000125','1'),
	('GM000250','2019-10-08 17:29:02','仓库货位','仓库货位','192.168.20.10250','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050250','FTYUIOLJYT^*(PLKJYT)0250','41.67100607145876','129.46837043532162','G000125','1'),
	('GM000251','2019-10-03 16:49:38','卡车','卡车','192.168.20.10251','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050251','FTYUIOLJYT^*(PLKJYT)0251','39.837978261657774','129.94387480991531','G000126','1'),
	('GM000252','2019-10-06 14:58:07','小超','小超','192.168.20.10252','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050252','FTYUIOLJYT^*(PLKJYT)0252','39.82169072181847','130.37600882370307','G000126','1'),
	('GM000253','2019-10-12 19:04:14','仓库货位','仓库货位','192.168.20.10253','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050253','FTYUIOLJYT^*(PLKJYT)0253','40.54436141266118','129.75375061061496','G000127','1'),
	('GM000254','2019-09-26 22:00:09','卡车','卡车','192.168.20.10254','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050254','FTYUIOLJYT^*(PLKJYT)0254','41.10345819233546','131.1541287403612','G000127','1'),
	('GM000255','2019-10-05 22:43:30','小超','小超','192.168.20.10255','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050255','FTYUIOLJYT^*(PLKJYT)0255','42.05490576928756','129.9386328415335','G000128','1'),
	('GM000256','2019-10-16 07:19:09','仓库货位','仓库货位','192.168.20.10256','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050256','FTYUIOLJYT^*(PLKJYT)0256','41.26715238198266','132.07092226751053','G000128','1');

insert into supplier_space_data values
	('SS000001','成都龙泉驿飞鹤路20号供货商独立管理区','02887654321','1876平方米','W000001','41.43797842011152','130.50731852236305','2019-10-08 02:19:40','1'),
	('SS000002','成都龙泉驿飞鹤路20号供货商独立管理区0002','028876543210002','1876平方米0002','W000001','40.31487719625355','130.13932588325855','2019-10-16 00:58:51','1'),
	('SS000003','成都龙泉驿飞鹤路20号供货商独立管理区0003','028876543210003','1876平方米0003','W000002','40.15892294256681','130.88165574066002','2019-10-02 04:10:46','1'),
	('SS000004','成都龙泉驿飞鹤路20号供货商独立管理区0004','028876543210004','1876平方米0004','W000002','40.81492068651556','130.36766954807746','2019-09-28 02:40:00','1');

insert into receiving_space_data values
	('RS000001','成都龙泉驿飞鹤路20号仓库卸货区','02887654321','每个收货区可以供一辆车卸货','1876平方米','W000001','42.07571192949716','132.13103401069623','2019-09-28 01:47:32','1'),
	('RS000002','成都龙泉驿飞鹤路20号仓库卸货区0002','028876543210002','每个收货区可以供一辆车卸货0002','1876平方米0002','W000001','42.07042786311577','131.5675378634298','2019-10-03 23:35:42','1'),
	('RS000003','成都龙泉驿飞鹤路20号仓库卸货区0003','028876543210003','每个收货区可以供一辆车卸货0003','1876平方米0003','W000002','42.587926282634136','129.3962912084822','2019-09-25 19:12:59','1'),
	('RS000004','成都龙泉驿飞鹤路20号仓库卸货区0004','028876543210004','每个收货区可以供一辆车卸货0004','1876平方米0004','W000002','42.42039745184602','130.22879968282305','2019-10-12 05:18:02','1');

insert into shipping_space_data values
	('SS000001','成都龙泉驿飞鹤路20号装货区','02887654321','1876平方米','W000001','42.68165074314698','131.1688318213503','每个收货区可以供一辆车装货','2019-10-02 17:59:34','1'),
	('SS000002','成都龙泉驿飞鹤路20号装货区0002','028876543210002','1876平方米0002','W000001','40.92418755970761','129.62008275184957','每个收货区可以供一辆车装货0002','2019-10-11 09:27:44','1'),
	('SS000003','成都龙泉驿飞鹤路20号装货区0003','028876543210003','1876平方米0003','W000002','41.28561783437218','130.2022032974751','每个收货区可以供一辆车装货0003','2019-09-27 04:41:41','1'),
	('SS000004','成都龙泉驿飞鹤路20号装货区0004','028876543210004','1876平方米0004','W000002','42.28196781178413','130.28313028202209','每个收货区可以供一辆车装货0004','2019-09-29 14:34:10','1');

insert into damage_space_data values
	('DS000001','成都龙泉驿飞鹤路20号仓库损坏货物堆放区','02887654321','1876平方米','41.71896962603013','130.3652679005716','W000001','2019-10-04 01:43:10','1'),
	('DS000002','成都龙泉驿飞鹤路20号仓库损坏货物堆放区0002','028876543210002','1876平方米0002','40.96782252600309','131.77506854032922','W000001','2019-10-16 14:35:36','1'),
	('DS000003','成都龙泉驿飞鹤路20号仓库损坏货物堆放区0003','028876543210003','1876平方米0003','41.36014397785433','131.0739340557134','W000002','2019-10-05 16:54:28','1'),
	('DS000004','成都龙泉驿飞鹤路20号仓库损坏货物堆放区0004','028876543210004','1876平方米0004','41.034677722350224','130.85072192335608','W000002','2019-10-15 08:45:40','1');

insert into warehouse_asset_data values
	('WA000001','叉车','备用件存放区设备库房','W000001','2019-10-16 18:34:21','1'),
	('WA000002','托盘','备用件存放区设备库房0002','W000001','2019-10-10 12:03:54','1'),
	('WA000003','传送带备件','备用件存放区设备库房0003','W000002','2019-10-16 06:41:24','1'),
	('WA000004','叉车','备用件存放区设备库房0004','W000002','2019-10-03 09:43:12','1');

insert into transport_fleet_data values
	('TF000001','双链先锋号车队','02887654321','RSCC000001','2019-10-09 16:00:09','1'),
	('TF000002','双链先锋号车队0002','028876543210002','RSCC000001','2019-10-09 07:25:30','1');

insert into transport_truck_data values
	('TT000001','运货卡车','川AK5','02887654321','VL9198','EN00102','2019-05-29','100万公里','红色','TF000001','1'),
	('TT000002','运货卡车0002','川AK50002','028876543210002','VL91980002','EN001020002','2019-09-20','100万公里0002','蓝色','TF000001','1'),
	('TT000003','运货卡车0003','川AK50003','028876543210003','VL91980003','EN001020003','2017-11-19','100万公里0003','白色','TF000002','1'),
	('TT000004','运货卡车0004','川AK50004','028876543210004','VL91980004','EN001020004','2019-03-21','100万公里0004','灰色','TF000002','1');

insert into truck_driver_data values
	('TD000001','运货卡车司机','51099887733','18777778888','TF000001','1'),
	('TD000002','运货卡车司机0002','510998877330002','13900000002','TF000001','1'),
	('TD000003','运货卡车司机0003','510998877330003','13900000003','TF000002','1'),
	('TD000004','运货卡车司机0004','510998877330004','13900000004','TF000002','1');

insert into transport_task_data values
	('TT000001','货运记录','双链二号仓','2019-03-22','RS000001','TD000001','TT000001','TF000001','41.429999074820095','131.6895052307268','1'),
	('TT000002','货运记录0002','双链二号仓0002','2016-12-07','RS000001','TD000001','TT000001','TF000001','42.62368563999','131.0698845346078','1'),
	('TT000003','货运记录0003','双链二号仓0003','2019-02-28','RS000002','TD000001','TT000001','TF000001','42.61824610442164','130.62126071751618','1'),
	('TT000004','货运记录0004','双链二号仓0004','2019-08-01','RS000002','TD000001','TT000001','TF000001','40.6221070316758','130.10464130355297','1'),
	('TT000005','货运记录0005','双链二号仓0005','2016-12-07','RS000003','TD000002','TT000002','TF000001','42.53169050040565','129.52017976485655','1'),
	('TT000006','货运记录0006','双链二号仓0006','2019-02-02','RS000003','TD000002','TT000002','TF000001','41.974813561250166','129.61739862657825','1'),
	('TT000007','货运记录0007','双链二号仓0007','2019-02-22','RS000004','TD000002','TT000002','TF000001','42.53807275693391','131.29958677099','1'),
	('TT000008','货运记录0008','双链二号仓0008','2018-01-30','RS000004','TD000002','TT000002','TF000001','40.894986609284494','129.52538938608495','1'),
	('TT000009','货运记录0009','双链二号仓0009','2019-04-16','RS000005','TD000003','TT000003','TF000002','42.05338823216972','132.17247132432453','1'),
	('TT000010','货运记录0010','双链二号仓0010','2017-02-16','RS000005','TD000003','TT000003','TF000002','42.58035335885815','131.9085878657426','1'),
	('TT000011','货运记录0011','双链二号仓0011','2019-05-28','RS000006','TD000003','TT000003','TF000002','39.80912121004299','131.94526905387576','1'),
	('TT000012','货运记录0012','双链二号仓0012','2018-10-15','RS000006','TD000003','TT000003','TF000002','40.823683584594804','131.17645874759833','1'),
	('TT000013','货运记录0013','双链二号仓0013','2019-10-02','RS000007','TD000004','TT000004','TF000002','40.464733986561214','129.948267997387','1'),
	('TT000014','货运记录0014','双链二号仓0014','2017-01-03','RS000007','TD000004','TT000004','TF000002','41.74626341161806','130.25046492045564','1'),
	('TT000015','货运记录0015','双链二号仓0015','2019-01-13','RS000008','TD000004','TT000004','TF000002','41.768464642351326','132.23824403100667','1'),
	('TT000016','货运记录0016','双链二号仓0016','2018-04-23','RS000008','TD000004','TT000004','TF000002','42.51666880264475','131.3507086152916','1');

insert into transport_task_track_data values
	('TTT000001','2018-08-27','32.380389409263934','105.53909858591258','TT000001','1'),
	('TTT000002','2018-09-24','30.246430253896666','104.74925311994714','TT000001','1'),
	('TTT000003','2017-11-28','31.846504994272237','104.3342632310849','TT000002','1'),
	('TTT000004','2017-07-20','31.25388632073376','103.18167268436359','TT000002','1'),
	('TTT000005','2018-06-12','32.70988359677361','105.48143194337975','TT000003','1'),
	('TTT000006','2017-09-03','31.130337209178382','103.35976194531241','TT000003','1'),
	('TTT000007','2017-09-19','32.21276268410747','105.0072021445286','TT000004','1'),
	('TTT000008','2018-11-25','32.165597612527236','105.37508066964249','TT000004','1'),
	('TTT000009','2019-08-31','30.166282273886434','104.56134047255291','TT000005','1'),
	('TTT000010','2016-10-19','31.04181526100899','104.65656407903334','TT000005','1'),
	('TTT000011','2017-06-18','30.75755469284239','104.62172877981223','TT000006','1'),
	('TTT000012','2019-03-23','30.239094991531786','103.40145351814945','TT000006','1'),
	('TTT000013','2017-07-02','31.078440301141658','104.5791615840979','TT000007','1'),
	('TTT000014','2018-06-11','31.47972038339519','105.15142768957932','TT000007','1'),
	('TTT000015','2018-11-08','29.937817635842848','105.36405896716015','TT000008','1'),
	('TTT000016','2017-09-27','29.999657206199295','104.85459878456594','TT000008','1'),
	('TTT000017','2017-08-16','30.38822455256393','103.40476100525403','TT000009','1'),
	('TTT000018','2019-06-15','30.969571543493476','103.66548703979944','TT000009','1'),
	('TTT000019','2018-07-06','31.342584856014593','104.69411281838096','TT000010','1'),
	('TTT000020','2018-11-28','32.01593336084641','103.25548441759402','TT000010','1'),
	('TTT000021','2018-11-20','32.56305631725985','105.09045667265711','TT000011','1'),
	('TTT000022','2017-10-24','32.31570819250238','104.01515503617198','TT000011','1'),
	('TTT000023','2017-02-14','32.5732119588244','103.33447418432476','TT000012','1'),
	('TTT000024','2018-09-08','31.34608968961247','105.7221153531141','TT000012','1'),
	('TTT000025','2019-09-25','32.343791160786964','104.1587502626822','TT000013','1'),
	('TTT000026','2018-02-25','32.394755153613104','105.28492886779878','TT000013','1'),
	('TTT000027','2019-08-22','31.613740460874446','103.47726314029724','TT000014','1'),
	('TTT000028','2018-07-16','31.597912675600877','104.83081164607233','TT000014','1'),
	('TTT000029','2019-09-09','30.88045758902942','103.5326699312384','TT000015','1'),
	('TTT000030','2018-10-11','32.43525159593587','105.72496313650521','TT000015','1'),
	('TTT000031','2018-07-09','32.38991648431193','103.75631629980737','TT000016','1'),
	('TTT000032','2016-12-24','31.525749237652565','103.14963145352966','TT000016','1');

insert into account_set_data values
	('AS000001','账套2017','2017年','2019-02-15','企业会计制度','RMB','人民币','招商银行','33265805054885','RSCC000001','RS000001','GS000001','2019-09-26 09:40:37','1'),
	('AS000002','账套2018','2018年','2019-03-24','小企业会计制度','USD','美元','工商银行','332658050548850002','RSCC000001','RS000001','GS000001','2019-10-13 14:12:56','1'),
	('AS000003','账套2019','2019年','2017-07-05','合伙制会计制度','RMB','人民币','招商银行','332658050548850003','RSCC000001','RS000002','GS000001','2019-10-04 17:07:00','1'),
	('AS000004','账套2017','2017年','2019-06-07','企业会计制度','USD','美元','工商银行','332658050548850004','RSCC000001','RS000002','GS000001','2019-10-09 12:37:20','1'),
	('AS000005','账套2018','2018年','2019-03-14','小企业会计制度','RMB','人民币','招商银行','332658050548850005','RSCC000001','RS000003','GS000001','2019-10-14 11:05:18','1'),
	('AS000006','账套2019','2019年','2018-02-18','合伙制会计制度','USD','美元','工商银行','332658050548850006','RSCC000001','RS000003','GS000001','2019-10-08 09:25:19','1'),
	('AS000007','账套2017','2017年','2019-07-20','企业会计制度','RMB','人民币','招商银行','332658050548850007','RSCC000001','RS000004','GS000001','2019-10-03 06:05:56','1'),
	('AS000008','账套2018','2018年','2017-12-25','小企业会计制度','USD','美元','工商银行','332658050548850008','RSCC000001','RS000004','GS000001','2019-10-14 21:54:10','1'),
	('AS000009','账套2019','2019年','2016-12-26','合伙制会计制度','RMB','人民币','招商银行','332658050548850009','RSCC000001','RS000005','GS000002','2019-10-14 17:59:58','1'),
	('AS000010','账套2017','2017年','2019-05-08','企业会计制度','USD','美元','工商银行','332658050548850010','RSCC000001','RS000005','GS000002','2019-10-10 17:09:17','1'),
	('AS000011','账套2018','2018年','2018-12-11','小企业会计制度','RMB','人民币','招商银行','332658050548850011','RSCC000001','RS000006','GS000002','2019-10-03 00:45:09','1'),
	('AS000012','账套2019','2019年','2019-01-17','合伙制会计制度','USD','美元','工商银行','332658050548850012','RSCC000001','RS000006','GS000002','2019-10-14 02:05:25','1'),
	('AS000013','账套2017','2017年','2017-01-30','企业会计制度','RMB','人民币','招商银行','332658050548850013','RSCC000001','RS000007','GS000002','2019-09-26 02:47:57','1'),
	('AS000014','账套2018','2018年','2018-08-28','小企业会计制度','USD','美元','工商银行','332658050548850014','RSCC000001','RS000007','GS000002','2019-10-15 03:53:53','1'),
	('AS000015','账套2019','2019年','2018-08-23','合伙制会计制度','RMB','人民币','招商银行','332658050548850015','RSCC000001','RS000008','GS000002','2019-09-27 23:19:35','1'),
	('AS000016','账套2017','2017年','2016-12-28','企业会计制度','USD','美元','工商银行','332658050548850016','RSCC000001','RS000008','GS000002','2019-09-26 02:12:20','1');
=======
	('W000001','成都龙泉驿飞鹤路20号','1296326757','187672平方米','RSCC000001','40.938176537459434','131.8471626190384','2019-11-29 05:51:50','1'),
	('W000002','成都龙泉驿飞鹤路20号0002','2331592089','187672平方米0002','RSCC000001','40.802480102225424','129.63690757963099','2019-11-29 09:42:08','1');

insert into storage_space_data values
	('SS000001','成都龙泉驿飞鹤路20号存货区','1819062865','1876平方米','W000001','41.683743767493254','130.23482755442555','2019-11-18 16:05:43','1'),
	('SS000002','成都龙泉驿飞鹤路20号存货区0002','1597903172','1876平方米0002','W000001','41.606940113892776','131.58415033177076','2019-11-20 06:28:41','1'),
	('SS000003','成都龙泉驿飞鹤路20号存货区0003','459808863','1876平方米0003','W000002','41.87044616424459','131.1278618934824','2019-11-20 11:00:37','1'),
	('SS000004','成都龙泉驿飞鹤路20号存货区0004','176248512','1876平方米0004','W000002','41.58701295287594','131.05482059202936','2019-12-03 21:46:18','1');

insert into smart_pallet_data values
	('SP000001','成都龙泉驿飞鹤路20号移动区域，比如过道，货运通道等','806712937','1876平方米','42.71725307913867','131.10747367618632','W000001','2019-11-27 23:29:59','1'),
	('SP000002','成都龙泉驿飞鹤路20号移动区域，比如过道，货运通道等0002','846391392','1876平方米0002','42.263707713271565','131.3318835708494','W000001','2019-11-24 01:42:51','1'),
	('SP000003','成都龙泉驿飞鹤路20号移动区域，比如过道，货运通道等0003','36870592','1876平方米0003','40.398044279715535','131.62244955750313','W000002','2019-11-15 11:05:46','1'),
	('SP000004','成都龙泉驿飞鹤路20号移动区域，比如过道，货运通道等0004','1442403814','1876平方米0004','41.99217995318979','129.72914196825536','W000002','2019-11-20 21:37:27','1');

insert into goods_shelf_data values
	('GS000001','成都龙泉驿飞鹤路20号存货区货架','SS000001','SS000001','DS000001','2019-11-24 01:39:40','1'),
	('GS000002','成都龙泉驿飞鹤路20号存货区货架0002','SS000001','SS000001','DS000001','2019-12-02 17:34:30','1'),
	('GS000003','成都龙泉驿飞鹤路20号存货区货架0003','SS000002','SS000002','DS000002','2019-11-23 13:03:38','1'),
	('GS000004','成都龙泉驿飞鹤路20号存货区货架0004','SS000002','SS000002','DS000002','2019-11-25 07:51:10','1'),
	('GS000005','成都龙泉驿飞鹤路20号存货区货架0005','SS000003','SS000003','DS000003','2019-11-30 01:35:56','1'),
	('GS000006','成都龙泉驿飞鹤路20号存货区货架0006','SS000003','SS000003','DS000003','2019-11-27 03:31:52','1'),
	('GS000007','成都龙泉驿飞鹤路20号存货区货架0007','SS000004','SS000004','DS000004','2019-11-19 23:57:46','1'),
	('GS000008','成都龙泉驿飞鹤路20号存货区货架0008','SS000004','SS000004','DS000004','2019-11-21 06:11:56','1');

insert into goods_shelf_stock_count_data values
	('GSSC000001','每日盘点','2018-04-03','使用先进的rfid技术，没有任何错误','GS000001','1'),
	('GSSC000002','每周盘点','2018-05-26','使用先进的rfid技术，没有任何错误0002','GS000001','1'),
	('GSSC000003','每月盘点','2018-09-05','使用先进的rfid技术，没有任何错误0003','GS000002','1'),
	('GSSC000004','年终盘点','2017-04-20','使用先进的rfid技术，没有任何错误0004','GS000002','1'),
	('GSSC000005','每日盘点','2017-11-18','使用先进的rfid技术，没有任何错误0005','GS000003','1'),
	('GSSC000006','每周盘点','2019-01-26','使用先进的rfid技术，没有任何错误0006','GS000003','1'),
	('GSSC000007','每月盘点','2018-06-25','使用先进的rfid技术，没有任何错误0007','GS000004','1'),
	('GSSC000008','年终盘点','2019-08-24','使用先进的rfid技术，没有任何错误0008','GS000004','1'),
	('GSSC000009','每日盘点','2017-12-28','使用先进的rfid技术，没有任何错误0009','GS000005','1'),
	('GSSC000010','每周盘点','2018-10-25','使用先进的rfid技术，没有任何错误0010','GS000005','1'),
	('GSSC000011','每月盘点','2017-02-19','使用先进的rfid技术，没有任何错误0011','GS000006','1'),
	('GSSC000012','年终盘点','2019-10-18','使用先进的rfid技术，没有任何错误0012','GS000006','1'),
	('GSSC000013','每日盘点','2018-05-06','使用先进的rfid技术，没有任何错误0013','GS000007','1'),
	('GSSC000014','每周盘点','2019-01-28','使用先进的rfid技术，没有任何错误0014','GS000007','1'),
	('GSSC000015','每月盘点','2017-01-09','使用先进的rfid技术，没有任何错误0015','GS000008','1'),
	('GSSC000016','年终盘点','2019-04-13','使用先进的rfid技术，没有任何错误0016','GS000008','1');

insert into stock_count_issue_track_data values
	('SCIT000001','盘点差错','2017-03-16','发现错误已经修正完成','GSSC000001','1'),
	('SCIT000002','盘点差错0002','2018-07-03','发现错误已经修正完成0002','GSSC000001','1'),
	('SCIT000003','盘点差错0003','2017-07-13','发现错误已经修正完成0003','GSSC000002','1'),
	('SCIT000004','盘点差错0004','2017-01-04','发现错误已经修正完成0004','GSSC000002','1'),
	('SCIT000005','盘点差错0005','2018-01-11','发现错误已经修正完成0005','GSSC000003','1'),
	('SCIT000006','盘点差错0006','2018-05-28','发现错误已经修正完成0006','GSSC000003','1'),
	('SCIT000007','盘点差错0007','2017-02-02','发现错误已经修正完成0007','GSSC000004','1'),
	('SCIT000008','盘点差错0008','2018-01-08','发现错误已经修正完成0008','GSSC000004','1'),
	('SCIT000009','盘点差错0009','2018-12-23','发现错误已经修正完成0009','GSSC000005','1'),
	('SCIT000010','盘点差错0010','2017-03-22','发现错误已经修正完成0010','GSSC000005','1'),
	('SCIT000011','盘点差错0011','2017-02-05','发现错误已经修正完成0011','GSSC000006','1'),
	('SCIT000012','盘点差错0012','2019-03-23','发现错误已经修正完成0012','GSSC000006','1'),
	('SCIT000013','盘点差错0013','2017-11-15','发现错误已经修正完成0013','GSSC000007','1'),
	('SCIT000014','盘点差错0014','2017-02-12','发现错误已经修正完成0014','GSSC000007','1'),
	('SCIT000015','盘点差错0015','2018-06-17','发现错误已经修正完成0015','GSSC000008','1'),
	('SCIT000016','盘点差错0016','2019-05-01','发现错误已经修正完成0016','GSSC000008','1'),
	('SCIT000017','盘点差错0017','2018-10-16','发现错误已经修正完成0017','GSSC000009','1'),
	('SCIT000018','盘点差错0018','2017-01-31','发现错误已经修正完成0018','GSSC000009','1'),
	('SCIT000019','盘点差错0019','2018-01-22','发现错误已经修正完成0019','GSSC000010','1'),
	('SCIT000020','盘点差错0020','2017-01-31','发现错误已经修正完成0020','GSSC000010','1'),
	('SCIT000021','盘点差错0021','2019-11-10','发现错误已经修正完成0021','GSSC000011','1'),
	('SCIT000022','盘点差错0022','2018-08-27','发现错误已经修正完成0022','GSSC000011','1'),
	('SCIT000023','盘点差错0023','2019-06-14','发现错误已经修正完成0023','GSSC000012','1'),
	('SCIT000024','盘点差错0024','2017-05-26','发现错误已经修正完成0024','GSSC000012','1'),
	('SCIT000025','盘点差错0025','2019-01-06','发现错误已经修正完成0025','GSSC000013','1'),
	('SCIT000026','盘点差错0026','2018-11-14','发现错误已经修正完成0026','GSSC000013','1'),
	('SCIT000027','盘点差错0027','2018-04-15','发现错误已经修正完成0027','GSSC000014','1'),
	('SCIT000028','盘点差错0028','2018-02-17','发现错误已经修正完成0028','GSSC000014','1'),
	('SCIT000029','盘点差错0029','2018-08-31','发现错误已经修正完成0029','GSSC000015','1'),
	('SCIT000030','盘点差错0030','2017-01-10','发现错误已经修正完成0030','GSSC000015','1'),
	('SCIT000031','盘点差错0031','2018-09-10','发现错误已经修正完成0031','GSSC000016','1'),
	('SCIT000032','盘点差错0032','2017-10-15','发现错误已经修正完成0032','GSSC000016','1');

insert into goods_allocation_data values
	('GA000001','成都龙泉驿飞鹤路20号存货区货架20号货位','40.874303168284854','131.79183356117312','GS000001','1'),
	('GA000002','成都龙泉驿飞鹤路20号存货区货架20号货位0002','41.553920303343716','129.31100717011626','GS000001','1'),
	('GA000003','成都龙泉驿飞鹤路20号存货区货架20号货位0003','40.56017313572548','130.98563897149018','GS000002','1'),
	('GA000004','成都龙泉驿飞鹤路20号存货区货架20号货位0004','41.13991439245281','130.21076636606827','GS000002','1'),
	('GA000005','成都龙泉驿飞鹤路20号存货区货架20号货位0005','42.63458455575752','131.39391964732366','GS000003','1'),
	('GA000006','成都龙泉驿飞鹤路20号存货区货架20号货位0006','39.83940494792347','131.41073649046675','GS000003','1'),
	('GA000007','成都龙泉驿飞鹤路20号存货区货架20号货位0007','42.74923032289445','130.28793240664058','GS000004','1'),
	('GA000008','成都龙泉驿飞鹤路20号存货区货架20号货位0008','42.239713607251964','131.77484345117182','GS000004','1'),
	('GA000009','成都龙泉驿飞鹤路20号存货区货架20号货位0009','40.32320699613243','130.36872785700646','GS000005','1'),
	('GA000010','成都龙泉驿飞鹤路20号存货区货架20号货位0010','40.70587099060041','129.3408090217956','GS000005','1'),
	('GA000011','成都龙泉驿飞鹤路20号存货区货架20号货位0011','41.84934256897911','130.19289327725383','GS000006','1'),
	('GA000012','成都龙泉驿飞鹤路20号存货区货架20号货位0012','42.54745326611285','130.00343260987486','GS000006','1'),
	('GA000013','成都龙泉驿飞鹤路20号存货区货架20号货位0013','42.40319424081602','131.71410480167583','GS000007','1'),
	('GA000014','成都龙泉驿飞鹤路20号存货区货架20号货位0014','41.817578748382886','131.9022295094202','GS000007','1'),
	('GA000015','成都龙泉驿飞鹤路20号存货区货架20号货位0015','41.26130193635158','130.9913615893129','GS000008','1'),
	('GA000016','成都龙泉驿飞鹤路20号存货区货架20号货位0016','40.320082711541666','131.60482539098254','GS000008','1');

insert into goods_data values
	('G000001','可口可乐','RF99192','件','8','2018-02-15','S000001','RS000001','GA000001','SP000001','SS000001','TT000001','RS000001','SO000001','RSO000001','GP000001','1'),
	('G000002','可口可乐0002','RF991920002','箱','8','2019-02-09','S000001','RS000001','GA000001','SP000001','SS000001','TT000001','RS000001','SO000001','RSO000001','GP000001','1'),
	('G000003','可口可乐0003','RF991920003','件','10','2019-11-03','S000002','RS000001','GA000001','SP000001','SS000001','TT000001','RS000001','SO000001','RSO000001','GP000001','1'),
	('G000004','可口可乐0004','RF991920004','箱','9','2017-06-21','S000002','RS000001','GA000001','SP000001','SS000001','TT000001','RS000001','SO000001','RSO000001','GP000001','1'),
	('G000005','可口可乐0005','RF991920005','件','10','2019-06-12','S000003','RS000001','GA000001','SP000001','SS000001','TT000001','RS000001','SO000001','RSO000001','GP000001','1'),
	('G000006','可口可乐0006','RF991920006','箱','8','2017-02-01','S000003','RS000001','GA000001','SP000001','SS000001','TT000001','RS000001','SO000001','RSO000001','GP000001','1'),
	('G000007','可口可乐0007','RF991920007','件','8','2017-02-05','S000004','RS000001','GA000001','SP000001','SS000001','TT000001','RS000001','SO000001','RSO000001','GP000001','1'),
	('G000008','可口可乐0008','RF991920008','箱','8','2017-04-14','S000004','RS000001','GA000001','SP000001','SS000001','TT000001','RS000001','SO000001','RSO000001','GP000001','1'),
	('G000009','可口可乐0009','RF991920009','件','10','2016-12-09','S000005','RS000001','GA000002','SP000001','SS000001','TT000002','RS000001','SO000001','RSO000002','GP000001','1'),
	('G000010','可口可乐0010','RF991920010','箱','8','2018-06-21','S000005','RS000001','GA000002','SP000001','SS000001','TT000002','RS000001','SO000001','RSO000002','GP000001','1'),
	('G000011','可口可乐0011','RF991920011','件','8','2019-04-19','S000006','RS000001','GA000002','SP000001','SS000001','TT000002','RS000001','SO000001','RSO000002','GP000001','1'),
	('G000012','可口可乐0012','RF991920012','箱','8','2019-01-17','S000006','RS000001','GA000002','SP000001','SS000001','TT000002','RS000001','SO000001','RSO000002','GP000001','1'),
	('G000013','可口可乐0013','RF991920013','件','8','2019-07-29','S000007','RS000001','GA000002','SP000001','SS000001','TT000002','RS000001','SO000001','RSO000002','GP000001','1'),
	('G000014','可口可乐0014','RF991920014','箱','8','2017-09-26','S000007','RS000001','GA000002','SP000001','SS000001','TT000002','RS000001','SO000001','RSO000002','GP000001','1'),
	('G000015','可口可乐0015','RF991920015','件','10','2018-05-04','S000008','RS000001','GA000002','SP000001','SS000001','TT000002','RS000001','SO000001','RSO000002','GP000001','1'),
	('G000016','可口可乐0016','RF991920016','箱','8','2019-04-21','S000008','RS000001','GA000002','SP000001','SS000001','TT000002','RS000001','SO000001','RSO000002','GP000001','1'),
	('G000017','可口可乐0017','RF991920017','件','9','2018-04-05','S000009','RS000001','GA000003','SP000001','SS000001','TT000003','RS000002','SO000001','RSO000003','GP000001','1'),
	('G000018','可口可乐0018','RF991920018','箱','8','2017-07-09','S000009','RS000001','GA000003','SP000001','SS000001','TT000003','RS000002','SO000001','RSO000003','GP000001','1'),
	('G000019','可口可乐0019','RF991920019','件','9','2019-03-04','S000010','RS000001','GA000003','SP000001','SS000001','TT000003','RS000002','SO000001','RSO000003','GP000001','1'),
	('G000020','可口可乐0020','RF991920020','箱','10','2019-07-22','S000010','RS000001','GA000003','SP000001','SS000001','TT000003','RS000002','SO000001','RSO000003','GP000001','1'),
	('G000021','可口可乐0021','RF991920021','件','9','2017-11-20','S000011','RS000001','GA000003','SP000001','SS000001','TT000003','RS000002','SO000001','RSO000003','GP000001','1'),
	('G000022','可口可乐0022','RF991920022','箱','9','2017-01-08','S000011','RS000001','GA000003','SP000001','SS000001','TT000003','RS000002','SO000001','RSO000003','GP000001','1'),
	('G000023','可口可乐0023','RF991920023','件','10','2019-04-04','S000012','RS000001','GA000003','SP000001','SS000001','TT000003','RS000002','SO000001','RSO000003','GP000001','1'),
	('G000024','可口可乐0024','RF991920024','箱','8','2019-04-06','S000012','RS000001','GA000003','SP000001','SS000001','TT000003','RS000002','SO000001','RSO000003','GP000001','1'),
	('G000025','可口可乐0025','RF991920025','件','10','2018-06-09','S000013','RS000001','GA000004','SP000001','SS000001','TT000004','RS000002','SO000001','RSO000004','GP000001','1'),
	('G000026','可口可乐0026','RF991920026','箱','8','2018-12-06','S000013','RS000001','GA000004','SP000001','SS000001','TT000004','RS000002','SO000001','RSO000004','GP000001','1'),
	('G000027','可口可乐0027','RF991920027','件','9','2019-05-30','S000014','RS000001','GA000004','SP000001','SS000001','TT000004','RS000002','SO000001','RSO000004','GP000001','1'),
	('G000028','可口可乐0028','RF991920028','箱','8','2018-04-16','S000014','RS000001','GA000004','SP000001','SS000001','TT000004','RS000002','SO000001','RSO000004','GP000001','1'),
	('G000029','可口可乐0029','RF991920029','件','8','2018-06-23','S000015','RS000001','GA000004','SP000001','SS000001','TT000004','RS000002','SO000001','RSO000004','GP000001','1'),
	('G000030','可口可乐0030','RF991920030','箱','8','2017-05-10','S000015','RS000001','GA000004','SP000001','SS000001','TT000004','RS000002','SO000001','RSO000004','GP000001','1'),
	('G000031','可口可乐0031','RF991920031','件','8','2019-09-09','S000016','RS000001','GA000004','SP000001','SS000001','TT000004','RS000002','SO000001','RSO000004','GP000001','1'),
	('G000032','可口可乐0032','RF991920032','箱','8','2018-08-21','S000016','RS000001','GA000004','SP000001','SS000001','TT000004','RS000002','SO000001','RSO000004','GP000001','1'),
	('G000033','可口可乐0033','RF991920033','件','10','2019-01-25','S000017','RS000002','GA000005','SP000002','SS000002','TT000005','RS000003','SO000002','RSO000005','GP000001','1'),
	('G000034','可口可乐0034','RF991920034','箱','8','2017-01-04','S000017','RS000002','GA000005','SP000002','SS000002','TT000005','RS000003','SO000002','RSO000005','GP000001','1'),
	('G000035','可口可乐0035','RF991920035','件','10','2017-10-31','S000018','RS000002','GA000005','SP000002','SS000002','TT000005','RS000003','SO000002','RSO000005','GP000001','1'),
	('G000036','可口可乐0036','RF991920036','箱','9','2019-02-13','S000018','RS000002','GA000005','SP000002','SS000002','TT000005','RS000003','SO000002','RSO000005','GP000001','1'),
	('G000037','可口可乐0037','RF991920037','件','10','2019-01-06','S000019','RS000002','GA000005','SP000002','SS000002','TT000005','RS000003','SO000002','RSO000005','GP000001','1'),
	('G000038','可口可乐0038','RF991920038','箱','9','2017-09-22','S000019','RS000002','GA000005','SP000002','SS000002','TT000005','RS000003','SO000002','RSO000005','GP000001','1'),
	('G000039','可口可乐0039','RF991920039','件','8','2019-05-24','S000020','RS000002','GA000005','SP000002','SS000002','TT000005','RS000003','SO000002','RSO000005','GP000001','1'),
	('G000040','可口可乐0040','RF991920040','箱','9','2018-05-13','S000020','RS000002','GA000005','SP000002','SS000002','TT000005','RS000003','SO000002','RSO000005','GP000001','1'),
	('G000041','可口可乐0041','RF991920041','件','10','2019-11-27','S000021','RS000002','GA000006','SP000002','SS000002','TT000006','RS000003','SO000002','RSO000006','GP000001','1'),
	('G000042','可口可乐0042','RF991920042','箱','8','2018-12-23','S000021','RS000002','GA000006','SP000002','SS000002','TT000006','RS000003','SO000002','RSO000006','GP000001','1'),
	('G000043','可口可乐0043','RF991920043','件','10','2018-07-28','S000022','RS000002','GA000006','SP000002','SS000002','TT000006','RS000003','SO000002','RSO000006','GP000001','1'),
	('G000044','可口可乐0044','RF991920044','箱','8','2018-04-07','S000022','RS000002','GA000006','SP000002','SS000002','TT000006','RS000003','SO000002','RSO000006','GP000001','1'),
	('G000045','可口可乐0045','RF991920045','件','8','2018-05-10','S000023','RS000002','GA000006','SP000002','SS000002','TT000006','RS000003','SO000002','RSO000006','GP000001','1'),
	('G000046','可口可乐0046','RF991920046','箱','10','2018-12-30','S000023','RS000002','GA000006','SP000002','SS000002','TT000006','RS000003','SO000002','RSO000006','GP000001','1'),
	('G000047','可口可乐0047','RF991920047','件','8','2017-05-17','S000024','RS000002','GA000006','SP000002','SS000002','TT000006','RS000003','SO000002','RSO000006','GP000001','1'),
	('G000048','可口可乐0048','RF991920048','箱','9','2017-10-22','S000024','RS000002','GA000006','SP000002','SS000002','TT000006','RS000003','SO000002','RSO000006','GP000001','1'),
	('G000049','可口可乐0049','RF991920049','件','9','2017-07-05','S000025','RS000002','GA000007','SP000002','SS000002','TT000007','RS000004','SO000002','RSO000007','GP000001','1'),
	('G000050','可口可乐0050','RF991920050','箱','10','2019-09-10','S000025','RS000002','GA000007','SP000002','SS000002','TT000007','RS000004','SO000002','RSO000007','GP000001','1'),
	('G000051','可口可乐0051','RF991920051','件','9','2019-08-24','S000026','RS000002','GA000007','SP000002','SS000002','TT000007','RS000004','SO000002','RSO000007','GP000001','1'),
	('G000052','可口可乐0052','RF991920052','箱','10','2017-11-06','S000026','RS000002','GA000007','SP000002','SS000002','TT000007','RS000004','SO000002','RSO000007','GP000001','1'),
	('G000053','可口可乐0053','RF991920053','件','8','2018-08-04','S000027','RS000002','GA000007','SP000002','SS000002','TT000007','RS000004','SO000002','RSO000007','GP000001','1'),
	('G000054','可口可乐0054','RF991920054','箱','9','2019-05-30','S000027','RS000002','GA000007','SP000002','SS000002','TT000007','RS000004','SO000002','RSO000007','GP000001','1'),
	('G000055','可口可乐0055','RF991920055','件','10','2018-01-22','S000028','RS000002','GA000007','SP000002','SS000002','TT000007','RS000004','SO000002','RSO000007','GP000001','1'),
	('G000056','可口可乐0056','RF991920056','箱','9','2019-04-15','S000028','RS000002','GA000007','SP000002','SS000002','TT000007','RS000004','SO000002','RSO000007','GP000001','1'),
	('G000057','可口可乐0057','RF991920057','件','8','2017-02-15','S000029','RS000002','GA000008','SP000002','SS000002','TT000008','RS000004','SO000002','RSO000008','GP000001','1'),
	('G000058','可口可乐0058','RF991920058','箱','10','2018-04-18','S000029','RS000002','GA000008','SP000002','SS000002','TT000008','RS000004','SO000002','RSO000008','GP000001','1'),
	('G000059','可口可乐0059','RF991920059','件','9','2017-02-15','S000030','RS000002','GA000008','SP000002','SS000002','TT000008','RS000004','SO000002','RSO000008','GP000001','1'),
	('G000060','可口可乐0060','RF991920060','箱','9','2018-09-29','S000030','RS000002','GA000008','SP000002','SS000002','TT000008','RS000004','SO000002','RSO000008','GP000001','1'),
	('G000061','可口可乐0061','RF991920061','件','8','2017-02-13','S000031','RS000002','GA000008','SP000002','SS000002','TT000008','RS000004','SO000002','RSO000008','GP000001','1'),
	('G000062','可口可乐0062','RF991920062','箱','8','2019-09-29','S000031','RS000002','GA000008','SP000002','SS000002','TT000008','RS000004','SO000002','RSO000008','GP000001','1'),
	('G000063','可口可乐0063','RF991920063','件','9','2018-10-30','S000032','RS000002','GA000008','SP000002','SS000002','TT000008','RS000004','SO000002','RSO000008','GP000001','1'),
	('G000064','可口可乐0064','RF991920064','箱','9','2018-08-17','S000032','RS000002','GA000008','SP000002','SS000002','TT000008','RS000004','SO000002','RSO000008','GP000001','1'),
	('G000065','可口可乐0065','RF991920065','件','9','2017-04-16','S000033','RS000003','GA000009','SP000003','SS000003','TT000009','RS000005','SO000003','RSO000009','GP000001','1'),
	('G000066','可口可乐0066','RF991920066','箱','9','2018-04-03','S000033','RS000003','GA000009','SP000003','SS000003','TT000009','RS000005','SO000003','RSO000009','GP000001','1'),
	('G000067','可口可乐0067','RF991920067','件','8','2018-05-29','S000034','RS000003','GA000009','SP000003','SS000003','TT000009','RS000005','SO000003','RSO000009','GP000001','1'),
	('G000068','可口可乐0068','RF991920068','箱','9','2018-03-26','S000034','RS000003','GA000009','SP000003','SS000003','TT000009','RS000005','SO000003','RSO000009','GP000001','1'),
	('G000069','可口可乐0069','RF991920069','件','9','2017-03-05','S000035','RS000003','GA000009','SP000003','SS000003','TT000009','RS000005','SO000003','RSO000009','GP000001','1'),
	('G000070','可口可乐0070','RF991920070','箱','9','2018-08-18','S000035','RS000003','GA000009','SP000003','SS000003','TT000009','RS000005','SO000003','RSO000009','GP000001','1'),
	('G000071','可口可乐0071','RF991920071','件','9','2019-06-02','S000036','RS000003','GA000009','SP000003','SS000003','TT000009','RS000005','SO000003','RSO000009','GP000001','1'),
	('G000072','可口可乐0072','RF991920072','箱','10','2019-04-07','S000036','RS000003','GA000009','SP000003','SS000003','TT000009','RS000005','SO000003','RSO000009','GP000001','1'),
	('G000073','可口可乐0073','RF991920073','件','9','2019-09-01','S000037','RS000003','GA000010','SP000003','SS000003','TT000010','RS000005','SO000003','RSO000010','GP000001','1'),
	('G000074','可口可乐0074','RF991920074','箱','10','2018-05-06','S000037','RS000003','GA000010','SP000003','SS000003','TT000010','RS000005','SO000003','RSO000010','GP000001','1'),
	('G000075','可口可乐0075','RF991920075','件','9','2018-02-03','S000038','RS000003','GA000010','SP000003','SS000003','TT000010','RS000005','SO000003','RSO000010','GP000001','1'),
	('G000076','可口可乐0076','RF991920076','箱','8','2019-12-03','S000038','RS000003','GA000010','SP000003','SS000003','TT000010','RS000005','SO000003','RSO000010','GP000001','1'),
	('G000077','可口可乐0077','RF991920077','件','9','2019-05-06','S000039','RS000003','GA000010','SP000003','SS000003','TT000010','RS000005','SO000003','RSO000010','GP000001','1'),
	('G000078','可口可乐0078','RF991920078','箱','9','2017-07-22','S000039','RS000003','GA000010','SP000003','SS000003','TT000010','RS000005','SO000003','RSO000010','GP000001','1'),
	('G000079','可口可乐0079','RF991920079','件','8','2018-08-24','S000040','RS000003','GA000010','SP000003','SS000003','TT000010','RS000005','SO000003','RSO000010','GP000001','1'),
	('G000080','可口可乐0080','RF991920080','箱','10','2017-05-25','S000040','RS000003','GA000010','SP000003','SS000003','TT000010','RS000005','SO000003','RSO000010','GP000001','1'),
	('G000081','可口可乐0081','RF991920081','件','10','2017-08-14','S000041','RS000003','GA000011','SP000003','SS000003','TT000011','RS000006','SO000003','RSO000011','GP000001','1'),
	('G000082','可口可乐0082','RF991920082','箱','8','2017-01-12','S000041','RS000003','GA000011','SP000003','SS000003','TT000011','RS000006','SO000003','RSO000011','GP000001','1'),
	('G000083','可口可乐0083','RF991920083','件','9','2018-12-24','S000042','RS000003','GA000011','SP000003','SS000003','TT000011','RS000006','SO000003','RSO000011','GP000001','1'),
	('G000084','可口可乐0084','RF991920084','箱','8','2018-06-26','S000042','RS000003','GA000011','SP000003','SS000003','TT000011','RS000006','SO000003','RSO000011','GP000001','1'),
	('G000085','可口可乐0085','RF991920085','件','9','2019-07-26','S000043','RS000003','GA000011','SP000003','SS000003','TT000011','RS000006','SO000003','RSO000011','GP000001','1'),
	('G000086','可口可乐0086','RF991920086','箱','10','2019-01-07','S000043','RS000003','GA000011','SP000003','SS000003','TT000011','RS000006','SO000003','RSO000011','GP000001','1'),
	('G000087','可口可乐0087','RF991920087','件','10','2018-01-11','S000044','RS000003','GA000011','SP000003','SS000003','TT000011','RS000006','SO000003','RSO000011','GP000001','1'),
	('G000088','可口可乐0088','RF991920088','箱','9','2019-08-26','S000044','RS000003','GA000011','SP000003','SS000003','TT000011','RS000006','SO000003','RSO000011','GP000001','1'),
	('G000089','可口可乐0089','RF991920089','件','8','2019-01-01','S000045','RS000003','GA000012','SP000003','SS000003','TT000012','RS000006','SO000003','RSO000012','GP000001','1'),
	('G000090','可口可乐0090','RF991920090','箱','10','2019-10-12','S000045','RS000003','GA000012','SP000003','SS000003','TT000012','RS000006','SO000003','RSO000012','GP000001','1'),
	('G000091','可口可乐0091','RF991920091','件','9','2018-08-23','S000046','RS000003','GA000012','SP000003','SS000003','TT000012','RS000006','SO000003','RSO000012','GP000001','1'),
	('G000092','可口可乐0092','RF991920092','箱','10','2017-09-06','S000046','RS000003','GA000012','SP000003','SS000003','TT000012','RS000006','SO000003','RSO000012','GP000001','1'),
	('G000093','可口可乐0093','RF991920093','件','8','2018-02-07','S000047','RS000003','GA000012','SP000003','SS000003','TT000012','RS000006','SO000003','RSO000012','GP000001','1'),
	('G000094','可口可乐0094','RF991920094','箱','9','2019-05-13','S000047','RS000003','GA000012','SP000003','SS000003','TT000012','RS000006','SO000003','RSO000012','GP000001','1'),
	('G000095','可口可乐0095','RF991920095','件','10','2018-09-25','S000048','RS000003','GA000012','SP000003','SS000003','TT000012','RS000006','SO000003','RSO000012','GP000001','1'),
	('G000096','可口可乐0096','RF991920096','箱','8','2019-11-05','S000048','RS000003','GA000012','SP000003','SS000003','TT000012','RS000006','SO000003','RSO000012','GP000001','1'),
	('G000097','可口可乐0097','RF991920097','件','8','2017-09-13','S000049','RS000004','GA000013','SP000004','SS000004','TT000013','RS000007','SO000004','RSO000013','GP000001','1'),
	('G000098','可口可乐0098','RF991920098','箱','10','2017-10-16','S000049','RS000004','GA000013','SP000004','SS000004','TT000013','RS000007','SO000004','RSO000013','GP000001','1'),
	('G000099','可口可乐0099','RF991920099','件','10','2017-02-20','S000050','RS000004','GA000013','SP000004','SS000004','TT000013','RS000007','SO000004','RSO000013','GP000001','1'),
	('G000100','可口可乐0100','RF991920100','箱','8','2017-03-04','S000050','RS000004','GA000013','SP000004','SS000004','TT000013','RS000007','SO000004','RSO000013','GP000001','1'),
	('G000101','可口可乐0101','RF991920101','件','8','2017-01-01','S000051','RS000004','GA000013','SP000004','SS000004','TT000013','RS000007','SO000004','RSO000013','GP000001','1'),
	('G000102','可口可乐0102','RF991920102','箱','10','2018-10-10','S000051','RS000004','GA000013','SP000004','SS000004','TT000013','RS000007','SO000004','RSO000013','GP000001','1'),
	('G000103','可口可乐0103','RF991920103','件','8','2019-05-21','S000052','RS000004','GA000013','SP000004','SS000004','TT000013','RS000007','SO000004','RSO000013','GP000001','1'),
	('G000104','可口可乐0104','RF991920104','箱','8','2017-03-29','S000052','RS000004','GA000013','SP000004','SS000004','TT000013','RS000007','SO000004','RSO000013','GP000001','1'),
	('G000105','可口可乐0105','RF991920105','件','9','2017-05-20','S000053','RS000004','GA000014','SP000004','SS000004','TT000014','RS000007','SO000004','RSO000014','GP000001','1'),
	('G000106','可口可乐0106','RF991920106','箱','10','2017-08-17','S000053','RS000004','GA000014','SP000004','SS000004','TT000014','RS000007','SO000004','RSO000014','GP000001','1'),
	('G000107','可口可乐0107','RF991920107','件','10','2017-04-23','S000054','RS000004','GA000014','SP000004','SS000004','TT000014','RS000007','SO000004','RSO000014','GP000001','1'),
	('G000108','可口可乐0108','RF991920108','箱','9','2017-08-15','S000054','RS000004','GA000014','SP000004','SS000004','TT000014','RS000007','SO000004','RSO000014','GP000001','1'),
	('G000109','可口可乐0109','RF991920109','件','9','2019-07-12','S000055','RS000004','GA000014','SP000004','SS000004','TT000014','RS000007','SO000004','RSO000014','GP000001','1'),
	('G000110','可口可乐0110','RF991920110','箱','8','2016-12-11','S000055','RS000004','GA000014','SP000004','SS000004','TT000014','RS000007','SO000004','RSO000014','GP000001','1'),
	('G000111','可口可乐0111','RF991920111','件','10','2019-03-28','S000056','RS000004','GA000014','SP000004','SS000004','TT000014','RS000007','SO000004','RSO000014','GP000001','1'),
	('G000112','可口可乐0112','RF991920112','箱','9','2017-11-10','S000056','RS000004','GA000014','SP000004','SS000004','TT000014','RS000007','SO000004','RSO000014','GP000001','1'),
	('G000113','可口可乐0113','RF991920113','件','8','2018-12-31','S000057','RS000004','GA000015','SP000004','SS000004','TT000015','RS000008','SO000004','RSO000015','GP000001','1'),
	('G000114','可口可乐0114','RF991920114','箱','9','2018-04-16','S000057','RS000004','GA000015','SP000004','SS000004','TT000015','RS000008','SO000004','RSO000015','GP000001','1'),
	('G000115','可口可乐0115','RF991920115','件','8','2019-03-05','S000058','RS000004','GA000015','SP000004','SS000004','TT000015','RS000008','SO000004','RSO000015','GP000001','1'),
	('G000116','可口可乐0116','RF991920116','箱','8','2018-08-10','S000058','RS000004','GA000015','SP000004','SS000004','TT000015','RS000008','SO000004','RSO000015','GP000001','1'),
	('G000117','可口可乐0117','RF991920117','件','10','2018-02-02','S000059','RS000004','GA000015','SP000004','SS000004','TT000015','RS000008','SO000004','RSO000015','GP000001','1'),
	('G000118','可口可乐0118','RF991920118','箱','10','2019-11-26','S000059','RS000004','GA000015','SP000004','SS000004','TT000015','RS000008','SO000004','RSO000015','GP000001','1'),
	('G000119','可口可乐0119','RF991920119','件','10','2019-03-12','S000060','RS000004','GA000015','SP000004','SS000004','TT000015','RS000008','SO000004','RSO000015','GP000001','1'),
	('G000120','可口可乐0120','RF991920120','箱','8','2017-05-10','S000060','RS000004','GA000015','SP000004','SS000004','TT000015','RS000008','SO000004','RSO000015','GP000001','1'),
	('G000121','可口可乐0121','RF991920121','件','8','2018-06-28','S000061','RS000004','GA000016','SP000004','SS000004','TT000016','RS000008','SO000004','RSO000016','GP000001','1'),
	('G000122','可口可乐0122','RF991920122','箱','10','2018-03-13','S000061','RS000004','GA000016','SP000004','SS000004','TT000016','RS000008','SO000004','RSO000016','GP000001','1'),
	('G000123','可口可乐0123','RF991920123','件','8','2018-12-20','S000062','RS000004','GA000016','SP000004','SS000004','TT000016','RS000008','SO000004','RSO000016','GP000001','1'),
	('G000124','可口可乐0124','RF991920124','箱','10','2019-10-24','S000062','RS000004','GA000016','SP000004','SS000004','TT000016','RS000008','SO000004','RSO000016','GP000001','1'),
	('G000125','可口可乐0125','RF991920125','件','8','2017-02-16','S000063','RS000004','GA000016','SP000004','SS000004','TT000016','RS000008','SO000004','RSO000016','GP000001','1'),
	('G000126','可口可乐0126','RF991920126','箱','8','2017-07-13','S000063','RS000004','GA000016','SP000004','SS000004','TT000016','RS000008','SO000004','RSO000016','GP000001','1'),
	('G000127','可口可乐0127','RF991920127','件','10','2019-03-10','S000064','RS000004','GA000016','SP000004','SS000004','TT000016','RS000008','SO000004','RSO000016','GP000001','1'),
	('G000128','可口可乐0128','RF991920128','箱','10','2017-11-29','S000064','RS000004','GA000016','SP000004','SS000004','TT000016','RS000008','SO000004','RSO000016','GP000001','1');

insert into goods_packaging_data values
	('GP000001','王煜东','RF99192','2017-04-27','打包完成，准备起运','1');

insert into goods_movement_data values
	('GM000001','2019-12-01 01:32:20','仓库货位','仓库货位','192.168.20.1','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B405','FTYUIOLJYT^*(PLKJYT)','41.14823861776185','129.91743900419235','G000001','1'),
	('GM000002','2019-12-02 03:44:09','卡车','卡车','192.168.20.10002','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050002','FTYUIOLJYT^*(PLKJYT)0002','40.08501219898072','131.00973541167505','G000001','1'),
	('GM000003','2019-11-22 00:50:23','小超','小超','192.168.20.10003','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050003','FTYUIOLJYT^*(PLKJYT)0003','42.30934040021587','129.8447340978798','G000002','1'),
	('GM000004','2019-11-20 07:12:22','仓库货位','仓库货位','192.168.20.10004','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050004','FTYUIOLJYT^*(PLKJYT)0004','40.054770518556495','129.40106595448347','G000002','1'),
	('GM000005','2019-12-02 07:55:57','卡车','卡车','192.168.20.10005','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050005','FTYUIOLJYT^*(PLKJYT)0005','42.05213964539572','130.02467037300661','G000003','1'),
	('GM000006','2019-12-05 17:11:32','小超','小超','192.168.20.10006','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050006','FTYUIOLJYT^*(PLKJYT)0006','41.62272264732398','130.40532110537146','G000003','1'),
	('GM000007','2019-11-20 09:00:02','仓库货位','仓库货位','192.168.20.10007','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050007','FTYUIOLJYT^*(PLKJYT)0007','41.702669773112675','131.91321587518314','G000004','1'),
	('GM000008','2019-12-02 08:10:03','卡车','卡车','192.168.20.10008','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050008','FTYUIOLJYT^*(PLKJYT)0008','42.169674198368845','130.06786348744149','G000004','1'),
	('GM000009','2019-11-20 21:14:00','小超','小超','192.168.20.10009','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050009','FTYUIOLJYT^*(PLKJYT)0009','40.69096236203987','130.51456378844824','G000005','1'),
	('GM000010','2019-11-16 10:30:27','仓库货位','仓库货位','192.168.20.10010','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050010','FTYUIOLJYT^*(PLKJYT)0010','40.76328369409576','131.3915401614644','G000005','1'),
	('GM000011','2019-12-01 09:23:28','卡车','卡车','192.168.20.10011','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050011','FTYUIOLJYT^*(PLKJYT)0011','42.42148659346603','131.4994217334326','G000006','1'),
	('GM000012','2019-11-16 11:18:13','小超','小超','192.168.20.10012','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050012','FTYUIOLJYT^*(PLKJYT)0012','41.869330951183024','130.09097202562378','G000006','1'),
	('GM000013','2019-12-02 10:15:12','仓库货位','仓库货位','192.168.20.10013','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050013','FTYUIOLJYT^*(PLKJYT)0013','41.60525566157629','129.69643457322607','G000007','1'),
	('GM000014','2019-11-21 10:32:30','卡车','卡车','192.168.20.10014','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050014','FTYUIOLJYT^*(PLKJYT)0014','42.26024233075918','130.8188643866762','G000007','1'),
	('GM000015','2019-11-22 01:50:42','小超','小超','192.168.20.10015','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050015','FTYUIOLJYT^*(PLKJYT)0015','42.396160306880255','130.37928120465443','G000008','1'),
	('GM000016','2019-11-15 23:10:07','仓库货位','仓库货位','192.168.20.10016','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050016','FTYUIOLJYT^*(PLKJYT)0016','42.68633231413616','129.3113377115069','G000008','1'),
	('GM000017','2019-11-19 06:46:42','卡车','卡车','192.168.20.10017','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050017','FTYUIOLJYT^*(PLKJYT)0017','41.629666341030074','130.3869574732523','G000009','1'),
	('GM000018','2019-11-27 22:56:19','小超','小超','192.168.20.10018','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050018','FTYUIOLJYT^*(PLKJYT)0018','41.428361598952634','131.02416679430755','G000009','1'),
	('GM000019','2019-12-02 20:28:58','仓库货位','仓库货位','192.168.20.10019','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050019','FTYUIOLJYT^*(PLKJYT)0019','40.894705245085575','130.2327192554239','G000010','1'),
	('GM000020','2019-11-19 18:03:31','卡车','卡车','192.168.20.10020','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050020','FTYUIOLJYT^*(PLKJYT)0020','42.6883735167055','132.06077039486317','G000010','1'),
	('GM000021','2019-11-16 05:18:47','小超','小超','192.168.20.10021','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050021','FTYUIOLJYT^*(PLKJYT)0021','40.230752811574064','129.37166727998618','G000011','1'),
	('GM000022','2019-11-27 22:14:39','仓库货位','仓库货位','192.168.20.10022','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050022','FTYUIOLJYT^*(PLKJYT)0022','40.83977548111098','131.77093104991044','G000011','1'),
	('GM000023','2019-11-30 10:26:13','卡车','卡车','192.168.20.10023','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050023','FTYUIOLJYT^*(PLKJYT)0023','40.34873244461631','129.9921861709285','G000012','1'),
	('GM000024','2019-12-01 21:56:41','小超','小超','192.168.20.10024','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050024','FTYUIOLJYT^*(PLKJYT)0024','40.92834275413091','130.3372841828923','G000012','1'),
	('GM000025','2019-12-04 09:29:52','仓库货位','仓库货位','192.168.20.10025','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050025','FTYUIOLJYT^*(PLKJYT)0025','40.859107504479866','129.99721531509937','G000013','1'),
	('GM000026','2019-11-21 01:34:37','卡车','卡车','192.168.20.10026','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050026','FTYUIOLJYT^*(PLKJYT)0026','40.46490957574078','131.4909689406812','G000013','1'),
	('GM000027','2019-11-19 23:53:52','小超','小超','192.168.20.10027','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050027','FTYUIOLJYT^*(PLKJYT)0027','41.25158567568764','131.56304710682514','G000014','1'),
	('GM000028','2019-12-01 17:24:26','仓库货位','仓库货位','192.168.20.10028','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050028','FTYUIOLJYT^*(PLKJYT)0028','41.09029036742563','132.00046821767','G000014','1'),
	('GM000029','2019-11-16 10:42:15','卡车','卡车','192.168.20.10029','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050029','FTYUIOLJYT^*(PLKJYT)0029','41.02211546493467','131.26208745978317','G000015','1'),
	('GM000030','2019-11-25 10:52:06','小超','小超','192.168.20.10030','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050030','FTYUIOLJYT^*(PLKJYT)0030','41.12636313476381','129.56620321733786','G000015','1'),
	('GM000031','2019-11-24 06:44:28','仓库货位','仓库货位','192.168.20.10031','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050031','FTYUIOLJYT^*(PLKJYT)0031','40.363800135587844','130.55844020242162','G000016','1'),
	('GM000032','2019-11-18 01:29:00','卡车','卡车','192.168.20.10032','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050032','FTYUIOLJYT^*(PLKJYT)0032','40.497812379122166','131.80112675332666','G000016','1'),
	('GM000033','2019-11-27 14:32:36','小超','小超','192.168.20.10033','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050033','FTYUIOLJYT^*(PLKJYT)0033','41.22411030030535','130.5186074138761','G000017','1'),
	('GM000034','2019-11-30 06:39:12','仓库货位','仓库货位','192.168.20.10034','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050034','FTYUIOLJYT^*(PLKJYT)0034','42.05093722454573','132.17325053470336','G000017','1'),
	('GM000035','2019-11-17 21:57:59','卡车','卡车','192.168.20.10035','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050035','FTYUIOLJYT^*(PLKJYT)0035','42.04207633499555','131.20195311686712','G000018','1'),
	('GM000036','2019-12-03 15:33:41','小超','小超','192.168.20.10036','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050036','FTYUIOLJYT^*(PLKJYT)0036','40.58400002371438','130.4842333181224','G000018','1'),
	('GM000037','2019-12-03 11:44:06','仓库货位','仓库货位','192.168.20.10037','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050037','FTYUIOLJYT^*(PLKJYT)0037','40.39236456564262','131.92541594385483','G000019','1'),
	('GM000038','2019-11-21 17:03:37','卡车','卡车','192.168.20.10038','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050038','FTYUIOLJYT^*(PLKJYT)0038','40.00324085637401','131.02897028131233','G000019','1'),
	('GM000039','2019-11-15 13:13:34','小超','小超','192.168.20.10039','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050039','FTYUIOLJYT^*(PLKJYT)0039','40.6202660912527','129.84346211366983','G000020','1'),
	('GM000040','2019-11-14 15:56:05','仓库货位','仓库货位','192.168.20.10040','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050040','FTYUIOLJYT^*(PLKJYT)0040','40.135974111349135','130.16029699925303','G000020','1'),
	('GM000041','2019-11-16 00:09:42','卡车','卡车','192.168.20.10041','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050041','FTYUIOLJYT^*(PLKJYT)0041','40.91028390957517','132.09723356004287','G000021','1'),
	('GM000042','2019-11-21 15:21:10','小超','小超','192.168.20.10042','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050042','FTYUIOLJYT^*(PLKJYT)0042','41.96379300666547','130.221824072347','G000021','1'),
	('GM000043','2019-12-03 14:50:14','仓库货位','仓库货位','192.168.20.10043','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050043','FTYUIOLJYT^*(PLKJYT)0043','41.41442367028267','131.60671822542608','G000022','1'),
	('GM000044','2019-12-05 07:47:59','卡车','卡车','192.168.20.10044','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050044','FTYUIOLJYT^*(PLKJYT)0044','42.1221397809542','129.62754522402994','G000022','1'),
	('GM000045','2019-11-30 08:11:29','小超','小超','192.168.20.10045','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050045','FTYUIOLJYT^*(PLKJYT)0045','40.913352899369485','129.98758240851046','G000023','1'),
	('GM000046','2019-11-15 16:36:10','仓库货位','仓库货位','192.168.20.10046','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050046','FTYUIOLJYT^*(PLKJYT)0046','40.57528671317934','130.19182022159185','G000023','1'),
	('GM000047','2019-11-22 17:28:02','卡车','卡车','192.168.20.10047','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050047','FTYUIOLJYT^*(PLKJYT)0047','42.09877704297838','131.54175783862257','G000024','1'),
	('GM000048','2019-11-14 21:07:03','小超','小超','192.168.20.10048','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050048','FTYUIOLJYT^*(PLKJYT)0048','42.68666584865109','130.3458811079856','G000024','1'),
	('GM000049','2019-11-28 03:53:09','仓库货位','仓库货位','192.168.20.10049','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050049','FTYUIOLJYT^*(PLKJYT)0049','40.06880973106468','130.91025888053304','G000025','1'),
	('GM000050','2019-11-18 07:07:30','卡车','卡车','192.168.20.10050','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050050','FTYUIOLJYT^*(PLKJYT)0050','41.622668600469936','130.8309984562436','G000025','1'),
	('GM000051','2019-11-28 02:45:25','小超','小超','192.168.20.10051','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050051','FTYUIOLJYT^*(PLKJYT)0051','40.90553271603511','130.29095787848485','G000026','1'),
	('GM000052','2019-11-29 11:52:03','仓库货位','仓库货位','192.168.20.10052','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050052','FTYUIOLJYT^*(PLKJYT)0052','40.95330781694601','129.31337731478015','G000026','1'),
	('GM000053','2019-12-03 03:42:55','卡车','卡车','192.168.20.10053','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050053','FTYUIOLJYT^*(PLKJYT)0053','41.65670848444643','130.75671703066834','G000027','1'),
	('GM000054','2019-11-14 09:16:13','小超','小超','192.168.20.10054','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050054','FTYUIOLJYT^*(PLKJYT)0054','41.63593328289501','129.61683779945744','G000027','1'),
	('GM000055','2019-12-04 07:04:39','仓库货位','仓库货位','192.168.20.10055','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050055','FTYUIOLJYT^*(PLKJYT)0055','42.33872840095678','130.69454676853715','G000028','1'),
	('GM000056','2019-11-30 06:49:06','卡车','卡车','192.168.20.10056','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050056','FTYUIOLJYT^*(PLKJYT)0056','40.61956303937108','130.17712613491543','G000028','1'),
	('GM000057','2019-12-05 21:53:02','小超','小超','192.168.20.10057','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050057','FTYUIOLJYT^*(PLKJYT)0057','42.39795472119621','130.89913827383708','G000029','1'),
	('GM000058','2019-12-05 02:11:49','仓库货位','仓库货位','192.168.20.10058','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050058','FTYUIOLJYT^*(PLKJYT)0058','42.30902088933739','131.66265225082176','G000029','1'),
	('GM000059','2019-12-04 08:27:05','卡车','卡车','192.168.20.10059','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050059','FTYUIOLJYT^*(PLKJYT)0059','39.860905203436594','131.95962515450495','G000030','1'),
	('GM000060','2019-12-04 01:11:56','小超','小超','192.168.20.10060','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050060','FTYUIOLJYT^*(PLKJYT)0060','39.942262442630614','129.52256569610708','G000030','1'),
	('GM000061','2019-11-24 21:43:53','仓库货位','仓库货位','192.168.20.10061','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050061','FTYUIOLJYT^*(PLKJYT)0061','41.13408221205502','130.9828332723855','G000031','1'),
	('GM000062','2019-11-22 05:32:09','卡车','卡车','192.168.20.10062','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050062','FTYUIOLJYT^*(PLKJYT)0062','39.813950950850476','131.57196691083283','G000031','1'),
	('GM000063','2019-11-23 08:57:15','小超','小超','192.168.20.10063','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050063','FTYUIOLJYT^*(PLKJYT)0063','41.31117490081367','131.99624318458095','G000032','1'),
	('GM000064','2019-11-30 19:23:23','仓库货位','仓库货位','192.168.20.10064','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050064','FTYUIOLJYT^*(PLKJYT)0064','41.6170706900904','131.42896100568254','G000032','1'),
	('GM000065','2019-12-04 06:17:52','卡车','卡车','192.168.20.10065','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050065','FTYUIOLJYT^*(PLKJYT)0065','42.15396705572334','129.8067340596355','G000033','1'),
	('GM000066','2019-11-19 13:50:40','小超','小超','192.168.20.10066','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050066','FTYUIOLJYT^*(PLKJYT)0066','41.256317077121864','130.01804854032977','G000033','1'),
	('GM000067','2019-11-24 23:40:58','仓库货位','仓库货位','192.168.20.10067','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050067','FTYUIOLJYT^*(PLKJYT)0067','42.64431158059646','129.28482169272056','G000034','1'),
	('GM000068','2019-11-15 15:46:20','卡车','卡车','192.168.20.10068','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050068','FTYUIOLJYT^*(PLKJYT)0068','41.23698389378968','132.0535214106326','G000034','1'),
	('GM000069','2019-11-25 22:27:31','小超','小超','192.168.20.10069','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050069','FTYUIOLJYT^*(PLKJYT)0069','40.68435546997453','130.76710776760274','G000035','1'),
	('GM000070','2019-11-28 04:35:51','仓库货位','仓库货位','192.168.20.10070','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050070','FTYUIOLJYT^*(PLKJYT)0070','42.46650725980112','130.03519229071412','G000035','1'),
	('GM000071','2019-11-14 11:25:28','卡车','卡车','192.168.20.10071','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050071','FTYUIOLJYT^*(PLKJYT)0071','39.94280320973805','131.1811986605751','G000036','1'),
	('GM000072','2019-11-15 07:45:39','小超','小超','192.168.20.10072','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050072','FTYUIOLJYT^*(PLKJYT)0072','42.47878148349617','132.21268903421353','G000036','1'),
	('GM000073','2019-11-30 18:24:32','仓库货位','仓库货位','192.168.20.10073','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050073','FTYUIOLJYT^*(PLKJYT)0073','41.81401063539652','129.89723431935838','G000037','1'),
	('GM000074','2019-11-24 03:58:56','卡车','卡车','192.168.20.10074','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050074','FTYUIOLJYT^*(PLKJYT)0074','40.05051062825238','130.10504786168858','G000037','1'),
	('GM000075','2019-11-15 11:28:40','小超','小超','192.168.20.10075','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050075','FTYUIOLJYT^*(PLKJYT)0075','41.54735280917553','129.88882331020497','G000038','1'),
	('GM000076','2019-11-19 10:12:07','仓库货位','仓库货位','192.168.20.10076','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050076','FTYUIOLJYT^*(PLKJYT)0076','41.91150510074753','129.66644238068895','G000038','1'),
	('GM000077','2019-11-16 00:32:16','卡车','卡车','192.168.20.10077','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050077','FTYUIOLJYT^*(PLKJYT)0077','39.905465238835866','130.37466334020627','G000039','1'),
	('GM000078','2019-11-20 20:34:25','小超','小超','192.168.20.10078','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050078','FTYUIOLJYT^*(PLKJYT)0078','42.13490976923448','132.24919729231186','G000039','1'),
	('GM000079','2019-12-03 14:28:20','仓库货位','仓库货位','192.168.20.10079','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050079','FTYUIOLJYT^*(PLKJYT)0079','42.576122296319355','131.43211239537246','G000040','1'),
	('GM000080','2019-11-14 15:46:05','卡车','卡车','192.168.20.10080','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050080','FTYUIOLJYT^*(PLKJYT)0080','40.34740602430818','131.08000775522524','G000040','1'),
	('GM000081','2019-11-17 21:15:50','小超','小超','192.168.20.10081','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050081','FTYUIOLJYT^*(PLKJYT)0081','41.36379398554626','131.48777767178848','G000041','1'),
	('GM000082','2019-11-29 07:50:01','仓库货位','仓库货位','192.168.20.10082','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050082','FTYUIOLJYT^*(PLKJYT)0082','40.53265265620002','131.49837524826114','G000041','1'),
	('GM000083','2019-11-17 10:54:07','卡车','卡车','192.168.20.10083','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050083','FTYUIOLJYT^*(PLKJYT)0083','41.059069289455465','130.85072644577565','G000042','1'),
	('GM000084','2019-11-24 10:53:02','小超','小超','192.168.20.10084','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050084','FTYUIOLJYT^*(PLKJYT)0084','41.963417928974366','131.43718090996143','G000042','1'),
	('GM000085','2019-11-15 02:12:47','仓库货位','仓库货位','192.168.20.10085','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050085','FTYUIOLJYT^*(PLKJYT)0085','40.47850161290956','130.45476213245752','G000043','1'),
	('GM000086','2019-11-23 13:56:08','卡车','卡车','192.168.20.10086','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050086','FTYUIOLJYT^*(PLKJYT)0086','42.12943859576528','131.2991545648915','G000043','1'),
	('GM000087','2019-11-19 06:14:00','小超','小超','192.168.20.10087','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050087','FTYUIOLJYT^*(PLKJYT)0087','42.40102912289143','129.50151483621394','G000044','1'),
	('GM000088','2019-12-01 09:30:48','仓库货位','仓库货位','192.168.20.10088','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050088','FTYUIOLJYT^*(PLKJYT)0088','42.01008133177378','132.0105133114809','G000044','1'),
	('GM000089','2019-11-29 04:23:41','卡车','卡车','192.168.20.10089','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050089','FTYUIOLJYT^*(PLKJYT)0089','39.93255063061487','131.17069086484955','G000045','1'),
	('GM000090','2019-11-25 19:14:16','小超','小超','192.168.20.10090','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050090','FTYUIOLJYT^*(PLKJYT)0090','40.145046479765234','131.6405977000226','G000045','1'),
	('GM000091','2019-12-02 04:16:11','仓库货位','仓库货位','192.168.20.10091','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050091','FTYUIOLJYT^*(PLKJYT)0091','39.90575168427108','131.8031209094285','G000046','1'),
	('GM000092','2019-12-06 01:23:47','卡车','卡车','192.168.20.10092','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050092','FTYUIOLJYT^*(PLKJYT)0092','40.79496067941149','129.85592307340553','G000046','1'),
	('GM000093','2019-12-01 23:36:01','小超','小超','192.168.20.10093','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050093','FTYUIOLJYT^*(PLKJYT)0093','42.481734317956274','130.92231431409905','G000047','1'),
	('GM000094','2019-11-15 19:01:48','仓库货位','仓库货位','192.168.20.10094','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050094','FTYUIOLJYT^*(PLKJYT)0094','40.559673878616145','131.93630454322422','G000047','1'),
	('GM000095','2019-11-18 08:56:31','卡车','卡车','192.168.20.10095','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050095','FTYUIOLJYT^*(PLKJYT)0095','41.642904503446125','129.9877314855009','G000048','1'),
	('GM000096','2019-12-05 19:51:49','小超','小超','192.168.20.10096','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050096','FTYUIOLJYT^*(PLKJYT)0096','41.778964378968','131.1928445461979','G000048','1'),
	('GM000097','2019-12-05 07:04:04','仓库货位','仓库货位','192.168.20.10097','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050097','FTYUIOLJYT^*(PLKJYT)0097','40.24802651592493','129.3552453523806','G000049','1'),
	('GM000098','2019-11-27 14:45:16','卡车','卡车','192.168.20.10098','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050098','FTYUIOLJYT^*(PLKJYT)0098','42.41235003797687','130.98146840679','G000049','1'),
	('GM000099','2019-11-16 14:52:28','小超','小超','192.168.20.10099','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050099','FTYUIOLJYT^*(PLKJYT)0099','41.021111105610075','131.435195857679','G000050','1'),
	('GM000100','2019-12-03 01:10:22','仓库货位','仓库货位','192.168.20.10100','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050100','FTYUIOLJYT^*(PLKJYT)0100','41.05659385550931','131.95583664899132','G000050','1'),
	('GM000101','2019-12-04 02:58:30','卡车','卡车','192.168.20.10101','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050101','FTYUIOLJYT^*(PLKJYT)0101','42.04222543569332','130.50460901591174','G000051','1'),
	('GM000102','2019-11-28 04:21:17','小超','小超','192.168.20.10102','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050102','FTYUIOLJYT^*(PLKJYT)0102','39.876725392310334','131.6199790867234','G000051','1'),
	('GM000103','2019-12-02 22:30:45','仓库货位','仓库货位','192.168.20.10103','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050103','FTYUIOLJYT^*(PLKJYT)0103','42.04239612712204','129.95673294523124','G000052','1'),
	('GM000104','2019-12-03 07:35:44','卡车','卡车','192.168.20.10104','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050104','FTYUIOLJYT^*(PLKJYT)0104','41.205016015096554','130.2596231244729','G000052','1'),
	('GM000105','2019-12-02 09:05:46','小超','小超','192.168.20.10105','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050105','FTYUIOLJYT^*(PLKJYT)0105','41.13413113303202','131.50783948290672','G000053','1'),
	('GM000106','2019-11-21 14:07:30','仓库货位','仓库货位','192.168.20.10106','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050106','FTYUIOLJYT^*(PLKJYT)0106','41.999034441848806','130.10329406234757','G000053','1'),
	('GM000107','2019-11-22 21:55:08','卡车','卡车','192.168.20.10107','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050107','FTYUIOLJYT^*(PLKJYT)0107','40.356964171906924','130.96868579225304','G000054','1'),
	('GM000108','2019-11-29 00:14:55','小超','小超','192.168.20.10108','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050108','FTYUIOLJYT^*(PLKJYT)0108','40.48196938230177','131.50684340663912','G000054','1'),
	('GM000109','2019-11-30 18:37:05','仓库货位','仓库货位','192.168.20.10109','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050109','FTYUIOLJYT^*(PLKJYT)0109','39.92268318632158','129.707174008563','G000055','1'),
	('GM000110','2019-11-26 00:02:45','卡车','卡车','192.168.20.10110','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050110','FTYUIOLJYT^*(PLKJYT)0110','41.743770601105155','130.50072654463543','G000055','1'),
	('GM000111','2019-11-27 12:32:36','小超','小超','192.168.20.10111','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050111','FTYUIOLJYT^*(PLKJYT)0111','40.912044953787465','130.85127739863339','G000056','1'),
	('GM000112','2019-11-26 19:42:01','仓库货位','仓库货位','192.168.20.10112','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050112','FTYUIOLJYT^*(PLKJYT)0112','40.62888258512919','131.3863472704631','G000056','1'),
	('GM000113','2019-11-24 05:38:59','卡车','卡车','192.168.20.10113','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050113','FTYUIOLJYT^*(PLKJYT)0113','40.02390852444716','131.21951150808235','G000057','1'),
	('GM000114','2019-11-17 21:15:00','小超','小超','192.168.20.10114','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050114','FTYUIOLJYT^*(PLKJYT)0114','40.53460270558507','129.92998094792628','G000057','1'),
	('GM000115','2019-11-16 15:32:11','仓库货位','仓库货位','192.168.20.10115','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050115','FTYUIOLJYT^*(PLKJYT)0115','42.1945897069315','129.92306097675842','G000058','1'),
	('GM000116','2019-11-30 05:05:55','卡车','卡车','192.168.20.10116','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050116','FTYUIOLJYT^*(PLKJYT)0116','41.09320061978381','131.05967207262367','G000058','1'),
	('GM000117','2019-11-17 13:32:58','小超','小超','192.168.20.10117','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050117','FTYUIOLJYT^*(PLKJYT)0117','41.39121386690751','131.7026694070653','G000059','1'),
	('GM000118','2019-12-02 11:14:06','仓库货位','仓库货位','192.168.20.10118','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050118','FTYUIOLJYT^*(PLKJYT)0118','41.80130665620825','130.8171934172412','G000059','1'),
	('GM000119','2019-11-21 21:43:28','卡车','卡车','192.168.20.10119','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050119','FTYUIOLJYT^*(PLKJYT)0119','41.80491119941215','130.37875191852163','G000060','1'),
	('GM000120','2019-12-02 04:45:13','小超','小超','192.168.20.10120','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050120','FTYUIOLJYT^*(PLKJYT)0120','41.32278065001615','130.41439345488385','G000060','1'),
	('GM000121','2019-11-20 20:17:54','仓库货位','仓库货位','192.168.20.10121','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050121','FTYUIOLJYT^*(PLKJYT)0121','41.210484086468945','129.97969126716322','G000061','1'),
	('GM000122','2019-11-21 03:38:30','卡车','卡车','192.168.20.10122','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050122','FTYUIOLJYT^*(PLKJYT)0122','42.147976510796255','131.86741703929422','G000061','1'),
	('GM000123','2019-11-23 17:22:54','小超','小超','192.168.20.10123','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050123','FTYUIOLJYT^*(PLKJYT)0123','41.36691265535447','130.23637087927113','G000062','1'),
	('GM000124','2019-11-28 15:34:09','仓库货位','仓库货位','192.168.20.10124','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050124','FTYUIOLJYT^*(PLKJYT)0124','39.90533855708141','131.37534870123187','G000062','1'),
	('GM000125','2019-11-17 07:05:10','卡车','卡车','192.168.20.10125','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050125','FTYUIOLJYT^*(PLKJYT)0125','40.47162798170701','130.39672301691994','G000063','1'),
	('GM000126','2019-11-29 20:08:16','小超','小超','192.168.20.10126','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050126','FTYUIOLJYT^*(PLKJYT)0126','42.643522876174615','131.92942020818958','G000063','1'),
	('GM000127','2019-11-23 10:13:57','仓库货位','仓库货位','192.168.20.10127','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050127','FTYUIOLJYT^*(PLKJYT)0127','41.58035560365677','131.81911851133415','G000064','1'),
	('GM000128','2019-11-24 17:51:45','卡车','卡车','192.168.20.10128','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050128','FTYUIOLJYT^*(PLKJYT)0128','40.72729147361461','130.90828364191415','G000064','1'),
	('GM000129','2019-11-28 06:43:09','小超','小超','192.168.20.10129','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050129','FTYUIOLJYT^*(PLKJYT)0129','42.30864412822179','129.28509515168585','G000065','1'),
	('GM000130','2019-12-02 00:30:40','仓库货位','仓库货位','192.168.20.10130','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050130','FTYUIOLJYT^*(PLKJYT)0130','41.40245663329189','129.47284539123407','G000065','1'),
	('GM000131','2019-12-04 14:04:43','卡车','卡车','192.168.20.10131','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050131','FTYUIOLJYT^*(PLKJYT)0131','42.5516724552764','129.55814510252242','G000066','1'),
	('GM000132','2019-11-20 21:06:57','小超','小超','192.168.20.10132','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050132','FTYUIOLJYT^*(PLKJYT)0132','41.00896132851524','129.52527976612302','G000066','1'),
	('GM000133','2019-11-19 12:33:41','仓库货位','仓库货位','192.168.20.10133','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050133','FTYUIOLJYT^*(PLKJYT)0133','42.42195670110082','129.67461226698885','G000067','1'),
	('GM000134','2019-12-05 09:31:47','卡车','卡车','192.168.20.10134','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050134','FTYUIOLJYT^*(PLKJYT)0134','41.0722007090933','130.96120697319523','G000067','1'),
	('GM000135','2019-11-18 23:42:11','小超','小超','192.168.20.10135','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050135','FTYUIOLJYT^*(PLKJYT)0135','40.40213315849968','130.9443716216541','G000068','1'),
	('GM000136','2019-11-29 09:05:53','仓库货位','仓库货位','192.168.20.10136','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050136','FTYUIOLJYT^*(PLKJYT)0136','40.03697128307514','130.8073739276361','G000068','1'),
	('GM000137','2019-12-02 06:30:25','卡车','卡车','192.168.20.10137','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050137','FTYUIOLJYT^*(PLKJYT)0137','41.14970354684672','130.46267200554558','G000069','1'),
	('GM000138','2019-11-19 00:15:06','小超','小超','192.168.20.10138','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050138','FTYUIOLJYT^*(PLKJYT)0138','41.0726630308169','132.00088540546363','G000069','1'),
	('GM000139','2019-11-19 21:24:33','仓库货位','仓库货位','192.168.20.10139','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050139','FTYUIOLJYT^*(PLKJYT)0139','40.54573088400933','130.28075850972266','G000070','1'),
	('GM000140','2019-11-26 22:21:29','卡车','卡车','192.168.20.10140','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050140','FTYUIOLJYT^*(PLKJYT)0140','42.659781834550124','131.69708508315634','G000070','1'),
	('GM000141','2019-11-21 00:43:59','小超','小超','192.168.20.10141','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050141','FTYUIOLJYT^*(PLKJYT)0141','41.03883546753935','130.58269987578353','G000071','1'),
	('GM000142','2019-12-02 06:52:25','仓库货位','仓库货位','192.168.20.10142','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050142','FTYUIOLJYT^*(PLKJYT)0142','42.44454604058091','130.7742045285453','G000071','1'),
	('GM000143','2019-12-03 02:45:27','卡车','卡车','192.168.20.10143','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050143','FTYUIOLJYT^*(PLKJYT)0143','40.953955146792076','131.49091316263645','G000072','1'),
	('GM000144','2019-11-24 20:43:21','小超','小超','192.168.20.10144','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050144','FTYUIOLJYT^*(PLKJYT)0144','42.1386840805734','130.08212072623658','G000072','1'),
	('GM000145','2019-11-27 01:07:09','仓库货位','仓库货位','192.168.20.10145','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050145','FTYUIOLJYT^*(PLKJYT)0145','40.08231886751373','130.3355050787415','G000073','1'),
	('GM000146','2019-11-25 07:28:20','卡车','卡车','192.168.20.10146','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050146','FTYUIOLJYT^*(PLKJYT)0146','41.95486180827048','131.92385895685982','G000073','1'),
	('GM000147','2019-11-22 23:43:36','小超','小超','192.168.20.10147','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050147','FTYUIOLJYT^*(PLKJYT)0147','42.18067717619105','131.6256676228621','G000074','1'),
	('GM000148','2019-11-23 06:33:24','仓库货位','仓库货位','192.168.20.10148','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050148','FTYUIOLJYT^*(PLKJYT)0148','40.754181703966886','130.4913365253351','G000074','1'),
	('GM000149','2019-11-24 10:13:23','卡车','卡车','192.168.20.10149','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050149','FTYUIOLJYT^*(PLKJYT)0149','42.13540987933818','131.94852924674495','G000075','1'),
	('GM000150','2019-12-01 22:57:13','小超','小超','192.168.20.10150','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050150','FTYUIOLJYT^*(PLKJYT)0150','41.68136162850179','130.74638859043458','G000075','1'),
	('GM000151','2019-11-23 01:52:23','仓库货位','仓库货位','192.168.20.10151','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050151','FTYUIOLJYT^*(PLKJYT)0151','39.907675350808304','129.87625101483025','G000076','1'),
	('GM000152','2019-11-16 19:31:13','卡车','卡车','192.168.20.10152','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050152','FTYUIOLJYT^*(PLKJYT)0152','42.65656245434395','130.5550809395953','G000076','1'),
	('GM000153','2019-11-15 01:47:20','小超','小超','192.168.20.10153','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050153','FTYUIOLJYT^*(PLKJYT)0153','40.401901538815636','131.61057695237196','G000077','1'),
	('GM000154','2019-12-02 23:08:48','仓库货位','仓库货位','192.168.20.10154','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050154','FTYUIOLJYT^*(PLKJYT)0154','40.652084008243754','130.27407595003314','G000077','1'),
	('GM000155','2019-11-15 07:40:44','卡车','卡车','192.168.20.10155','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050155','FTYUIOLJYT^*(PLKJYT)0155','40.289884603506536','129.85092314632962','G000078','1'),
	('GM000156','2019-11-15 23:25:36','小超','小超','192.168.20.10156','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050156','FTYUIOLJYT^*(PLKJYT)0156','39.81957613437969','132.2443585016932','G000078','1'),
	('GM000157','2019-12-02 18:30:54','仓库货位','仓库货位','192.168.20.10157','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050157','FTYUIOLJYT^*(PLKJYT)0157','42.290421318922505','130.69348524163743','G000079','1'),
	('GM000158','2019-11-24 19:52:36','卡车','卡车','192.168.20.10158','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050158','FTYUIOLJYT^*(PLKJYT)0158','40.25196428256308','130.57757207096634','G000079','1'),
	('GM000159','2019-11-22 15:10:48','小超','小超','192.168.20.10159','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050159','FTYUIOLJYT^*(PLKJYT)0159','42.42925710669687','130.60142766231638','G000080','1'),
	('GM000160','2019-11-26 13:08:39','仓库货位','仓库货位','192.168.20.10160','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050160','FTYUIOLJYT^*(PLKJYT)0160','41.60750323395643','129.79680197591364','G000080','1'),
	('GM000161','2019-11-18 08:38:41','卡车','卡车','192.168.20.10161','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050161','FTYUIOLJYT^*(PLKJYT)0161','41.3812896039304','130.61730360368122','G000081','1'),
	('GM000162','2019-11-22 16:02:03','小超','小超','192.168.20.10162','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050162','FTYUIOLJYT^*(PLKJYT)0162','42.02544342106269','130.4057375551629','G000081','1'),
	('GM000163','2019-11-16 15:55:30','仓库货位','仓库货位','192.168.20.10163','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050163','FTYUIOLJYT^*(PLKJYT)0163','39.887177142111284','131.39636611737285','G000082','1'),
	('GM000164','2019-11-25 17:29:35','卡车','卡车','192.168.20.10164','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050164','FTYUIOLJYT^*(PLKJYT)0164','42.398516618089474','131.6622469877883','G000082','1'),
	('GM000165','2019-11-17 21:39:05','小超','小超','192.168.20.10165','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050165','FTYUIOLJYT^*(PLKJYT)0165','40.71612761282417','129.84192795930738','G000083','1'),
	('GM000166','2019-11-19 06:42:08','仓库货位','仓库货位','192.168.20.10166','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050166','FTYUIOLJYT^*(PLKJYT)0166','40.202254770869935','130.09461251126586','G000083','1'),
	('GM000167','2019-12-01 14:58:13','卡车','卡车','192.168.20.10167','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050167','FTYUIOLJYT^*(PLKJYT)0167','41.25767771309951','131.5305851545193','G000084','1'),
	('GM000168','2019-12-02 23:35:02','小超','小超','192.168.20.10168','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050168','FTYUIOLJYT^*(PLKJYT)0168','40.921103996584364','129.75675865650575','G000084','1'),
	('GM000169','2019-11-16 00:03:58','仓库货位','仓库货位','192.168.20.10169','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050169','FTYUIOLJYT^*(PLKJYT)0169','41.125332034614665','129.77574356761554','G000085','1'),
	('GM000170','2019-11-15 22:55:55','卡车','卡车','192.168.20.10170','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050170','FTYUIOLJYT^*(PLKJYT)0170','42.75305954681497','131.52411189630558','G000085','1'),
	('GM000171','2019-11-23 23:31:50','小超','小超','192.168.20.10171','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050171','FTYUIOLJYT^*(PLKJYT)0171','42.46726048408602','130.53291309503416','G000086','1'),
	('GM000172','2019-11-24 15:47:57','仓库货位','仓库货位','192.168.20.10172','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050172','FTYUIOLJYT^*(PLKJYT)0172','42.45543803499827','129.80126296786838','G000086','1'),
	('GM000173','2019-11-20 18:57:33','卡车','卡车','192.168.20.10173','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050173','FTYUIOLJYT^*(PLKJYT)0173','39.84271603356723','129.98070434191501','G000087','1'),
	('GM000174','2019-11-24 02:45:28','小超','小超','192.168.20.10174','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050174','FTYUIOLJYT^*(PLKJYT)0174','41.04234513864445','129.7789700340058','G000087','1'),
	('GM000175','2019-11-30 04:05:58','仓库货位','仓库货位','192.168.20.10175','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050175','FTYUIOLJYT^*(PLKJYT)0175','40.64192572990495','129.9890722803017','G000088','1'),
	('GM000176','2019-11-19 18:15:58','卡车','卡车','192.168.20.10176','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050176','FTYUIOLJYT^*(PLKJYT)0176','41.8279469339311','130.53949222820654','G000088','1'),
	('GM000177','2019-12-04 19:06:49','小超','小超','192.168.20.10177','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050177','FTYUIOLJYT^*(PLKJYT)0177','40.22204328962207','129.92338892248313','G000089','1'),
	('GM000178','2019-11-23 08:19:05','仓库货位','仓库货位','192.168.20.10178','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050178','FTYUIOLJYT^*(PLKJYT)0178','42.18799118246323','130.0796387200026','G000089','1'),
	('GM000179','2019-11-20 19:55:30','卡车','卡车','192.168.20.10179','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050179','FTYUIOLJYT^*(PLKJYT)0179','42.08807456615445','129.8323372408857','G000090','1'),
	('GM000180','2019-11-23 16:22:37','小超','小超','192.168.20.10180','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050180','FTYUIOLJYT^*(PLKJYT)0180','40.18495566671162','130.17975642817532','G000090','1'),
	('GM000181','2019-11-22 04:08:27','仓库货位','仓库货位','192.168.20.10181','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050181','FTYUIOLJYT^*(PLKJYT)0181','41.96686328254519','131.6729444535796','G000091','1'),
	('GM000182','2019-12-02 06:29:56','卡车','卡车','192.168.20.10182','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050182','FTYUIOLJYT^*(PLKJYT)0182','42.060150951807024','131.48927330988093','G000091','1'),
	('GM000183','2019-11-19 19:40:12','小超','小超','192.168.20.10183','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050183','FTYUIOLJYT^*(PLKJYT)0183','41.17124778716341','129.37150083560502','G000092','1'),
	('GM000184','2019-11-22 11:29:55','仓库货位','仓库货位','192.168.20.10184','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050184','FTYUIOLJYT^*(PLKJYT)0184','41.870135974804136','131.48610872168283','G000092','1'),
	('GM000185','2019-12-03 20:03:53','卡车','卡车','192.168.20.10185','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050185','FTYUIOLJYT^*(PLKJYT)0185','40.91298410569322','130.37944363149305','G000093','1'),
	('GM000186','2019-11-24 15:44:40','小超','小超','192.168.20.10186','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050186','FTYUIOLJYT^*(PLKJYT)0186','41.45658848760754','131.87462016433264','G000093','1'),
	('GM000187','2019-11-16 06:42:20','仓库货位','仓库货位','192.168.20.10187','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050187','FTYUIOLJYT^*(PLKJYT)0187','42.64522408481599','129.52395108317728','G000094','1'),
	('GM000188','2019-12-02 19:05:24','卡车','卡车','192.168.20.10188','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050188','FTYUIOLJYT^*(PLKJYT)0188','42.35061894883027','129.55677763317047','G000094','1'),
	('GM000189','2019-11-15 13:03:53','小超','小超','192.168.20.10189','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050189','FTYUIOLJYT^*(PLKJYT)0189','41.06210063574391','132.0800490193335','G000095','1'),
	('GM000190','2019-11-25 03:58:35','仓库货位','仓库货位','192.168.20.10190','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050190','FTYUIOLJYT^*(PLKJYT)0190','41.377353441196284','130.60154880857203','G000095','1'),
	('GM000191','2019-11-21 10:22:45','卡车','卡车','192.168.20.10191','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050191','FTYUIOLJYT^*(PLKJYT)0191','40.283801401253506','129.7011565359684','G000096','1'),
	('GM000192','2019-12-02 13:09:46','小超','小超','192.168.20.10192','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050192','FTYUIOLJYT^*(PLKJYT)0192','41.037993427133244','129.4712920742683','G000096','1'),
	('GM000193','2019-11-17 23:05:30','仓库货位','仓库货位','192.168.20.10193','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050193','FTYUIOLJYT^*(PLKJYT)0193','41.255524093405725','129.3754963924505','G000097','1'),
	('GM000194','2019-11-25 12:20:34','卡车','卡车','192.168.20.10194','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050194','FTYUIOLJYT^*(PLKJYT)0194','40.48866750443259','130.4801526139645','G000097','1'),
	('GM000195','2019-11-23 21:46:27','小超','小超','192.168.20.10195','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050195','FTYUIOLJYT^*(PLKJYT)0195','40.49864253944792','129.55459712481615','G000098','1'),
	('GM000196','2019-11-16 08:39:24','仓库货位','仓库货位','192.168.20.10196','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050196','FTYUIOLJYT^*(PLKJYT)0196','40.03302780613071','129.66253171238688','G000098','1'),
	('GM000197','2019-11-19 06:47:18','卡车','卡车','192.168.20.10197','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050197','FTYUIOLJYT^*(PLKJYT)0197','42.59863891376484','129.79577383998003','G000099','1'),
	('GM000198','2019-11-22 14:22:02','小超','小超','192.168.20.10198','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050198','FTYUIOLJYT^*(PLKJYT)0198','41.8141393059955','130.53976955468787','G000099','1'),
	('GM000199','2019-11-30 18:06:48','仓库货位','仓库货位','192.168.20.10199','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050199','FTYUIOLJYT^*(PLKJYT)0199','40.988869591313005','131.33217134343022','G000100','1'),
	('GM000200','2019-12-05 19:22:10','卡车','卡车','192.168.20.10200','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050200','FTYUIOLJYT^*(PLKJYT)0200','40.28682295084514','132.07598883292556','G000100','1'),
	('GM000201','2019-12-01 22:54:55','小超','小超','192.168.20.10201','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050201','FTYUIOLJYT^*(PLKJYT)0201','42.499643554191096','130.23149354973566','G000101','1'),
	('GM000202','2019-11-20 15:11:41','仓库货位','仓库货位','192.168.20.10202','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050202','FTYUIOLJYT^*(PLKJYT)0202','40.42091603593458','131.31095691781846','G000101','1'),
	('GM000203','2019-11-28 09:17:16','卡车','卡车','192.168.20.10203','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050203','FTYUIOLJYT^*(PLKJYT)0203','40.36164651839801','131.91835340554596','G000102','1'),
	('GM000204','2019-11-14 18:15:45','小超','小超','192.168.20.10204','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050204','FTYUIOLJYT^*(PLKJYT)0204','40.41621849939464','130.91583241797548','G000102','1'),
	('GM000205','2019-12-02 22:57:07','仓库货位','仓库货位','192.168.20.10205','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050205','FTYUIOLJYT^*(PLKJYT)0205','39.97031031806391','131.64631769310188','G000103','1'),
	('GM000206','2019-12-03 08:37:43','卡车','卡车','192.168.20.10206','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050206','FTYUIOLJYT^*(PLKJYT)0206','41.37912312978985','130.41938064852974','G000103','1'),
	('GM000207','2019-11-25 16:10:39','小超','小超','192.168.20.10207','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050207','FTYUIOLJYT^*(PLKJYT)0207','41.087794038894295','130.7358632285315','G000104','1'),
	('GM000208','2019-12-01 11:10:58','仓库货位','仓库货位','192.168.20.10208','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050208','FTYUIOLJYT^*(PLKJYT)0208','40.43764434307909','132.04592054885973','G000104','1'),
	('GM000209','2019-11-21 08:40:07','卡车','卡车','192.168.20.10209','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050209','FTYUIOLJYT^*(PLKJYT)0209','40.65192962142014','129.40591852793906','G000105','1'),
	('GM000210','2019-11-28 07:44:06','小超','小超','192.168.20.10210','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050210','FTYUIOLJYT^*(PLKJYT)0210','41.564934612094035','130.4557626030919','G000105','1'),
	('GM000211','2019-11-14 11:54:37','仓库货位','仓库货位','192.168.20.10211','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050211','FTYUIOLJYT^*(PLKJYT)0211','41.112536328415764','131.57235917291456','G000106','1'),
	('GM000212','2019-11-17 22:22:28','卡车','卡车','192.168.20.10212','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050212','FTYUIOLJYT^*(PLKJYT)0212','40.99122418038639','129.9137118182571','G000106','1'),
	('GM000213','2019-12-05 22:28:15','小超','小超','192.168.20.10213','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050213','FTYUIOLJYT^*(PLKJYT)0213','41.87628351594496','131.96031993931243','G000107','1'),
	('GM000214','2019-11-29 23:56:09','仓库货位','仓库货位','192.168.20.10214','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050214','FTYUIOLJYT^*(PLKJYT)0214','40.95085916199412','130.27645622989704','G000107','1'),
	('GM000215','2019-11-15 03:56:24','卡车','卡车','192.168.20.10215','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050215','FTYUIOLJYT^*(PLKJYT)0215','41.92878224857997','130.06264962283532','G000108','1'),
	('GM000216','2019-12-05 18:07:28','小超','小超','192.168.20.10216','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050216','FTYUIOLJYT^*(PLKJYT)0216','41.21580683539749','131.1960798970761','G000108','1'),
	('GM000217','2019-12-03 02:48:21','仓库货位','仓库货位','192.168.20.10217','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050217','FTYUIOLJYT^*(PLKJYT)0217','39.949423672477224','129.29908403418497','G000109','1'),
	('GM000218','2019-11-15 20:08:24','卡车','卡车','192.168.20.10218','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050218','FTYUIOLJYT^*(PLKJYT)0218','39.88132035285411','132.11090244583593','G000109','1'),
	('GM000219','2019-11-29 09:14:57','小超','小超','192.168.20.10219','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050219','FTYUIOLJYT^*(PLKJYT)0219','39.93889957068452','130.00516766064013','G000110','1'),
	('GM000220','2019-12-05 21:09:44','仓库货位','仓库货位','192.168.20.10220','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050220','FTYUIOLJYT^*(PLKJYT)0220','42.305717329607425','131.22834225673432','G000110','1'),
	('GM000221','2019-11-22 09:52:07','卡车','卡车','192.168.20.10221','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050221','FTYUIOLJYT^*(PLKJYT)0221','41.7552072951386','131.56267419812744','G000111','1'),
	('GM000222','2019-12-02 20:45:49','小超','小超','192.168.20.10222','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050222','FTYUIOLJYT^*(PLKJYT)0222','42.46734891564183','130.1051459717934','G000111','1'),
	('GM000223','2019-11-15 21:04:49','仓库货位','仓库货位','192.168.20.10223','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050223','FTYUIOLJYT^*(PLKJYT)0223','41.480746011312874','131.92094082855044','G000112','1'),
	('GM000224','2019-11-14 09:45:58','卡车','卡车','192.168.20.10224','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050224','FTYUIOLJYT^*(PLKJYT)0224','40.93138703267624','131.6713669229786','G000112','1'),
	('GM000225','2019-11-30 02:17:22','小超','小超','192.168.20.10225','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050225','FTYUIOLJYT^*(PLKJYT)0225','42.71597598644293','129.43844360027435','G000113','1'),
	('GM000226','2019-11-22 10:15:53','仓库货位','仓库货位','192.168.20.10226','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050226','FTYUIOLJYT^*(PLKJYT)0226','40.65120007272455','130.21477403766738','G000113','1'),
	('GM000227','2019-12-05 09:45:29','卡车','卡车','192.168.20.10227','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050227','FTYUIOLJYT^*(PLKJYT)0227','40.97477302619505','131.27403195597918','G000114','1'),
	('GM000228','2019-11-28 08:44:23','小超','小超','192.168.20.10228','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050228','FTYUIOLJYT^*(PLKJYT)0228','40.1386400109346','130.79642611252942','G000114','1'),
	('GM000229','2019-11-28 13:46:39','仓库货位','仓库货位','192.168.20.10229','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050229','FTYUIOLJYT^*(PLKJYT)0229','40.11944026574093','129.49606388786606','G000115','1'),
	('GM000230','2019-11-21 17:40:04','卡车','卡车','192.168.20.10230','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050230','FTYUIOLJYT^*(PLKJYT)0230','41.6899503284471','129.67606571519633','G000115','1'),
	('GM000231','2019-11-23 00:49:20','小超','小超','192.168.20.10231','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050231','FTYUIOLJYT^*(PLKJYT)0231','40.26132656112078','130.56441997594962','G000116','1'),
	('GM000232','2019-11-22 02:07:14','仓库货位','仓库货位','192.168.20.10232','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050232','FTYUIOLJYT^*(PLKJYT)0232','41.05527812627399','130.22352191868862','G000116','1'),
	('GM000233','2019-11-22 16:41:27','卡车','卡车','192.168.20.10233','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050233','FTYUIOLJYT^*(PLKJYT)0233','39.82376416962227','131.4248279740715','G000117','1'),
	('GM000234','2019-11-25 21:05:06','小超','小超','192.168.20.10234','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050234','FTYUIOLJYT^*(PLKJYT)0234','39.78661741838557','130.63082415000932','G000117','1'),
	('GM000235','2019-11-17 01:59:52','仓库货位','仓库货位','192.168.20.10235','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050235','FTYUIOLJYT^*(PLKJYT)0235','40.34082019133044','132.0775299041741','G000118','1'),
	('GM000236','2019-11-18 08:49:54','卡车','卡车','192.168.20.10236','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050236','FTYUIOLJYT^*(PLKJYT)0236','40.728727977832335','130.93621051871645','G000118','1'),
	('GM000237','2019-11-25 15:08:52','小超','小超','192.168.20.10237','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050237','FTYUIOLJYT^*(PLKJYT)0237','42.38702208680532','132.22412615042145','G000119','1'),
	('GM000238','2019-12-03 20:37:47','仓库货位','仓库货位','192.168.20.10238','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050238','FTYUIOLJYT^*(PLKJYT)0238','41.35809540751671','130.85828928121762','G000119','1'),
	('GM000239','2019-11-25 19:20:15','卡车','卡车','192.168.20.10239','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050239','FTYUIOLJYT^*(PLKJYT)0239','41.40426321289995','129.42911487874957','G000120','1'),
	('GM000240','2019-11-22 01:44:22','小超','小超','192.168.20.10240','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050240','FTYUIOLJYT^*(PLKJYT)0240','42.69487550533637','130.9145107276837','G000120','1'),
	('GM000241','2019-11-21 13:14:19','仓库货位','仓库货位','192.168.20.10241','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050241','FTYUIOLJYT^*(PLKJYT)0241','41.732631256482996','130.76851331124527','G000121','1'),
	('GM000242','2019-11-23 17:12:32','卡车','卡车','192.168.20.10242','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050242','FTYUIOLJYT^*(PLKJYT)0242','40.971181881678625','131.9767120660576','G000121','1'),
	('GM000243','2019-11-22 20:55:42','小超','小超','192.168.20.10243','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050243','FTYUIOLJYT^*(PLKJYT)0243','41.247679938161525','130.17993503741272','G000122','1'),
	('GM000244','2019-11-18 17:40:52','仓库货位','仓库货位','192.168.20.10244','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050244','FTYUIOLJYT^*(PLKJYT)0244','41.435835258149446','130.7772824180518','G000122','1'),
	('GM000245','2019-11-17 15:41:37','卡车','卡车','192.168.20.10245','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050245','FTYUIOLJYT^*(PLKJYT)0245','42.55904233190513','129.82015109524835','G000123','1'),
	('GM000246','2019-11-24 09:37:12','小超','小超','192.168.20.10246','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050246','FTYUIOLJYT^*(PLKJYT)0246','42.30122212697547','129.91759788230945','G000123','1'),
	('GM000247','2019-12-05 07:30:15','仓库货位','仓库货位','192.168.20.10247','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050247','FTYUIOLJYT^*(PLKJYT)0247','41.901261073103534','131.7116692945637','G000124','1'),
	('GM000248','2019-11-25 14:37:43','卡车','卡车','192.168.20.10248','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050248','FTYUIOLJYT^*(PLKJYT)0248','40.723266538773316','129.40651900278712','G000124','1'),
	('GM000249','2019-11-21 17:26:59','小超','小超','192.168.20.10249','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050249','FTYUIOLJYT^*(PLKJYT)0249','40.82989967296479','129.49402732499007','G000125','1'),
	('GM000250','2019-11-17 04:48:33','仓库货位','仓库货位','192.168.20.10250','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050250','FTYUIOLJYT^*(PLKJYT)0250','42.572385038151864','130.9473088665093','G000125','1'),
	('GM000251','2019-11-24 22:43:44','卡车','卡车','192.168.20.10251','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050251','FTYUIOLJYT^*(PLKJYT)0251','42.57264294741885','131.2537394540248','G000126','1'),
	('GM000252','2019-11-19 22:12:01','小超','小超','192.168.20.10252','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050252','FTYUIOLJYT^*(PLKJYT)0252','39.96396522983903','129.63830086670225','G000126','1'),
	('GM000253','2019-12-01 18:31:03','仓库货位','仓库货位','192.168.20.10253','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050253','FTYUIOLJYT^*(PLKJYT)0253','39.840063968527566','130.39522098350957','G000127','1'),
	('GM000254','2019-12-04 06:50:43','卡车','卡车','192.168.20.10254','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050254','FTYUIOLJYT^*(PLKJYT)0254','39.824326403647014','130.01364293949686','G000127','1'),
	('GM000255','2019-12-03 01:48:13','小超','小超','192.168.20.10255','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050255','FTYUIOLJYT^*(PLKJYT)0255','39.80351521449598','129.43021838180215','G000128','1'),
	('GM000256','2019-12-05 05:41:22','仓库货位','仓库货位','192.168.20.10256','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050256','FTYUIOLJYT^*(PLKJYT)0256','40.06582976352427','130.74871137257054','G000128','1');

insert into supplier_space_data values
	('SS000001','成都龙泉驿飞鹤路20号供货商独立管理区','2752082921','1876平方米','W000001','42.5433179755524','132.14259893667705','2019-11-29 18:44:42','1'),
	('SS000002','成都龙泉驿飞鹤路20号供货商独立管理区0002','2656532392','1876平方米0002','W000001','42.23241796753222','131.8782175365973','2019-11-23 15:13:20','1'),
	('SS000003','成都龙泉驿飞鹤路20号供货商独立管理区0003','305045105','1876平方米0003','W000002','41.88234584917182','129.52168416641166','2019-11-24 03:42:13','1'),
	('SS000004','成都龙泉驿飞鹤路20号供货商独立管理区0004','1835339316','1876平方米0004','W000002','40.049257185636726','131.76969738196493','2019-12-03 08:07:48','1');

insert into receiving_space_data values
	('RS000001','成都龙泉驿飞鹤路20号仓库卸货区','1293029170','每个收货区可以供一辆车卸货','1876平方米','W000001','40.37190866023655','129.53073515171255','2019-11-22 12:37:58','1'),
	('RS000002','成都龙泉驿飞鹤路20号仓库卸货区0002','110087783','每个收货区可以供一辆车卸货0002','1876平方米0002','W000001','41.44066622447134','130.89491975408262','2019-11-29 03:22:51','1'),
	('RS000003','成都龙泉驿飞鹤路20号仓库卸货区0003','260405654','每个收货区可以供一辆车卸货0003','1876平方米0003','W000002','42.44979594957646','130.5511587697034','2019-12-04 08:49:26','1'),
	('RS000004','成都龙泉驿飞鹤路20号仓库卸货区0004','679533948','每个收货区可以供一辆车卸货0004','1876平方米0004','W000002','41.35749374054952','131.32889992629845','2019-11-16 17:29:55','1');

insert into shipping_space_data values
	('SS000001','成都龙泉驿飞鹤路20号装货区','2371335286','1876平方米','W000001','41.74979063901655','129.56820449380598','每个收货区可以供一辆车装货','2019-11-16 09:12:46','1'),
	('SS000002','成都龙泉驿飞鹤路20号装货区0002','1925834656','1876平方米0002','W000001','42.41989971725165','132.1419613322271','每个收货区可以供一辆车装货0002','2019-11-16 14:18:05','1'),
	('SS000003','成都龙泉驿飞鹤路20号装货区0003','1019077530','1876平方米0003','W000002','39.833750653269455','132.16793080489458','每个收货区可以供一辆车装货0003','2019-11-17 21:32:55','1'),
	('SS000004','成都龙泉驿飞鹤路20号装货区0004','1822693897','1876平方米0004','W000002','42.15538745624366','129.75592462997832','每个收货区可以供一辆车装货0004','2019-11-29 07:29:23','1');

insert into damage_space_data values
	('DS000001','成都龙泉驿飞鹤路20号仓库损坏货物堆放区','141594986','1876平方米','40.35258419782406','131.53679605184223','W000001','2019-11-19 14:10:16','1'),
	('DS000002','成都龙泉驿飞鹤路20号仓库损坏货物堆放区0002','2466002518','1876平方米0002','41.09346447344321','132.21503017980223','W000001','2019-11-20 23:48:15','1'),
	('DS000003','成都龙泉驿飞鹤路20号仓库损坏货物堆放区0003','2002158522','1876平方米0003','40.67908806396408','129.97559277636225','W000002','2019-12-03 00:46:08','1'),
	('DS000004','成都龙泉驿飞鹤路20号仓库损坏货物堆放区0004','1540767420','1876平方米0004','40.13490035750247','132.25831338032538','W000002','2019-11-17 07:37:51','1');

insert into warehouse_asset_data values
	('WA000001','叉车','备用件存放区设备库房','W000001','2019-11-22 19:11:04','1'),
	('WA000002','托盘','备用件存放区设备库房0002','W000001','2019-11-21 16:56:07','1'),
	('WA000003','传送带备件','备用件存放区设备库房0003','W000002','2019-11-20 21:08:51','1'),
	('WA000004','叉车','备用件存放区设备库房0004','W000002','2019-11-26 12:18:03','1');

insert into transport_fleet_data values
	('TF000001','双链先锋号车队','131029625','RSCC000001','2019-11-25 18:41:06','1'),
	('TF000002','双链先锋号车队0002','426887304','RSCC000001','2019-11-27 16:07:57','1');

insert into transport_truck_data values
	('TT000001','运货卡车','川AK5','503410307','VL9198','EN00102','2019-03-15','100万公里','红色','TF000001','1'),
	('TT000002','运货卡车0002','川AK50002','2799166011','VL91980002','EN001020002','2016-12-28','100万公里0002','蓝色','TF000001','1'),
	('TT000003','运货卡车0003','川AK50003','692122932','VL91980003','EN001020003','2017-05-16','100万公里0003','白色','TF000002','1'),
	('TT000004','运货卡车0004','川AK50004','825818109','VL91980004','EN001020004','2019-02-08','100万公里0004','灰色','TF000002','1');

insert into truck_driver_data values
	('TD000001','运货卡车司机','29781804647','18777778888','TF000001','1'),
	('TD000002','运货卡车司机0002','15625027537','13900000002','TF000001','1'),
	('TD000003','运货卡车司机0003','8057388185','13900000003','TF000002','1'),
	('TD000004','运货卡车司机0004','38369731334','13900000004','TF000002','1');

insert into transport_task_data values
	('TT000001','货运记录','双链二号仓','2019-11-18','RS000001','TD000001','TT000001','TF000001','42.69600143503058','130.33793920510647','1'),
	('TT000002','货运记录0002','双链二号仓0002','2019-09-04','RS000001','TD000001','TT000001','TF000001','41.754793243486766','130.26227907945182','1'),
	('TT000003','货运记录0003','双链二号仓0003','2018-03-31','RS000002','TD000001','TT000001','TF000001','42.43630158216326','130.44589337496936','1'),
	('TT000004','货运记录0004','双链二号仓0004','2017-02-23','RS000002','TD000001','TT000001','TF000001','41.40627661473936','130.90243404560715','1'),
	('TT000005','货运记录0005','双链二号仓0005','2017-04-20','RS000003','TD000002','TT000002','TF000001','42.2652435492654','129.63463871042785','1'),
	('TT000006','货运记录0006','双链二号仓0006','2018-12-27','RS000003','TD000002','TT000002','TF000001','40.478031870554354','131.2761096520812','1'),
	('TT000007','货运记录0007','双链二号仓0007','2018-09-08','RS000004','TD000002','TT000002','TF000001','40.50139287093402','131.44005027611277','1'),
	('TT000008','货运记录0008','双链二号仓0008','2019-05-06','RS000004','TD000002','TT000002','TF000001','41.49986639362624','131.14331592038562','1'),
	('TT000009','货运记录0009','双链二号仓0009','2017-08-31','RS000005','TD000003','TT000003','TF000002','41.974317188065356','129.75684807039255','1'),
	('TT000010','货运记录0010','双链二号仓0010','2019-01-02','RS000005','TD000003','TT000003','TF000002','39.80744054087371','130.3445529583098','1'),
	('TT000011','货运记录0011','双链二号仓0011','2017-12-27','RS000006','TD000003','TT000003','TF000002','40.62100684802419','129.63350526568132','1'),
	('TT000012','货运记录0012','双链二号仓0012','2017-11-29','RS000006','TD000003','TT000003','TF000002','42.2464373930533','131.07566457481798','1'),
	('TT000013','货运记录0013','双链二号仓0013','2019-11-24','RS000007','TD000004','TT000004','TF000002','39.96929302758455','130.9464428256531','1'),
	('TT000014','货运记录0014','双链二号仓0014','2018-03-21','RS000007','TD000004','TT000004','TF000002','39.93554273694338','129.67269938062284','1'),
	('TT000015','货运记录0015','双链二号仓0015','2019-05-04','RS000008','TD000004','TT000004','TF000002','42.52255296110131','129.5366106061157','1'),
	('TT000016','货运记录0016','双链二号仓0016','2018-06-07','RS000008','TD000004','TT000004','TF000002','41.217208349740936','132.12047897769503','1');

insert into transport_task_track_data values
	('TTT000001','2017-05-17','32.67591498102876','106.09227369948677','TT000001','1'),
	('TTT000002','2018-08-15','30.694322061709325','103.55393315730008','TT000001','1'),
	('TTT000003','2017-07-15','31.46480819935089','105.41648568278825','TT000002','1'),
	('TTT000004','2019-09-07','30.554751961926723','103.87852207211948','TT000002','1'),
	('TTT000005','2018-03-04','32.19003553443695','104.35171644538123','TT000003','1'),
	('TTT000006','2019-01-29','30.28131607228774','104.02215464778195','TT000003','1'),
	('TTT000007','2017-08-01','30.23695875548285','104.8531886252917','TT000004','1'),
	('TTT000008','2018-10-09','32.703496801184436','104.52827972002726','TT000004','1'),
	('TTT000009','2019-02-02','30.753785712160045','105.94593593688558','TT000005','1'),
	('TTT000010','2017-07-10','31.5021479764578','103.49910387601585','TT000005','1'),
	('TTT000011','2019-02-15','32.79978737771375','104.30689711054313','TT000006','1'),
	('TTT000012','2018-06-24','29.918033466647067','103.76420197108835','TT000006','1'),
	('TTT000013','2019-05-12','32.22952801008998','104.35444002878397','TT000007','1'),
	('TTT000014','2018-05-13','30.189344539458887','105.55665024181485','TT000007','1'),
	('TTT000015','2018-05-24','32.494239203131016','104.05595203837933','TT000008','1'),
	('TTT000016','2018-01-30','31.11679064935587','105.45515058377033','TT000008','1'),
	('TTT000017','2018-11-07','30.90463712366622','104.5138424605117','TT000009','1'),
	('TTT000018','2019-01-29','32.604853769196936','103.58231563558583','TT000009','1'),
	('TTT000019','2018-03-10','32.80421948599154','103.51058539389608','TT000010','1'),
	('TTT000020','2019-04-29','32.311833317467816','105.01200349541638','TT000010','1'),
	('TTT000021','2019-02-11','32.793495317801664','105.82158590212578','TT000011','1'),
	('TTT000022','2019-10-28','31.943573702137016','104.37119502841355','TT000011','1'),
	('TTT000023','2017-07-18','32.63444330188294','103.8686105512367','TT000012','1'),
	('TTT000024','2019-07-07','31.17105884706968','103.32888839972907','TT000012','1'),
	('TTT000025','2018-12-13','31.27712847564918','104.9548379929057','TT000013','1'),
	('TTT000026','2019-06-20','29.955811287665192','105.66596157786678','TT000013','1'),
	('TTT000027','2018-01-12','30.3788221515454','105.55444114018742','TT000014','1'),
	('TTT000028','2019-03-10','30.685300928083333','104.30166708323871','TT000014','1'),
	('TTT000029','2019-05-11','30.537790746340182','104.224805920976','TT000015','1'),
	('TTT000030','2018-07-14','31.300029215316783','104.91573931906537','TT000015','1'),
	('TTT000031','2017-04-30','32.81237860569904','105.35846017113889','TT000016','1'),
	('TTT000032','2017-03-24','30.521913188402','104.81701072535391','TT000016','1');

insert into account_set_data values
	('AS000001','账套2017','2017年','2017-08-13','企业会计制度','RMB','人民币','招商银行','9790652862778','RSCC000001','RS000001','GS000001','2019-11-28 02:20:31','1'),
	('AS000002','账套2018','2018年','2019-01-24','小企业会计制度','USD','美元','工商银行','24006225029042','RSCC000001','RS000001','GS000001','2019-11-18 01:47:16','1'),
	('AS000003','账套2019','2019年','2017-08-30','合伙制会计制度','RMB','人民币','招商银行','18278969697979','RSCC000001','RS000002','GS000001','2019-11-30 02:06:52','1'),
	('AS000004','账套2017','2017年','2017-09-26','企业会计制度','USD','美元','工商银行','13751573784691','RSCC000001','RS000002','GS000001','2019-11-30 15:22:42','1'),
	('AS000005','账套2018','2018年','2017-12-07','小企业会计制度','RMB','人民币','招商银行','20714809570944','RSCC000001','RS000003','GS000001','2019-11-28 07:48:10','1'),
	('AS000006','账套2019','2019年','2019-07-21','合伙制会计制度','USD','美元','工商银行','2845221203987','RSCC000001','RS000003','GS000001','2019-11-20 22:14:22','1'),
	('AS000007','账套2017','2017年','2019-11-16','企业会计制度','RMB','人民币','招商银行','26897323141177','RSCC000001','RS000004','GS000001','2019-12-06 00:09:08','1'),
	('AS000008','账套2018','2018年','2017-07-10','小企业会计制度','USD','美元','工商银行','6660408999440','RSCC000001','RS000004','GS000001','2019-11-22 19:09:58','1'),
	('AS000009','账套2019','2019年','2018-08-08','合伙制会计制度','RMB','人民币','招商银行','7114629281244','RSCC000001','RS000005','GS000002','2019-11-16 05:36:06','1'),
	('AS000010','账套2017','2017年','2019-09-26','企业会计制度','USD','美元','工商银行','19081441398872','RSCC000001','RS000005','GS000002','2019-11-15 23:27:09','1'),
	('AS000011','账套2018','2018年','2019-05-21','小企业会计制度','RMB','人民币','招商银行','8789081575804','RSCC000001','RS000006','GS000002','2019-11-27 10:49:58','1'),
	('AS000012','账套2019','2019年','2017-08-05','合伙制会计制度','USD','美元','工商银行','6023631253698','RSCC000001','RS000006','GS000002','2019-11-26 19:57:44','1'),
	('AS000013','账套2017','2017年','2019-11-18','企业会计制度','RMB','人民币','招商银行','8612684779389','RSCC000001','RS000007','GS000002','2019-11-14 21:12:03','1'),
	('AS000014','账套2018','2018年','2018-03-23','小企业会计制度','USD','美元','工商银行','13962546748814','RSCC000001','RS000007','GS000002','2019-11-30 15:43:53','1'),
	('AS000015','账套2019','2019年','2018-02-17','合伙制会计制度','RMB','人民币','招商银行','2677278501339','RSCC000001','RS000008','GS000002','2019-11-29 19:23:00','1'),
	('AS000016','账套2017','2017年','2018-07-14','企业会计制度','USD','美元','工商银行','8009903041786','RSCC000001','RS000008','GS000002','2019-11-23 06:35:45','1');
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

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
<<<<<<< HEAD
	('AP000001','2017年1月','2018-03-10','2017-03-14','AS000001','1'),
	('AP000002','2017年2月','2019-02-07','2017-10-10','AS000001','1'),
	('AP000003','2017年3月','2017-05-25','2018-12-16','AS000002','1'),
	('AP000004','2017年4月','2019-01-13','2017-11-29','AS000002','1'),
	('AP000005','2017年5月','2019-01-19','2017-11-08','AS000003','1'),
	('AP000006','2017年6月','2019-07-14','2016-10-26','AS000003','1'),
	('AP000007','2017年7月','2019-02-13','2017-10-11','AS000004','1'),
	('AP000008','2017年8月','2016-11-19','2018-08-25','AS000004','1'),
	('AP000009','2017年9月','2019-05-06','2017-11-02','AS000005','1'),
	('AP000010','2017年10月','2018-04-09','2016-10-28','AS000005','1'),
	('AP000011','2017年11月','2018-10-02','2018-03-25','AS000006','1'),
	('AP000012','2017年12月','2018-03-10','2017-09-15','AS000006','1'),
	('AP000013','2017年1月','2019-04-12','2018-01-02','AS000007','1'),
	('AP000014','2017年2月','2017-11-19','2019-09-02','AS000007','1'),
	('AP000015','2017年3月','2019-09-25','2017-07-01','AS000008','1'),
	('AP000016','2017年4月','2019-01-20','2017-12-18','AS000008','1'),
	('AP000017','2017年5月','2019-06-10','2018-12-01','AS000009','1'),
	('AP000018','2017年6月','2017-09-30','2019-01-20','AS000009','1'),
	('AP000019','2017年7月','2019-01-08','2018-05-30','AS000010','1'),
	('AP000020','2017年8月','2018-10-05','2017-12-14','AS000010','1'),
	('AP000021','2017年9月','2017-02-17','2019-04-22','AS000011','1'),
	('AP000022','2017年10月','2017-11-04','2016-12-24','AS000011','1'),
	('AP000023','2017年11月','2019-04-05','2019-08-27','AS000012','1'),
	('AP000024','2017年12月','2019-06-12','2018-12-25','AS000012','1'),
	('AP000025','2017年1月','2017-03-21','2019-06-09','AS000013','1'),
	('AP000026','2017年2月','2019-01-01','2018-07-31','AS000013','1'),
	('AP000027','2017年3月','2017-06-26','2017-10-07','AS000014','1'),
	('AP000028','2017年4月','2017-05-19','2018-04-30','AS000014','1'),
	('AP000029','2017年5月','2019-03-23','2019-05-14','AS000015','1'),
	('AP000030','2017年6月','2017-07-08','2017-12-02','AS000015','1'),
	('AP000031','2017年7月','2019-07-08','2017-05-02','AS000016','1'),
	('AP000032','2017年8月','2017-02-14','2019-07-06','AS000016','1');
=======
	('AP000001','2017年1月','2017-10-14','2019-08-18','AS000001','1'),
	('AP000002','2017年2月','2019-08-02','2019-08-18','AS000001','1'),
	('AP000003','2017年3月','2018-11-18','2017-08-10','AS000002','1'),
	('AP000004','2017年4月','2019-07-24','2018-07-02','AS000002','1'),
	('AP000005','2017年5月','2018-02-03','2018-05-24','AS000003','1'),
	('AP000006','2017年6月','2019-10-30','2019-10-16','AS000003','1'),
	('AP000007','2017年7月','2018-11-18','2019-02-23','AS000004','1'),
	('AP000008','2017年8月','2019-08-22','2017-02-04','AS000004','1'),
	('AP000009','2017年9月','2019-01-21','2018-03-30','AS000005','1'),
	('AP000010','2017年10月','2017-03-04','2017-04-02','AS000005','1'),
	('AP000011','2017年11月','2018-11-20','2019-03-04','AS000006','1'),
	('AP000012','2017年12月','2018-10-31','2019-04-08','AS000006','1'),
	('AP000013','2017年1月','2017-10-06','2018-03-16','AS000007','1'),
	('AP000014','2017年2月','2019-08-01','2017-12-04','AS000007','1'),
	('AP000015','2017年3月','2018-09-18','2017-07-11','AS000008','1'),
	('AP000016','2017年4月','2018-08-14','2017-02-28','AS000008','1'),
	('AP000017','2017年5月','2018-04-29','2018-10-04','AS000009','1'),
	('AP000018','2017年6月','2018-06-08','2019-10-05','AS000009','1'),
	('AP000019','2017年7月','2018-03-08','2017-04-15','AS000010','1'),
	('AP000020','2017年8月','2018-09-26','2017-04-09','AS000010','1'),
	('AP000021','2017年9月','2019-03-31','2019-09-09','AS000011','1'),
	('AP000022','2017年10月','2017-05-27','2017-03-11','AS000011','1'),
	('AP000023','2017年11月','2019-06-09','2017-11-03','AS000012','1'),
	('AP000024','2017年12月','2019-07-02','2017-07-14','AS000012','1'),
	('AP000025','2017年1月','2017-02-25','2018-09-27','AS000013','1'),
	('AP000026','2017年2月','2017-03-06','2018-09-08','AS000013','1'),
	('AP000027','2017年3月','2019-06-04','2019-02-11','AS000014','1'),
	('AP000028','2017年4月','2018-04-06','2019-03-30','AS000014','1'),
	('AP000029','2017年5月','2018-03-02','2017-01-05','AS000015','1'),
	('AP000030','2017年6月','2019-05-26','2019-01-02','AS000015','1'),
	('AP000031','2017年7月','2017-02-04','2019-04-19','AS000016','1'),
	('AP000032','2017年8月','2018-10-26','2018-09-27','AS000016','1');
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

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
<<<<<<< HEAD
	('AD000001','记账凭证','2018-03-30','AP000001','ADT000001',NULL,NULL,NULL,NULL,'CREATED','1'),
	('AD000002','记账凭证0002','2017-10-17','AP000001','ADT000001',NULL,NULL,NULL,NULL,'CONFIRMED','1'),
	('AD000003','记账凭证0003','2016-11-17','AP000002','ADT000002',NULL,NULL,NULL,NULL,'AUDITED','1'),
	('AD000004','记账凭证0004','2018-03-26','AP000002','ADT000002',NULL,NULL,NULL,NULL,'POSTED','1'),
	('AD000005','记账凭证0005','2018-12-01','AP000003','ADT000003',NULL,NULL,NULL,NULL,'CREATED','1'),
	('AD000006','记账凭证0006','2019-05-26','AP000003','ADT000003',NULL,NULL,NULL,NULL,'CONFIRMED','1'),
	('AD000007','记账凭证0007','2019-08-30','AP000004','ADT000004',NULL,NULL,NULL,NULL,'AUDITED','1'),
	('AD000008','记账凭证0008','2019-07-11','AP000004','ADT000004',NULL,NULL,NULL,NULL,'POSTED','1'),
	('AD000009','记账凭证0009','2018-11-08','AP000005','ADT000005',NULL,NULL,NULL,NULL,'CREATED','1'),
	('AD000010','记账凭证0010','2018-01-12','AP000005','ADT000005',NULL,NULL,NULL,NULL,'CONFIRMED','1'),
	('AD000011','记账凭证0011','2017-01-05','AP000006','ADT000006',NULL,NULL,NULL,NULL,'AUDITED','1'),
	('AD000012','记账凭证0012','2019-09-23','AP000006','ADT000006',NULL,NULL,NULL,NULL,'POSTED','1'),
	('AD000013','记账凭证0013','2018-02-23','AP000007','ADT000007',NULL,NULL,NULL,NULL,'CREATED','1'),
	('AD000014','记账凭证0014','2019-01-09','AP000007','ADT000007',NULL,NULL,NULL,NULL,'CONFIRMED','1'),
	('AD000015','记账凭证0015','2017-05-01','AP000008','ADT000008',NULL,NULL,NULL,NULL,'AUDITED','1'),
	('AD000016','记账凭证0016','2017-06-18','AP000008','ADT000008',NULL,NULL,NULL,NULL,'POSTED','1'),
	('AD000017','记账凭证0017','2017-02-13','AP000009','ADT000009',NULL,NULL,NULL,NULL,'CREATED','1'),
	('AD000018','记账凭证0018','2018-04-18','AP000009','ADT000009',NULL,NULL,NULL,NULL,'CONFIRMED','1'),
	('AD000019','记账凭证0019','2017-04-08','AP000010','ADT000010',NULL,NULL,NULL,NULL,'AUDITED','1'),
	('AD000020','记账凭证0020','2016-11-30','AP000010','ADT000010',NULL,NULL,NULL,NULL,'POSTED','1'),
	('AD000021','记账凭证0021','2017-04-28','AP000011','ADT000011',NULL,NULL,NULL,NULL,'CREATED','1'),
	('AD000022','记账凭证0022','2019-07-20','AP000011','ADT000011',NULL,NULL,NULL,NULL,'CONFIRMED','1'),
	('AD000023','记账凭证0023','2017-02-04','AP000012','ADT000012',NULL,NULL,NULL,NULL,'AUDITED','1'),
	('AD000024','记账凭证0024','2017-12-05','AP000012','ADT000012',NULL,NULL,NULL,NULL,'POSTED','1'),
	('AD000025','记账凭证0025','2017-05-20','AP000013','ADT000013',NULL,NULL,NULL,NULL,'CREATED','1'),
	('AD000026','记账凭证0026','2018-04-16','AP000013','ADT000013',NULL,NULL,NULL,NULL,'CONFIRMED','1'),
	('AD000027','记账凭证0027','2019-02-06','AP000014','ADT000014',NULL,NULL,NULL,NULL,'AUDITED','1'),
	('AD000028','记账凭证0028','2018-01-24','AP000014','ADT000014',NULL,NULL,NULL,NULL,'POSTED','1'),
	('AD000029','记账凭证0029','2019-09-12','AP000015','ADT000015',NULL,NULL,NULL,NULL,'CREATED','1'),
	('AD000030','记账凭证0030','2017-12-17','AP000015','ADT000015',NULL,NULL,NULL,NULL,'CONFIRMED','1'),
	('AD000031','记账凭证0031','2018-07-17','AP000016','ADT000016',NULL,NULL,NULL,NULL,'AUDITED','1'),
	('AD000032','记账凭证0032','2018-03-16','AP000016','ADT000016',NULL,NULL,NULL,NULL,'POSTED','1'),
	('AD000033','记账凭证0033','2019-05-23','AP000017','ADT000017',NULL,NULL,NULL,NULL,'CREATED','1'),
	('AD000034','记账凭证0034','2017-11-03','AP000017','ADT000017',NULL,NULL,NULL,NULL,'CONFIRMED','1'),
	('AD000035','记账凭证0035','2018-02-11','AP000018','ADT000018',NULL,NULL,NULL,NULL,'AUDITED','1'),
	('AD000036','记账凭证0036','2019-04-21','AP000018','ADT000018',NULL,NULL,NULL,NULL,'POSTED','1'),
	('AD000037','记账凭证0037','2019-09-29','AP000019','ADT000019',NULL,NULL,NULL,NULL,'CREATED','1'),
	('AD000038','记账凭证0038','2018-05-28','AP000019','ADT000019',NULL,NULL,NULL,NULL,'CONFIRMED','1'),
	('AD000039','记账凭证0039','2017-08-12','AP000020','ADT000020',NULL,NULL,NULL,NULL,'AUDITED','1'),
	('AD000040','记账凭证0040','2017-01-01','AP000020','ADT000020',NULL,NULL,NULL,NULL,'POSTED','1'),
	('AD000041','记账凭证0041','2017-01-08','AP000021','ADT000021',NULL,NULL,NULL,NULL,'CREATED','1'),
	('AD000042','记账凭证0042','2017-01-19','AP000021','ADT000021',NULL,NULL,NULL,NULL,'CONFIRMED','1'),
	('AD000043','记账凭证0043','2017-12-21','AP000022','ADT000022',NULL,NULL,NULL,NULL,'AUDITED','1'),
	('AD000044','记账凭证0044','2019-06-02','AP000022','ADT000022',NULL,NULL,NULL,NULL,'POSTED','1'),
	('AD000045','记账凭证0045','2018-07-06','AP000023','ADT000023',NULL,NULL,NULL,NULL,'CREATED','1'),
	('AD000046','记账凭证0046','2017-10-09','AP000023','ADT000023',NULL,NULL,NULL,NULL,'CONFIRMED','1'),
	('AD000047','记账凭证0047','2017-12-16','AP000024','ADT000024',NULL,NULL,NULL,NULL,'AUDITED','1'),
	('AD000048','记账凭证0048','2017-05-07','AP000024','ADT000024',NULL,NULL,NULL,NULL,'POSTED','1'),
	('AD000049','记账凭证0049','2017-08-03','AP000025','ADT000025',NULL,NULL,NULL,NULL,'CREATED','1'),
	('AD000050','记账凭证0050','2019-03-14','AP000025','ADT000025',NULL,NULL,NULL,NULL,'CONFIRMED','1'),
	('AD000051','记账凭证0051','2018-04-20','AP000026','ADT000026',NULL,NULL,NULL,NULL,'AUDITED','1'),
	('AD000052','记账凭证0052','2018-05-13','AP000026','ADT000026',NULL,NULL,NULL,NULL,'POSTED','1'),
	('AD000053','记账凭证0053','2018-08-04','AP000027','ADT000027',NULL,NULL,NULL,NULL,'CREATED','1'),
	('AD000054','记账凭证0054','2018-11-29','AP000027','ADT000027',NULL,NULL,NULL,NULL,'CONFIRMED','1'),
	('AD000055','记账凭证0055','2017-06-03','AP000028','ADT000028',NULL,NULL,NULL,NULL,'AUDITED','1'),
	('AD000056','记账凭证0056','2017-11-11','AP000028','ADT000028',NULL,NULL,NULL,NULL,'POSTED','1'),
	('AD000057','记账凭证0057','2019-07-14','AP000029','ADT000029',NULL,NULL,NULL,NULL,'CREATED','1'),
	('AD000058','记账凭证0058','2017-05-08','AP000029','ADT000029',NULL,NULL,NULL,NULL,'CONFIRMED','1'),
	('AD000059','记账凭证0059','2019-08-11','AP000030','ADT000030',NULL,NULL,NULL,NULL,'AUDITED','1'),
	('AD000060','记账凭证0060','2018-02-06','AP000030','ADT000030',NULL,NULL,NULL,NULL,'POSTED','1'),
	('AD000061','记账凭证0061','2017-11-19','AP000031','ADT000031',NULL,NULL,NULL,NULL,'CREATED','1'),
	('AD000062','记账凭证0062','2016-11-07','AP000031','ADT000031',NULL,NULL,NULL,NULL,'CONFIRMED','1'),
	('AD000063','记账凭证0063','2019-01-12','AP000032','ADT000032',NULL,NULL,NULL,NULL,'AUDITED','1'),
	('AD000064','记账凭证0064','2017-07-03','AP000032','ADT000032',NULL,NULL,NULL,NULL,'POSTED','1');

insert into accounting_document_creation_data values
	('ADC000001','财务会计','确认提交','2018-12-19','1');

insert into accounting_document_confirmation_data values
	('ADC000001','财务会计','确认通过','2018-06-19','1');

insert into accounting_document_auditing_data values
	('ADA000001','财务会计','审核通过，要都审核过了才通过哦','2016-11-14','1');

insert into accounting_document_posting_data values
	('ADP000001','财务会计','审核通过，要都审核过了才通过哦','2018-03-09','1');

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
	('OVC000001','财务会计','确认提交','2019-01-05','1');

insert into original_voucher_confirmation_data values
	('OVC000001','财务会计','确认通过','2018-02-11','1');

insert into original_voucher_auditing_data values
	('OVA000001','财务会计','审核通过，要都审核过了才通过哦','2017-07-23','1');

insert into accounting_document_line_data values
	('ADL000001','收到存款','AS9999','借','912636.25','AD000001','AS000001','1'),
	('ADL000002','收到存款0002','AS99990002','贷','932355.56','AD000001','AS000001','1'),
	('ADL000003','收到存款0003','AS99990003','借','830111.50','AD000002','AS000001','1'),
	('ADL000004','收到存款0004','AS99990004','贷','944503.06','AD000002','AS000001','1'),
	('ADL000005','收到存款0005','AS99990005','借','938036.19','AD000003','AS000002','1'),
	('ADL000006','收到存款0006','AS99990006','贷','866392.38','AD000003','AS000002','1'),
	('ADL000007','收到存款0007','AS99990007','借','769658.06','AD000004','AS000002','1'),
	('ADL000008','收到存款0008','AS99990008','贷','826696.75','AD000004','AS000002','1'),
	('ADL000009','收到存款0009','AS99990009','借','922990.25','AD000005','AS000003','1'),
	('ADL000010','收到存款0010','AS99990010','贷','829907.88','AD000005','AS000003','1'),
	('ADL000011','收到存款0011','AS99990011','借','758574.25','AD000006','AS000003','1'),
	('ADL000012','收到存款0012','AS99990012','贷','759226.50','AD000006','AS000003','1'),
	('ADL000013','收到存款0013','AS99990013','借','904160.81','AD000007','AS000004','1'),
	('ADL000014','收到存款0014','AS99990014','贷','886065.38','AD000007','AS000004','1'),
	('ADL000015','收到存款0015','AS99990015','借','722477.94','AD000008','AS000004','1'),
	('ADL000016','收到存款0016','AS99990016','贷','902425.94','AD000008','AS000004','1'),
	('ADL000017','收到存款0017','AS99990017','借','712389.25','AD000009','AS000005','1'),
	('ADL000018','收到存款0018','AS99990018','贷','900414.88','AD000009','AS000005','1'),
	('ADL000019','收到存款0019','AS99990019','借','864959.56','AD000010','AS000005','1'),
	('ADL000020','收到存款0020','AS99990020','贷','727399.56','AD000010','AS000005','1'),
	('ADL000021','收到存款0021','AS99990021','借','892122.19','AD000011','AS000006','1'),
	('ADL000022','收到存款0022','AS99990022','贷','735586.00','AD000011','AS000006','1'),
	('ADL000023','收到存款0023','AS99990023','借','879760.81','AD000012','AS000006','1'),
	('ADL000024','收到存款0024','AS99990024','贷','769088.00','AD000012','AS000006','1'),
	('ADL000025','收到存款0025','AS99990025','借','934801.81','AD000013','AS000007','1'),
	('ADL000026','收到存款0026','AS99990026','贷','973651.50','AD000013','AS000007','1'),
	('ADL000027','收到存款0027','AS99990027','借','942622.12','AD000014','AS000007','1'),
	('ADL000028','收到存款0028','AS99990028','贷','867669.81','AD000014','AS000007','1'),
	('ADL000029','收到存款0029','AS99990029','借','728740.19','AD000015','AS000008','1'),
	('ADL000030','收到存款0030','AS99990030','贷','719901.62','AD000015','AS000008','1'),
	('ADL000031','收到存款0031','AS99990031','借','988073.69','AD000016','AS000008','1'),
	('ADL000032','收到存款0032','AS99990032','贷','817699.88','AD000016','AS000008','1'),
	('ADL000033','收到存款0033','AS99990033','借','769684.31','AD000017','AS000009','1'),
	('ADL000034','收到存款0034','AS99990034','贷','982880.31','AD000017','AS000009','1'),
	('ADL000035','收到存款0035','AS99990035','借','956656.69','AD000018','AS000009','1'),
	('ADL000036','收到存款0036','AS99990036','贷','843004.19','AD000018','AS000009','1'),
	('ADL000037','收到存款0037','AS99990037','借','923055.88','AD000019','AS000010','1'),
	('ADL000038','收到存款0038','AS99990038','贷','822674.69','AD000019','AS000010','1'),
	('ADL000039','收到存款0039','AS99990039','借','705714.31','AD000020','AS000010','1'),
	('ADL000040','收到存款0040','AS99990040','贷','745431.56','AD000020','AS000010','1'),
	('ADL000041','收到存款0041','AS99990041','借','950325.38','AD000021','AS000011','1'),
	('ADL000042','收到存款0042','AS99990042','贷','812411.88','AD000021','AS000011','1'),
	('ADL000043','收到存款0043','AS99990043','借','729331.38','AD000022','AS000011','1'),
	('ADL000044','收到存款0044','AS99990044','贷','815387.56','AD000022','AS000011','1'),
	('ADL000045','收到存款0045','AS99990045','借','892952.88','AD000023','AS000012','1'),
	('ADL000046','收到存款0046','AS99990046','贷','805003.12','AD000023','AS000012','1'),
	('ADL000047','收到存款0047','AS99990047','借','970473.50','AD000024','AS000012','1'),
	('ADL000048','收到存款0048','AS99990048','贷','694935.88','AD000024','AS000012','1'),
	('ADL000049','收到存款0049','AS99990049','借','881456.62','AD000025','AS000013','1'),
	('ADL000050','收到存款0050','AS99990050','贷','693562.06','AD000025','AS000013','1'),
	('ADL000051','收到存款0051','AS99990051','借','854763.94','AD000026','AS000013','1'),
	('ADL000052','收到存款0052','AS99990052','贷','759868.44','AD000026','AS000013','1'),
	('ADL000053','收到存款0053','AS99990053','借','882734.62','AD000027','AS000014','1'),
	('ADL000054','收到存款0054','AS99990054','贷','712863.12','AD000027','AS000014','1'),
	('ADL000055','收到存款0055','AS99990055','借','832845.69','AD000028','AS000014','1'),
	('ADL000056','收到存款0056','AS99990056','贷','704075.56','AD000028','AS000014','1'),
	('ADL000057','收到存款0057','AS99990057','借','722287.00','AD000029','AS000015','1'),
	('ADL000058','收到存款0058','AS99990058','贷','812524.50','AD000029','AS000015','1'),
	('ADL000059','收到存款0059','AS99990059','借','715165.25','AD000030','AS000015','1'),
	('ADL000060','收到存款0060','AS99990060','贷','740523.06','AD000030','AS000015','1'),
	('ADL000061','收到存款0061','AS99990061','借','903156.56','AD000031','AS000016','1'),
	('ADL000062','收到存款0062','AS99990062','贷','716437.44','AD000031','AS000016','1'),
	('ADL000063','收到存款0063','AS99990063','借','723576.69','AD000032','AS000016','1'),
	('ADL000064','收到存款0064','AS99990064','贷','931529.19','AD000032','AS000016','1'),
	('ADL000065','收到存款0065','AS99990065','借','839153.38','AD000033','AS000017','1'),
	('ADL000066','收到存款0066','AS99990066','贷','796661.19','AD000033','AS000017','1'),
	('ADL000067','收到存款0067','AS99990067','借','969584.00','AD000034','AS000017','1'),
	('ADL000068','收到存款0068','AS99990068','贷','719125.62','AD000034','AS000017','1'),
	('ADL000069','收到存款0069','AS99990069','借','930550.31','AD000035','AS000018','1'),
	('ADL000070','收到存款0070','AS99990070','贷','910739.19','AD000035','AS000018','1'),
	('ADL000071','收到存款0071','AS99990071','借','794871.75','AD000036','AS000018','1'),
	('ADL000072','收到存款0072','AS99990072','贷','895230.25','AD000036','AS000018','1'),
	('ADL000073','收到存款0073','AS99990073','借','750162.38','AD000037','AS000019','1'),
	('ADL000074','收到存款0074','AS99990074','贷','858481.69','AD000037','AS000019','1'),
	('ADL000075','收到存款0075','AS99990075','借','897815.88','AD000038','AS000019','1'),
	('ADL000076','收到存款0076','AS99990076','贷','767034.12','AD000038','AS000019','1'),
	('ADL000077','收到存款0077','AS99990077','借','889461.19','AD000039','AS000020','1'),
	('ADL000078','收到存款0078','AS99990078','贷','742542.25','AD000039','AS000020','1'),
	('ADL000079','收到存款0079','AS99990079','借','704707.94','AD000040','AS000020','1'),
	('ADL000080','收到存款0080','AS99990080','贷','930965.44','AD000040','AS000020','1'),
	('ADL000081','收到存款0081','AS99990081','借','796967.50','AD000041','AS000021','1'),
	('ADL000082','收到存款0082','AS99990082','贷','961106.94','AD000041','AS000021','1'),
	('ADL000083','收到存款0083','AS99990083','借','789426.62','AD000042','AS000021','1'),
	('ADL000084','收到存款0084','AS99990084','贷','696186.88','AD000042','AS000021','1'),
	('ADL000085','收到存款0085','AS99990085','借','946205.81','AD000043','AS000022','1'),
	('ADL000086','收到存款0086','AS99990086','贷','918564.88','AD000043','AS000022','1'),
	('ADL000087','收到存款0087','AS99990087','借','908003.25','AD000044','AS000022','1'),
	('ADL000088','收到存款0088','AS99990088','贷','695596.81','AD000044','AS000022','1'),
	('ADL000089','收到存款0089','AS99990089','借','802488.88','AD000045','AS000023','1'),
	('ADL000090','收到存款0090','AS99990090','贷','823072.94','AD000045','AS000023','1'),
	('ADL000091','收到存款0091','AS99990091','借','799136.00','AD000046','AS000023','1'),
	('ADL000092','收到存款0092','AS99990092','贷','721565.69','AD000046','AS000023','1'),
	('ADL000093','收到存款0093','AS99990093','借','786139.69','AD000047','AS000024','1'),
	('ADL000094','收到存款0094','AS99990094','贷','783303.81','AD000047','AS000024','1'),
	('ADL000095','收到存款0095','AS99990095','借','696395.50','AD000048','AS000024','1'),
	('ADL000096','收到存款0096','AS99990096','贷','741247.75','AD000048','AS000024','1'),
	('ADL000097','收到存款0097','AS99990097','借','878519.62','AD000049','AS000025','1'),
	('ADL000098','收到存款0098','AS99990098','贷','835500.12','AD000049','AS000025','1'),
	('ADL000099','收到存款0099','AS99990099','借','968852.44','AD000050','AS000025','1'),
	('ADL000100','收到存款0100','AS99990100','贷','835697.62','AD000050','AS000025','1'),
	('ADL000101','收到存款0101','AS99990101','借','924319.12','AD000051','AS000026','1'),
	('ADL000102','收到存款0102','AS99990102','贷','698080.44','AD000051','AS000026','1'),
	('ADL000103','收到存款0103','AS99990103','借','913951.38','AD000052','AS000026','1'),
	('ADL000104','收到存款0104','AS99990104','贷','946332.31','AD000052','AS000026','1'),
	('ADL000105','收到存款0105','AS99990105','借','867563.81','AD000053','AS000027','1'),
	('ADL000106','收到存款0106','AS99990106','贷','923085.06','AD000053','AS000027','1'),
	('ADL000107','收到存款0107','AS99990107','借','810957.19','AD000054','AS000027','1'),
	('ADL000108','收到存款0108','AS99990108','贷','952659.00','AD000054','AS000027','1'),
	('ADL000109','收到存款0109','AS99990109','借','716378.69','AD000055','AS000028','1'),
	('ADL000110','收到存款0110','AS99990110','贷','777633.75','AD000055','AS000028','1'),
	('ADL000111','收到存款0111','AS99990111','借','804159.75','AD000056','AS000028','1'),
	('ADL000112','收到存款0112','AS99990112','贷','791185.00','AD000056','AS000028','1'),
	('ADL000113','收到存款0113','AS99990113','借','763835.00','AD000057','AS000029','1'),
	('ADL000114','收到存款0114','AS99990114','贷','834431.69','AD000057','AS000029','1'),
	('ADL000115','收到存款0115','AS99990115','借','927589.75','AD000058','AS000029','1'),
	('ADL000116','收到存款0116','AS99990116','贷','837476.75','AD000058','AS000029','1'),
	('ADL000117','收到存款0117','AS99990117','借','718752.62','AD000059','AS000030','1'),
	('ADL000118','收到存款0118','AS99990118','贷','916377.06','AD000059','AS000030','1'),
	('ADL000119','收到存款0119','AS99990119','借','921498.19','AD000060','AS000030','1'),
	('ADL000120','收到存款0120','AS99990120','贷','753829.69','AD000060','AS000030','1'),
	('ADL000121','收到存款0121','AS99990121','借','823299.44','AD000061','AS000031','1'),
	('ADL000122','收到存款0122','AS99990122','贷','821978.38','AD000061','AS000031','1'),
	('ADL000123','收到存款0123','AS99990123','借','757826.88','AD000062','AS000031','1'),
	('ADL000124','收到存款0124','AS99990124','贷','839805.75','AD000062','AS000031','1'),
	('ADL000125','收到存款0125','AS99990125','借','949309.50','AD000063','AS000032','1'),
	('ADL000126','收到存款0126','AS99990126','贷','730744.69','AD000063','AS000032','1'),
	('ADL000127','收到存款0127','AS99990127','借','821080.94','AD000064','AS000032','1'),
	('ADL000128','收到存款0128','AS99990128','贷','763124.25','AD000064','AS000032','1');

insert into level_one_department_data values
	('LOD000001','RSCC000001','供应链部','主要执行集团信息系统建设，维护，规划','刘强','2017-10-22','1'),
	('LOD000002','RSCC000001','采购部','主要执行集团信息系统建设，维护，规划0002','王德宏','2019-08-22','1');

insert into level_two_department_data values
	('LTD000001','LOD000001','信息系统部大数据部门','主要执行集团信息系统建设，维护，规划','2019-07-29','1'),
	('LTD000002','LOD000001','信息系统部大数据部门0002','主要执行集团信息系统建设，维护，规划0002','2018-07-18','1'),
	('LTD000003','LOD000002','信息系统部大数据部门0003','主要执行集团信息系统建设，维护，规划0003','2019-01-08','1'),
	('LTD000004','LOD000002','信息系统部大数据部门0004','主要执行集团信息系统建设，维护，规划0004','2017-04-26','1');

insert into level_three_department_data values
	('LTD000001','LTD000001','信息系统部大数据清洗组','主要执行集团信息系统建设，维护，规划','2017-04-25','1'),
	('LTD000002','LTD000001','信息系统部大数据运算组','主要执行集团信息系统建设，维护，规划0002','2018-12-29','1'),
	('LTD000003','LTD000002','信息系统部大数据解决方案组','主要执行集团信息系统建设，维护，规划0003','2019-02-27','1'),
	('LTD000004','LTD000002','信息系统部大数据清洗组','主要执行集团信息系统建设，维护，规划0004','2017-10-10','1'),
	('LTD000005','LTD000003','信息系统部大数据运算组','主要执行集团信息系统建设，维护，规划0005','2018-01-01','1'),
	('LTD000006','LTD000003','信息系统部大数据解决方案组','主要执行集团信息系统建设，维护，规划0006','2018-12-02','1'),
	('LTD000007','LTD000004','信息系统部大数据清洗组','主要执行集团信息系统建设，维护，规划0007','2016-11-04','1'),
	('LTD000008','LTD000004','信息系统部大数据运算组','主要执行集团信息系统建设，维护，规划0008','2018-11-02','1');
=======
	('AD000001','记账凭证','2018-10-11','AP000001','ADT000001','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000002','记账凭证0002','2019-10-08','AP000001','ADT000001','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000003','记账凭证0003','2017-11-26','AP000002','ADT000002','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000004','记账凭证0004','2018-07-11','AP000002','ADT000002','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000005','记账凭证0005','2018-08-31','AP000003','ADT000003','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000006','记账凭证0006','2019-01-29','AP000003','ADT000003','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000007','记账凭证0007','2019-04-01','AP000004','ADT000004','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000008','记账凭证0008','2017-08-18','AP000004','ADT000004','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000009','记账凭证0009','2017-12-27','AP000005','ADT000005','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000010','记账凭证0010','2019-01-19','AP000005','ADT000005','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000011','记账凭证0011','2018-03-14','AP000006','ADT000006','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000012','记账凭证0012','2017-09-19','AP000006','ADT000006','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000013','记账凭证0013','2018-12-25','AP000007','ADT000007','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000014','记账凭证0014','2019-03-12','AP000007','ADT000007','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000015','记账凭证0015','2019-06-09','AP000008','ADT000008','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000016','记账凭证0016','2019-01-06','AP000008','ADT000008','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000017','记账凭证0017','2018-02-18','AP000009','ADT000009','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000018','记账凭证0018','2017-04-16','AP000009','ADT000009','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000019','记账凭证0019','2018-10-26','AP000010','ADT000010','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000020','记账凭证0020','2017-09-02','AP000010','ADT000010','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000021','记账凭证0021','2018-11-14','AP000011','ADT000011','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000022','记账凭证0022','2019-10-29','AP000011','ADT000011','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000023','记账凭证0023','2018-04-29','AP000012','ADT000012','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000024','记账凭证0024','2016-12-10','AP000012','ADT000012','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000025','记账凭证0025','2017-08-12','AP000013','ADT000013','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000026','记账凭证0026','2019-10-31','AP000013','ADT000013','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000027','记账凭证0027','2017-11-21','AP000014','ADT000014','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000028','记账凭证0028','2019-03-24','AP000014','ADT000014','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000029','记账凭证0029','2018-12-16','AP000015','ADT000015','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000030','记账凭证0030','2019-03-05','AP000015','ADT000015','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000031','记账凭证0031','2019-08-15','AP000016','ADT000016','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000032','记账凭证0032','2017-01-21','AP000016','ADT000016','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000033','记账凭证0033','2017-06-10','AP000017','ADT000017','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000034','记账凭证0034','2018-01-09','AP000017','ADT000017','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000035','记账凭证0035','2019-02-12','AP000018','ADT000018','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000036','记账凭证0036','2017-02-08','AP000018','ADT000018','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000037','记账凭证0037','2018-05-28','AP000019','ADT000019','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000038','记账凭证0038','2018-03-01','AP000019','ADT000019','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000039','记账凭证0039','2017-06-28','AP000020','ADT000020','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000040','记账凭证0040','2019-03-28','AP000020','ADT000020','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000041','记账凭证0041','2019-05-13','AP000021','ADT000021','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000042','记账凭证0042','2018-04-23','AP000021','ADT000021','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000043','记账凭证0043','2018-01-06','AP000022','ADT000022','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000044','记账凭证0044','2019-02-14','AP000022','ADT000022','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000045','记账凭证0045','2017-06-29','AP000023','ADT000023','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000046','记账凭证0046','2018-03-16','AP000023','ADT000023','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000047','记账凭证0047','2018-07-08','AP000024','ADT000024','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000048','记账凭证0048','2019-08-13','AP000024','ADT000024','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000049','记账凭证0049','2017-12-07','AP000025','ADT000025','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000050','记账凭证0050','2017-06-20','AP000025','ADT000025','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000051','记账凭证0051','2019-01-23','AP000026','ADT000026','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000052','记账凭证0052','2019-05-08','AP000026','ADT000026','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000053','记账凭证0053','2018-01-06','AP000027','ADT000027','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000054','记账凭证0054','2017-06-01','AP000027','ADT000027','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000055','记账凭证0055','2018-11-18','AP000028','ADT000028','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000056','记账凭证0056','2018-04-08','AP000028','ADT000028','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000057','记账凭证0057','2019-10-22','AP000029','ADT000029','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000058','记账凭证0058','2016-12-16','AP000029','ADT000029','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000059','记账凭证0059','2018-02-16','AP000030','ADT000030','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000060','记账凭证0060','2019-10-30','AP000030','ADT000030','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000061','记账凭证0061','2018-12-11','AP000031','ADT000031','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000062','记账凭证0062','2017-09-20','AP000031','ADT000031','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000063','记账凭证0063','2018-08-03','AP000032','ADT000032','ADC000001','ADC000001','ADA000001','ADP000001','1'),
	('AD000064','记账凭证0064','2019-07-16','AP000032','ADT000032','ADC000001','ADC000001','ADA000001','ADP000001','1');

insert into accounting_document_creation_data values
	('ADC000001','财务会计','确认提交','2019-02-28','1');

insert into accounting_document_confirmation_data values
	('ADC000001','财务会计','确认通过','2016-12-21','1');

insert into accounting_document_auditing_data values
	('ADA000001','财务会计','审核通过，要都审核过了才通过哦','2017-05-12','1');

insert into accounting_document_posting_data values
	('ADP000001','财务会计','审核通过，要都审核过了才通过哦','2019-03-09','1');

insert into original_voucher_data values
	('OV000001','这是手写的发票','李亚青','本公司','原始凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000001','OVC000001','OVC000001','OVA000001','1'),
	('OV000002','这是手写的发票0002','李亚青0002','本公司0002','发票','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000001','OVC000001','OVC000001','OVA000001','1'),
	('OV000003','这是手写的发票0003','李亚青0003','本公司0003','出库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000002','OVC000001','OVC000001','OVA000001','1'),
	('OV000004','这是手写的发票0004','李亚青0004','本公司0004','入库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000002','OVC000001','OVC000001','OVA000001','1'),
	('OV000005','这是手写的发票0005','李亚青0005','本公司0005','存款回执','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000003','OVC000001','OVC000001','OVA000001','1'),
	('OV000006','这是手写的发票0006','李亚青0006','本公司0006','验收证明','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000003','OVC000001','OVC000001','OVA000001','1'),
	('OV000007','这是手写的发票0007','李亚青0007','本公司0007','借款凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000004','OVC000001','OVC000001','OVA000001','1'),
	('OV000008','这是手写的发票0008','李亚青0008','本公司0008','原始凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000004','OVC000001','OVC000001','OVA000001','1'),
	('OV000009','这是手写的发票0009','李亚青0009','本公司0009','发票','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000005','OVC000001','OVC000001','OVA000001','1'),
	('OV000010','这是手写的发票0010','李亚青0010','本公司0010','出库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000005','OVC000001','OVC000001','OVA000001','1'),
	('OV000011','这是手写的发票0011','李亚青0011','本公司0011','入库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000006','OVC000001','OVC000001','OVA000001','1'),
	('OV000012','这是手写的发票0012','李亚青0012','本公司0012','存款回执','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000006','OVC000001','OVC000001','OVA000001','1'),
	('OV000013','这是手写的发票0013','李亚青0013','本公司0013','验收证明','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000007','OVC000001','OVC000001','OVA000001','1'),
	('OV000014','这是手写的发票0014','李亚青0014','本公司0014','借款凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000007','OVC000001','OVC000001','OVA000001','1'),
	('OV000015','这是手写的发票0015','李亚青0015','本公司0015','原始凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000008','OVC000001','OVC000001','OVA000001','1'),
	('OV000016','这是手写的发票0016','李亚青0016','本公司0016','发票','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000008','OVC000001','OVC000001','OVA000001','1'),
	('OV000017','这是手写的发票0017','李亚青0017','本公司0017','出库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000009','OVC000001','OVC000001','OVA000001','1'),
	('OV000018','这是手写的发票0018','李亚青0018','本公司0018','入库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000009','OVC000001','OVC000001','OVA000001','1'),
	('OV000019','这是手写的发票0019','李亚青0019','本公司0019','存款回执','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000010','OVC000001','OVC000001','OVA000001','1'),
	('OV000020','这是手写的发票0020','李亚青0020','本公司0020','验收证明','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000010','OVC000001','OVC000001','OVA000001','1'),
	('OV000021','这是手写的发票0021','李亚青0021','本公司0021','借款凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000011','OVC000001','OVC000001','OVA000001','1'),
	('OV000022','这是手写的发票0022','李亚青0022','本公司0022','原始凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000011','OVC000001','OVC000001','OVA000001','1'),
	('OV000023','这是手写的发票0023','李亚青0023','本公司0023','发票','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000012','OVC000001','OVC000001','OVA000001','1'),
	('OV000024','这是手写的发票0024','李亚青0024','本公司0024','出库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000012','OVC000001','OVC000001','OVA000001','1'),
	('OV000025','这是手写的发票0025','李亚青0025','本公司0025','入库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000013','OVC000001','OVC000001','OVA000001','1'),
	('OV000026','这是手写的发票0026','李亚青0026','本公司0026','存款回执','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000013','OVC000001','OVC000001','OVA000001','1'),
	('OV000027','这是手写的发票0027','李亚青0027','本公司0027','验收证明','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000014','OVC000001','OVC000001','OVA000001','1'),
	('OV000028','这是手写的发票0028','李亚青0028','本公司0028','借款凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000014','OVC000001','OVC000001','OVA000001','1'),
	('OV000029','这是手写的发票0029','李亚青0029','本公司0029','原始凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000015','OVC000001','OVC000001','OVA000001','1'),
	('OV000030','这是手写的发票0030','李亚青0030','本公司0030','发票','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000015','OVC000001','OVC000001','OVA000001','1'),
	('OV000031','这是手写的发票0031','李亚青0031','本公司0031','出库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000016','OVC000001','OVC000001','OVA000001','1'),
	('OV000032','这是手写的发票0032','李亚青0032','本公司0032','入库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000016','OVC000001','OVC000001','OVA000001','1'),
	('OV000033','这是手写的发票0033','李亚青0033','本公司0033','存款回执','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000017','OVC000001','OVC000001','OVA000001','1'),
	('OV000034','这是手写的发票0034','李亚青0034','本公司0034','验收证明','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000017','OVC000001','OVC000001','OVA000001','1'),
	('OV000035','这是手写的发票0035','李亚青0035','本公司0035','借款凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000018','OVC000001','OVC000001','OVA000001','1'),
	('OV000036','这是手写的发票0036','李亚青0036','本公司0036','原始凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000018','OVC000001','OVC000001','OVA000001','1'),
	('OV000037','这是手写的发票0037','李亚青0037','本公司0037','发票','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000019','OVC000001','OVC000001','OVA000001','1'),
	('OV000038','这是手写的发票0038','李亚青0038','本公司0038','出库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000019','OVC000001','OVC000001','OVA000001','1'),
	('OV000039','这是手写的发票0039','李亚青0039','本公司0039','入库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000020','OVC000001','OVC000001','OVA000001','1'),
	('OV000040','这是手写的发票0040','李亚青0040','本公司0040','存款回执','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000020','OVC000001','OVC000001','OVA000001','1'),
	('OV000041','这是手写的发票0041','李亚青0041','本公司0041','验收证明','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000021','OVC000001','OVC000001','OVA000001','1'),
	('OV000042','这是手写的发票0042','李亚青0042','本公司0042','借款凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000021','OVC000001','OVC000001','OVA000001','1'),
	('OV000043','这是手写的发票0043','李亚青0043','本公司0043','原始凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000022','OVC000001','OVC000001','OVA000001','1'),
	('OV000044','这是手写的发票0044','李亚青0044','本公司0044','发票','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000022','OVC000001','OVC000001','OVA000001','1'),
	('OV000045','这是手写的发票0045','李亚青0045','本公司0045','出库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000023','OVC000001','OVC000001','OVA000001','1'),
	('OV000046','这是手写的发票0046','李亚青0046','本公司0046','入库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000023','OVC000001','OVC000001','OVA000001','1'),
	('OV000047','这是手写的发票0047','李亚青0047','本公司0047','存款回执','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000024','OVC000001','OVC000001','OVA000001','1'),
	('OV000048','这是手写的发票0048','李亚青0048','本公司0048','验收证明','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000024','OVC000001','OVC000001','OVA000001','1'),
	('OV000049','这是手写的发票0049','李亚青0049','本公司0049','借款凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000025','OVC000001','OVC000001','OVA000001','1'),
	('OV000050','这是手写的发票0050','李亚青0050','本公司0050','原始凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000025','OVC000001','OVC000001','OVA000001','1'),
	('OV000051','这是手写的发票0051','李亚青0051','本公司0051','发票','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000026','OVC000001','OVC000001','OVA000001','1'),
	('OV000052','这是手写的发票0052','李亚青0052','本公司0052','出库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000026','OVC000001','OVC000001','OVA000001','1'),
	('OV000053','这是手写的发票0053','李亚青0053','本公司0053','入库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000027','OVC000001','OVC000001','OVA000001','1'),
	('OV000054','这是手写的发票0054','李亚青0054','本公司0054','存款回执','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000027','OVC000001','OVC000001','OVA000001','1'),
	('OV000055','这是手写的发票0055','李亚青0055','本公司0055','验收证明','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000028','OVC000001','OVC000001','OVA000001','1'),
	('OV000056','这是手写的发票0056','李亚青0056','本公司0056','借款凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000028','OVC000001','OVC000001','OVA000001','1'),
	('OV000057','这是手写的发票0057','李亚青0057','本公司0057','原始凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000029','OVC000001','OVC000001','OVA000001','1'),
	('OV000058','这是手写的发票0058','李亚青0058','本公司0058','发票','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000029','OVC000001','OVC000001','OVA000001','1'),
	('OV000059','这是手写的发票0059','李亚青0059','本公司0059','出库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000030','OVC000001','OVC000001','OVA000001','1'),
	('OV000060','这是手写的发票0060','李亚青0060','本公司0060','入库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000030','OVC000001','OVC000001','OVA000001','1'),
	('OV000061','这是手写的发票0061','李亚青0061','本公司0061','存款回执','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000031','OVC000001','OVC000001','OVA000001','1'),
	('OV000062','这是手写的发票0062','李亚青0062','本公司0062','验收证明','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000031','OVC000001','OVC000001','OVA000001','1'),
	('OV000063','这是手写的发票0063','李亚青0063','本公司0063','借款凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000032','OVC000001','OVC000001','OVA000001','1'),
	('OV000064','这是手写的发票0064','李亚青0064','本公司0064','原始凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000032','OVC000001','OVC000001','OVA000001','1'),
	('OV000065','这是手写的发票0065','李亚青0065','本公司0065','发票','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000033','OVC000001','OVC000001','OVA000001','1'),
	('OV000066','这是手写的发票0066','李亚青0066','本公司0066','出库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000033','OVC000001','OVC000001','OVA000001','1'),
	('OV000067','这是手写的发票0067','李亚青0067','本公司0067','入库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000034','OVC000001','OVC000001','OVA000001','1'),
	('OV000068','这是手写的发票0068','李亚青0068','本公司0068','存款回执','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000034','OVC000001','OVC000001','OVA000001','1'),
	('OV000069','这是手写的发票0069','李亚青0069','本公司0069','验收证明','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000035','OVC000001','OVC000001','OVA000001','1'),
	('OV000070','这是手写的发票0070','李亚青0070','本公司0070','借款凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000035','OVC000001','OVC000001','OVA000001','1'),
	('OV000071','这是手写的发票0071','李亚青0071','本公司0071','原始凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000036','OVC000001','OVC000001','OVA000001','1'),
	('OV000072','这是手写的发票0072','李亚青0072','本公司0072','发票','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000036','OVC000001','OVC000001','OVA000001','1'),
	('OV000073','这是手写的发票0073','李亚青0073','本公司0073','出库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000037','OVC000001','OVC000001','OVA000001','1'),
	('OV000074','这是手写的发票0074','李亚青0074','本公司0074','入库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000037','OVC000001','OVC000001','OVA000001','1'),
	('OV000075','这是手写的发票0075','李亚青0075','本公司0075','存款回执','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000038','OVC000001','OVC000001','OVA000001','1'),
	('OV000076','这是手写的发票0076','李亚青0076','本公司0076','验收证明','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000038','OVC000001','OVC000001','OVA000001','1'),
	('OV000077','这是手写的发票0077','李亚青0077','本公司0077','借款凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000039','OVC000001','OVC000001','OVA000001','1'),
	('OV000078','这是手写的发票0078','李亚青0078','本公司0078','原始凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000039','OVC000001','OVC000001','OVA000001','1'),
	('OV000079','这是手写的发票0079','李亚青0079','本公司0079','发票','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000040','OVC000001','OVC000001','OVA000001','1'),
	('OV000080','这是手写的发票0080','李亚青0080','本公司0080','出库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000040','OVC000001','OVC000001','OVA000001','1'),
	('OV000081','这是手写的发票0081','李亚青0081','本公司0081','入库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000041','OVC000001','OVC000001','OVA000001','1'),
	('OV000082','这是手写的发票0082','李亚青0082','本公司0082','存款回执','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000041','OVC000001','OVC000001','OVA000001','1'),
	('OV000083','这是手写的发票0083','李亚青0083','本公司0083','验收证明','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000042','OVC000001','OVC000001','OVA000001','1'),
	('OV000084','这是手写的发票0084','李亚青0084','本公司0084','借款凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000042','OVC000001','OVC000001','OVA000001','1'),
	('OV000085','这是手写的发票0085','李亚青0085','本公司0085','原始凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000043','OVC000001','OVC000001','OVA000001','1'),
	('OV000086','这是手写的发票0086','李亚青0086','本公司0086','发票','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000043','OVC000001','OVC000001','OVA000001','1'),
	('OV000087','这是手写的发票0087','李亚青0087','本公司0087','出库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000044','OVC000001','OVC000001','OVA000001','1'),
	('OV000088','这是手写的发票0088','李亚青0088','本公司0088','入库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000044','OVC000001','OVC000001','OVA000001','1'),
	('OV000089','这是手写的发票0089','李亚青0089','本公司0089','存款回执','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000045','OVC000001','OVC000001','OVA000001','1'),
	('OV000090','这是手写的发票0090','李亚青0090','本公司0090','验收证明','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000045','OVC000001','OVC000001','OVA000001','1'),
	('OV000091','这是手写的发票0091','李亚青0091','本公司0091','借款凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000046','OVC000001','OVC000001','OVA000001','1'),
	('OV000092','这是手写的发票0092','李亚青0092','本公司0092','原始凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000046','OVC000001','OVC000001','OVA000001','1'),
	('OV000093','这是手写的发票0093','李亚青0093','本公司0093','发票','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000047','OVC000001','OVC000001','OVA000001','1'),
	('OV000094','这是手写的发票0094','李亚青0094','本公司0094','出库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000047','OVC000001','OVC000001','OVA000001','1'),
	('OV000095','这是手写的发票0095','李亚青0095','本公司0095','入库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000048','OVC000001','OVC000001','OVA000001','1'),
	('OV000096','这是手写的发票0096','李亚青0096','本公司0096','存款回执','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000048','OVC000001','OVC000001','OVA000001','1'),
	('OV000097','这是手写的发票0097','李亚青0097','本公司0097','验收证明','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000049','OVC000001','OVC000001','OVA000001','1'),
	('OV000098','这是手写的发票0098','李亚青0098','本公司0098','借款凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000049','OVC000001','OVC000001','OVA000001','1'),
	('OV000099','这是手写的发票0099','李亚青0099','本公司0099','原始凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000050','OVC000001','OVC000001','OVA000001','1'),
	('OV000100','这是手写的发票0100','李亚青0100','本公司0100','发票','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000050','OVC000001','OVC000001','OVA000001','1'),
	('OV000101','这是手写的发票0101','李亚青0101','本公司0101','出库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000051','OVC000001','OVC000001','OVA000001','1'),
	('OV000102','这是手写的发票0102','李亚青0102','本公司0102','入库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000051','OVC000001','OVC000001','OVA000001','1'),
	('OV000103','这是手写的发票0103','李亚青0103','本公司0103','存款回执','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000052','OVC000001','OVC000001','OVA000001','1'),
	('OV000104','这是手写的发票0104','李亚青0104','本公司0104','验收证明','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000052','OVC000001','OVC000001','OVA000001','1'),
	('OV000105','这是手写的发票0105','李亚青0105','本公司0105','借款凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000053','OVC000001','OVC000001','OVA000001','1'),
	('OV000106','这是手写的发票0106','李亚青0106','本公司0106','原始凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000053','OVC000001','OVC000001','OVA000001','1'),
	('OV000107','这是手写的发票0107','李亚青0107','本公司0107','发票','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000054','OVC000001','OVC000001','OVA000001','1'),
	('OV000108','这是手写的发票0108','李亚青0108','本公司0108','出库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000054','OVC000001','OVC000001','OVA000001','1'),
	('OV000109','这是手写的发票0109','李亚青0109','本公司0109','入库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000055','OVC000001','OVC000001','OVA000001','1'),
	('OV000110','这是手写的发票0110','李亚青0110','本公司0110','存款回执','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000055','OVC000001','OVC000001','OVA000001','1'),
	('OV000111','这是手写的发票0111','李亚青0111','本公司0111','验收证明','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000056','OVC000001','OVC000001','OVA000001','1'),
	('OV000112','这是手写的发票0112','李亚青0112','本公司0112','借款凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000056','OVC000001','OVC000001','OVA000001','1'),
	('OV000113','这是手写的发票0113','李亚青0113','本公司0113','原始凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000057','OVC000001','OVC000001','OVA000001','1'),
	('OV000114','这是手写的发票0114','李亚青0114','本公司0114','发票','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000057','OVC000001','OVC000001','OVA000001','1'),
	('OV000115','这是手写的发票0115','李亚青0115','本公司0115','出库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000058','OVC000001','OVC000001','OVA000001','1'),
	('OV000116','这是手写的发票0116','李亚青0116','本公司0116','入库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000058','OVC000001','OVC000001','OVA000001','1'),
	('OV000117','这是手写的发票0117','李亚青0117','本公司0117','存款回执','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000059','OVC000001','OVC000001','OVA000001','1'),
	('OV000118','这是手写的发票0118','李亚青0118','本公司0118','验收证明','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000059','OVC000001','OVC000001','OVA000001','1'),
	('OV000119','这是手写的发票0119','李亚青0119','本公司0119','借款凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000060','OVC000001','OVC000001','OVA000001','1'),
	('OV000120','这是手写的发票0120','李亚青0120','本公司0120','原始凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000060','OVC000001','OVC000001','OVA000001','1'),
	('OV000121','这是手写的发票0121','李亚青0121','本公司0121','发票','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000061','OVC000001','OVC000001','OVA000001','1'),
	('OV000122','这是手写的发票0122','李亚青0122','本公司0122','出库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000061','OVC000001','OVC000001','OVA000001','1'),
	('OV000123','这是手写的发票0123','李亚青0123','本公司0123','入库单','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000062','OVC000001','OVC000001','OVA000001','1'),
	('OV000124','这是手写的发票0124','李亚青0124','本公司0124','存款回执','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000062','OVC000001','OVC000001','OVA000001','1'),
	('OV000125','这是手写的发票0125','李亚青0125','本公司0125','验收证明','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000063','OVC000001','OVC000001','OVA000001','1'),
	('OV000126','这是手写的发票0126','李亚青0126','本公司0126','借款凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000063','OVC000001','OVC000001','OVA000001','1'),
	('OV000127','这是手写的发票0127','李亚青0127','本公司0127','原始凭证','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000064','OVC000001','OVC000001','OVA000001','1'),
	('OV000128','这是手写的发票0128','李亚青0128','本公司0128','发票','https://demo.doublechaintech.com/demodata/imageManager/genImage/goodthing00/400/200/grey/','AD000064','OVC000001','OVC000001','OVA000001','1');

insert into original_voucher_creation_data values
	('OVC000001','财务会计','确认提交','2017-10-10','1');

insert into original_voucher_confirmation_data values
	('OVC000001','财务会计','确认通过','2019-10-03','1');

insert into original_voucher_auditing_data values
	('OVA000001','财务会计','审核通过，要都审核过了才通过哦','2017-03-18','1');

insert into accounting_document_line_data values
	('ADL000001','收到存款','AS9999','借','811056.25','AD000001','AS000001','1'),
	('ADL000002','收到存款0002','AS99990002','贷','889071.69','AD000001','AS000001','1'),
	('ADL000003','收到存款0003','AS99990003','借','814455.19','AD000002','AS000001','1'),
	('ADL000004','收到存款0004','AS99990004','贷','946419.62','AD000002','AS000001','1'),
	('ADL000005','收到存款0005','AS99990005','借','758448.56','AD000003','AS000002','1'),
	('ADL000006','收到存款0006','AS99990006','贷','728986.69','AD000003','AS000002','1'),
	('ADL000007','收到存款0007','AS99990007','借','736002.88','AD000004','AS000002','1'),
	('ADL000008','收到存款0008','AS99990008','贷','940253.69','AD000004','AS000002','1'),
	('ADL000009','收到存款0009','AS99990009','借','918870.69','AD000005','AS000003','1'),
	('ADL000010','收到存款0010','AS99990010','贷','841476.06','AD000005','AS000003','1'),
	('ADL000011','收到存款0011','AS99990011','借','797295.06','AD000006','AS000003','1'),
	('ADL000012','收到存款0012','AS99990012','贷','751508.25','AD000006','AS000003','1'),
	('ADL000013','收到存款0013','AS99990013','借','920824.62','AD000007','AS000004','1'),
	('ADL000014','收到存款0014','AS99990014','贷','931172.88','AD000007','AS000004','1'),
	('ADL000015','收到存款0015','AS99990015','借','885346.00','AD000008','AS000004','1'),
	('ADL000016','收到存款0016','AS99990016','贷','848152.62','AD000008','AS000004','1'),
	('ADL000017','收到存款0017','AS99990017','借','767487.06','AD000009','AS000005','1'),
	('ADL000018','收到存款0018','AS99990018','贷','860864.94','AD000009','AS000005','1'),
	('ADL000019','收到存款0019','AS99990019','借','920934.75','AD000010','AS000005','1'),
	('ADL000020','收到存款0020','AS99990020','贷','729296.88','AD000010','AS000005','1'),
	('ADL000021','收到存款0021','AS99990021','借','932307.62','AD000011','AS000006','1'),
	('ADL000022','收到存款0022','AS99990022','贷','911197.50','AD000011','AS000006','1'),
	('ADL000023','收到存款0023','AS99990023','借','915554.19','AD000012','AS000006','1'),
	('ADL000024','收到存款0024','AS99990024','贷','934240.56','AD000012','AS000006','1'),
	('ADL000025','收到存款0025','AS99990025','借','883526.38','AD000013','AS000007','1'),
	('ADL000026','收到存款0026','AS99990026','贷','903651.00','AD000013','AS000007','1'),
	('ADL000027','收到存款0027','AS99990027','借','764561.75','AD000014','AS000007','1'),
	('ADL000028','收到存款0028','AS99990028','贷','847614.81','AD000014','AS000007','1'),
	('ADL000029','收到存款0029','AS99990029','借','819683.88','AD000015','AS000008','1'),
	('ADL000030','收到存款0030','AS99990030','贷','759195.88','AD000015','AS000008','1'),
	('ADL000031','收到存款0031','AS99990031','借','861979.12','AD000016','AS000008','1'),
	('ADL000032','收到存款0032','AS99990032','贷','721864.31','AD000016','AS000008','1'),
	('ADL000033','收到存款0033','AS99990033','借','979605.94','AD000017','AS000009','1'),
	('ADL000034','收到存款0034','AS99990034','贷','884893.81','AD000017','AS000009','1'),
	('ADL000035','收到存款0035','AS99990035','借','875777.94','AD000018','AS000009','1'),
	('ADL000036','收到存款0036','AS99990036','贷','840401.19','AD000018','AS000009','1'),
	('ADL000037','收到存款0037','AS99990037','借','786079.25','AD000019','AS000010','1'),
	('ADL000038','收到存款0038','AS99990038','贷','894024.12','AD000019','AS000010','1'),
	('ADL000039','收到存款0039','AS99990039','借','726628.75','AD000020','AS000010','1'),
	('ADL000040','收到存款0040','AS99990040','贷','757072.44','AD000020','AS000010','1'),
	('ADL000041','收到存款0041','AS99990041','借','772989.19','AD000021','AS000011','1'),
	('ADL000042','收到存款0042','AS99990042','贷','759004.00','AD000021','AS000011','1'),
	('ADL000043','收到存款0043','AS99990043','借','932183.06','AD000022','AS000011','1'),
	('ADL000044','收到存款0044','AS99990044','贷','868044.44','AD000022','AS000011','1'),
	('ADL000045','收到存款0045','AS99990045','借','763680.25','AD000023','AS000012','1'),
	('ADL000046','收到存款0046','AS99990046','贷','875933.50','AD000023','AS000012','1'),
	('ADL000047','收到存款0047','AS99990047','借','971629.88','AD000024','AS000012','1'),
	('ADL000048','收到存款0048','AS99990048','贷','761665.88','AD000024','AS000012','1'),
	('ADL000049','收到存款0049','AS99990049','借','754954.00','AD000025','AS000013','1'),
	('ADL000050','收到存款0050','AS99990050','贷','720834.88','AD000025','AS000013','1'),
	('ADL000051','收到存款0051','AS99990051','借','927410.69','AD000026','AS000013','1'),
	('ADL000052','收到存款0052','AS99990052','贷','853537.75','AD000026','AS000013','1'),
	('ADL000053','收到存款0053','AS99990053','借','718715.12','AD000027','AS000014','1'),
	('ADL000054','收到存款0054','AS99990054','贷','898421.94','AD000027','AS000014','1'),
	('ADL000055','收到存款0055','AS99990055','借','820459.88','AD000028','AS000014','1'),
	('ADL000056','收到存款0056','AS99990056','贷','940379.50','AD000028','AS000014','1'),
	('ADL000057','收到存款0057','AS99990057','借','934555.75','AD000029','AS000015','1'),
	('ADL000058','收到存款0058','AS99990058','贷','839793.94','AD000029','AS000015','1'),
	('ADL000059','收到存款0059','AS99990059','借','864471.50','AD000030','AS000015','1'),
	('ADL000060','收到存款0060','AS99990060','贷','755921.19','AD000030','AS000015','1'),
	('ADL000061','收到存款0061','AS99990061','借','882232.19','AD000031','AS000016','1'),
	('ADL000062','收到存款0062','AS99990062','贷','783725.50','AD000031','AS000016','1'),
	('ADL000063','收到存款0063','AS99990063','借','792029.25','AD000032','AS000016','1'),
	('ADL000064','收到存款0064','AS99990064','贷','951376.12','AD000032','AS000016','1'),
	('ADL000065','收到存款0065','AS99990065','借','847566.94','AD000033','AS000017','1'),
	('ADL000066','收到存款0066','AS99990066','贷','849115.75','AD000033','AS000017','1'),
	('ADL000067','收到存款0067','AS99990067','借','893316.56','AD000034','AS000017','1'),
	('ADL000068','收到存款0068','AS99990068','贷','704174.88','AD000034','AS000017','1'),
	('ADL000069','收到存款0069','AS99990069','借','709289.75','AD000035','AS000018','1'),
	('ADL000070','收到存款0070','AS99990070','贷','727861.31','AD000035','AS000018','1'),
	('ADL000071','收到存款0071','AS99990071','借','981592.31','AD000036','AS000018','1'),
	('ADL000072','收到存款0072','AS99990072','贷','767414.88','AD000036','AS000018','1'),
	('ADL000073','收到存款0073','AS99990073','借','783070.31','AD000037','AS000019','1'),
	('ADL000074','收到存款0074','AS99990074','贷','738251.81','AD000037','AS000019','1'),
	('ADL000075','收到存款0075','AS99990075','借','787965.25','AD000038','AS000019','1'),
	('ADL000076','收到存款0076','AS99990076','贷','730758.44','AD000038','AS000019','1'),
	('ADL000077','收到存款0077','AS99990077','借','933016.56','AD000039','AS000020','1'),
	('ADL000078','收到存款0078','AS99990078','贷','845223.00','AD000039','AS000020','1'),
	('ADL000079','收到存款0079','AS99990079','借','771721.62','AD000040','AS000020','1'),
	('ADL000080','收到存款0080','AS99990080','贷','755890.19','AD000040','AS000020','1'),
	('ADL000081','收到存款0081','AS99990081','借','841871.81','AD000041','AS000021','1'),
	('ADL000082','收到存款0082','AS99990082','贷','941718.38','AD000041','AS000021','1'),
	('ADL000083','收到存款0083','AS99990083','借','848481.44','AD000042','AS000021','1'),
	('ADL000084','收到存款0084','AS99990084','贷','956759.75','AD000042','AS000021','1'),
	('ADL000085','收到存款0085','AS99990085','借','839543.44','AD000043','AS000022','1'),
	('ADL000086','收到存款0086','AS99990086','贷','939624.19','AD000043','AS000022','1'),
	('ADL000087','收到存款0087','AS99990087','借','834583.19','AD000044','AS000022','1'),
	('ADL000088','收到存款0088','AS99990088','贷','902397.00','AD000044','AS000022','1'),
	('ADL000089','收到存款0089','AS99990089','借','894964.44','AD000045','AS000023','1'),
	('ADL000090','收到存款0090','AS99990090','贷','843559.44','AD000045','AS000023','1'),
	('ADL000091','收到存款0091','AS99990091','借','897604.44','AD000046','AS000023','1'),
	('ADL000092','收到存款0092','AS99990092','贷','929263.56','AD000046','AS000023','1'),
	('ADL000093','收到存款0093','AS99990093','借','916663.19','AD000047','AS000024','1'),
	('ADL000094','收到存款0094','AS99990094','贷','964284.56','AD000047','AS000024','1'),
	('ADL000095','收到存款0095','AS99990095','借','794105.12','AD000048','AS000024','1'),
	('ADL000096','收到存款0096','AS99990096','贷','808724.94','AD000048','AS000024','1'),
	('ADL000097','收到存款0097','AS99990097','借','875224.19','AD000049','AS000025','1'),
	('ADL000098','收到存款0098','AS99990098','贷','770641.06','AD000049','AS000025','1'),
	('ADL000099','收到存款0099','AS99990099','借','792639.94','AD000050','AS000025','1'),
	('ADL000100','收到存款0100','AS99990100','贷','891703.56','AD000050','AS000025','1'),
	('ADL000101','收到存款0101','AS99990101','借','776682.25','AD000051','AS000026','1'),
	('ADL000102','收到存款0102','AS99990102','贷','778637.69','AD000051','AS000026','1'),
	('ADL000103','收到存款0103','AS99990103','借','976104.75','AD000052','AS000026','1'),
	('ADL000104','收到存款0104','AS99990104','贷','835044.12','AD000052','AS000026','1'),
	('ADL000105','收到存款0105','AS99990105','借','761338.38','AD000053','AS000027','1'),
	('ADL000106','收到存款0106','AS99990106','贷','704273.06','AD000053','AS000027','1'),
	('ADL000107','收到存款0107','AS99990107','借','754479.75','AD000054','AS000027','1'),
	('ADL000108','收到存款0108','AS99990108','贷','868793.88','AD000054','AS000027','1'),
	('ADL000109','收到存款0109','AS99990109','借','874259.56','AD000055','AS000028','1'),
	('ADL000110','收到存款0110','AS99990110','贷','703039.75','AD000055','AS000028','1'),
	('ADL000111','收到存款0111','AS99990111','借','873121.12','AD000056','AS000028','1'),
	('ADL000112','收到存款0112','AS99990112','贷','824264.31','AD000056','AS000028','1'),
	('ADL000113','收到存款0113','AS99990113','借','725732.88','AD000057','AS000029','1'),
	('ADL000114','收到存款0114','AS99990114','贷','735006.06','AD000057','AS000029','1'),
	('ADL000115','收到存款0115','AS99990115','借','928386.75','AD000058','AS000029','1'),
	('ADL000116','收到存款0116','AS99990116','贷','791909.50','AD000058','AS000029','1'),
	('ADL000117','收到存款0117','AS99990117','借','738710.44','AD000059','AS000030','1'),
	('ADL000118','收到存款0118','AS99990118','贷','737413.44','AD000059','AS000030','1'),
	('ADL000119','收到存款0119','AS99990119','借','823219.69','AD000060','AS000030','1'),
	('ADL000120','收到存款0120','AS99990120','贷','784298.25','AD000060','AS000030','1'),
	('ADL000121','收到存款0121','AS99990121','借','953867.00','AD000061','AS000031','1'),
	('ADL000122','收到存款0122','AS99990122','贷','792806.62','AD000061','AS000031','1'),
	('ADL000123','收到存款0123','AS99990123','借','703951.75','AD000062','AS000031','1'),
	('ADL000124','收到存款0124','AS99990124','贷','959004.44','AD000062','AS000031','1'),
	('ADL000125','收到存款0125','AS99990125','借','906249.81','AD000063','AS000032','1'),
	('ADL000126','收到存款0126','AS99990126','贷','983489.12','AD000063','AS000032','1'),
	('ADL000127','收到存款0127','AS99990127','借','864837.38','AD000064','AS000032','1'),
	('ADL000128','收到存款0128','AS99990128','贷','708055.94','AD000064','AS000032','1');

insert into level_one_department_data values
	('LOD000001','RSCC000001','供应链部','主要执行集团信息系统建设，维护，规划','刘强','2018-03-09','1'),
	('LOD000002','RSCC000001','采购部','主要执行集团信息系统建设，维护，规划0002','王德宏','2017-02-21','1');

insert into level_two_department_data values
	('LTD000001','LOD000001','信息系统部大数据部门','主要执行集团信息系统建设，维护，规划','2017-08-25','1'),
	('LTD000002','LOD000001','信息系统部大数据部门0002','主要执行集团信息系统建设，维护，规划0002','2018-03-20','1'),
	('LTD000003','LOD000002','信息系统部大数据部门0003','主要执行集团信息系统建设，维护，规划0003','2018-07-29','1'),
	('LTD000004','LOD000002','信息系统部大数据部门0004','主要执行集团信息系统建设，维护，规划0004','2016-12-09','1');

insert into level_three_department_data values
	('LTD000001','LTD000001','信息系统部大数据清洗组','主要执行集团信息系统建设，维护，规划','2019-05-27','1'),
	('LTD000002','LTD000001','信息系统部大数据运算组','主要执行集团信息系统建设，维护，规划0002','2018-12-06','1'),
	('LTD000003','LTD000002','信息系统部大数据解决方案组','主要执行集团信息系统建设，维护，规划0003','2017-04-30','1'),
	('LTD000004','LTD000002','信息系统部大数据清洗组','主要执行集团信息系统建设，维护，规划0004','2019-11-13','1'),
	('LTD000005','LTD000003','信息系统部大数据运算组','主要执行集团信息系统建设，维护，规划0005','2019-09-14','1'),
	('LTD000006','LTD000003','信息系统部大数据解决方案组','主要执行集团信息系统建设，维护，规划0006','2018-02-23','1'),
	('LTD000007','LTD000004','信息系统部大数据清洗组','主要执行集团信息系统建设，维护，规划0007','2017-02-23','1'),
	('LTD000008','LTD000004','信息系统部大数据运算组','主要执行集团信息系统建设，维护，规划0008','2019-11-18','1');
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

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
<<<<<<< HEAD
	('V000001','面试官','小伙子不错，值得培养','2018-12-04','1');

insert into employee_data values
	('E000001','RSCC000001','程序员','LTD000001','张','文强','share@163.com','北京','学院路234号','18677778888','OT000001','RT000001','SG000001','6226 7788 9908 ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-14 23:54:57','JOB_APPLIED','1'),
	('E000002','RSCC000001','程序员0002','LTD000001','王','大伟','2@qq.com','天津','学院路234号0002','13900000002','OT000001','RT000001','SG000001','6226 7788 9908 0002',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-27 14:31:48','PASSED_WITH_PROFESSION','1'),
	('E000003','RSCC000001','程序员0003','LTD000002','李','字章','3@qq.com','成都','学院路234号0003','13900000003','OT000001','RT000001','SG000001','6226 7788 9908 0003',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-09 22:38:11','PASSED_BY_HR','1'),
	('E000004','RSCC000001','程序员0004','LTD000002','贺','文强','4@qq.com','上海','学院路234号0004','13900000004','OT000001','RT000001','SG000001','6226 7788 9908 0004',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-12 10:29:30','OFFER_APPROVED','1'),
	('E000005','RSCC000001','程序员0005','LTD000003','张','大伟','5@qq.com','深圳','学院路234号0005','13900000005','OT000001','RT000001','SG000001','6226 7788 9908 0005',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-08 00:27:21','OFFER_ACCEPTED','1'),
	('E000006','RSCC000001','程序员0006','LTD000003','王','字章','6@qq.com','广州','学院路234号0006','13900000006','OT000001','RT000001','SG000001','6226 7788 9908 0006',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-25 01:57:48','EMPLOYEE_BOARDED','1'),
	('E000007','RSCC000001','程序员0007','LTD000004','李','文强','7@qq.com','西安','学院路234号0007','13900000007','OT000001','RT000001','SG000001','6226 7788 9908 0007',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-28 18:09:36','TERMINATED','1'),
	('E000008','RSCC000001','程序员0008','LTD000004','贺','大伟','8@qq.com','北京','学院路234号0008','13900000008','OT000001','RT000001','SG000001','6226 7788 9908 0008',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-30 10:00:52','JOB_APPLIED','1'),
	('E000009','RSCC000001','程序员0009','LTD000005','张','字章','9@qq.com','天津','学院路234号0009','13900000009','OT000002','RT000002','SG000002','6226 7788 9908 0009',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-28 09:44:35','PASSED_WITH_PROFESSION','1'),
	('E000010','RSCC000001','程序员0010','LTD000005','王','文强','10@qq.com','成都','学院路234号0010','13900000010','OT000002','RT000002','SG000002','6226 7788 9908 0010',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-02 19:57:10','PASSED_BY_HR','1'),
	('E000011','RSCC000001','程序员0011','LTD000006','李','大伟','11@qq.com','上海','学院路234号0011','13900000011','OT000002','RT000002','SG000002','6226 7788 9908 0011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-13 09:09:45','OFFER_APPROVED','1'),
	('E000012','RSCC000001','程序员0012','LTD000006','贺','字章','12@qq.com','深圳','学院路234号0012','13900000012','OT000002','RT000002','SG000002','6226 7788 9908 0012',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-04 10:16:55','OFFER_ACCEPTED','1'),
	('E000013','RSCC000001','程序员0013','LTD000007','张','文强','13@qq.com','广州','学院路234号0013','13900000013','OT000002','RT000002','SG000002','6226 7788 9908 0013',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-26 15:43:39','EMPLOYEE_BOARDED','1'),
	('E000014','RSCC000001','程序员0014','LTD000007','王','大伟','14@qq.com','西安','学院路234号0014','13900000014','OT000002','RT000002','SG000002','6226 7788 9908 0014',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-03 04:57:22','TERMINATED','1'),
	('E000015','RSCC000001','程序员0015','LTD000008','李','字章','15@qq.com','北京','学院路234号0015','13900000015','OT000002','RT000002','SG000002','6226 7788 9908 0015',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-01 11:07:01','JOB_APPLIED','1'),
	('E000016','RSCC000001','程序员0016','LTD000008','贺','文强','16@qq.com','天津','学院路234号0016','13900000016','OT000002','RT000002','SG000002','6226 7788 9908 0016',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-12 12:02:28','PASSED_WITH_PROFESSION','1');

insert into job_application_data values
	('JA000001','2019-01-30','申请者本人','我觉得我符合职位要求，请给我一个机会为公司发展做出贡献，谢谢！','1');

insert into profession_interview_data values
	('PI000001','技术部','2017-05-04','能力各方面表现不错，进入下一轮','1');

insert into hr_interview_data values
	('HI000001','人力资源部','2019-07-09','软技能，责任感，气质不错啊','1');

insert into offer_approval_data values
	('OA000001','总经理','2018-07-30','该员工发展潜力不错，','1');

insert into offer_acceptance_data values
	('OA000001','申请者','2017-10-03','谢谢，我一个月内上班','1');

insert into employee_boarding_data values
	('EB000001','人力资源部','2017-05-19','欢迎加入植物医生大家庭','1');

insert into instructor_data values
	('I000001','高级讲师','张','文强','18699990000','instructor@gmail.com','RSCC000001','这是一个长长长长长长长长的介绍','2019-10-02 22:56:52','1'),
	('I000002','高级讲师0002','王','大伟','13900000002','2@qq.com','RSCC000001','这是一个长长长长长长长长的介绍0002','2019-10-03 03:34:01','1');

insert into company_training_data values
	('CT000001','入职培训','RSCC000001','I000001','TCT000001','2017-12-27','3','2019-10-10 08:02:10','1'),
	('CT000002','入职培训0002','RSCC000001','I000001','TCT000001','2018-06-02','3','2019-10-08 09:12:05','1'),
	('CT000003','入职培训0003','RSCC000001','I000002','TCT000002','2018-02-19','3','2019-10-02 00:09:59','1'),
	('CT000004','入职培训0004','RSCC000001','I000002','TCT000002','2017-10-12','3','2019-10-15 00:16:48','1');

insert into scoring_data values
	('S000001','王志文','81','这个题做的真不错啊','1');

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
=======
	('V000001','面试官','小伙子不错，值得培养','2018-07-27','1');

insert into employee_data values
	('E000001','RSCC000001','程序员','LTD000001','张','文强','share@163.com','北京','学院路234号','18677778888','OT000001','RT000001','SG000001','6226 7788 9908 ','JA000001','PI000001','HI000001','OA000001','OA000001','EB000001','T000001','2019-11-23 18:51:05','1'),
	('E000002','RSCC000001','程序员0002','LTD000001','王','大伟','2@qq.com','天津','学院路234号0002','13900000002','OT000001','RT000001','SG000001','6226 7788 9908 0002','JA000001','PI000001','HI000001','OA000001','OA000001','EB000001','T000001','2019-11-22 14:45:28','1'),
	('E000003','RSCC000001','程序员0003','LTD000002','李','字章','3@qq.com','成都','学院路234号0003','13900000003','OT000001','RT000001','SG000001','6226 7788 9908 0003','JA000001','PI000001','HI000001','OA000001','OA000001','EB000001','T000001','2019-11-16 18:51:13','1'),
	('E000004','RSCC000001','程序员0004','LTD000002','贺','文强','4@qq.com','上海','学院路234号0004','13900000004','OT000001','RT000001','SG000001','6226 7788 9908 0004','JA000001','PI000001','HI000001','OA000001','OA000001','EB000001','T000001','2019-11-17 22:09:48','1'),
	('E000005','RSCC000001','程序员0005','LTD000003','张','大伟','5@qq.com','深圳','学院路234号0005','13900000005','OT000001','RT000001','SG000001','6226 7788 9908 0005','JA000001','PI000001','HI000001','OA000001','OA000001','EB000001','T000002','2019-11-29 03:55:16','1'),
	('E000006','RSCC000001','程序员0006','LTD000003','王','字章','6@qq.com','广州','学院路234号0006','13900000006','OT000001','RT000001','SG000001','6226 7788 9908 0006','JA000001','PI000001','HI000001','OA000001','OA000001','EB000001','T000002','2019-11-17 04:46:49','1'),
	('E000007','RSCC000001','程序员0007','LTD000004','李','文强','7@qq.com','西安','学院路234号0007','13900000007','OT000001','RT000001','SG000001','6226 7788 9908 0007','JA000001','PI000001','HI000001','OA000001','OA000001','EB000001','T000002','2019-11-22 04:09:33','1'),
	('E000008','RSCC000001','程序员0008','LTD000004','贺','大伟','8@qq.com','北京','学院路234号0008','13900000008','OT000001','RT000001','SG000001','6226 7788 9908 0008','JA000001','PI000001','HI000001','OA000001','OA000001','EB000001','T000002','2019-11-20 03:55:31','1'),
	('E000009','RSCC000001','程序员0009','LTD000005','张','字章','9@qq.com','天津','学院路234号0009','13900000009','OT000002','RT000002','SG000002','6226 7788 9908 0009','JA000001','PI000001','HI000001','OA000001','OA000001','EB000001','T000003','2019-12-04 19:29:16','1'),
	('E000010','RSCC000001','程序员0010','LTD000005','王','文强','10@qq.com','成都','学院路234号0010','13900000010','OT000002','RT000002','SG000002','6226 7788 9908 0010','JA000001','PI000001','HI000001','OA000001','OA000001','EB000001','T000003','2019-11-29 22:12:47','1'),
	('E000011','RSCC000001','程序员0011','LTD000006','李','大伟','11@qq.com','上海','学院路234号0011','13900000011','OT000002','RT000002','SG000002','6226 7788 9908 0011','JA000001','PI000001','HI000001','OA000001','OA000001','EB000001','T000003','2019-12-03 19:13:56','1'),
	('E000012','RSCC000001','程序员0012','LTD000006','贺','字章','12@qq.com','深圳','学院路234号0012','13900000012','OT000002','RT000002','SG000002','6226 7788 9908 0012','JA000001','PI000001','HI000001','OA000001','OA000001','EB000001','T000003','2019-11-17 17:16:14','1'),
	('E000013','RSCC000001','程序员0013','LTD000007','张','文强','13@qq.com','广州','学院路234号0013','13900000013','OT000002','RT000002','SG000002','6226 7788 9908 0013','JA000001','PI000001','HI000001','OA000001','OA000001','EB000001','T000004','2019-11-25 19:57:02','1'),
	('E000014','RSCC000001','程序员0014','LTD000007','王','大伟','14@qq.com','西安','学院路234号0014','13900000014','OT000002','RT000002','SG000002','6226 7788 9908 0014','JA000001','PI000001','HI000001','OA000001','OA000001','EB000001','T000004','2019-11-21 22:02:46','1'),
	('E000015','RSCC000001','程序员0015','LTD000008','李','字章','15@qq.com','北京','学院路234号0015','13900000015','OT000002','RT000002','SG000002','6226 7788 9908 0015','JA000001','PI000001','HI000001','OA000001','OA000001','EB000001','T000004','2019-11-25 16:45:47','1'),
	('E000016','RSCC000001','程序员0016','LTD000008','贺','文强','16@qq.com','天津','学院路234号0016','13900000016','OT000002','RT000002','SG000002','6226 7788 9908 0016','JA000001','PI000001','HI000001','OA000001','OA000001','EB000001','T000004','2019-11-14 06:53:49','1');

insert into job_application_data values
	('JA000001','2017-08-07','申请者本人','我觉得我符合职位要求，请给我一个机会为公司发展做出贡献，谢谢！','1');

insert into profession_interview_data values
	('PI000001','技术部','2019-08-15','能力各方面表现不错，进入下一轮','1');

insert into hr_interview_data values
	('HI000001','人力资源部','2016-12-15','软技能，责任感，气质不错啊','1');

insert into offer_approval_data values
	('OA000001','总经理','2018-08-04','该员工发展潜力不错，','1');

insert into offer_acceptance_data values
	('OA000001','申请者','2017-03-08','谢谢，我一个月内上班','1');

insert into employee_boarding_data values
	('EB000001','人力资源部','2017-11-30','欢迎加入植物医生大家庭','1');

insert into instructor_data values
	('I000001','高级讲师','张','文强','18699990000','instructor@gmail.com','RSCC000001','这是一个长长长长长长长长的介绍','2019-11-25 03:33:11','1'),
	('I000002','高级讲师0002','王','大伟','13900000002','2@qq.com','RSCC000001','这是一个长长长长长长长长的介绍0002','2019-11-24 10:04:12','1');

insert into company_training_data values
	('CT000001','入职培训','RSCC000001','I000001','TCT000001','2017-05-04','3','2019-11-28 11:28:31','1'),
	('CT000002','入职培训0002','RSCC000001','I000001','TCT000001','2017-11-17','3','2019-12-02 13:12:50','1'),
	('CT000003','入职培训0003','RSCC000001','I000002','TCT000002','2018-05-17','3','2019-12-05 07:56:58','1'),
	('CT000004','入职培训0004','RSCC000001','I000002','TCT000002','2018-01-09','3','2019-12-04 13:30:59','1');

insert into scoring_data values
	('S000001','王志文','84','这个题做的真不错啊','1');

insert into employee_company_training_data values
	('ECT000001','E000001','CT000001','S000001','1'),
	('ECT000002','E000001','CT000001','S000001','1'),
	('ECT000003','E000002','CT000001','S000001','1'),
	('ECT000004','E000002','CT000001','S000001','1'),
	('ECT000005','E000003','CT000001','S000001','1'),
	('ECT000006','E000003','CT000001','S000001','1'),
	('ECT000007','E000004','CT000001','S000001','1'),
	('ECT000008','E000004','CT000001','S000001','1'),
	('ECT000009','E000005','CT000002','S000001','1'),
	('ECT000010','E000005','CT000002','S000001','1'),
	('ECT000011','E000006','CT000002','S000001','1'),
	('ECT000012','E000006','CT000002','S000001','1'),
	('ECT000013','E000007','CT000002','S000001','1'),
	('ECT000014','E000007','CT000002','S000001','1'),
	('ECT000015','E000008','CT000002','S000001','1'),
	('ECT000016','E000008','CT000002','S000001','1'),
	('ECT000017','E000009','CT000003','S000001','1'),
	('ECT000018','E000009','CT000003','S000001','1'),
	('ECT000019','E000010','CT000003','S000001','1'),
	('ECT000020','E000010','CT000003','S000001','1'),
	('ECT000021','E000011','CT000003','S000001','1'),
	('ECT000022','E000011','CT000003','S000001','1'),
	('ECT000023','E000012','CT000003','S000001','1'),
	('ECT000024','E000012','CT000003','S000001','1'),
	('ECT000025','E000013','CT000004','S000001','1'),
	('ECT000026','E000013','CT000004','S000001','1'),
	('ECT000027','E000014','CT000004','S000001','1'),
	('ECT000028','E000014','CT000004','S000001','1'),
	('ECT000029','E000015','CT000004','S000001','1'),
	('ECT000030','E000015','CT000004','S000001','1'),
	('ECT000031','E000016','CT000004','S000001','1'),
	('ECT000032','E000016','CT000004','S000001','1');
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

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
<<<<<<< HEAD
	('EWE000001','E000001','2018-09-30','2017-04-11','丝芙兰化妆品公司','在此期间取得非常好的绩效，赢得了客户的信赖','1'),
	('EWE000002','E000001','2017-01-13','2017-11-28','丝芙兰化妆品公司0002','在此期间取得非常好的绩效，赢得了客户的信赖0002','1'),
	('EWE000003','E000002','2019-09-15','2018-11-17','丝芙兰化妆品公司0003','在此期间取得非常好的绩效，赢得了客户的信赖0003','1'),
	('EWE000004','E000002','2018-04-02','2016-12-19','丝芙兰化妆品公司0004','在此期间取得非常好的绩效，赢得了客户的信赖0004','1'),
	('EWE000005','E000003','2018-09-04','2019-01-24','丝芙兰化妆品公司0005','在此期间取得非常好的绩效，赢得了客户的信赖0005','1'),
	('EWE000006','E000003','2018-02-14','2018-01-10','丝芙兰化妆品公司0006','在此期间取得非常好的绩效，赢得了客户的信赖0006','1'),
	('EWE000007','E000004','2017-09-29','2016-11-09','丝芙兰化妆品公司0007','在此期间取得非常好的绩效，赢得了客户的信赖0007','1'),
	('EWE000008','E000004','2018-01-03','2019-07-06','丝芙兰化妆品公司0008','在此期间取得非常好的绩效，赢得了客户的信赖0008','1'),
	('EWE000009','E000005','2019-05-14','2018-01-19','丝芙兰化妆品公司0009','在此期间取得非常好的绩效，赢得了客户的信赖0009','1'),
	('EWE000010','E000005','2017-02-16','2017-03-23','丝芙兰化妆品公司0010','在此期间取得非常好的绩效，赢得了客户的信赖0010','1'),
	('EWE000011','E000006','2019-07-01','2018-02-02','丝芙兰化妆品公司0011','在此期间取得非常好的绩效，赢得了客户的信赖0011','1'),
	('EWE000012','E000006','2017-10-12','2018-05-30','丝芙兰化妆品公司0012','在此期间取得非常好的绩效，赢得了客户的信赖0012','1'),
	('EWE000013','E000007','2018-10-28','2019-05-30','丝芙兰化妆品公司0013','在此期间取得非常好的绩效，赢得了客户的信赖0013','1'),
	('EWE000014','E000007','2018-08-25','2018-05-11','丝芙兰化妆品公司0014','在此期间取得非常好的绩效，赢得了客户的信赖0014','1'),
	('EWE000015','E000008','2017-03-20','2019-04-20','丝芙兰化妆品公司0015','在此期间取得非常好的绩效，赢得了客户的信赖0015','1'),
	('EWE000016','E000008','2017-03-09','2018-03-21','丝芙兰化妆品公司0016','在此期间取得非常好的绩效，赢得了客户的信赖0016','1'),
	('EWE000017','E000009','2019-09-09','2018-11-19','丝芙兰化妆品公司0017','在此期间取得非常好的绩效，赢得了客户的信赖0017','1'),
	('EWE000018','E000009','2017-07-29','2017-04-29','丝芙兰化妆品公司0018','在此期间取得非常好的绩效，赢得了客户的信赖0018','1'),
	('EWE000019','E000010','2018-10-01','2017-06-01','丝芙兰化妆品公司0019','在此期间取得非常好的绩效，赢得了客户的信赖0019','1'),
	('EWE000020','E000010','2016-12-27','2018-08-09','丝芙兰化妆品公司0020','在此期间取得非常好的绩效，赢得了客户的信赖0020','1'),
	('EWE000021','E000011','2018-10-13','2019-09-12','丝芙兰化妆品公司0021','在此期间取得非常好的绩效，赢得了客户的信赖0021','1'),
	('EWE000022','E000011','2019-03-16','2018-06-22','丝芙兰化妆品公司0022','在此期间取得非常好的绩效，赢得了客户的信赖0022','1'),
	('EWE000023','E000012','2019-06-23','2019-04-25','丝芙兰化妆品公司0023','在此期间取得非常好的绩效，赢得了客户的信赖0023','1'),
	('EWE000024','E000012','2018-07-04','2019-02-09','丝芙兰化妆品公司0024','在此期间取得非常好的绩效，赢得了客户的信赖0024','1'),
	('EWE000025','E000013','2019-10-08','2017-02-14','丝芙兰化妆品公司0025','在此期间取得非常好的绩效，赢得了客户的信赖0025','1'),
	('EWE000026','E000013','2019-09-30','2018-12-31','丝芙兰化妆品公司0026','在此期间取得非常好的绩效，赢得了客户的信赖0026','1'),
	('EWE000027','E000014','2019-09-14','2018-07-14','丝芙兰化妆品公司0027','在此期间取得非常好的绩效，赢得了客户的信赖0027','1'),
	('EWE000028','E000014','2017-02-20','2019-04-24','丝芙兰化妆品公司0028','在此期间取得非常好的绩效，赢得了客户的信赖0028','1'),
	('EWE000029','E000015','2017-11-24','2017-01-15','丝芙兰化妆品公司0029','在此期间取得非常好的绩效，赢得了客户的信赖0029','1'),
	('EWE000030','E000015','2017-11-10','2016-11-15','丝芙兰化妆品公司0030','在此期间取得非常好的绩效，赢得了客户的信赖0030','1'),
	('EWE000031','E000016','2018-11-14','2017-09-22','丝芙兰化妆品公司0031','在此期间取得非常好的绩效，赢得了客户的信赖0031','1'),
	('EWE000032','E000016','2019-01-01','2018-05-07','丝芙兰化妆品公司0032','在此期间取得非常好的绩效，赢得了客户的信赖0032','1');
=======
	('EWE000001','E000001','2016-12-16','2018-01-12','丝芙兰化妆品公司','在此期间取得非常好的绩效，赢得了客户的信赖','1'),
	('EWE000002','E000001','2018-10-08','2018-05-18','丝芙兰化妆品公司0002','在此期间取得非常好的绩效，赢得了客户的信赖0002','1'),
	('EWE000003','E000002','2018-10-27','2019-10-06','丝芙兰化妆品公司0003','在此期间取得非常好的绩效，赢得了客户的信赖0003','1'),
	('EWE000004','E000002','2017-07-06','2019-07-26','丝芙兰化妆品公司0004','在此期间取得非常好的绩效，赢得了客户的信赖0004','1'),
	('EWE000005','E000003','2017-12-04','2019-04-04','丝芙兰化妆品公司0005','在此期间取得非常好的绩效，赢得了客户的信赖0005','1'),
	('EWE000006','E000003','2019-05-03','2019-10-03','丝芙兰化妆品公司0006','在此期间取得非常好的绩效，赢得了客户的信赖0006','1'),
	('EWE000007','E000004','2018-04-25','2018-11-30','丝芙兰化妆品公司0007','在此期间取得非常好的绩效，赢得了客户的信赖0007','1'),
	('EWE000008','E000004','2017-03-11','2018-01-02','丝芙兰化妆品公司0008','在此期间取得非常好的绩效，赢得了客户的信赖0008','1'),
	('EWE000009','E000005','2018-06-11','2017-08-21','丝芙兰化妆品公司0009','在此期间取得非常好的绩效，赢得了客户的信赖0009','1'),
	('EWE000010','E000005','2018-11-12','2019-03-23','丝芙兰化妆品公司0010','在此期间取得非常好的绩效，赢得了客户的信赖0010','1'),
	('EWE000011','E000006','2018-04-07','2017-05-20','丝芙兰化妆品公司0011','在此期间取得非常好的绩效，赢得了客户的信赖0011','1'),
	('EWE000012','E000006','2018-03-19','2019-04-23','丝芙兰化妆品公司0012','在此期间取得非常好的绩效，赢得了客户的信赖0012','1'),
	('EWE000013','E000007','2018-03-17','2018-05-11','丝芙兰化妆品公司0013','在此期间取得非常好的绩效，赢得了客户的信赖0013','1'),
	('EWE000014','E000007','2017-03-27','2019-09-07','丝芙兰化妆品公司0014','在此期间取得非常好的绩效，赢得了客户的信赖0014','1'),
	('EWE000015','E000008','2019-11-04','2018-05-24','丝芙兰化妆品公司0015','在此期间取得非常好的绩效，赢得了客户的信赖0015','1'),
	('EWE000016','E000008','2017-10-07','2019-08-17','丝芙兰化妆品公司0016','在此期间取得非常好的绩效，赢得了客户的信赖0016','1'),
	('EWE000017','E000009','2019-06-17','2016-12-31','丝芙兰化妆品公司0017','在此期间取得非常好的绩效，赢得了客户的信赖0017','1'),
	('EWE000018','E000009','2018-01-18','2017-08-30','丝芙兰化妆品公司0018','在此期间取得非常好的绩效，赢得了客户的信赖0018','1'),
	('EWE000019','E000010','2018-10-21','2017-03-20','丝芙兰化妆品公司0019','在此期间取得非常好的绩效，赢得了客户的信赖0019','1'),
	('EWE000020','E000010','2017-12-30','2019-04-28','丝芙兰化妆品公司0020','在此期间取得非常好的绩效，赢得了客户的信赖0020','1'),
	('EWE000021','E000011','2018-04-26','2018-07-07','丝芙兰化妆品公司0021','在此期间取得非常好的绩效，赢得了客户的信赖0021','1'),
	('EWE000022','E000011','2017-02-26','2017-08-26','丝芙兰化妆品公司0022','在此期间取得非常好的绩效，赢得了客户的信赖0022','1'),
	('EWE000023','E000012','2016-12-23','2019-09-30','丝芙兰化妆品公司0023','在此期间取得非常好的绩效，赢得了客户的信赖0023','1'),
	('EWE000024','E000012','2019-07-20','2017-01-10','丝芙兰化妆品公司0024','在此期间取得非常好的绩效，赢得了客户的信赖0024','1'),
	('EWE000025','E000013','2018-07-19','2018-07-19','丝芙兰化妆品公司0025','在此期间取得非常好的绩效，赢得了客户的信赖0025','1'),
	('EWE000026','E000013','2017-07-15','2017-01-29','丝芙兰化妆品公司0026','在此期间取得非常好的绩效，赢得了客户的信赖0026','1'),
	('EWE000027','E000014','2017-07-22','2019-06-25','丝芙兰化妆品公司0027','在此期间取得非常好的绩效，赢得了客户的信赖0027','1'),
	('EWE000028','E000014','2018-09-02','2017-01-05','丝芙兰化妆品公司0028','在此期间取得非常好的绩效，赢得了客户的信赖0028','1'),
	('EWE000029','E000015','2017-09-05','2018-11-02','丝芙兰化妆品公司0029','在此期间取得非常好的绩效，赢得了客户的信赖0029','1'),
	('EWE000030','E000015','2019-02-06','2018-11-23','丝芙兰化妆品公司0030','在此期间取得非常好的绩效，赢得了客户的信赖0030','1'),
	('EWE000031','E000016','2017-06-02','2017-01-10','丝芙兰化妆品公司0031','在此期间取得非常好的绩效，赢得了客户的信赖0031','1'),
	('EWE000032','E000016','2019-10-07','2017-03-21','丝芙兰化妆品公司0032','在此期间取得非常好的绩效，赢得了客户的信赖0032','1');
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

insert into employee_leave_data values
	('EL000001','E000001','LT000001','8','请年假，出去耍！！！！','1'),
	('EL000002','E000001','LT000001','8','请年假，出去耍！！！！0002','1'),
<<<<<<< HEAD
	('EL000003','E000002','LT000001','8','请年假，出去耍！！！！0003','1'),
	('EL000004','E000002','LT000001','6','请年假，出去耍！！！！0004','1'),
	('EL000005','E000003','LT000001','8','请年假，出去耍！！！！0005','1'),
	('EL000006','E000003','LT000001','8','请年假，出去耍！！！！0006','1'),
	('EL000007','E000004','LT000001','8','请年假，出去耍！！！！0007','1'),
	('EL000008','E000004','LT000001','7','请年假，出去耍！！！！0008','1'),
	('EL000009','E000005','LT000001','8','请年假，出去耍！！！！0009','1'),
	('EL000010','E000005','LT000001','7','请年假，出去耍！！！！0010','1'),
	('EL000011','E000006','LT000001','6','请年假，出去耍！！！！0011','1'),
	('EL000012','E000006','LT000001','8','请年假，出去耍！！！！0012','1'),
	('EL000013','E000007','LT000001','8','请年假，出去耍！！！！0013','1'),
	('EL000014','E000007','LT000001','8','请年假，出去耍！！！！0014','1'),
	('EL000015','E000008','LT000001','6','请年假，出去耍！！！！0015','1'),
	('EL000016','E000008','LT000001','8','请年假，出去耍！！！！0016','1'),
	('EL000017','E000009','LT000002','8','请年假，出去耍！！！！0017','1'),
	('EL000018','E000009','LT000002','6','请年假，出去耍！！！！0018','1'),
=======
	('EL000003','E000002','LT000001','6','请年假，出去耍！！！！0003','1'),
	('EL000004','E000002','LT000001','7','请年假，出去耍！！！！0004','1'),
	('EL000005','E000003','LT000001','6','请年假，出去耍！！！！0005','1'),
	('EL000006','E000003','LT000001','8','请年假，出去耍！！！！0006','1'),
	('EL000007','E000004','LT000001','7','请年假，出去耍！！！！0007','1'),
	('EL000008','E000004','LT000001','8','请年假，出去耍！！！！0008','1'),
	('EL000009','E000005','LT000001','8','请年假，出去耍！！！！0009','1'),
	('EL000010','E000005','LT000001','7','请年假，出去耍！！！！0010','1'),
	('EL000011','E000006','LT000001','7','请年假，出去耍！！！！0011','1'),
	('EL000012','E000006','LT000001','8','请年假，出去耍！！！！0012','1'),
	('EL000013','E000007','LT000001','6','请年假，出去耍！！！！0013','1'),
	('EL000014','E000007','LT000001','8','请年假，出去耍！！！！0014','1'),
	('EL000015','E000008','LT000001','8','请年假，出去耍！！！！0015','1'),
	('EL000016','E000008','LT000001','8','请年假，出去耍！！！！0016','1'),
	('EL000017','E000009','LT000002','7','请年假，出去耍！！！！0017','1'),
	('EL000018','E000009','LT000002','8','请年假，出去耍！！！！0018','1'),
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
	('EL000019','E000010','LT000002','8','请年假，出去耍！！！！0019','1'),
	('EL000020','E000010','LT000002','8','请年假，出去耍！！！！0020','1'),
	('EL000021','E000011','LT000002','8','请年假，出去耍！！！！0021','1'),
	('EL000022','E000011','LT000002','8','请年假，出去耍！！！！0022','1'),
<<<<<<< HEAD
	('EL000023','E000012','LT000002','8','请年假，出去耍！！！！0023','1'),
	('EL000024','E000012','LT000002','8','请年假，出去耍！！！！0024','1'),
	('EL000025','E000013','LT000002','7','请年假，出去耍！！！！0025','1'),
	('EL000026','E000013','LT000002','7','请年假，出去耍！！！！0026','1'),
	('EL000027','E000014','LT000002','7','请年假，出去耍！！！！0027','1'),
	('EL000028','E000014','LT000002','8','请年假，出去耍！！！！0028','1'),
	('EL000029','E000015','LT000002','6','请年假，出去耍！！！！0029','1'),
	('EL000030','E000015','LT000002','7','请年假，出去耍！！！！0030','1'),
	('EL000031','E000016','LT000002','7','请年假，出去耍！！！！0031','1'),
	('EL000032','E000016','LT000002','7','请年假，出去耍！！！！0032','1');
=======
	('EL000023','E000012','LT000002','6','请年假，出去耍！！！！0023','1'),
	('EL000024','E000012','LT000002','7','请年假，出去耍！！！！0024','1'),
	('EL000025','E000013','LT000002','8','请年假，出去耍！！！！0025','1'),
	('EL000026','E000013','LT000002','8','请年假，出去耍！！！！0026','1'),
	('EL000027','E000014','LT000002','6','请年假，出去耍！！！！0027','1'),
	('EL000028','E000014','LT000002','7','请年假，出去耍！！！！0028','1'),
	('EL000029','E000015','LT000002','8','请年假，出去耍！！！！0029','1'),
	('EL000030','E000015','LT000002','6','请年假，出去耍！！！！0030','1'),
	('EL000031','E000016','LT000002','7','请年假，出去耍！！！！0031','1'),
	('EL000032','E000016','LT000002','8','请年假，出去耍！！！！0032','1');
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

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
<<<<<<< HEAD
	('EA000001','E000001','2017-09-11','2017-11-23','6','今天状态不错啊','1'),
	('EA000002','E000001','2017-02-24','2019-03-16','8','今天状态不错啊0002','1'),
	('EA000003','E000002','2019-01-29','2018-11-17','8','今天状态不错啊0003','1'),
	('EA000004','E000002','2019-03-09','2017-05-07','6','今天状态不错啊0004','1'),
	('EA000005','E000003','2016-11-26','2019-03-04','6','今天状态不错啊0005','1'),
	('EA000006','E000003','2019-02-25','2017-06-21','8','今天状态不错啊0006','1'),
	('EA000007','E000004','2016-12-19','2018-02-22','8','今天状态不错啊0007','1'),
	('EA000008','E000004','2019-08-08','2017-11-18','8','今天状态不错啊0008','1'),
	('EA000009','E000005','2017-01-30','2017-01-20','8','今天状态不错啊0009','1'),
	('EA000010','E000005','2019-06-09','2018-07-19','7','今天状态不错啊0010','1'),
	('EA000011','E000006','2017-09-21','2017-04-08','7','今天状态不错啊0011','1'),
	('EA000012','E000006','2018-04-20','2019-07-29','6','今天状态不错啊0012','1'),
	('EA000013','E000007','2017-06-07','2019-06-11','7','今天状态不错啊0013','1'),
	('EA000014','E000007','2017-03-19','2016-11-12','6','今天状态不错啊0014','1'),
	('EA000015','E000008','2019-01-01','2017-09-04','8','今天状态不错啊0015','1'),
	('EA000016','E000008','2018-06-30','2019-04-20','8','今天状态不错啊0016','1'),
	('EA000017','E000009','2018-04-07','2018-11-27','7','今天状态不错啊0017','1'),
	('EA000018','E000009','2019-09-15','2018-10-16','8','今天状态不错啊0018','1'),
	('EA000019','E000010','2017-06-19','2019-03-05','7','今天状态不错啊0019','1'),
	('EA000020','E000010','2019-08-17','2018-11-09','7','今天状态不错啊0020','1'),
	('EA000021','E000011','2018-10-09','2018-02-24','7','今天状态不错啊0021','1'),
	('EA000022','E000011','2018-07-30','2019-02-12','7','今天状态不错啊0022','1'),
	('EA000023','E000012','2017-01-04','2017-06-11','8','今天状态不错啊0023','1'),
	('EA000024','E000012','2019-08-25','2017-05-31','8','今天状态不错啊0024','1'),
	('EA000025','E000013','2018-05-06','2017-06-29','7','今天状态不错啊0025','1'),
	('EA000026','E000013','2017-04-04','2017-06-04','7','今天状态不错啊0026','1'),
	('EA000027','E000014','2017-11-01','2017-11-12','7','今天状态不错啊0027','1'),
	('EA000028','E000014','2019-03-28','2018-09-23','8','今天状态不错啊0028','1'),
	('EA000029','E000015','2016-12-30','2019-06-29','7','今天状态不错啊0029','1'),
	('EA000030','E000015','2017-01-22','2019-08-01','7','今天状态不错啊0030','1'),
	('EA000031','E000016','2016-10-19','2016-11-20','8','今天状态不错啊0031','1'),
	('EA000032','E000016','2018-10-01','2018-05-25','7','今天状态不错啊0032','1');

insert into employee_qualifier_data values
	('EQ000001','E000001','2017-11-06','认证药剂师','高级','考试成绩当年第一名','1'),
	('EQ000002','E000001','2018-05-04','认证架构师','中级','考试成绩当年第一名0002','1'),
	('EQ000003','E000002','2016-11-20','认证会计师','初级','考试成绩当年第一名0003','1'),
	('EQ000004','E000002','2019-04-25','认证经济师','高级','考试成绩当年第一名0004','1'),
	('EQ000005','E000003','2018-05-25','OCP','中级','考试成绩当年第一名0005','1'),
	('EQ000006','E000003','2019-04-18','CCNA','初级','考试成绩当年第一名0006','1'),
	('EQ000007','E000004','2019-07-20','CCNP','高级','考试成绩当年第一名0007','1'),
	('EQ000008','E000004','2019-10-15','认证药剂师','中级','考试成绩当年第一名0008','1'),
	('EQ000009','E000005','2019-09-19','认证架构师','初级','考试成绩当年第一名0009','1'),
	('EQ000010','E000005','2019-04-19','认证会计师','高级','考试成绩当年第一名0010','1'),
	('EQ000011','E000006','2018-02-08','认证经济师','中级','考试成绩当年第一名0011','1'),
	('EQ000012','E000006','2016-12-08','OCP','初级','考试成绩当年第一名0012','1'),
	('EQ000013','E000007','2019-01-22','CCNA','高级','考试成绩当年第一名0013','1'),
	('EQ000014','E000007','2019-05-22','CCNP','中级','考试成绩当年第一名0014','1'),
	('EQ000015','E000008','2017-05-14','认证药剂师','初级','考试成绩当年第一名0015','1'),
	('EQ000016','E000008','2017-06-21','认证架构师','高级','考试成绩当年第一名0016','1'),
	('EQ000017','E000009','2018-02-18','认证会计师','中级','考试成绩当年第一名0017','1'),
	('EQ000018','E000009','2018-07-19','认证经济师','初级','考试成绩当年第一名0018','1'),
	('EQ000019','E000010','2019-06-21','OCP','高级','考试成绩当年第一名0019','1'),
	('EQ000020','E000010','2019-04-15','CCNA','中级','考试成绩当年第一名0020','1'),
	('EQ000021','E000011','2019-05-13','CCNP','初级','考试成绩当年第一名0021','1'),
	('EQ000022','E000011','2018-04-27','认证药剂师','高级','考试成绩当年第一名0022','1'),
	('EQ000023','E000012','2018-06-09','认证架构师','中级','考试成绩当年第一名0023','1'),
	('EQ000024','E000012','2018-05-24','认证会计师','初级','考试成绩当年第一名0024','1'),
	('EQ000025','E000013','2019-01-28','认证经济师','高级','考试成绩当年第一名0025','1'),
	('EQ000026','E000013','2017-03-24','OCP','中级','考试成绩当年第一名0026','1'),
	('EQ000027','E000014','2016-12-22','CCNA','初级','考试成绩当年第一名0027','1'),
	('EQ000028','E000014','2018-11-29','CCNP','高级','考试成绩当年第一名0028','1'),
	('EQ000029','E000015','2017-07-15','认证药剂师','中级','考试成绩当年第一名0029','1'),
	('EQ000030','E000015','2018-07-25','认证架构师','初级','考试成绩当年第一名0030','1'),
	('EQ000031','E000016','2017-08-30','认证会计师','高级','考试成绩当年第一名0031','1'),
	('EQ000032','E000016','2019-08-13','认证经济师','中级','考试成绩当年第一名0032','1');

insert into employee_education_data values
	('EE000001','E000001','2019-08-02','小学','考试成绩当年第一名','1'),
	('EE000002','E000001','2017-03-08','初中','考试成绩当年第一名0002','1'),
	('EE000003','E000002','2019-08-27','高中','考试成绩当年第一名0003','1'),
	('EE000004','E000002','2019-06-30','大学','考试成绩当年第一名0004','1'),
	('EE000005','E000003','2018-08-01','硕士','考试成绩当年第一名0005','1'),
	('EE000006','E000003','2016-12-05','博士','考试成绩当年第一名0006','1'),
	('EE000007','E000004','2017-10-15','职业教育','考试成绩当年第一名0007','1'),
	('EE000008','E000004','2017-10-05','小学','考试成绩当年第一名0008','1'),
	('EE000009','E000005','2019-10-11','初中','考试成绩当年第一名0009','1'),
	('EE000010','E000005','2018-08-28','高中','考试成绩当年第一名0010','1'),
	('EE000011','E000006','2018-09-29','大学','考试成绩当年第一名0011','1'),
	('EE000012','E000006','2016-11-30','硕士','考试成绩当年第一名0012','1'),
	('EE000013','E000007','2017-12-05','博士','考试成绩当年第一名0013','1'),
	('EE000014','E000007','2016-12-01','职业教育','考试成绩当年第一名0014','1'),
	('EE000015','E000008','2017-05-22','小学','考试成绩当年第一名0015','1'),
	('EE000016','E000008','2018-07-20','初中','考试成绩当年第一名0016','1'),
	('EE000017','E000009','2017-01-17','高中','考试成绩当年第一名0017','1'),
	('EE000018','E000009','2018-11-12','大学','考试成绩当年第一名0018','1'),
	('EE000019','E000010','2018-10-08','硕士','考试成绩当年第一名0019','1'),
	('EE000020','E000010','2017-01-20','博士','考试成绩当年第一名0020','1'),
	('EE000021','E000011','2019-08-15','职业教育','考试成绩当年第一名0021','1'),
	('EE000022','E000011','2017-05-16','小学','考试成绩当年第一名0022','1'),
	('EE000023','E000012','2019-06-28','初中','考试成绩当年第一名0023','1'),
	('EE000024','E000012','2019-07-08','高中','考试成绩当年第一名0024','1'),
	('EE000025','E000013','2018-04-25','大学','考试成绩当年第一名0025','1'),
	('EE000026','E000013','2017-11-14','硕士','考试成绩当年第一名0026','1'),
	('EE000027','E000014','2018-03-14','博士','考试成绩当年第一名0027','1'),
	('EE000028','E000014','2018-11-30','职业教育','考试成绩当年第一名0028','1'),
	('EE000029','E000015','2017-05-04','小学','考试成绩当年第一名0029','1'),
	('EE000030','E000015','2017-02-16','初中','考试成绩当年第一名0030','1'),
	('EE000031','E000016','2017-11-01','高中','考试成绩当年第一名0031','1'),
	('EE000032','E000016','2017-11-16','大学','考试成绩当年第一名0032','1');

insert into employee_award_data values
	('EA000001','E000001','2017-01-22','明星员工','考试成绩当年第一名','1'),
	('EA000002','E000001','2017-11-23','销售之星','考试成绩当年第一名0002','1'),
	('EA000003','E000002','2017-01-03','技术之星','考试成绩当年第一名0003','1'),
	('EA000004','E000002','2018-05-23','管理之星','考试成绩当年第一名0004','1'),
	('EA000005','E000003','2017-04-04','终身成就奖','考试成绩当年第一名0005','1'),
	('EA000006','E000003','2019-03-12','明星员工','考试成绩当年第一名0006','1'),
	('EA000007','E000004','2017-07-02','销售之星','考试成绩当年第一名0007','1'),
	('EA000008','E000004','2018-03-14','技术之星','考试成绩当年第一名0008','1'),
	('EA000009','E000005','2017-06-26','管理之星','考试成绩当年第一名0009','1'),
	('EA000010','E000005','2017-12-14','终身成就奖','考试成绩当年第一名0010','1'),
	('EA000011','E000006','2018-03-26','明星员工','考试成绩当年第一名0011','1'),
	('EA000012','E000006','2019-10-04','销售之星','考试成绩当年第一名0012','1'),
	('EA000013','E000007','2017-07-29','技术之星','考试成绩当年第一名0013','1'),
	('EA000014','E000007','2018-09-26','管理之星','考试成绩当年第一名0014','1'),
	('EA000015','E000008','2018-05-19','终身成就奖','考试成绩当年第一名0015','1'),
	('EA000016','E000008','2018-06-03','明星员工','考试成绩当年第一名0016','1'),
	('EA000017','E000009','2018-01-08','销售之星','考试成绩当年第一名0017','1'),
	('EA000018','E000009','2018-06-01','技术之星','考试成绩当年第一名0018','1'),
	('EA000019','E000010','2018-05-30','管理之星','考试成绩当年第一名0019','1'),
	('EA000020','E000010','2018-09-08','终身成就奖','考试成绩当年第一名0020','1'),
	('EA000021','E000011','2019-03-30','明星员工','考试成绩当年第一名0021','1'),
	('EA000022','E000011','2016-11-06','销售之星','考试成绩当年第一名0022','1'),
	('EA000023','E000012','2019-09-24','技术之星','考试成绩当年第一名0023','1'),
	('EA000024','E000012','2019-04-17','管理之星','考试成绩当年第一名0024','1'),
	('EA000025','E000013','2017-02-12','终身成就奖','考试成绩当年第一名0025','1'),
	('EA000026','E000013','2017-12-11','明星员工','考试成绩当年第一名0026','1'),
	('EA000027','E000014','2018-07-01','销售之星','考试成绩当年第一名0027','1'),
	('EA000028','E000014','2017-05-29','技术之星','考试成绩当年第一名0028','1'),
	('EA000029','E000015','2017-03-07','管理之星','考试成绩当年第一名0029','1'),
	('EA000030','E000015','2018-11-25','终身成就奖','考试成绩当年第一名0030','1'),
	('EA000031','E000016','2017-10-09','明星员工','考试成绩当年第一名0031','1'),
	('EA000032','E000016','2019-04-13','销售之星','考试成绩当年第一名0032','1');

insert into employee_salary_sheet_data values
	('ESS000001','E000001','SG000001','2670.80','791.58','819.73','595.71','964.04','957.73','8.62',NULL,'PAID_OFF','1'),
	('ESS000002','E000001','SG000001','2750.88','863.10','779.90','727.34','1088.09','1170.31','8.21',NULL,'PAID_OFF0002','1'),
	('ESS000003','E000001','SG000001','2850.77','785.91','881.25','595.63','883.33','1006.99','6.97',NULL,'PAID_OFF0003','1'),
	('ESS000004','E000001','SG000001','2409.84','863.04','817.66','731.77','959.48','1031.69','8.20',NULL,'PAID_OFF0004','1'),
	('ESS000005','E000002','SG000001','2570.70','732.60','847.82','697.38','930.38','863.67','6.51',NULL,'PAID_OFF0005','1'),
	('ESS000006','E000002','SG000001','2982.25','850.92','760.81','616.15','1089.19','894.09','8.05',NULL,'PAID_OFF0006','1'),
	('ESS000007','E000002','SG000001','2238.28','888.76','796.31','555.10','883.77','945.48','7.66',NULL,'PAID_OFF0007','1'),
	('ESS000008','E000002','SG000001','2705.76','719.61','802.22','782.64','950.04','1115.84','8.05',NULL,'PAID_OFF0008','1'),
	('ESS000009','E000003','SG000001','2237.12','940.69','805.78','631.88','1004.11','899.73','7.01',NULL,'PAID_OFF0009','1'),
	('ESS000010','E000003','SG000001','2293.57','995.12','876.71','598.75','796.78','856.33','7.35',NULL,'PAID_OFF0010','1'),
	('ESS000011','E000003','SG000001','2749.49','791.52','763.08','721.71','795.84','1142.38','8.80',NULL,'PAID_OFF0011','1'),
	('ESS000012','E000003','SG000001','2661.44','968.45','953.64','774.07','791.19','994.91','7.04',NULL,'PAID_OFF0012','1'),
	('ESS000013','E000004','SG000001','2977.75','766.23','762.95','757.88','878.42','1029.01','8.84',NULL,'PAID_OFF0013','1'),
	('ESS000014','E000004','SG000001','2847.47','986.17','866.20','703.36','1018.32','915.52','7.08',NULL,'PAID_OFF0014','1'),
	('ESS000015','E000004','SG000001','2601.16','817.17','771.07','644.19','1006.85','1092.03','8.30',NULL,'PAID_OFF0015','1'),
	('ESS000016','E000004','SG000001','2872.47','740.55','969.06','619.42','1024.33','1067.68','8.21',NULL,'PAID_OFF0016','1'),
	('ESS000017','E000005','SG000001','2360.91','704.69','980.28','677.57','891.53','1009.17','6.46',NULL,'PAID_OFF0017','1'),
	('ESS000018','E000005','SG000001','2972.38','890.88','932.45','728.80','869.58','1001.91','8.68',NULL,'PAID_OFF0018','1'),
	('ESS000019','E000005','SG000001','2996.82','767.21','868.51','701.68','799.01','1083.28','6.41',NULL,'PAID_OFF0019','1'),
	('ESS000020','E000005','SG000001','2782.13','930.46','708.59','753.94','923.37','991.05','7.98',NULL,'PAID_OFF0020','1'),
	('ESS000021','E000006','SG000001','2307.16','989.86','756.33','667.99','807.18','939.06','6.91',NULL,'PAID_OFF0021','1'),
	('ESS000022','E000006','SG000001','2220.59','777.06','928.75','599.48','953.94','1003.72','8.39',NULL,'PAID_OFF0022','1'),
	('ESS000023','E000006','SG000001','2341.34','965.03','870.46','708.88','869.33','1047.24','8.80',NULL,'PAID_OFF0023','1'),
	('ESS000024','E000006','SG000001','2345.96','821.20','724.49','742.25','968.86','1156.61','8.03',NULL,'PAID_OFF0024','1'),
	('ESS000025','E000007','SG000001','2232.47','800.82','703.95','607.49','779.81','1074.21','7.51',NULL,'PAID_OFF0025','1'),
	('ESS000026','E000007','SG000001','2882.49','812.36','886.71','669.79','772.70','1017.97','7.24',NULL,'PAID_OFF0026','1'),
	('ESS000027','E000007','SG000001','2388.55','843.86','840.42','615.94','860.55','1208.13','8.62',NULL,'PAID_OFF0027','1'),
	('ESS000028','E000007','SG000001','2442.49','975.72','925.67','772.02','961.69','1040.98','6.90',NULL,'PAID_OFF0028','1'),
	('ESS000029','E000008','SG000001','2580.89','716.18','791.99','738.19','999.03','972.79','6.32',NULL,'PAID_OFF0029','1'),
	('ESS000030','E000008','SG000001','2247.60','828.49','739.03','602.16','877.57','1205.65','7.04',NULL,'PAID_OFF0030','1'),
	('ESS000031','E000008','SG000001','2828.78','724.46','920.11','693.49','851.10','1075.83','7.52',NULL,'PAID_OFF0031','1'),
	('ESS000032','E000008','SG000001','2721.77','949.19','707.26','559.63','821.49','1080.72','7.11',NULL,'PAID_OFF0032','1'),
	('ESS000033','E000009','SG000002','2906.66','741.53','732.25','578.90','953.20','1194.70','8.81',NULL,'PAID_OFF0033','1'),
	('ESS000034','E000009','SG000002','2957.29','948.67','864.71','657.50','866.26','1190.26','6.53',NULL,'PAID_OFF0034','1'),
	('ESS000035','E000009','SG000002','2800.45','925.10','919.40','620.92','1017.24','1071.90','6.33',NULL,'PAID_OFF0035','1'),
	('ESS000036','E000009','SG000002','2326.27','802.22','754.75','555.34','1034.59','1072.41','7.03',NULL,'PAID_OFF0036','1'),
	('ESS000037','E000010','SG000002','2769.30','766.78','745.75','756.51','901.64','1016.35','8.23',NULL,'PAID_OFF0037','1'),
	('ESS000038','E000010','SG000002','2197.78','740.54','993.95','662.04','982.93','933.37','7.48',NULL,'PAID_OFF0038','1'),
	('ESS000039','E000010','SG000002','2312.75','730.93','875.30','773.52','1070.74','959.31','7.46',NULL,'PAID_OFF0039','1'),
	('ESS000040','E000010','SG000002','2863.12','725.75','996.36','604.99','786.24','876.52','6.36',NULL,'PAID_OFF0040','1'),
	('ESS000041','E000011','SG000002','2284.91','771.60','906.14','587.19','1059.14','1098.72','8.09',NULL,'PAID_OFF0041','1'),
	('ESS000042','E000011','SG000002','2644.35','882.58','754.91','711.72','811.62','972.77','8.88',NULL,'PAID_OFF0042','1'),
	('ESS000043','E000011','SG000002','2598.32','717.27','844.43','699.54','884.16','874.70','8.41',NULL,'PAID_OFF0043','1'),
	('ESS000044','E000011','SG000002','2255.22','931.13','927.13','650.56','1061.03','1080.13','7.95',NULL,'PAID_OFF0044','1'),
	('ESS000045','E000012','SG000002','2635.75','795.15','731.44','675.81','947.56','953.03','7.29',NULL,'PAID_OFF0045','1'),
	('ESS000046','E000012','SG000002','2176.95','914.81','922.48','780.68','776.23','1193.28','7.22',NULL,'PAID_OFF0046','1'),
	('ESS000047','E000012','SG000002','2375.35','972.52','808.93','687.96','894.53','1213.65','8.06',NULL,'PAID_OFF0047','1'),
	('ESS000048','E000012','SG000002','2150.95','709.95','861.15','715.05','786.81','865.93','8.70',NULL,'PAID_OFF0048','1'),
	('ESS000049','E000013','SG000002','2676.35','917.85','877.96','625.49','905.17','1132.80','7.31',NULL,'PAID_OFF0049','1'),
	('ESS000050','E000013','SG000002','2955.87','989.68','742.21','692.78','1043.54','979.57','6.29',NULL,'PAID_OFF0050','1'),
	('ESS000051','E000013','SG000002','2986.77','903.99','750.55','588.40','1035.79','1015.80','8.76',NULL,'PAID_OFF0051','1'),
	('ESS000052','E000013','SG000002','2625.24','729.28','785.34','672.51','1025.86','946.18','7.98',NULL,'PAID_OFF0052','1'),
	('ESS000053','E000014','SG000002','2989.95','769.01','881.31','660.37','853.92','1193.94','6.23',NULL,'PAID_OFF0053','1'),
	('ESS000054','E000014','SG000002','2262.10','940.17','950.77','744.37','875.67','871.81','6.93',NULL,'PAID_OFF0054','1'),
	('ESS000055','E000014','SG000002','2799.58','930.42','881.52','612.98','1081.02','931.30','7.89',NULL,'PAID_OFF0055','1'),
	('ESS000056','E000014','SG000002','2364.17','996.70','991.52','593.83','981.74','1057.67','6.90',NULL,'PAID_OFF0056','1'),
	('ESS000057','E000015','SG000002','2140.91','875.01','892.08','728.27','882.64','1086.52','6.71',NULL,'PAID_OFF0057','1'),
	('ESS000058','E000015','SG000002','2581.33','745.76','894.61','675.45','779.35','1109.07','8.84',NULL,'PAID_OFF0058','1'),
	('ESS000059','E000015','SG000002','2493.31','769.15','914.48','574.21','834.59','1007.22','8.76',NULL,'PAID_OFF0059','1'),
	('ESS000060','E000015','SG000002','2885.22','810.59','948.65','734.28','995.01','953.36','8.55',NULL,'PAID_OFF0060','1'),
	('ESS000061','E000016','SG000002','2240.80','996.76','862.96','693.70','1004.86','1198.43','7.20',NULL,'PAID_OFF0061','1'),
	('ESS000062','E000016','SG000002','2532.91','897.41','966.27','666.48','941.27','1112.88','8.71',NULL,'PAID_OFF0062','1'),
	('ESS000063','E000016','SG000002','2237.55','917.34','806.49','671.48','785.52','1180.52','8.53',NULL,'PAID_OFF0063','1'),
	('ESS000064','E000016','SG000002','2708.85','798.92','849.19','770.93','942.31','990.28','8.20',NULL,'PAID_OFF0064','1');

insert into paying_off_data values
	('PO000001','出纳','E000001','2017-10-24','4050.81','1'),
	('PO000002','出纳0002','E000001','2019-02-21','3920.55','1'),
	('PO000003','出纳0003','E000002','2017-10-27','4235.92','1'),
	('PO000004','出纳0004','E000002','2016-12-29','3875.15','1'),
	('PO000005','出纳0005','E000003','2018-05-08','4317.19','1'),
	('PO000006','出纳0006','E000003','2017-11-26','3835.56','1'),
	('PO000007','出纳0007','E000004','2017-12-01','4607.81','1'),
	('PO000008','出纳0008','E000004','2019-04-04','5215.11','1'),
	('PO000009','出纳0009','E000005','2019-07-20','4610.45','1'),
	('PO000010','出纳0010','E000005','2017-02-16','4828.87','1'),
	('PO000011','出纳0011','E000006','2017-06-30','3944.89','1'),
	('PO000012','出纳0012','E000006','2017-04-25','4791.93','1'),
	('PO000013','出纳0013','E000007','2017-11-13','3993.90','1'),
	('PO000014','出纳0014','E000007','2018-08-18','5006.91','1'),
	('PO000015','出纳0015','E000008','2018-09-28','3702.31','1'),
	('PO000016','出纳0016','E000008','2018-05-22','3973.32','1'),
	('PO000017','出纳0017','E000009','2018-08-31','5038.18','1'),
	('PO000018','出纳0018','E000009','2016-12-08','4963.48','1'),
	('PO000019','出纳0019','E000010','2019-05-02','4529.36','1'),
	('PO000020','出纳0020','E000010','2018-06-23','4492.15','1'),
	('PO000021','出纳0021','E000011','2019-05-05','3742.64','1'),
	('PO000022','出纳0022','E000011','2016-12-31','3683.62','1'),
	('PO000023','出纳0023','E000012','2017-04-18','4170.08','1'),
	('PO000024','出纳0024','E000012','2017-05-05','4939.87','1'),
	('PO000025','出纳0025','E000013','2018-07-18','5208.51','1'),
	('PO000026','出纳0026','E000013','2017-07-04','4219.90','1'),
	('PO000027','出纳0027','E000014','2017-10-12','5000.23','1'),
	('PO000028','出纳0028','E000014','2019-04-30','4972.42','1'),
	('PO000029','出纳0029','E000015','2018-05-19','3742.32','1'),
	('PO000030','出纳0030','E000015','2018-06-08','3766.66','1'),
	('PO000031','出纳0031','E000016','2018-02-20','4160.77','1'),
	('PO000032','出纳0032','E000016','2018-12-20','4195.50','1');

insert into user_domain_data values
	('UD000001','用户区域','1');

insert into user_white_list_data values
	('UWL000001','clariones','tester;ios-spokesperson','UD000001','1'),
	('UWL000002','13808188512','tester;ios-spokesperson0002','UD000001','1');

insert into sec_user_data values
	('SU000001','login','13900000001','','C183EC89F92A462CF45B95504792EC4625E847C90536EEFE512D1C9DB8602E95','wx123456789abcdefghijklmn','wxapp12098410239840','jwt_token_12345678','0','2019-09-28 15:33:44','2019-09-25 22:50:54','UD000001',NULL,'BLOCKED','1'),
	('SU000002','login0002','13900000002','suddy_chang@163.com','AC2F95628244C6975EB2C36942EA879ED93D93F5895EF3157733E4629FA86B92','wx123456789abcdefghijklmn0002','wxapp120984102398400002','jwt_token_123456780002','9999999','2019-10-12 09:03:46','2019-09-27 08:59:54','UD000001',NULL,'BLOCKED0002','1');

insert into sec_user_blocking_data values
	('SUB000001','currentUser()','2019-09-28 01:51:05','这个用户多次发送违反社区的帖子，现在把他给屏蔽了','1');

insert into user_app_data values
	('UA000001','审车平台','SU000001','users','1','MXWR','CarInspectionPlatform','CIP000001','/link/to/app','1'),
	('UA000002','账户管理','SU000001','bank','1','MXWR','UserDomain','UD000001','/link/to/app0002','1'),
	('UA000003','接车公司','SU000002','wechat','1','MXWR','CarReceivingServiceCompany','CRSC000001','/link/to/app0003','1'),
	('UA000004','审车公司','SU000002','bar-chart','1','MXWR','CarInspectionServiceCompany','CISC000001','/link/to/app0004','1');

insert into quick_link_data values
	('QL000001','列表','facebook','https://demo.doublechaintech.com/demodata/imageManager/genImage/y00/200/200/red/','列表','2019-10-02 14:46:01','UA000001','1'),
	('QL000002','列表0002','google','https://demo.doublechaintech.com/demodata/imageManager/genImage/y00/200/200/red/','列表0002','2019-10-12 04:24:47','UA000001','1'),
	('QL000003','列表0003','facebook','https://demo.doublechaintech.com/demodata/imageManager/genImage/y00/200/200/red/','列表0003','2019-10-08 15:55:56','UA000002','1'),
	('QL000004','列表0004','google','https://demo.doublechaintech.com/demodata/imageManager/genImage/y00/200/200/red/','列表0004','2019-10-11 09:40:44','UA000002','1'),
	('QL000005','列表0005','facebook','https://demo.doublechaintech.com/demodata/imageManager/genImage/y00/200/200/red/','列表0005','2019-10-11 02:07:56','UA000003','1'),
	('QL000006','列表0006','google','https://demo.doublechaintech.com/demodata/imageManager/genImage/y00/200/200/red/','列表0006','2019-10-13 12:19:58','UA000003','1'),
	('QL000007','列表0007','facebook','https://demo.doublechaintech.com/demodata/imageManager/genImage/y00/200/200/red/','列表0007','2019-10-10 21:11:19','UA000004','1'),
	('QL000008','列表0008','google','https://demo.doublechaintech.com/demodata/imageManager/genImage/y00/200/200/red/','列表0008','2019-10-02 03:54:44','UA000004','1');

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
	('LH000001','2019-10-11 02:10:31','192.168.1.1','登陆成功','SU000001','1'),
	('LH000002','2019-10-13 01:21:47','192.168.1.2','登陆成功0002','SU000001','1'),
	('LH000003','2019-09-28 21:20:49','192.168.1.1','登陆成功0003','SU000002','1'),
	('LH000004','2019-10-03 02:39:25','192.168.1.2','登陆成功0004','SU000002','1');

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



=======
	('EA000001','E000001','2018-05-12','2018-07-15','8','今天状态不错啊','1'),
	('EA000002','E000001','2017-08-18','2017-05-29','8','今天状态不错啊0002','1'),
	('EA000003','E000002','2017-04-13','2018-08-17','8','今天状态不错啊0003','1'),
	('EA000004','E000002','2019-07-21','2018-04-18','8','今天状态不错啊0004','1'),
	('EA000005','E000003','2017-12-12','2017-02-12','8','今天状态不错啊0005','1'),
	('EA000006','E000003','2019-11-17','2018-12-01','8','今天状态不错啊0006','1'),
	('EA000007','E000004','2017-02-14','2017-08-16','7','今天状态不错啊0007','1'),
	('EA000008','E000004','2019-05-22','2017-05-12','7','今天状态不错啊0008','1'),
	('EA000009','E000005','2018-07-05','2018-05-26','6','今天状态不错啊0009','1'),
	('EA000010','E000005','2018-07-11','2017-11-21','8','今天状态不错啊0010','1'),
	('EA000011','E000006','2019-02-07','2017-05-08','8','今天状态不错啊0011','1'),
	('EA000012','E000006','2018-12-19','2019-02-09','8','今天状态不错啊0012','1'),
	('EA000013','E000007','2019-05-21','2019-04-10','7','今天状态不错啊0013','1'),
	('EA000014','E000007','2019-06-25','2017-11-22','8','今天状态不错啊0014','1'),
	('EA000015','E000008','2019-05-20','2019-03-28','8','今天状态不错啊0015','1'),
	('EA000016','E000008','2017-07-05','2018-01-08','8','今天状态不错啊0016','1'),
	('EA000017','E000009','2018-03-20','2018-10-09','6','今天状态不错啊0017','1'),
	('EA000018','E000009','2019-05-23','2017-03-22','8','今天状态不错啊0018','1'),
	('EA000019','E000010','2019-01-12','2019-10-27','8','今天状态不错啊0019','1'),
	('EA000020','E000010','2017-11-30','2019-03-19','7','今天状态不错啊0020','1'),
	('EA000021','E000011','2017-10-30','2019-02-17','7','今天状态不错啊0021','1'),
	('EA000022','E000011','2019-06-04','2019-03-31','7','今天状态不错啊0022','1'),
	('EA000023','E000012','2018-10-02','2018-02-08','8','今天状态不错啊0023','1'),
	('EA000024','E000012','2019-05-27','2017-04-29','8','今天状态不错啊0024','1'),
	('EA000025','E000013','2017-03-27','2019-02-14','6','今天状态不错啊0025','1'),
	('EA000026','E000013','2018-08-05','2018-02-16','7','今天状态不错啊0026','1'),
	('EA000027','E000014','2018-07-20','2019-06-07','8','今天状态不错啊0027','1'),
	('EA000028','E000014','2018-03-30','2019-09-02','7','今天状态不错啊0028','1'),
	('EA000029','E000015','2018-09-15','2017-04-14','7','今天状态不错啊0029','1'),
	('EA000030','E000015','2017-03-10','2017-04-19','7','今天状态不错啊0030','1'),
	('EA000031','E000016','2019-03-31','2017-10-04','7','今天状态不错啊0031','1'),
	('EA000032','E000016','2017-02-02','2019-09-24','8','今天状态不错啊0032','1');

insert into employee_qualifier_data values
	('EQ000001','E000001','2019-01-10','认证药剂师','高级','考试成绩当年第一名','1'),
	('EQ000002','E000001','2019-04-03','认证架构师','中级','考试成绩当年第一名0002','1'),
	('EQ000003','E000002','2018-12-31','认证会计师','初级','考试成绩当年第一名0003','1'),
	('EQ000004','E000002','2019-11-06','认证经济师','高级','考试成绩当年第一名0004','1'),
	('EQ000005','E000003','2018-01-01','OCP','中级','考试成绩当年第一名0005','1'),
	('EQ000006','E000003','2019-07-18','CCNA','初级','考试成绩当年第一名0006','1'),
	('EQ000007','E000004','2019-08-29','CCNP','高级','考试成绩当年第一名0007','1'),
	('EQ000008','E000004','2017-03-18','认证药剂师','中级','考试成绩当年第一名0008','1'),
	('EQ000009','E000005','2018-04-04','认证架构师','初级','考试成绩当年第一名0009','1'),
	('EQ000010','E000005','2016-12-22','认证会计师','高级','考试成绩当年第一名0010','1'),
	('EQ000011','E000006','2018-04-30','认证经济师','中级','考试成绩当年第一名0011','1'),
	('EQ000012','E000006','2019-02-18','OCP','初级','考试成绩当年第一名0012','1'),
	('EQ000013','E000007','2017-06-24','CCNA','高级','考试成绩当年第一名0013','1'),
	('EQ000014','E000007','2018-07-24','CCNP','中级','考试成绩当年第一名0014','1'),
	('EQ000015','E000008','2019-09-11','认证药剂师','初级','考试成绩当年第一名0015','1'),
	('EQ000016','E000008','2019-11-30','认证架构师','高级','考试成绩当年第一名0016','1'),
	('EQ000017','E000009','2019-07-19','认证会计师','中级','考试成绩当年第一名0017','1'),
	('EQ000018','E000009','2018-04-12','认证经济师','初级','考试成绩当年第一名0018','1'),
	('EQ000019','E000010','2019-03-26','OCP','高级','考试成绩当年第一名0019','1'),
	('EQ000020','E000010','2016-12-29','CCNA','中级','考试成绩当年第一名0020','1'),
	('EQ000021','E000011','2018-02-18','CCNP','初级','考试成绩当年第一名0021','1'),
	('EQ000022','E000011','2019-06-29','认证药剂师','高级','考试成绩当年第一名0022','1'),
	('EQ000023','E000012','2019-02-17','认证架构师','中级','考试成绩当年第一名0023','1'),
	('EQ000024','E000012','2018-02-25','认证会计师','初级','考试成绩当年第一名0024','1'),
	('EQ000025','E000013','2017-04-08','认证经济师','高级','考试成绩当年第一名0025','1'),
	('EQ000026','E000013','2017-03-31','OCP','中级','考试成绩当年第一名0026','1'),
	('EQ000027','E000014','2018-03-02','CCNA','初级','考试成绩当年第一名0027','1'),
	('EQ000028','E000014','2017-02-26','CCNP','高级','考试成绩当年第一名0028','1'),
	('EQ000029','E000015','2017-11-29','认证药剂师','中级','考试成绩当年第一名0029','1'),
	('EQ000030','E000015','2018-10-08','认证架构师','初级','考试成绩当年第一名0030','1'),
	('EQ000031','E000016','2019-10-15','认证会计师','高级','考试成绩当年第一名0031','1'),
	('EQ000032','E000016','2017-04-12','认证经济师','中级','考试成绩当年第一名0032','1');

insert into employee_education_data values
	('EE000001','E000001','2017-04-25','小学','考试成绩当年第一名','1'),
	('EE000002','E000001','2019-12-05','初中','考试成绩当年第一名0002','1'),
	('EE000003','E000002','2019-06-07','高中','考试成绩当年第一名0003','1'),
	('EE000004','E000002','2017-06-30','大学','考试成绩当年第一名0004','1'),
	('EE000005','E000003','2018-08-19','硕士','考试成绩当年第一名0005','1'),
	('EE000006','E000003','2017-07-14','博士','考试成绩当年第一名0006','1'),
	('EE000007','E000004','2019-06-02','职业教育','考试成绩当年第一名0007','1'),
	('EE000008','E000004','2017-08-26','小学','考试成绩当年第一名0008','1'),
	('EE000009','E000005','2017-09-11','初中','考试成绩当年第一名0009','1'),
	('EE000010','E000005','2018-12-18','高中','考试成绩当年第一名0010','1'),
	('EE000011','E000006','2017-03-04','大学','考试成绩当年第一名0011','1'),
	('EE000012','E000006','2018-07-03','硕士','考试成绩当年第一名0012','1'),
	('EE000013','E000007','2018-04-06','博士','考试成绩当年第一名0013','1'),
	('EE000014','E000007','2016-12-23','职业教育','考试成绩当年第一名0014','1'),
	('EE000015','E000008','2019-06-28','小学','考试成绩当年第一名0015','1'),
	('EE000016','E000008','2017-03-18','初中','考试成绩当年第一名0016','1'),
	('EE000017','E000009','2017-02-12','高中','考试成绩当年第一名0017','1'),
	('EE000018','E000009','2019-04-03','大学','考试成绩当年第一名0018','1'),
	('EE000019','E000010','2019-10-02','硕士','考试成绩当年第一名0019','1'),
	('EE000020','E000010','2017-08-18','博士','考试成绩当年第一名0020','1'),
	('EE000021','E000011','2019-07-14','职业教育','考试成绩当年第一名0021','1'),
	('EE000022','E000011','2018-10-31','小学','考试成绩当年第一名0022','1'),
	('EE000023','E000012','2019-07-20','初中','考试成绩当年第一名0023','1'),
	('EE000024','E000012','2018-08-13','高中','考试成绩当年第一名0024','1'),
	('EE000025','E000013','2019-05-30','大学','考试成绩当年第一名0025','1'),
	('EE000026','E000013','2018-07-17','硕士','考试成绩当年第一名0026','1'),
	('EE000027','E000014','2017-02-04','博士','考试成绩当年第一名0027','1'),
	('EE000028','E000014','2019-07-22','职业教育','考试成绩当年第一名0028','1'),
	('EE000029','E000015','2017-02-02','小学','考试成绩当年第一名0029','1'),
	('EE000030','E000015','2019-03-08','初中','考试成绩当年第一名0030','1'),
	('EE000031','E000016','2019-01-29','高中','考试成绩当年第一名0031','1'),
	('EE000032','E000016','2017-05-01','大学','考试成绩当年第一名0032','1');

insert into employee_award_data values
	('EA000001','E000001','2017-06-11','明星员工','考试成绩当年第一名','1'),
	('EA000002','E000001','2018-06-24','销售之星','考试成绩当年第一名0002','1'),
	('EA000003','E000002','2017-03-11','技术之星','考试成绩当年第一名0003','1'),
	('EA000004','E000002','2018-02-20','管理之星','考试成绩当年第一名0004','1'),
	('EA000005','E000003','2019-03-21','终身成就奖','考试成绩当年第一名0005','1'),
	('EA000006','E000003','2017-08-05','明星员工','考试成绩当年第一名0006','1'),
	('EA000007','E000004','2018-06-21','销售之星','考试成绩当年第一名0007','1'),
	('EA000008','E000004','2019-10-20','技术之星','考试成绩当年第一名0008','1'),
	('EA000009','E000005','2018-10-24','管理之星','考试成绩当年第一名0009','1'),
	('EA000010','E000005','2019-06-23','终身成就奖','考试成绩当年第一名0010','1'),
	('EA000011','E000006','2017-12-10','明星员工','考试成绩当年第一名0011','1'),
	('EA000012','E000006','2017-07-14','销售之星','考试成绩当年第一名0012','1'),
	('EA000013','E000007','2019-10-26','技术之星','考试成绩当年第一名0013','1'),
	('EA000014','E000007','2019-03-27','管理之星','考试成绩当年第一名0014','1'),
	('EA000015','E000008','2017-08-18','终身成就奖','考试成绩当年第一名0015','1'),
	('EA000016','E000008','2018-08-08','明星员工','考试成绩当年第一名0016','1'),
	('EA000017','E000009','2017-06-24','销售之星','考试成绩当年第一名0017','1'),
	('EA000018','E000009','2019-06-14','技术之星','考试成绩当年第一名0018','1'),
	('EA000019','E000010','2018-01-05','管理之星','考试成绩当年第一名0019','1'),
	('EA000020','E000010','2019-10-11','终身成就奖','考试成绩当年第一名0020','1'),
	('EA000021','E000011','2017-02-19','明星员工','考试成绩当年第一名0021','1'),
	('EA000022','E000011','2017-06-05','销售之星','考试成绩当年第一名0022','1'),
	('EA000023','E000012','2017-04-05','技术之星','考试成绩当年第一名0023','1'),
	('EA000024','E000012','2017-03-10','管理之星','考试成绩当年第一名0024','1'),
	('EA000025','E000013','2017-02-26','终身成就奖','考试成绩当年第一名0025','1'),
	('EA000026','E000013','2019-03-31','明星员工','考试成绩当年第一名0026','1'),
	('EA000027','E000014','2018-04-26','销售之星','考试成绩当年第一名0027','1'),
	('EA000028','E000014','2017-10-22','技术之星','考试成绩当年第一名0028','1'),
	('EA000029','E000015','2017-06-25','管理之星','考试成绩当年第一名0029','1'),
	('EA000030','E000015','2019-11-06','终身成就奖','考试成绩当年第一名0030','1'),
	('EA000031','E000016','2019-11-04','明星员工','考试成绩当年第一名0031','1'),
	('EA000032','E000016','2017-08-29','销售之星','考试成绩当年第一名0032','1');

insert into employee_salary_sheet_data values
	('ESS000001','E000001','SG000001','2650.51','958.72','953.58','649.16','772.12','1174.14','7.10','PO000001','1'),
	('ESS000002','E000001','SG000001','2787.97','933.39','776.18','571.48','998.67','1142.00','8.88','PO000001','1'),
	('ESS000003','E000001','SG000001','2925.45','875.09','856.93','703.01','788.33','1024.24','6.73','PO000002','1'),
	('ESS000004','E000001','SG000001','2445.58','863.17','858.58','665.44','789.18','1055.07','8.46','PO000002','1'),
	('ESS000005','E000002','SG000001','2790.00','912.59','709.73','724.12','974.83','1103.31','8.53','PO000003','1'),
	('ESS000006','E000002','SG000001','2728.69','811.43','750.94','594.69','806.72','883.43','7.89','PO000003','1'),
	('ESS000007','E000002','SG000001','2514.64','969.25','823.46','569.75','979.05','1207.15','7.25','PO000004','1'),
	('ESS000008','E000002','SG000001','2395.00','862.52','942.36','589.02','886.41','951.38','7.66','PO000004','1'),
	('ESS000009','E000003','SG000001','2524.23','954.96','749.53','772.46','1006.48','920.47','7.80','PO000005','1'),
	('ESS000010','E000003','SG000001','2400.06','813.82','830.26','678.71','880.73','959.03','8.71','PO000005','1'),
	('ESS000011','E000003','SG000001','2633.99','707.86','775.73','687.93','814.52','1123.66','6.88','PO000006','1'),
	('ESS000012','E000003','SG000001','2504.83','980.17','960.00','640.30','1078.71','997.54','8.46','PO000006','1'),
	('ESS000013','E000004','SG000001','2591.14','790.21','779.07','652.84','1086.37','1028.23','7.47','PO000007','1'),
	('ESS000014','E000004','SG000001','2714.72','836.82','808.97','644.36','957.26','1021.56','6.24','PO000007','1'),
	('ESS000015','E000004','SG000001','2774.25','724.95','813.58','592.37','806.62','1053.32','6.29','PO000008','1'),
	('ESS000016','E000004','SG000001','2472.47','722.22','738.46','699.37','927.82','1040.15','6.36','PO000008','1'),
	('ESS000017','E000005','SG000001','2801.08','788.88','872.15','724.63','1086.52','1032.68','7.41','PO000009','1'),
	('ESS000018','E000005','SG000001','2103.97','998.67','830.96','787.85','840.92','1166.72','6.65','PO000009','1'),
	('ESS000019','E000005','SG000001','2944.42','799.75','729.71','729.59','912.14','865.36','6.58','PO000010','1'),
	('ESS000020','E000005','SG000001','2911.66','880.05','950.38','660.38','843.01','1005.71','7.42','PO000010','1'),
	('ESS000021','E000006','SG000001','2890.26','858.13','733.57','606.60','1078.22','1023.43','6.72','PO000011','1'),
	('ESS000022','E000006','SG000001','2291.51','922.08','717.08','731.89','948.40','924.90','7.18','PO000011','1'),
	('ESS000023','E000006','SG000001','2982.81','864.04','928.87','573.12','790.33','1192.67','8.08','PO000012','1'),
	('ESS000024','E000006','SG000001','2370.85','892.26','897.90','731.14','907.37','1064.12','6.46','PO000012','1'),
	('ESS000025','E000007','SG000001','2299.73','991.41','886.40','560.36','883.34','1066.74','8.37','PO000013','1'),
	('ESS000026','E000007','SG000001','2341.96','799.84','820.55','687.65','1020.32','1151.77','6.39','PO000013','1'),
	('ESS000027','E000007','SG000001','2306.52','789.04','969.85','586.38','981.79','896.83','8.31','PO000014','1'),
	('ESS000028','E000007','SG000001','2663.30','936.78','735.25','770.72','891.73','1106.17','8.23','PO000014','1'),
	('ESS000029','E000008','SG000001','2742.04','988.44','740.00','568.56','1055.38','1106.63','7.58','PO000015','1'),
	('ESS000030','E000008','SG000001','2482.17','923.48','841.93','754.16','888.23','1131.95','7.71','PO000015','1'),
	('ESS000031','E000008','SG000001','2234.59','737.16','741.05','588.67','771.23','878.97','6.83','PO000016','1'),
	('ESS000032','E000008','SG000001','2864.71','947.64','971.44','709.35','936.64','942.64','6.55','PO000016','1'),
	('ESS000033','E000009','SG000002','2608.44','982.91','955.46','784.09','870.89','1006.55','8.28','PO000017','1'),
	('ESS000034','E000009','SG000002','2424.28','849.98','763.86','772.01','950.89','1078.56','8.83','PO000017','1'),
	('ESS000035','E000009','SG000002','2387.87','888.89','705.89','566.06','843.38','1195.87','6.31','PO000018','1'),
	('ESS000036','E000009','SG000002','2982.71','939.04','801.55','730.78','940.53','1107.23','7.31','PO000018','1'),
	('ESS000037','E000010','SG000002','2489.86','845.05','742.02','594.17','892.38','1039.78','8.79','PO000019','1'),
	('ESS000038','E000010','SG000002','2256.30','886.55','876.28','750.64','970.78','1035.07','8.39','PO000019','1'),
	('ESS000039','E000010','SG000002','2215.11','815.23','790.45','685.89','996.44','1128.19','7.69','PO000020','1'),
	('ESS000040','E000010','SG000002','2701.06','765.80','957.01','585.07','954.88','980.92','6.99','PO000020','1'),
	('ESS000041','E000011','SG000002','2931.43','841.18','998.01','617.76','938.16','880.52','6.66','PO000021','1'),
	('ESS000042','E000011','SG000002','2904.88','786.00','959.07','706.21','976.28','1041.48','7.18','PO000021','1'),
	('ESS000043','E000011','SG000002','2718.37','760.45','930.66','664.99','825.49','1066.66','8.54','PO000022','1'),
	('ESS000044','E000011','SG000002','2855.18','954.92','738.94','710.62','990.08','1193.43','7.98','PO000022','1'),
	('ESS000045','E000012','SG000002','2216.62','730.96','844.60','661.64','916.16','1066.65','6.83','PO000023','1'),
	('ESS000046','E000012','SG000002','2716.39','769.82','969.33','783.61','945.79','1114.93','8.40','PO000023','1'),
	('ESS000047','E000012','SG000002','2353.25','928.02','750.80','672.86','1055.87','1192.18','8.78','PO000024','1'),
	('ESS000048','E000012','SG000002','2901.36','908.41','910.86','697.19','773.46','907.53','6.27','PO000024','1'),
	('ESS000049','E000013','SG000002','2581.01','766.59','799.86','766.50','885.40','1149.96','6.35','PO000025','1'),
	('ESS000050','E000013','SG000002','2248.73','727.31','744.68','655.24','980.32','998.74','8.65','PO000025','1'),
	('ESS000051','E000013','SG000002','2960.28','926.09','808.74','674.63','1071.27','1163.56','7.75','PO000026','1'),
	('ESS000052','E000013','SG000002','2301.76','902.82','768.71','608.00','910.53','1126.18','7.13','PO000026','1'),
	('ESS000053','E000014','SG000002','2386.69','925.64','994.02','601.61','808.09','1112.63','7.14','PO000027','1'),
	('ESS000054','E000014','SG000002','2413.54','982.14','783.39','667.89','1038.18','1049.83','7.98','PO000027','1'),
	('ESS000055','E000014','SG000002','2741.22','926.20','816.17','613.74','1073.81','976.35','8.87','PO000028','1'),
	('ESS000056','E000014','SG000002','2559.29','894.00','787.28','692.06','972.17','1130.40','7.27','PO000028','1'),
	('ESS000057','E000015','SG000002','2849.95','861.49','744.02','759.80','934.96','878.42','7.05','PO000029','1'),
	('ESS000058','E000015','SG000002','2560.43','867.86','894.75','585.53','890.80','1190.92','8.37','PO000029','1'),
	('ESS000059','E000015','SG000002','2232.08','920.22','925.65','594.91','1006.11','859.66','6.76','PO000030','1'),
	('ESS000060','E000015','SG000002','2901.93','779.74','853.06','737.61','1027.91','1216.59','8.43','PO000030','1'),
	('ESS000061','E000016','SG000002','2801.12','891.78','779.74','620.03','955.40','913.56','8.39','PO000031','1'),
	('ESS000062','E000016','SG000002','2949.79','715.78','931.62','740.31','821.84','1062.28','7.69','PO000031','1'),
	('ESS000063','E000016','SG000002','2338.16','927.14','966.77','623.59','948.57','1204.82','7.08','PO000032','1'),
	('ESS000064','E000016','SG000002','2535.31','875.94','742.10','573.90','801.16','892.86','6.69','PO000032','1');

insert into paying_off_data values
	('PO000001','出纳','E000001','2018-09-07','3998.95','1'),
	('PO000002','出纳0002','E000001','2017-06-17','4143.25','1'),
	('PO000003','出纳0003','E000002','2019-05-07','3725.39','1'),
	('PO000004','出纳0004','E000002','2017-01-19','5080.36','1'),
	('PO000005','出纳0005','E000003','2017-08-28','4797.89','1'),
	('PO000006','出纳0006','E000003','2018-01-21','5090.10','1'),
	('PO000007','出纳0007','E000004','2017-03-19','4969.25','1'),
	('PO000008','出纳0008','E000004','2017-12-18','4708.68','1'),
	('PO000009','出纳0009','E000005','2018-10-08','4177.46','1'),
	('PO000010','出纳0010','E000005','2017-12-06','4539.75','1'),
	('PO000011','出纳0011','E000006','2018-02-05','5142.73','1'),
	('PO000012','出纳0012','E000006','2019-09-12','4612.22','1'),
	('PO000013','出纳0013','E000007','2018-11-21','3871.52','1'),
	('PO000014','出纳0014','E000007','2017-05-02','4929.10','1'),
	('PO000015','出纳0015','E000008','2017-01-19','4471.82','1'),
	('PO000016','出纳0016','E000008','2019-11-01','4794.82','1'),
	('PO000017','出纳0017','E000009','2019-05-29','3757.73','1'),
	('PO000018','出纳0018','E000009','2019-03-08','4175.16','1'),
	('PO000019','出纳0019','E000010','2018-02-05','5094.78','1'),
	('PO000020','出纳0020','E000010','2017-05-25','4992.57','1'),
	('PO000021','出纳0021','E000011','2019-04-23','3704.13','1'),
	('PO000022','出纳0022','E000011','2019-06-08','4858.20','1'),
	('PO000023','出纳0023','E000012','2018-12-18','4220.81','1'),
	('PO000024','出纳0024','E000012','2018-05-15','4770.26','1'),
	('PO000025','出纳0025','E000013','2017-12-17','4567.04','1'),
	('PO000026','出纳0026','E000013','2019-04-18','4495.44','1'),
	('PO000027','出纳0027','E000014','2019-05-06','4949.09','1'),
	('PO000028','出纳0028','E000014','2017-09-16','3952.18','1'),
	('PO000029','出纳0029','E000015','2019-05-15','3730.58','1'),
	('PO000030','出纳0030','E000015','2019-10-04','4511.25','1'),
	('PO000031','出纳0031','E000016','2017-11-09','3897.76','1'),
	('PO000032','出纳0032','E000016','2017-10-08','4752.38','1');



-- Mysql innodb's foreign key has index automatically 
create unique index idx4id_ver_of_retail_store_country_center on retail_store_country_center_data (id, version);
create  index idx4founded_of_retail_store_country_center on retail_store_country_center_data (founded);

create unique index idx4id_ver_of_catalog on catalog_data (id, version);
create  index idx4sub_count_of_catalog on catalog_data (sub_count);
create  index idx4amount_of_catalog on catalog_data (amount);

create unique index idx4id_ver_of_level_one_category on level_one_category_data (id, version);

create unique index idx4id_ver_of_level_two_category on level_two_category_data (id, version);

create unique index idx4id_ver_of_level_three_category on level_three_category_data (id, version);

create unique index idx4id_ver_of_product on product_data (id, version);
create  index idx4last_update_time_of_product on product_data (last_update_time);

create unique index idx4id_ver_of_sku on sku_data (id, version);
create  index idx4price_of_sku on sku_data (price);

create unique index idx4id_ver_of_retail_store_province_center on retail_store_province_center_data (id, version);
create  index idx4founded_of_retail_store_province_center on retail_store_province_center_data (founded);
create  index idx4last_update_time_of_retail_store_province_center on retail_store_province_center_data (last_update_time);

create unique index idx4id_ver_of_province_center_department on province_center_department_data (id, version);
create  index idx4founded_of_province_center_department on province_center_department_data (founded);

create unique index idx4id_ver_of_province_center_employee on province_center_employee_data (id, version);
create  index idx4mobile_of_province_center_employee on province_center_employee_data (mobile);
create  index idx4founded_of_province_center_employee on province_center_employee_data (founded);

create unique index idx4id_ver_of_retail_store_city_service_center on retail_store_city_service_center_data (id, version);
create  index idx4founded_of_retail_store_city_service_center on retail_store_city_service_center_data (founded);
create  index idx4last_update_time_of_retail_store_city_service_center on retail_store_city_service_center_data (last_update_time);

create unique index idx4id_ver_of_city_partner on city_partner_data (id, version);
create  index idx4mobile_of_city_partner on city_partner_data (mobile);
create  index idx4last_update_time_of_city_partner on city_partner_data (last_update_time);

create unique index idx4id_ver_of_potential_customer on potential_customer_data (id, version);
create  index idx4mobile_of_potential_customer on potential_customer_data (mobile);
create  index idx4last_update_time_of_potential_customer on potential_customer_data (last_update_time);

create unique index idx4id_ver_of_potential_customer_contact_person on potential_customer_contact_person_data (id, version);
create  index idx4mobile_of_potential_customer_contact_person on potential_customer_contact_person_data (mobile);

create unique index idx4id_ver_of_potential_customer_contact on potential_customer_contact_data (id, version);
create  index idx4contact_date_of_potential_customer_contact on potential_customer_contact_data (contact_date);
create  index idx4last_update_time_of_potential_customer_contact on potential_customer_contact_data (last_update_time);

create unique index idx4id_ver_of_city_event on city_event_data (id, version);
create  index idx4mobile_of_city_event on city_event_data (mobile);
create  index idx4last_update_time_of_city_event on city_event_data (last_update_time);

create unique index idx4id_ver_of_event_attendance on event_attendance_data (id, version);

create unique index idx4id_ver_of_retail_store on retail_store_data (id, version);
create  index idx4telephone_of_retail_store on retail_store_data (telephone);
create  index idx4founded_of_retail_store on retail_store_data (founded);
create  index idx4latitude_of_retail_store on retail_store_data (latitude);
create  index idx4longitude_of_retail_store on retail_store_data (longitude);
create  index idx4last_update_time_of_retail_store on retail_store_data (last_update_time);

create unique index idx4id_ver_of_retail_store_creation on retail_store_creation_data (id, version);

create unique index idx4id_ver_of_retail_store_investment_invitation on retail_store_investment_invitation_data (id, version);

create unique index idx4id_ver_of_retail_store_franchising on retail_store_franchising_data (id, version);

create unique index idx4id_ver_of_retail_store_decoration on retail_store_decoration_data (id, version);

create unique index idx4id_ver_of_retail_store_opening on retail_store_opening_data (id, version);

create unique index idx4id_ver_of_retail_store_closing on retail_store_closing_data (id, version);

create unique index idx4id_ver_of_retail_store_member on retail_store_member_data (id, version);
create  index idx4mobile_phone_of_retail_store_member on retail_store_member_data (mobile_phone);

create unique index idx4id_ver_of_consumer_order on consumer_order_data (id, version);
create  index idx4last_update_time_of_consumer_order on consumer_order_data (last_update_time);

create unique index idx4id_ver_of_consumer_order_confirmation on consumer_order_confirmation_data (id, version);
create  index idx4confirm_time_of_consumer_order_confirmation on consumer_order_confirmation_data (confirm_time);

create unique index idx4id_ver_of_consumer_order_approval on consumer_order_approval_data (id, version);
create  index idx4approve_time_of_consumer_order_approval on consumer_order_approval_data (approve_time);

create unique index idx4id_ver_of_consumer_order_processing on consumer_order_processing_data (id, version);
create  index idx4process_time_of_consumer_order_processing on consumer_order_processing_data (process_time);

create unique index idx4id_ver_of_consumer_order_shipment on consumer_order_shipment_data (id, version);
create  index idx4ship_time_of_consumer_order_shipment on consumer_order_shipment_data (ship_time);

create unique index idx4id_ver_of_consumer_order_delivery on consumer_order_delivery_data (id, version);
create  index idx4delivery_time_of_consumer_order_delivery on consumer_order_delivery_data (delivery_time);

create unique index idx4id_ver_of_consumer_order_line_item on consumer_order_line_item_data (id, version);
create  index idx4sku_id_of_consumer_order_line_item on consumer_order_line_item_data (sku_id);
create  index idx4price_of_consumer_order_line_item on consumer_order_line_item_data (price);
create  index idx4quantity_of_consumer_order_line_item on consumer_order_line_item_data (quantity);
create  index idx4amount_of_consumer_order_line_item on consumer_order_line_item_data (amount);
create  index idx4last_update_time_of_consumer_order_line_item on consumer_order_line_item_data (last_update_time);

create unique index idx4id_ver_of_consumer_order_shipping_group on consumer_order_shipping_group_data (id, version);
create  index idx4amount_of_consumer_order_shipping_group on consumer_order_shipping_group_data (amount);

create unique index idx4id_ver_of_consumer_order_payment_group on consumer_order_payment_group_data (id, version);

create unique index idx4id_ver_of_consumer_order_price_adjustment on consumer_order_price_adjustment_data (id, version);
create  index idx4amount_of_consumer_order_price_adjustment on consumer_order_price_adjustment_data (amount);

create unique index idx4id_ver_of_retail_store_member_coupon on retail_store_member_coupon_data (id, version);
create  index idx4last_update_time_of_retail_store_member_coupon on retail_store_member_coupon_data (last_update_time);

create unique index idx4id_ver_of_member_wishlist on member_wishlist_data (id, version);

create unique index idx4id_ver_of_member_reward_point on member_reward_point_data (id, version);
create  index idx4point_of_member_reward_point on member_reward_point_data (point);

create unique index idx4id_ver_of_member_reward_point_redemption on member_reward_point_redemption_data (id, version);
create  index idx4point_of_member_reward_point_redemption on member_reward_point_redemption_data (point);

create unique index idx4id_ver_of_member_wishlist_product on member_wishlist_product_data (id, version);

create unique index idx4id_ver_of_retail_store_member_address on retail_store_member_address_data (id, version);
create  index idx4mobile_phone_of_retail_store_member_address on retail_store_member_address_data (mobile_phone);

create unique index idx4id_ver_of_retail_store_member_gift_card on retail_store_member_gift_card_data (id, version);
create  index idx4remain_of_retail_store_member_gift_card on retail_store_member_gift_card_data (remain);

create unique index idx4id_ver_of_retail_store_member_gift_card_consume_record on retail_store_member_gift_card_consume_record_data (id, version);
create  index idx788630187178288 on retail_store_member_gift_card_consume_record_data (occure_time);
create  index idx4amount_of_retail_store_member_gift_card_consume_record on retail_store_member_gift_card_consume_record_data (amount);

create unique index idx4id_ver_of_goods_supplier on goods_supplier_data (id, version);
create  index idx4contact_number_of_goods_supplier on goods_supplier_data (contact_number);
create  index idx4last_update_time_of_goods_supplier on goods_supplier_data (last_update_time);

create unique index idx4id_ver_of_supplier_product on supplier_product_data (id, version);

create unique index idx4id_ver_of_product_supply_duration on product_supply_duration_data (id, version);
create  index idx4quantity_of_product_supply_duration on product_supply_duration_data (quantity);
create  index idx4price_of_product_supply_duration on product_supply_duration_data (price);

create unique index idx4id_ver_of_supply_order on supply_order_data (id, version);
create  index idx4total_amount_of_supply_order on supply_order_data (total_amount);
create  index idx4last_update_time_of_supply_order on supply_order_data (last_update_time);

create unique index idx4id_ver_of_supply_order_confirmation on supply_order_confirmation_data (id, version);
create  index idx4confirm_time_of_supply_order_confirmation on supply_order_confirmation_data (confirm_time);

create unique index idx4id_ver_of_supply_order_approval on supply_order_approval_data (id, version);
create  index idx4approve_time_of_supply_order_approval on supply_order_approval_data (approve_time);

create unique index idx4id_ver_of_supply_order_processing on supply_order_processing_data (id, version);
create  index idx4process_time_of_supply_order_processing on supply_order_processing_data (process_time);

create unique index idx4id_ver_of_supply_order_picking on supply_order_picking_data (id, version);
create  index idx4process_time_of_supply_order_picking on supply_order_picking_data (process_time);

create unique index idx4id_ver_of_supply_order_shipment on supply_order_shipment_data (id, version);
create  index idx4ship_time_of_supply_order_shipment on supply_order_shipment_data (ship_time);

create unique index idx4id_ver_of_supply_order_delivery on supply_order_delivery_data (id, version);
create  index idx4delivery_time_of_supply_order_delivery on supply_order_delivery_data (delivery_time);

create unique index idx4id_ver_of_supply_order_line_item on supply_order_line_item_data (id, version);
create  index idx4sku_id_of_supply_order_line_item on supply_order_line_item_data (sku_id);
create  index idx4amount_of_supply_order_line_item on supply_order_line_item_data (amount);
create  index idx4quantity_of_supply_order_line_item on supply_order_line_item_data (quantity);

create unique index idx4id_ver_of_supply_order_shipping_group on supply_order_shipping_group_data (id, version);
create  index idx4amount_of_supply_order_shipping_group on supply_order_shipping_group_data (amount);

create unique index idx4id_ver_of_supply_order_payment_group on supply_order_payment_group_data (id, version);

create unique index idx4id_ver_of_retail_store_order on retail_store_order_data (id, version);
create  index idx4total_amount_of_retail_store_order on retail_store_order_data (total_amount);
create  index idx4last_update_time_of_retail_store_order on retail_store_order_data (last_update_time);

create unique index idx4id_ver_of_retail_store_order_confirmation on retail_store_order_confirmation_data (id, version);
create  index idx4confirm_time_of_retail_store_order_confirmation on retail_store_order_confirmation_data (confirm_time);

create unique index idx4id_ver_of_retail_store_order_approval on retail_store_order_approval_data (id, version);
create  index idx4approve_time_of_retail_store_order_approval on retail_store_order_approval_data (approve_time);

create unique index idx4id_ver_of_retail_store_order_processing on retail_store_order_processing_data (id, version);
create  index idx4process_time_of_retail_store_order_processing on retail_store_order_processing_data (process_time);

create unique index idx4id_ver_of_retail_store_order_picking on retail_store_order_picking_data (id, version);
create  index idx4process_time_of_retail_store_order_picking on retail_store_order_picking_data (process_time);

create unique index idx4id_ver_of_retail_store_order_shipment on retail_store_order_shipment_data (id, version);
create  index idx4ship_time_of_retail_store_order_shipment on retail_store_order_shipment_data (ship_time);

create unique index idx4id_ver_of_retail_store_order_delivery on retail_store_order_delivery_data (id, version);
create  index idx4delivery_time_of_retail_store_order_delivery on retail_store_order_delivery_data (delivery_time);

create unique index idx4id_ver_of_retail_store_order_line_item on retail_store_order_line_item_data (id, version);
create  index idx4sku_id_of_retail_store_order_line_item on retail_store_order_line_item_data (sku_id);
create  index idx4amount_of_retail_store_order_line_item on retail_store_order_line_item_data (amount);
create  index idx4quantity_of_retail_store_order_line_item on retail_store_order_line_item_data (quantity);

create unique index idx4id_ver_of_retail_store_order_shipping_group on retail_store_order_shipping_group_data (id, version);
create  index idx4amount_of_retail_store_order_shipping_group on retail_store_order_shipping_group_data (amount);

create unique index idx4id_ver_of_retail_store_order_payment_group on retail_store_order_payment_group_data (id, version);

create unique index idx4id_ver_of_warehouse on warehouse_data (id, version);
create  index idx4contact_number_of_warehouse on warehouse_data (contact_number);
create  index idx4latitude_of_warehouse on warehouse_data (latitude);
create  index idx4longitude_of_warehouse on warehouse_data (longitude);
create  index idx4last_update_time_of_warehouse on warehouse_data (last_update_time);

create unique index idx4id_ver_of_storage_space on storage_space_data (id, version);
create  index idx4contact_number_of_storage_space on storage_space_data (contact_number);
create  index idx4latitude_of_storage_space on storage_space_data (latitude);
create  index idx4longitude_of_storage_space on storage_space_data (longitude);
create  index idx4last_update_time_of_storage_space on storage_space_data (last_update_time);

create unique index idx4id_ver_of_smart_pallet on smart_pallet_data (id, version);
create  index idx4contact_number_of_smart_pallet on smart_pallet_data (contact_number);
create  index idx4latitude_of_smart_pallet on smart_pallet_data (latitude);
create  index idx4longitude_of_smart_pallet on smart_pallet_data (longitude);
create  index idx4last_update_time_of_smart_pallet on smart_pallet_data (last_update_time);

create unique index idx4id_ver_of_goods_shelf on goods_shelf_data (id, version);
create  index idx4last_update_time_of_goods_shelf on goods_shelf_data (last_update_time);

create unique index idx4id_ver_of_goods_shelf_stock_count on goods_shelf_stock_count_data (id, version);
create  index idx4count_time_of_goods_shelf_stock_count on goods_shelf_stock_count_data (count_time);

create unique index idx4id_ver_of_stock_count_issue_track on stock_count_issue_track_data (id, version);
create  index idx4count_time_of_stock_count_issue_track on stock_count_issue_track_data (count_time);

create unique index idx4id_ver_of_goods_allocation on goods_allocation_data (id, version);
create  index idx4latitude_of_goods_allocation on goods_allocation_data (latitude);
create  index idx4longitude_of_goods_allocation on goods_allocation_data (longitude);

create unique index idx4id_ver_of_goods on goods_data (id, version);
create  index idx4max_package_of_goods on goods_data (max_package);
create  index idx4expire_time_of_goods on goods_data (expire_time);

create unique index idx4id_ver_of_goods_packaging on goods_packaging_data (id, version);
create  index idx4package_time_of_goods_packaging on goods_packaging_data (package_time);

create unique index idx4id_ver_of_goods_movement on goods_movement_data (id, version);
create  index idx4move_time_of_goods_movement on goods_movement_data (move_time);
create  index idx4facility_id_of_goods_movement on goods_movement_data (facility_id);
create  index idx4session_id_of_goods_movement on goods_movement_data (session_id);
create  index idx4latitude_of_goods_movement on goods_movement_data (latitude);
create  index idx4longitude_of_goods_movement on goods_movement_data (longitude);

create unique index idx4id_ver_of_supplier_space on supplier_space_data (id, version);
create  index idx4contact_number_of_supplier_space on supplier_space_data (contact_number);
create  index idx4latitude_of_supplier_space on supplier_space_data (latitude);
create  index idx4longitude_of_supplier_space on supplier_space_data (longitude);
create  index idx4last_update_time_of_supplier_space on supplier_space_data (last_update_time);

create unique index idx4id_ver_of_receiving_space on receiving_space_data (id, version);
create  index idx4contact_number_of_receiving_space on receiving_space_data (contact_number);
create  index idx4latitude_of_receiving_space on receiving_space_data (latitude);
create  index idx4longitude_of_receiving_space on receiving_space_data (longitude);
create  index idx4last_update_time_of_receiving_space on receiving_space_data (last_update_time);

create unique index idx4id_ver_of_shipping_space on shipping_space_data (id, version);
create  index idx4contact_number_of_shipping_space on shipping_space_data (contact_number);
create  index idx4latitude_of_shipping_space on shipping_space_data (latitude);
create  index idx4longitude_of_shipping_space on shipping_space_data (longitude);
create  index idx4last_update_time_of_shipping_space on shipping_space_data (last_update_time);

create unique index idx4id_ver_of_damage_space on damage_space_data (id, version);
create  index idx4contact_number_of_damage_space on damage_space_data (contact_number);
create  index idx4latitude_of_damage_space on damage_space_data (latitude);
create  index idx4longitude_of_damage_space on damage_space_data (longitude);
create  index idx4last_update_time_of_damage_space on damage_space_data (last_update_time);

create unique index idx4id_ver_of_warehouse_asset on warehouse_asset_data (id, version);
create  index idx4last_update_time_of_warehouse_asset on warehouse_asset_data (last_update_time);

create unique index idx4id_ver_of_transport_fleet on transport_fleet_data (id, version);
create  index idx4contact_number_of_transport_fleet on transport_fleet_data (contact_number);
create  index idx4last_update_time_of_transport_fleet on transport_fleet_data (last_update_time);

create unique index idx4id_ver_of_transport_truck on transport_truck_data (id, version);
create  index idx4contact_number_of_transport_truck on transport_truck_data (contact_number);
create  index idx4make_date_of_transport_truck on transport_truck_data (make_date);

create unique index idx4id_ver_of_truck_driver on truck_driver_data (id, version);
create  index idx4driver_license_number_of_truck_driver on truck_driver_data (driver_license_number);
create  index idx4contact_number_of_truck_driver on truck_driver_data (contact_number);

create unique index idx4id_ver_of_transport_task on transport_task_data (id, version);
create  index idx4begin_time_of_transport_task on transport_task_data (begin_time);
create  index idx4latitude_of_transport_task on transport_task_data (latitude);
create  index idx4longitude_of_transport_task on transport_task_data (longitude);

create unique index idx4id_ver_of_transport_task_track on transport_task_track_data (id, version);
create  index idx4track_time_of_transport_task_track on transport_task_track_data (track_time);
create  index idx4latitude_of_transport_task_track on transport_task_track_data (latitude);
create  index idx4longitude_of_transport_task_track on transport_task_track_data (longitude);

create unique index idx4id_ver_of_account_set on account_set_data (id, version);
create  index idx4effective_date_of_account_set on account_set_data (effective_date);
create  index idx4account_number_of_account_set on account_set_data (account_number);
create  index idx4last_update_time_of_account_set on account_set_data (last_update_time);

create unique index idx4id_ver_of_accounting_subject on accounting_subject_data (id, version);
create  index idx4accounting_subject_class_code_of_accounting_subject on accounting_subject_data (accounting_subject_class_code);

create unique index idx4id_ver_of_accounting_period on accounting_period_data (id, version);
create  index idx4start_date_of_accounting_period on accounting_period_data (start_date);
create  index idx4end_date_of_accounting_period on accounting_period_data (end_date);

create unique index idx4id_ver_of_accounting_document_type on accounting_document_type_data (id, version);

create unique index idx4id_ver_of_accounting_document on accounting_document_data (id, version);
create  index idx4accounting_document_date_of_accounting_document on accounting_document_data (accounting_document_date);

create unique index idx4id_ver_of_accounting_document_creation on accounting_document_creation_data (id, version);
create  index idx4make_date_of_accounting_document_creation on accounting_document_creation_data (make_date);

create unique index idx4id_ver_of_accounting_document_confirmation on accounting_document_confirmation_data (id, version);
create  index idx4make_date_of_accounting_document_confirmation on accounting_document_confirmation_data (make_date);

create unique index idx4id_ver_of_accounting_document_auditing on accounting_document_auditing_data (id, version);
create  index idx4make_date_of_accounting_document_auditing on accounting_document_auditing_data (make_date);

create unique index idx4id_ver_of_accounting_document_posting on accounting_document_posting_data (id, version);
create  index idx4make_date_of_accounting_document_posting on accounting_document_posting_data (make_date);

create unique index idx4id_ver_of_original_voucher on original_voucher_data (id, version);

create unique index idx4id_ver_of_original_voucher_creation on original_voucher_creation_data (id, version);
create  index idx4make_date_of_original_voucher_creation on original_voucher_creation_data (make_date);

create unique index idx4id_ver_of_original_voucher_confirmation on original_voucher_confirmation_data (id, version);
create  index idx4make_date_of_original_voucher_confirmation on original_voucher_confirmation_data (make_date);

create unique index idx4id_ver_of_original_voucher_auditing on original_voucher_auditing_data (id, version);
create  index idx4make_date_of_original_voucher_auditing on original_voucher_auditing_data (make_date);

create unique index idx4id_ver_of_accounting_document_line on accounting_document_line_data (id, version);
create  index idx4amount_of_accounting_document_line on accounting_document_line_data (amount);

create unique index idx4id_ver_of_level_one_department on level_one_department_data (id, version);
create  index idx4founded_of_level_one_department on level_one_department_data (founded);

create unique index idx4id_ver_of_level_two_department on level_two_department_data (id, version);
create  index idx4founded_of_level_two_department on level_two_department_data (founded);

create unique index idx4id_ver_of_level_three_department on level_three_department_data (id, version);
create  index idx4founded_of_level_three_department on level_three_department_data (founded);

create unique index idx4id_ver_of_skill_type on skill_type_data (id, version);

create unique index idx4id_ver_of_responsibility_type on responsibility_type_data (id, version);

create unique index idx4id_ver_of_termination_reason on termination_reason_data (id, version);

create unique index idx4id_ver_of_termination_type on termination_type_data (id, version);

create unique index idx4id_ver_of_occupation_type on occupation_type_data (id, version);

create unique index idx4id_ver_of_leave_type on leave_type_data (id, version);

create unique index idx4id_ver_of_salary_grade on salary_grade_data (id, version);

create unique index idx4id_ver_of_interview_type on interview_type_data (id, version);

create unique index idx4id_ver_of_training_course_type on training_course_type_data (id, version);

create unique index idx4id_ver_of_public_holiday on public_holiday_data (id, version);

create unique index idx4id_ver_of_termination on termination_data (id, version);

create unique index idx4id_ver_of_view on view_data (id, version);
create  index idx4interview_time_of_view on view_data (interview_time);

create unique index idx4id_ver_of_employee on employee_data (id, version);
create  index idx4cell_phone_of_employee on employee_data (cell_phone);
create  index idx4last_update_time_of_employee on employee_data (last_update_time);

create unique index idx4id_ver_of_job_application on job_application_data (id, version);
create  index idx4application_time_of_job_application on job_application_data (application_time);

create unique index idx4id_ver_of_profession_interview on profession_interview_data (id, version);
create  index idx4interview_time_of_profession_interview on profession_interview_data (interview_time);

create unique index idx4id_ver_of_hr_interview on hr_interview_data (id, version);
create  index idx4interview_time_of_hr_interview on hr_interview_data (interview_time);

create unique index idx4id_ver_of_offer_approval on offer_approval_data (id, version);
create  index idx4approve_time_of_offer_approval on offer_approval_data (approve_time);

create unique index idx4id_ver_of_offer_acceptance on offer_acceptance_data (id, version);
create  index idx4accept_time_of_offer_acceptance on offer_acceptance_data (accept_time);

create unique index idx4id_ver_of_employee_boarding on employee_boarding_data (id, version);
create  index idx4employ_time_of_employee_boarding on employee_boarding_data (employ_time);

create unique index idx4id_ver_of_instructor on instructor_data (id, version);
create  index idx4cell_phone_of_instructor on instructor_data (cell_phone);
create  index idx4last_update_time_of_instructor on instructor_data (last_update_time);

create unique index idx4id_ver_of_company_training on company_training_data (id, version);
create  index idx4time_start_of_company_training on company_training_data (time_start);
create  index idx4duration_hours_of_company_training on company_training_data (duration_hours);
create  index idx4last_update_time_of_company_training on company_training_data (last_update_time);

create unique index idx4id_ver_of_scoring on scoring_data (id, version);
create  index idx4score_of_scoring on scoring_data (score);

create unique index idx4id_ver_of_employee_company_training on employee_company_training_data (id, version);

create unique index idx4id_ver_of_employee_skill on employee_skill_data (id, version);

create unique index idx4id_ver_of_employee_performance on employee_performance_data (id, version);

create unique index idx4id_ver_of_employee_work_experience on employee_work_experience_data (id, version);
create  index idx4start_of_employee_work_experience on employee_work_experience_data (start);
create  index idx4end_of_employee_work_experience on employee_work_experience_data (end);

create unique index idx4id_ver_of_employee_leave on employee_leave_data (id, version);
create  index idx4leave_duration_hour_of_employee_leave on employee_leave_data (leave_duration_hour);

create unique index idx4id_ver_of_employee_interview on employee_interview_data (id, version);

create unique index idx4id_ver_of_employee_attendance on employee_attendance_data (id, version);
create  index idx4enter_time_of_employee_attendance on employee_attendance_data (enter_time);
create  index idx4leave_time_of_employee_attendance on employee_attendance_data (leave_time);
create  index idx4duration_hours_of_employee_attendance on employee_attendance_data (duration_hours);

create unique index idx4id_ver_of_employee_qualifier on employee_qualifier_data (id, version);
create  index idx4qualified_time_of_employee_qualifier on employee_qualifier_data (qualified_time);

create unique index idx4id_ver_of_employee_education on employee_education_data (id, version);
create  index idx4complete_time_of_employee_education on employee_education_data (complete_time);

create unique index idx4id_ver_of_employee_award on employee_award_data (id, version);
create  index idx4complete_time_of_employee_award on employee_award_data (complete_time);

create unique index idx4id_ver_of_employee_salary_sheet on employee_salary_sheet_data (id, version);
create  index idx4base_salary_of_employee_salary_sheet on employee_salary_sheet_data (base_salary);
create  index idx4bonus_of_employee_salary_sheet on employee_salary_sheet_data (bonus);
create  index idx4reward_of_employee_salary_sheet on employee_salary_sheet_data (reward);
create  index idx4personal_tax_of_employee_salary_sheet on employee_salary_sheet_data (personal_tax);
create  index idx4social_security_of_employee_salary_sheet on employee_salary_sheet_data (social_security);
create  index idx4housing_found_of_employee_salary_sheet on employee_salary_sheet_data (housing_found);
create  index idx4job_insurance_of_employee_salary_sheet on employee_salary_sheet_data (job_insurance);

create unique index idx4id_ver_of_paying_off on paying_off_data (id, version);
create  index idx4paid_time_of_paying_off on paying_off_data (paid_time);
create  index idx4amount_of_paying_off on paying_off_data (amount);

create unique index idx4id_ver_of_user_domain on user_domain_data (id, version);

create unique index idx4id_ver_of_user_white_list on user_white_list_data (id, version);

create unique index idx4id_ver_of_sec_user on sec_user_data (id, version);
create unique index idx4login_of_sec_user on sec_user_data (login);
create unique index idx4email_of_sec_user on sec_user_data (email);
create unique index idx4mobile_of_sec_user on sec_user_data (mobile);
create  index idx4verification_code_of_sec_user on sec_user_data (verification_code);
create  index idx4verification_code_expire_of_sec_user on sec_user_data (verification_code_expire);
create  index idx4last_login_time_of_sec_user on sec_user_data (last_login_time);

create unique index idx4id_ver_of_sec_user_blocking on sec_user_blocking_data (id, version);
create  index idx4block_time_of_sec_user_blocking on sec_user_blocking_data (block_time);

create unique index idx4id_ver_of_user_app on user_app_data (id, version);
create  index idx4object_id_of_user_app on user_app_data (object_id);

create unique index idx4id_ver_of_quick_link on quick_link_data (id, version);
create  index idx4create_time_of_quick_link on quick_link_data (create_time);

create unique index idx4id_ver_of_list_access on list_access_data (id, version);

create unique index idx4id_ver_of_object_access on object_access_data (id, version);

create unique index idx4id_ver_of_login_history on login_history_data (id, version);
create  index idx4login_time_of_login_history on login_history_data (login_time);

create unique index idx4id_ver_of_generic_form on generic_form_data (id, version);

create unique index idx4id_ver_of_form_message on form_message_data (id, version);

create unique index idx4id_ver_of_form_field_message on form_field_message_data (id, version);

create unique index idx4id_ver_of_form_field on form_field_data (id, version);

create unique index idx4id_ver_of_form_action on form_action_data (id, version);

create unique index idx4id_ver_of_candidate_container on candidate_container_data (id, version);

create unique index idx4id_ver_of_candidate_element on candidate_element_data (id, version);
alter table retail_store_country_center_data add constraint pk4id_of_retail_store_country_center_data primary key (id);

alter table catalog_data add constraint pk4id_of_catalog_data primary key (id);
alter table catalog_data add constraint 
	fk4owner_of_catalog_data foreign key (owner) references retail_store_country_center_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table level_one_category_data add constraint pk4id_of_level_one_category_data primary key (id);
alter table level_one_category_data add constraint 
	fk4catalog_of_level_one_category_data foreign key (catalog) references catalog_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table level_two_category_data add constraint pk4id_of_level_two_category_data primary key (id);
alter table level_two_category_data add constraint 
	fk4parent_category_of_level_two_category_data foreign key (parent_category) references level_one_category_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table level_three_category_data add constraint pk4id_of_level_three_category_data primary key (id);
alter table level_three_category_data add constraint 
	fk4parent_category_of_level_three_category_data foreign key (parent_category) references level_two_category_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table product_data add constraint pk4id_of_product_data primary key (id);
alter table product_data add constraint 
	fk4parent_category_of_product_data foreign key (parent_category) references level_three_category_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table sku_data add constraint pk4id_of_sku_data primary key (id);
alter table sku_data add constraint 
	fk4product_of_sku_data foreign key (product) references product_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table retail_store_province_center_data add constraint pk4id_of_retail_store_province_center_data primary key (id);
alter table retail_store_province_center_data add constraint 
	fk4country_of_retail_store_province_center_data foreign key (country) references retail_store_country_center_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table province_center_department_data add constraint pk4id_of_province_center_department_data primary key (id);
alter table province_center_department_data add constraint 
	fk4province_center_of_province_center_department_data foreign key (province_center) references retail_store_province_center_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table province_center_employee_data add constraint pk4id_of_province_center_employee_data primary key (id);
alter table province_center_employee_data add constraint 
	fk4department_of_province_center_employee_data foreign key (department) references province_center_department_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table province_center_employee_data add constraint 
	fk4province_center_of_province_center_employee_data foreign key (province_center) references retail_store_province_center_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table retail_store_city_service_center_data add constraint pk4id_of_retail_store_city_service_center_data primary key (id);
alter table retail_store_city_service_center_data add constraint 
	fk4belongs_to_of_retail_store_city_service_center_data foreign key (belongs_to) references retail_store_province_center_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table city_partner_data add constraint pk4id_of_city_partner_data primary key (id);
alter table city_partner_data add constraint 
	fk4city_service_center_of_city_partner_data foreign key (city_service_center) references retail_store_city_service_center_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table potential_customer_data add constraint pk4id_of_potential_customer_data primary key (id);
alter table potential_customer_data add constraint 
	fk4city_service_center_of_potential_customer_data foreign key (city_service_center) references retail_store_city_service_center_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table potential_customer_data add constraint 
	fk4city_partner_of_potential_customer_data foreign key (city_partner) references city_partner_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table potential_customer_contact_person_data add constraint pk4id_of_potential_customer_contact_person_data primary key (id);
alter table potential_customer_contact_person_data add constraint 
	fk4potential_customer_of_potential_customer_contact_person_data foreign key (potential_customer) references potential_customer_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table potential_customer_contact_data add constraint pk4id_of_potential_customer_contact_data primary key (id);
alter table potential_customer_contact_data add constraint 
	fk4potential_customer_of_potential_customer_contact_data foreign key (potential_customer) references potential_customer_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table potential_customer_contact_data add constraint 
	fk4city_partner_of_potential_customer_contact_data foreign key (city_partner) references city_partner_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table potential_customer_contact_data add constraint 
	fk4contact_to_of_potential_customer_contact_data foreign key (contact_to) references potential_customer_contact_person_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table city_event_data add constraint pk4id_of_city_event_data primary key (id);
alter table city_event_data add constraint 
	fk4city_service_center_of_city_event_data foreign key (city_service_center) references retail_store_city_service_center_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table event_attendance_data add constraint pk4id_of_event_attendance_data primary key (id);
alter table event_attendance_data add constraint 
	fk4potential_customer_of_event_attendance_data foreign key (potential_customer) references potential_customer_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table event_attendance_data add constraint 
	fk4city_event_of_event_attendance_data foreign key (city_event) references city_event_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table retail_store_data add constraint pk4id_of_retail_store_data primary key (id);
alter table retail_store_data add constraint 
	fk4retail_store_country_center_of_retail_store_data foreign key (retail_store_country_center) references retail_store_country_center_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table retail_store_data add constraint 
	fk4city_service_center_of_retail_store_data foreign key (city_service_center) references retail_store_city_service_center_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table retail_store_data add constraint 
	fk4creation_of_retail_store_data foreign key (creation) references retail_store_creation_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table retail_store_data add constraint 
	fk4investment_invitation_of_retail_store_data foreign key (investment_invitation) references retail_store_investment_invitation_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table retail_store_data add constraint 
	fk4franchising_of_retail_store_data foreign key (franchising) references retail_store_franchising_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table retail_store_data add constraint 
	fk4decoration_of_retail_store_data foreign key (decoration) references retail_store_decoration_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table retail_store_data add constraint 
	fk4opening_of_retail_store_data foreign key (opening) references retail_store_opening_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table retail_store_data add constraint 
	fk4closing_of_retail_store_data foreign key (closing) references retail_store_closing_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table retail_store_creation_data add constraint pk4id_of_retail_store_creation_data primary key (id);

alter table retail_store_investment_invitation_data add constraint pk4id_of_retail_store_investment_invitation_data primary key (id);

alter table retail_store_franchising_data add constraint pk4id_of_retail_store_franchising_data primary key (id);

alter table retail_store_decoration_data add constraint pk4id_of_retail_store_decoration_data primary key (id);

alter table retail_store_opening_data add constraint pk4id_of_retail_store_opening_data primary key (id);

alter table retail_store_closing_data add constraint pk4id_of_retail_store_closing_data primary key (id);

alter table retail_store_member_data add constraint pk4id_of_retail_store_member_data primary key (id);
alter table retail_store_member_data add constraint 
	fk4owner_of_retail_store_member_data foreign key (owner) references retail_store_country_center_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table consumer_order_data add constraint pk4id_of_consumer_order_data primary key (id);
alter table consumer_order_data add constraint 
	fk4consumer_of_consumer_order_data foreign key (consumer) references retail_store_member_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table consumer_order_data add constraint 
	fk4confirmation_of_consumer_order_data foreign key (confirmation) references supply_order_confirmation_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table consumer_order_data add constraint 
	fk4approval_of_consumer_order_data foreign key (approval) references supply_order_approval_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table consumer_order_data add constraint 
	fk4processing_of_consumer_order_data foreign key (processing) references supply_order_processing_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table consumer_order_data add constraint 
	fk4shipment_of_consumer_order_data foreign key (shipment) references supply_order_shipment_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table consumer_order_data add constraint 
	fk4delivery_of_consumer_order_data foreign key (delivery) references supply_order_delivery_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table consumer_order_data add constraint 
	fk4store_of_consumer_order_data foreign key (store) references retail_store_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table consumer_order_confirmation_data add constraint pk4id_of_consumer_order_confirmation_data primary key (id);

alter table consumer_order_approval_data add constraint pk4id_of_consumer_order_approval_data primary key (id);

alter table consumer_order_processing_data add constraint pk4id_of_consumer_order_processing_data primary key (id);

alter table consumer_order_shipment_data add constraint pk4id_of_consumer_order_shipment_data primary key (id);

alter table consumer_order_delivery_data add constraint pk4id_of_consumer_order_delivery_data primary key (id);

alter table consumer_order_line_item_data add constraint pk4id_of_consumer_order_line_item_data primary key (id);
alter table consumer_order_line_item_data add constraint 
	fk4biz_order_of_consumer_order_line_item_data foreign key (biz_order) references consumer_order_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table consumer_order_shipping_group_data add constraint pk4id_of_consumer_order_shipping_group_data primary key (id);
alter table consumer_order_shipping_group_data add constraint 
	fk4biz_order_of_consumer_order_shipping_group_data foreign key (biz_order) references consumer_order_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table consumer_order_payment_group_data add constraint pk4id_of_consumer_order_payment_group_data primary key (id);
alter table consumer_order_payment_group_data add constraint 
	fk4biz_order_of_consumer_order_payment_group_data foreign key (biz_order) references consumer_order_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table consumer_order_price_adjustment_data add constraint pk4id_of_consumer_order_price_adjustment_data primary key (id);
alter table consumer_order_price_adjustment_data add constraint 
	fk4biz_order_of_consumer_order_price_adjustment_data foreign key (biz_order) references consumer_order_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table retail_store_member_coupon_data add constraint pk4id_of_retail_store_member_coupon_data primary key (id);
alter table retail_store_member_coupon_data add constraint 
	fk4owner_of_retail_store_member_coupon_data foreign key (owner) references retail_store_member_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table member_wishlist_data add constraint pk4id_of_member_wishlist_data primary key (id);
alter table member_wishlist_data add constraint 
	fk4owner_of_member_wishlist_data foreign key (owner) references retail_store_member_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table member_reward_point_data add constraint pk4id_of_member_reward_point_data primary key (id);
alter table member_reward_point_data add constraint 
	fk4owner_of_member_reward_point_data foreign key (owner) references retail_store_member_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table member_reward_point_redemption_data add constraint pk4id_of_member_reward_point_redemption_data primary key (id);
alter table member_reward_point_redemption_data add constraint 
	fk4owner_of_member_reward_point_redemption_data foreign key (owner) references retail_store_member_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table member_wishlist_product_data add constraint pk4id_of_member_wishlist_product_data primary key (id);
alter table member_wishlist_product_data add constraint 
	fk4owner_of_member_wishlist_product_data foreign key (owner) references member_wishlist_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table retail_store_member_address_data add constraint pk4id_of_retail_store_member_address_data primary key (id);
alter table retail_store_member_address_data add constraint 
	fk4owner_of_retail_store_member_address_data foreign key (owner) references retail_store_member_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table retail_store_member_gift_card_data add constraint pk4id_of_retail_store_member_gift_card_data primary key (id);
alter table retail_store_member_gift_card_data add constraint 
	fk4owner_of_retail_store_member_gift_card_data foreign key (owner) references retail_store_member_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table retail_store_member_gift_card_consume_record_data add constraint pk4id_of_retail_store_member_gift_card_consume_record_data primary key (id);
alter table retail_store_member_gift_card_consume_record_data add constraint 
	fk4owner_of_retail_store_member_gift_card_consume_record_data foreign key (owner) references retail_store_member_gift_card_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table retail_store_member_gift_card_consume_record_data add constraint 
	fk4biz_order_of_788630190445614 foreign key (biz_order) references consumer_order_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table goods_supplier_data add constraint pk4id_of_goods_supplier_data primary key (id);
alter table goods_supplier_data add constraint 
	fk4belong_to_of_goods_supplier_data foreign key (belong_to) references retail_store_country_center_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table supplier_product_data add constraint pk4id_of_supplier_product_data primary key (id);
alter table supplier_product_data add constraint 
	fk4supplier_of_supplier_product_data foreign key (supplier) references goods_supplier_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table product_supply_duration_data add constraint pk4id_of_product_supply_duration_data primary key (id);
alter table product_supply_duration_data add constraint 
	fk4product_of_product_supply_duration_data foreign key (product) references supplier_product_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table supply_order_data add constraint pk4id_of_supply_order_data primary key (id);
alter table supply_order_data add constraint 
	fk4buyer_of_supply_order_data foreign key (buyer) references retail_store_country_center_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table supply_order_data add constraint 
	fk4seller_of_supply_order_data foreign key (seller) references goods_supplier_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table supply_order_data add constraint 
	fk4confirmation_of_supply_order_data foreign key (confirmation) references supply_order_confirmation_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table supply_order_data add constraint 
	fk4approval_of_supply_order_data foreign key (approval) references supply_order_approval_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table supply_order_data add constraint 
	fk4processing_of_supply_order_data foreign key (processing) references supply_order_processing_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table supply_order_data add constraint 
	fk4picking_of_supply_order_data foreign key (picking) references supply_order_picking_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table supply_order_data add constraint 
	fk4shipment_of_supply_order_data foreign key (shipment) references supply_order_shipment_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table supply_order_data add constraint 
	fk4delivery_of_supply_order_data foreign key (delivery) references supply_order_delivery_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table supply_order_confirmation_data add constraint pk4id_of_supply_order_confirmation_data primary key (id);

alter table supply_order_approval_data add constraint pk4id_of_supply_order_approval_data primary key (id);

alter table supply_order_processing_data add constraint pk4id_of_supply_order_processing_data primary key (id);

alter table supply_order_picking_data add constraint pk4id_of_supply_order_picking_data primary key (id);

alter table supply_order_shipment_data add constraint pk4id_of_supply_order_shipment_data primary key (id);

alter table supply_order_delivery_data add constraint pk4id_of_supply_order_delivery_data primary key (id);

alter table supply_order_line_item_data add constraint pk4id_of_supply_order_line_item_data primary key (id);
alter table supply_order_line_item_data add constraint 
	fk4biz_order_of_supply_order_line_item_data foreign key (biz_order) references supply_order_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table supply_order_shipping_group_data add constraint pk4id_of_supply_order_shipping_group_data primary key (id);
alter table supply_order_shipping_group_data add constraint 
	fk4biz_order_of_supply_order_shipping_group_data foreign key (biz_order) references supply_order_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table supply_order_payment_group_data add constraint pk4id_of_supply_order_payment_group_data primary key (id);
alter table supply_order_payment_group_data add constraint 
	fk4biz_order_of_supply_order_payment_group_data foreign key (biz_order) references supply_order_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table retail_store_order_data add constraint pk4id_of_retail_store_order_data primary key (id);
alter table retail_store_order_data add constraint 
	fk4buyer_of_retail_store_order_data foreign key (buyer) references retail_store_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table retail_store_order_data add constraint 
	fk4seller_of_retail_store_order_data foreign key (seller) references retail_store_country_center_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table retail_store_order_data add constraint 
	fk4confirmation_of_retail_store_order_data foreign key (confirmation) references retail_store_order_confirmation_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table retail_store_order_data add constraint 
	fk4approval_of_retail_store_order_data foreign key (approval) references retail_store_order_approval_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table retail_store_order_data add constraint 
	fk4processing_of_retail_store_order_data foreign key (processing) references retail_store_order_processing_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table retail_store_order_data add constraint 
	fk4picking_of_retail_store_order_data foreign key (picking) references retail_store_order_picking_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table retail_store_order_data add constraint 
	fk4shipment_of_retail_store_order_data foreign key (shipment) references retail_store_order_shipment_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table retail_store_order_data add constraint 
	fk4delivery_of_retail_store_order_data foreign key (delivery) references retail_store_order_delivery_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table retail_store_order_confirmation_data add constraint pk4id_of_retail_store_order_confirmation_data primary key (id);

alter table retail_store_order_approval_data add constraint pk4id_of_retail_store_order_approval_data primary key (id);

alter table retail_store_order_processing_data add constraint pk4id_of_retail_store_order_processing_data primary key (id);

alter table retail_store_order_picking_data add constraint pk4id_of_retail_store_order_picking_data primary key (id);

alter table retail_store_order_shipment_data add constraint pk4id_of_retail_store_order_shipment_data primary key (id);

alter table retail_store_order_delivery_data add constraint pk4id_of_retail_store_order_delivery_data primary key (id);

alter table retail_store_order_line_item_data add constraint pk4id_of_retail_store_order_line_item_data primary key (id);
alter table retail_store_order_line_item_data add constraint 
	fk4biz_order_of_retail_store_order_line_item_data foreign key (biz_order) references retail_store_order_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table retail_store_order_shipping_group_data add constraint pk4id_of_retail_store_order_shipping_group_data primary key (id);
alter table retail_store_order_shipping_group_data add constraint 
	fk4biz_order_of_retail_store_order_shipping_group_data foreign key (biz_order) references retail_store_order_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table retail_store_order_payment_group_data add constraint pk4id_of_retail_store_order_payment_group_data primary key (id);
alter table retail_store_order_payment_group_data add constraint 
	fk4biz_order_of_retail_store_order_payment_group_data foreign key (biz_order) references retail_store_order_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table warehouse_data add constraint pk4id_of_warehouse_data primary key (id);
alter table warehouse_data add constraint 
	fk4owner_of_warehouse_data foreign key (owner) references retail_store_country_center_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table storage_space_data add constraint pk4id_of_storage_space_data primary key (id);
alter table storage_space_data add constraint 
	fk4warehouse_of_storage_space_data foreign key (warehouse) references warehouse_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table smart_pallet_data add constraint pk4id_of_smart_pallet_data primary key (id);
alter table smart_pallet_data add constraint 
	fk4warehouse_of_smart_pallet_data foreign key (warehouse) references warehouse_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table goods_shelf_data add constraint pk4id_of_goods_shelf_data primary key (id);
alter table goods_shelf_data add constraint 
	fk4storage_space_of_goods_shelf_data foreign key (storage_space) references storage_space_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table goods_shelf_data add constraint 
	fk4supplier_space_of_goods_shelf_data foreign key (supplier_space) references supplier_space_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table goods_shelf_data add constraint 
	fk4damage_space_of_goods_shelf_data foreign key (damage_space) references damage_space_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table goods_shelf_stock_count_data add constraint pk4id_of_goods_shelf_stock_count_data primary key (id);
alter table goods_shelf_stock_count_data add constraint 
	fk4shelf_of_goods_shelf_stock_count_data foreign key (shelf) references goods_shelf_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table stock_count_issue_track_data add constraint pk4id_of_stock_count_issue_track_data primary key (id);
alter table stock_count_issue_track_data add constraint 
	fk4stock_count_of_stock_count_issue_track_data foreign key (stock_count) references goods_shelf_stock_count_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table goods_allocation_data add constraint pk4id_of_goods_allocation_data primary key (id);
alter table goods_allocation_data add constraint 
	fk4goods_shelf_of_goods_allocation_data foreign key (goods_shelf) references goods_shelf_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table goods_data add constraint pk4id_of_goods_data primary key (id);
alter table goods_data add constraint 
	fk4sku_of_goods_data foreign key (sku) references sku_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table goods_data add constraint 
	fk4receiving_space_of_goods_data foreign key (receiving_space) references receiving_space_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table goods_data add constraint 
	fk4goods_allocation_of_goods_data foreign key (goods_allocation) references goods_allocation_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table goods_data add constraint 
	fk4smart_pallet_of_goods_data foreign key (smart_pallet) references smart_pallet_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table goods_data add constraint 
	fk4shipping_space_of_goods_data foreign key (shipping_space) references shipping_space_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table goods_data add constraint 
	fk4transport_task_of_goods_data foreign key (transport_task) references transport_task_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table goods_data add constraint 
	fk4retail_store_of_goods_data foreign key (retail_store) references retail_store_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table goods_data add constraint 
	fk4biz_order_of_goods_data foreign key (biz_order) references supply_order_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table goods_data add constraint 
	fk4retail_store_order_of_goods_data foreign key (retail_store_order) references retail_store_order_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table goods_data add constraint 
	fk4packaging_of_goods_data foreign key (packaging) references goods_packaging_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table goods_packaging_data add constraint pk4id_of_goods_packaging_data primary key (id);

alter table goods_movement_data add constraint pk4id_of_goods_movement_data primary key (id);
alter table goods_movement_data add constraint 
	fk4goods_of_goods_movement_data foreign key (goods) references goods_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table supplier_space_data add constraint pk4id_of_supplier_space_data primary key (id);
alter table supplier_space_data add constraint 
	fk4warehouse_of_supplier_space_data foreign key (warehouse) references warehouse_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table receiving_space_data add constraint pk4id_of_receiving_space_data primary key (id);
alter table receiving_space_data add constraint 
	fk4warehouse_of_receiving_space_data foreign key (warehouse) references warehouse_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table shipping_space_data add constraint pk4id_of_shipping_space_data primary key (id);
alter table shipping_space_data add constraint 
	fk4warehouse_of_shipping_space_data foreign key (warehouse) references warehouse_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table damage_space_data add constraint pk4id_of_damage_space_data primary key (id);
alter table damage_space_data add constraint 
	fk4warehouse_of_damage_space_data foreign key (warehouse) references warehouse_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table warehouse_asset_data add constraint pk4id_of_warehouse_asset_data primary key (id);
alter table warehouse_asset_data add constraint 
	fk4owner_of_warehouse_asset_data foreign key (owner) references warehouse_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table transport_fleet_data add constraint pk4id_of_transport_fleet_data primary key (id);
alter table transport_fleet_data add constraint 
	fk4owner_of_transport_fleet_data foreign key (owner) references retail_store_country_center_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table transport_truck_data add constraint pk4id_of_transport_truck_data primary key (id);
alter table transport_truck_data add constraint 
	fk4owner_of_transport_truck_data foreign key (owner) references transport_fleet_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table truck_driver_data add constraint pk4id_of_truck_driver_data primary key (id);
alter table truck_driver_data add constraint 
	fk4belongs_to_of_truck_driver_data foreign key (belongs_to) references transport_fleet_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table transport_task_data add constraint pk4id_of_transport_task_data primary key (id);
alter table transport_task_data add constraint 
	fk4end_of_transport_task_data foreign key (end) references retail_store_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table transport_task_data add constraint 
	fk4driver_of_transport_task_data foreign key (driver) references truck_driver_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table transport_task_data add constraint 
	fk4truck_of_transport_task_data foreign key (truck) references transport_truck_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table transport_task_data add constraint 
	fk4belongs_to_of_transport_task_data foreign key (belongs_to) references transport_fleet_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table transport_task_track_data add constraint pk4id_of_transport_task_track_data primary key (id);
alter table transport_task_track_data add constraint 
	fk4movement_of_transport_task_track_data foreign key (movement) references transport_task_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table account_set_data add constraint pk4id_of_account_set_data primary key (id);
alter table account_set_data add constraint 
	fk4country_center_of_account_set_data foreign key (country_center) references retail_store_country_center_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table account_set_data add constraint 
	fk4retail_store_of_account_set_data foreign key (retail_store) references retail_store_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table account_set_data add constraint 
	fk4goods_supplier_of_account_set_data foreign key (goods_supplier) references goods_supplier_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table accounting_subject_data add constraint pk4id_of_accounting_subject_data primary key (id);
alter table accounting_subject_data add constraint 
	fk4account_set_of_accounting_subject_data foreign key (account_set) references account_set_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table accounting_period_data add constraint pk4id_of_accounting_period_data primary key (id);
alter table accounting_period_data add constraint 
	fk4account_set_of_accounting_period_data foreign key (account_set) references account_set_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table accounting_document_type_data add constraint pk4id_of_accounting_document_type_data primary key (id);
alter table accounting_document_type_data add constraint 
	fk4accounting_period_of_accounting_document_type_data foreign key (accounting_period) references account_set_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table accounting_document_data add constraint pk4id_of_accounting_document_data primary key (id);
alter table accounting_document_data add constraint 
	fk4accounting_period_of_accounting_document_data foreign key (accounting_period) references accounting_period_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table accounting_document_data add constraint 
	fk4document_type_of_accounting_document_data foreign key (document_type) references accounting_document_type_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table accounting_document_data add constraint 
	fk4creation_of_accounting_document_data foreign key (creation) references accounting_document_creation_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table accounting_document_data add constraint 
	fk4confirmation_of_accounting_document_data foreign key (confirmation) references accounting_document_confirmation_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table accounting_document_data add constraint 
	fk4auditing_of_accounting_document_data foreign key (auditing) references accounting_document_auditing_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table accounting_document_data add constraint 
	fk4posting_of_accounting_document_data foreign key (posting) references accounting_document_posting_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table accounting_document_creation_data add constraint pk4id_of_accounting_document_creation_data primary key (id);

alter table accounting_document_confirmation_data add constraint pk4id_of_accounting_document_confirmation_data primary key (id);

alter table accounting_document_auditing_data add constraint pk4id_of_accounting_document_auditing_data primary key (id);

alter table accounting_document_posting_data add constraint pk4id_of_accounting_document_posting_data primary key (id);

alter table original_voucher_data add constraint pk4id_of_original_voucher_data primary key (id);
alter table original_voucher_data add constraint 
	fk4belongs_to_of_original_voucher_data foreign key (belongs_to) references accounting_document_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table original_voucher_data add constraint 
	fk4creation_of_original_voucher_data foreign key (creation) references original_voucher_creation_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table original_voucher_data add constraint 
	fk4confirmation_of_original_voucher_data foreign key (confirmation) references original_voucher_confirmation_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table original_voucher_data add constraint 
	fk4auditing_of_original_voucher_data foreign key (auditing) references original_voucher_auditing_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table original_voucher_creation_data add constraint pk4id_of_original_voucher_creation_data primary key (id);

alter table original_voucher_confirmation_data add constraint pk4id_of_original_voucher_confirmation_data primary key (id);

alter table original_voucher_auditing_data add constraint pk4id_of_original_voucher_auditing_data primary key (id);

alter table accounting_document_line_data add constraint pk4id_of_accounting_document_line_data primary key (id);
alter table accounting_document_line_data add constraint 
	fk4belongs_to_of_accounting_document_line_data foreign key (belongs_to) references accounting_document_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table accounting_document_line_data add constraint 
	fk4accounting_subject_of_accounting_document_line_data foreign key (accounting_subject) references accounting_subject_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table level_one_department_data add constraint pk4id_of_level_one_department_data primary key (id);
alter table level_one_department_data add constraint 
	fk4belongs_to_of_level_one_department_data foreign key (belongs_to) references retail_store_country_center_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table level_two_department_data add constraint pk4id_of_level_two_department_data primary key (id);
alter table level_two_department_data add constraint 
	fk4belongs_to_of_level_two_department_data foreign key (belongs_to) references level_one_department_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table level_three_department_data add constraint pk4id_of_level_three_department_data primary key (id);
alter table level_three_department_data add constraint 
	fk4belongs_to_of_level_three_department_data foreign key (belongs_to) references level_two_department_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table skill_type_data add constraint pk4id_of_skill_type_data primary key (id);
alter table skill_type_data add constraint 
	fk4company_of_skill_type_data foreign key (company) references retail_store_country_center_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table responsibility_type_data add constraint pk4id_of_responsibility_type_data primary key (id);
alter table responsibility_type_data add constraint 
	fk4company_of_responsibility_type_data foreign key (company) references retail_store_country_center_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table termination_reason_data add constraint pk4id_of_termination_reason_data primary key (id);
alter table termination_reason_data add constraint 
	fk4company_of_termination_reason_data foreign key (company) references retail_store_country_center_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table termination_type_data add constraint pk4id_of_termination_type_data primary key (id);
alter table termination_type_data add constraint 
	fk4company_of_termination_type_data foreign key (company) references retail_store_country_center_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table occupation_type_data add constraint pk4id_of_occupation_type_data primary key (id);
alter table occupation_type_data add constraint 
	fk4company_of_occupation_type_data foreign key (company) references retail_store_country_center_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table leave_type_data add constraint pk4id_of_leave_type_data primary key (id);
alter table leave_type_data add constraint 
	fk4company_of_leave_type_data foreign key (company) references retail_store_country_center_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table salary_grade_data add constraint pk4id_of_salary_grade_data primary key (id);
alter table salary_grade_data add constraint 
	fk4company_of_salary_grade_data foreign key (company) references retail_store_country_center_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table interview_type_data add constraint pk4id_of_interview_type_data primary key (id);
alter table interview_type_data add constraint 
	fk4company_of_interview_type_data foreign key (company) references retail_store_country_center_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table training_course_type_data add constraint pk4id_of_training_course_type_data primary key (id);
alter table training_course_type_data add constraint 
	fk4company_of_training_course_type_data foreign key (company) references retail_store_country_center_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table public_holiday_data add constraint pk4id_of_public_holiday_data primary key (id);
alter table public_holiday_data add constraint 
	fk4company_of_public_holiday_data foreign key (company) references retail_store_country_center_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table termination_data add constraint pk4id_of_termination_data primary key (id);
alter table termination_data add constraint 
	fk4reason_of_termination_data foreign key (reason) references termination_reason_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table termination_data add constraint 
	fk4type_of_termination_data foreign key (type) references termination_type_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table view_data add constraint pk4id_of_view_data primary key (id);

alter table employee_data add constraint pk4id_of_employee_data primary key (id);
alter table employee_data add constraint 
	fk4company_of_employee_data foreign key (company) references retail_store_country_center_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table employee_data add constraint 
	fk4department_of_employee_data foreign key (department) references level_three_department_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table employee_data add constraint 
	fk4occupation_of_employee_data foreign key (occupation) references occupation_type_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table employee_data add constraint 
	fk4responsible_for_of_employee_data foreign key (responsible_for) references responsibility_type_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table employee_data add constraint 
	fk4current_salary_grade_of_employee_data foreign key (current_salary_grade) references salary_grade_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table employee_data add constraint 
	fk4job_application_of_employee_data foreign key (job_application) references job_application_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table employee_data add constraint 
	fk4profession_interview_of_employee_data foreign key (profession_interview) references profession_interview_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table employee_data add constraint 
	fk4hr_interview_of_employee_data foreign key (hr_interview) references hr_interview_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table employee_data add constraint 
	fk4offer_approval_of_employee_data foreign key (offer_approval) references offer_approval_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table employee_data add constraint 
	fk4offer_acceptance_of_employee_data foreign key (offer_acceptance) references offer_acceptance_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table employee_data add constraint 
	fk4employee_boarding_of_employee_data foreign key (employee_boarding) references employee_boarding_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table employee_data add constraint 
	fk4termination_of_employee_data foreign key (termination) references termination_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table job_application_data add constraint pk4id_of_job_application_data primary key (id);

alter table profession_interview_data add constraint pk4id_of_profession_interview_data primary key (id);

alter table hr_interview_data add constraint pk4id_of_hr_interview_data primary key (id);

alter table offer_approval_data add constraint pk4id_of_offer_approval_data primary key (id);

alter table offer_acceptance_data add constraint pk4id_of_offer_acceptance_data primary key (id);

alter table employee_boarding_data add constraint pk4id_of_employee_boarding_data primary key (id);

alter table instructor_data add constraint pk4id_of_instructor_data primary key (id);
alter table instructor_data add constraint 
	fk4company_of_instructor_data foreign key (company) references retail_store_country_center_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table company_training_data add constraint pk4id_of_company_training_data primary key (id);
alter table company_training_data add constraint 
	fk4company_of_company_training_data foreign key (company) references retail_store_country_center_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table company_training_data add constraint 
	fk4instructor_of_company_training_data foreign key (instructor) references instructor_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table company_training_data add constraint 
	fk4training_course_type_of_company_training_data foreign key (training_course_type) references training_course_type_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table scoring_data add constraint pk4id_of_scoring_data primary key (id);

alter table employee_company_training_data add constraint pk4id_of_employee_company_training_data primary key (id);
alter table employee_company_training_data add constraint 
	fk4employee_of_employee_company_training_data foreign key (employee) references employee_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table employee_company_training_data add constraint 
	fk4training_of_employee_company_training_data foreign key (training) references company_training_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table employee_company_training_data add constraint 
	fk4scoring_of_employee_company_training_data foreign key (scoring) references scoring_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table employee_skill_data add constraint pk4id_of_employee_skill_data primary key (id);
alter table employee_skill_data add constraint 
	fk4employee_of_employee_skill_data foreign key (employee) references employee_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table employee_skill_data add constraint 
	fk4skill_type_of_employee_skill_data foreign key (skill_type) references skill_type_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table employee_performance_data add constraint pk4id_of_employee_performance_data primary key (id);
alter table employee_performance_data add constraint 
	fk4employee_of_employee_performance_data foreign key (employee) references employee_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table employee_work_experience_data add constraint pk4id_of_employee_work_experience_data primary key (id);
alter table employee_work_experience_data add constraint 
	fk4employee_of_employee_work_experience_data foreign key (employee) references employee_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table employee_leave_data add constraint pk4id_of_employee_leave_data primary key (id);
alter table employee_leave_data add constraint 
	fk4who_of_employee_leave_data foreign key (who) references employee_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table employee_leave_data add constraint 
	fk4type_of_employee_leave_data foreign key (type) references leave_type_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table employee_interview_data add constraint pk4id_of_employee_interview_data primary key (id);
alter table employee_interview_data add constraint 
	fk4employee_of_employee_interview_data foreign key (employee) references employee_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table employee_interview_data add constraint 
	fk4interview_type_of_employee_interview_data foreign key (interview_type) references interview_type_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table employee_attendance_data add constraint pk4id_of_employee_attendance_data primary key (id);
alter table employee_attendance_data add constraint 
	fk4employee_of_employee_attendance_data foreign key (employee) references employee_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table employee_qualifier_data add constraint pk4id_of_employee_qualifier_data primary key (id);
alter table employee_qualifier_data add constraint 
	fk4employee_of_employee_qualifier_data foreign key (employee) references employee_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table employee_education_data add constraint pk4id_of_employee_education_data primary key (id);
alter table employee_education_data add constraint 
	fk4employee_of_employee_education_data foreign key (employee) references employee_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table employee_award_data add constraint pk4id_of_employee_award_data primary key (id);
alter table employee_award_data add constraint 
	fk4employee_of_employee_award_data foreign key (employee) references employee_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table employee_salary_sheet_data add constraint pk4id_of_employee_salary_sheet_data primary key (id);
alter table employee_salary_sheet_data add constraint 
	fk4employee_of_employee_salary_sheet_data foreign key (employee) references employee_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table employee_salary_sheet_data add constraint 
	fk4current_salary_grade_of_employee_salary_sheet_data foreign key (current_salary_grade) references salary_grade_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table employee_salary_sheet_data add constraint 
	fk4paying_off_of_employee_salary_sheet_data foreign key (paying_off) references paying_off_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table paying_off_data add constraint pk4id_of_paying_off_data primary key (id);
alter table paying_off_data add constraint 
	fk4paid_for_of_paying_off_data foreign key (paid_for) references employee_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table user_domain_data add constraint pk4id_of_user_domain_data primary key (id);

alter table user_white_list_data add constraint pk4id_of_user_white_list_data primary key (id);
alter table user_white_list_data add constraint 
	fk4domain_of_user_white_list_data foreign key (domain) references user_domain_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table sec_user_data add constraint pk4id_of_sec_user_data primary key (id);
alter table sec_user_data add constraint 
	fk4domain_of_sec_user_data foreign key (domain) references user_domain_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table sec_user_data add constraint 
	fk4blocking_of_sec_user_data foreign key (blocking) references sec_user_blocking_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table sec_user_blocking_data add constraint pk4id_of_sec_user_blocking_data primary key (id);

alter table user_app_data add constraint pk4id_of_user_app_data primary key (id);
alter table user_app_data add constraint 
	fk4sec_user_of_user_app_data foreign key (sec_user) references sec_user_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table quick_link_data add constraint pk4id_of_quick_link_data primary key (id);
alter table quick_link_data add constraint 
	fk4app_of_quick_link_data foreign key (app) references user_app_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table list_access_data add constraint pk4id_of_list_access_data primary key (id);
alter table list_access_data add constraint 
	fk4app_of_list_access_data foreign key (app) references user_app_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table object_access_data add constraint pk4id_of_object_access_data primary key (id);
alter table object_access_data add constraint 
	fk4app_of_object_access_data foreign key (app) references user_app_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table login_history_data add constraint pk4id_of_login_history_data primary key (id);
alter table login_history_data add constraint 
	fk4sec_user_of_login_history_data foreign key (sec_user) references sec_user_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table generic_form_data add constraint pk4id_of_generic_form_data primary key (id);

alter table form_message_data add constraint pk4id_of_form_message_data primary key (id);
alter table form_message_data add constraint 
	fk4form_of_form_message_data foreign key (form) references generic_form_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table form_field_message_data add constraint pk4id_of_form_field_message_data primary key (id);
alter table form_field_message_data add constraint 
	fk4form_of_form_field_message_data foreign key (form) references generic_form_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table form_field_data add constraint pk4id_of_form_field_data primary key (id);
alter table form_field_data add constraint 
	fk4form_of_form_field_data foreign key (form) references generic_form_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table form_action_data add constraint pk4id_of_form_action_data primary key (id);
alter table form_action_data add constraint 
	fk4form_of_form_action_data foreign key (form) references generic_form_data(id) ON DELETE CASCADE ON UPDATE CASCADE;

alter table candidate_container_data add constraint pk4id_of_candidate_container_data primary key (id);

alter table candidate_element_data add constraint pk4id_of_candidate_element_data primary key (id);
alter table candidate_element_data add constraint 
	fk4container_of_candidate_element_data foreign key (container) references candidate_container_data(id) ON DELETE CASCADE ON UPDATE CASCADE;
-- create extra index for time, number and mobile phone
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe







delete from list_access_data ;
delete from object_access_data ;
delete from user_app_data ;
delete from login_history_data ;
delete from sec_user_data ;
delete from user_domain_data ;
insert into user_domain_data values ('UD000001','用户区域','1');



<<<<<<< HEAD
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
insert into user_app_data values('UA000047','通用的形式','SU000024','wpforms',1,'MXWR','GenericForm','GF000001','/link/to/app','1');
insert into user_app_data values('UA000048','我的账户','SU000024','lock',1,'MXWR','SecUser','SU000024','/link/to/app','1');
insert into sec_user_data values('SU000025','User000025','13900000025','1000025@qq.com','E1D441F2F9DA5C7456A3D6F32097D0C29DEFF3FFCAB5CE40927FC12208CDABE0', 'weixin_openid_000025', 'weixin_appid_000025', 'jwt_token_000025' ,'9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000049','候选人容器','SU000025','at',1,'MXWR','CandidateContainer','CC000001','/link/to/app','1');
insert into user_app_data values('UA000050','我的账户','SU000025','lock',1,'MXWR','SecUser','SU000025','/link/to/app','1');

/* ------------------------------------------------------------------------ */


select id,pwd from sec_user_data;
=======
insert into sec_user_data values('SU000001','User000001','13900000001','1000001@qq.com','24327F1C00D22210298A18D0DB9AA6C4C22DEAC4BEAE7C02E616442CA7764246', 'weixin_openid_000001', 'weixin_appid_000001', 'jwt_token_000001' ,'9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,1);
insert into user_app_data values('UA000001','双链小超中国国运营中心','SU000001','university',1,'MXWR','RetailStoreCountryCenter','RSCC000001','/link/to/app','1');
insert into user_app_data values('UA000002','我的账户','SU000001','lock',1,'MXWR','SecUser','SU000001','/link/to/app','1');
insert into user_app_data values('UA000003','用户管理','SU000001','users',1,'MXWR','UserDomain','UD000001','/link/to/app','1');

/* ------------------------------ generate users for all target od marked as user4all ------------------------------------------ */


select mobile as `可用于登录的账号`, 'admin123' as `密码` from sec_user_data;
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

/*
| 角色        | 用户名           | 密码         |
| ------------- |:-------------:|:-------------------:|
<<<<<<< HEAD
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
|通用的形式|13900000024|DoubleChain!y1|
|候选人容器|13900000025|DoubleChain!y1|
=======
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe


*/


<<<<<<< HEAD

/* start with data patch */
/* The sql file is not found from: /Users/Philip/githome/web-code-generator/sky/data-patch/retailscm.sql */


/*

=======
create table info_lines(line varchar(400));

insert into info_lines values( '   SSSSSSSSSSSSSSS                                                                                                                  !!! ');
insert into info_lines values( ' SS:::::::::::::::S                                                                                                                !!:!!');
insert into info_lines values( 'S:::::SSSSSS::::::S                                                                                                                !:::!');
insert into info_lines values( 'S:::::S     SSSSSSS                                                                                                                !:::!');
insert into info_lines values( 'S:::::S            uuuuuu    uuuuuu      cccccccccccccccc    cccccccccccccccc    eeeeeeeeeeee        ssssssssss       ssssssssss   !:::!');
insert into info_lines values( 'S:::::S            u::::u    u::::u    cc:::::::::::::::c  cc:::::::::::::::c  ee::::::::::::ee    ss::::::::::s    ss::::::::::s  !:::!');
insert into info_lines values( ' S::::SSSS         u::::u    u::::u   c:::::::::::::::::c c:::::::::::::::::c e::::::eeeee:::::eess:::::::::::::s ss:::::::::::::s !:::!');
insert into info_lines values( '  SS::::::SSSSS    u::::u    u::::u  c:::::::cccccc:::::cc:::::::cccccc:::::ce::::::e     e:::::es::::::ssss:::::ss::::::ssss:::::s!:::!');
insert into info_lines values( '    SSS::::::::SS  u::::u    u::::u  c::::::c     cccccccc::::::c     ccccccce:::::::eeeee::::::e s:::::s  ssssss  s:::::s  ssssss !:::!');
insert into info_lines values( '       SSSSSS::::S u::::u    u::::u  c:::::c             c:::::c             e:::::::::::::::::e    s::::::s         s::::::s      !:::!');
insert into info_lines values( '            S:::::Su::::u    u::::u  c:::::c             c:::::c             e::::::eeeeeeeeeee        s::::::s         s::::::s   !!:!!');
insert into info_lines values( '            S:::::Su:::::uuuu:::::u  c::::::c     cccccccc::::::c     ccccccce:::::::e           ssssss   s:::::s ssssss   s:::::s  !!! ');
insert into info_lines values( 'SSSSSSS     S:::::Su:::::::::::::::uuc:::::::cccccc:::::cc:::::::cccccc:::::ce::::::::e          s:::::ssss::::::ss:::::ssss::::::s     ');
insert into info_lines values( 'S::::::SSSSSS:::::S u:::::::::::::::u c:::::::::::::::::c c:::::::::::::::::c e::::::::eeeeeeee  s::::::::::::::s s::::::::::::::s  !!! ');
insert into info_lines values( 'S:::::::::::::::SS   uu::::::::uu:::u  cc:::::::::::::::c  cc:::::::::::::::c  ee:::::::::::::e   s:::::::::::ss   s:::::::::::ss  !!:!!');
insert into info_lines values( ' SSSSSSSSSSSSSSS       uuuuuuuu  uuuu    cccccccccccccccc    cccccccccccccccc    eeeeeeeeeeeeee    sssssssssss      sssssssssss     !!! ');

select * from info_lines;
/* start with data patch */
/* The sql file is not found from: /home/philip/resin-3.1.12/webapps/sky/data-patch/retailscm.sql */
-- no change request defined .
-- turn on safe mode
SET SQL_SAFE_UPDATES = 1;
-- change request type

/*
http://patorjk.com/software/taag/#p=testall&h=0&v=0&f=Graceful&t=Success!
   _____                                            _ 
  / ____|                                          | |
 | (___    _   _    ___    ___    ___   ___   ___  | |
  \\___   | | | |  / __|  / __|  / _  / __| / __| | |
  ____) | | |_| | | (__  | (__  |  __/ \\__  \\__  |_|
 |_____/   \\__,_|  \\___|  \\___|  \\___| |___/ |___/ (_)  
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
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

