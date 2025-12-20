CREATE TABLE "kesplus_app"."kesplus_audit_record" (
	"id" varchar NOT NULL,
	"table_name" varchar NULL,
	"operation_type" varchar NULL,
	"old_values" jsonb NULL,
	"new_values" jsonb NULL,
	"create_time" datetime NULL DEFAULT CURRENT_TIMESTAMP,
	"request_id" varchar NULL,
	--"diff_values" jsonb generated always as ("kesplus_app".diff_jsonb_values(new_values,old_values)) stored,
	CONSTRAINT "con_kesplus_audit_record_constraint_1" PRIMARY KEY (id)
);
COMMENT ON TABLE "kesplus_app"."kesplus_audit_record" IS '审计记录表';

-- Column comments

COMMENT ON COLUMN "kesplus_app"."kesplus_audit_record"."table_name" IS '表名';
COMMENT ON COLUMN "kesplus_app"."kesplus_audit_record"."operation_type" IS '操作类型';
COMMENT ON COLUMN "kesplus_app"."kesplus_audit_record"."old_values" IS '旧数据';
COMMENT ON COLUMN "kesplus_app"."kesplus_audit_record"."new_values" IS '新数据';
COMMENT ON COLUMN "kesplus_app"."kesplus_audit_record"."create_time" IS '创建日期';
COMMENT ON COLUMN "kesplus_app"."kesplus_audit_record"."request_id" IS '请求id';