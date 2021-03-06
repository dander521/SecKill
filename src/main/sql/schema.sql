
-- 数据库初始化脚本

-- 创建数据库
create database seckill;
-- 使用数据库
use seckill;
-- 创建秒杀库存表
create table seckill(
    `seckill_id` bigint not null auto_increment comment '商品库存id',
    `name` varchar(120) not null comment '商品名称',
    `number` int not null comment '库存数量',
    `start_time` timestamp not null default current_timestamp on update current_timestamp comment '秒杀开启时间',
    `end_time` timestamp not null default current_timestamp comment '秒杀结束时间',
    `create_time` timestamp not null default current_timestamp comment '创建时间',
    primary key (seckill_id),
    key `idx_start_time`(start_time),
    key `idx_end_time`(end_time),
    key `idx_create_time`(create_time)

) engine = InnoDB auto_increment=1000 default charset = utf8 comment = '秒杀库存表';

-- 初始化数据
insert into
    seckill (name, number, start_time, end_time)
values
    ('1000元秒杀iPhone6s',100,'2019-06-01 00:00:00','2019-07-01 00:00:00'),
    ('500元秒杀手表',200,'2019-06-03 00:00:00','2019-07-03 00:00:00'),
    ('40元秒杀红米',100,'2019-06-10 00:00:00','2019-07-01 00:00:00'),
    ('1000元秒杀华为',100,'2019-06-20 00:00:00','2019-07-01 00:00:00');

-- 秒杀成功明细
-- 用户登录认证
create table success_seckill(
    `seckill_id` bigint not null comment '秒杀商品id',
    `user_phone` bigint not null comment '用户手机号',
    `state` tinyint not null default -1 comment '状态标记：-1：无效 0：成功 1：已付款 2：已发货',
    `create_time` timestamp not null comment '创建时间',
    primary key (seckill_id,user_phone), /*联合主键*/
    key idx_create_time(create_time)

) engine = InnoDB default charset = utf8 comment = '秒杀成功明细表';

-- 连接数据库
mysql -uroot -p