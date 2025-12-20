CREATE UNLOGGED TABLE "kesplus_app"."kesplus_unlogged_audit_record" (
	"id" varchar NOT NULL,
	"table_name" varchar NULL,
	"operation_type" varchar NULL,
	"old_values" jsonb NULL,
	"new_values" jsonb NULL,
	"create_time" datetime NULL DEFAULT CURRENT_TIMESTAMP,
	"request_id" varchar NULL,
	CONSTRAINT "pk_unlogged_audit_record" PRIMARY KEY (id)
);
