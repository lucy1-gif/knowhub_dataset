-- "kesplus_workflow"."kes_app_pending_his" definition

-- drop table

drop table if exists "kesplus_workflow"."kes_app_pending_his";

create table "kesplus_workflow"."kes_app_pending_his" (
	"id" character varying(32 char) not null,
	"module_code" character varying(50 char) null,
	"dept_id" character varying(32 char) null,
	"type" character varying(64 char) not null,
	"title" character varying(256 char) not null,
	"path" character varying(500 char) not null,
	"create_time" datetime null,
	"create_by" character varying(32 char) null,
	"update_time" datetime null,
	"update_by" character varying(32 char) null,
	"handler_id" character varying(32 char) null,
	"handler_dept_id" character varying(32 char) null,
	"handler_name" character varying(32 char) null,
	"handler_dept_name" character varying(128 char) null,
	"status" tinyint null,
	"variables" json null,
	"pending_key" character varying(128 char) not null,
    "pending_id" character varying(128 char)  null,
	"complete_time" datetime null,
	"business_id" varchar null,
	"form_vue" character varying(255 char) null,
	"real_name" character varying(256 char) null,
    "process_type" integer null,
    "process_instance_id" character varying(64 char) null,
    "process_status" character varying(32 char) null,
    "dept_name" character varying(64 char) null,
    "category" character varying(64 char) NULL,
	constraint "pk_kes_app_pending_his" primary key (id)
);

create index inxex_kes_app_pending_his_pending_key on kesplus_workflow.kes_app_pending_his using btree (pending_key);
create index inxex_kes_app_pending_his_business_id on kesplus_workflow.kes_app_pending_his using btree (business_id);
create index inxex_kes_app_pending_his_pending_id on kesplus_workflow.kes_app_pending_his using btree (pending_id);