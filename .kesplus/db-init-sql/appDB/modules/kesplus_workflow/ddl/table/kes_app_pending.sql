-- "kesplus_workflow"."kes_app_pending" definition

-- drop table

drop table if exists "kesplus_workflow"."kes_app_pending";

create table "kesplus_workflow"."kes_app_pending" (
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
	"status" tinyint null,
	"variables" json null,
	"pending_key" character varying(128 char) not null,
	"pending_id" character varying(128 char)  null,
	"complete_time" datetime null,
	"business_id" character varying(32 char) null,
	"form_vue" character varying(255 char) null,
	"real_name" character varying(256 char) null,
    "process_type" integer null,
    "process_instance_id" character varying(64 char) null,
    "process_status" character varying(32 char) null,
    "dept_name" character varying(64 char) null,
    "category" character varying(64 char) NULL,
	constraint "pk_kes_app_pending" primary key (id)
);
create unique index uk_pending_type_key_category on kesplus_workflow.kes_app_pending using btree (type, pending_key,category);

create index inxex_kes_app_pending_business_id on kesplus_workflow.kes_app_pending using btree (business_id);
create index inxex_kes_app_pending_pending_key on kesplus_workflow.kes_app_pending using btree (pending_key);
create index inxex_kes_app_pending_create_by on kesplus_workflow.kes_app_pending using btree (create_by);
create index inxex_kes_app_pending_pending_id on kesplus_workflow.kes_app_pending using btree (pending_id);