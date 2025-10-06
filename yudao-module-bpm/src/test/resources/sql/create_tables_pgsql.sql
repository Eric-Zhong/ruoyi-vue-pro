-- The script is same as create_tables.sql, only use for postgresql.
-- I use AI to transfer mysql script to postgresql script.

-- =============================================
-- bpm_user_group 用户组表
-- =============================================
CREATE TABLE IF NOT EXISTS "bpm_user_group" (
    "id"           bigserial     PRIMARY KEY,
    "name"         varchar(63)   NOT NULL,
    "description"  varchar(255)  NOT NULL,
    "status"       smallint      NOT NULL,
    "user_ids"     varchar(255)  NOT NULL,
    "creator"      varchar(64)   DEFAULT '',
    "create_time"  timestamp     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updater"      varchar(64)   DEFAULT '',
    "update_time"  timestamp     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted"      boolean       NOT NULL DEFAULT false
);

COMMENT ON TABLE "bpm_user_group" IS '用户组表';
COMMENT ON COLUMN "bpm_user_group"."id" IS '主键ID';
COMMENT ON COLUMN "bpm_user_group"."name" IS '组名称';
COMMENT ON COLUMN "bpm_user_group"."status" IS '状态（0-禁用 1-启用）';

-- =============================================
-- bpm_category 流程分类表
-- =============================================
CREATE TABLE IF NOT EXISTS "bpm_category" (
    "id"           bigserial     PRIMARY KEY,
    "name"         varchar(63)   NOT NULL,
    "code"         varchar(63)   NOT NULL,
    "description"  varchar(255)  NOT NULL,
    "status"       smallint      NOT NULL,
    "sort"         integer       NOT NULL,
    "creator"      varchar(64)   DEFAULT '',
    "create_time"  timestamp     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updater"      varchar(64)   DEFAULT '',
    "update_time"  timestamp     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted"      boolean       NOT NULL DEFAULT false
);

COMMENT ON TABLE "bpm_category" IS '流程分类表';
COMMENT ON COLUMN "bpm_category"."code" IS '分类编码';
COMMENT ON COLUMN "bpm_category"."sort" IS '排序字段';

-- =============================================
-- bpm_form 动态表单表
-- =============================================
CREATE TABLE IF NOT EXISTS "bpm_form" (
    "id"           bigserial     PRIMARY KEY,
    "name"         varchar(63)   NOT NULL,
    "status"       smallint      NOT NULL,
    "fields"       varchar(255)  NOT NULL,
    "conf"         varchar(255)  NOT NULL,
    "remark"       varchar(255),
    "creator"      varchar(64)   DEFAULT '',
    "create_time"  timestamp     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updater"      varchar(64)   DEFAULT '',
    "update_time"  timestamp     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted"      boolean       NOT NULL DEFAULT false
);

COMMENT ON TABLE "bpm_form" IS '动态表单表';
COMMENT ON COLUMN "bpm_form"."fields" IS '表单字段配置';
COMMENT ON COLUMN "bpm_form"."conf" IS '表单布局配置';
