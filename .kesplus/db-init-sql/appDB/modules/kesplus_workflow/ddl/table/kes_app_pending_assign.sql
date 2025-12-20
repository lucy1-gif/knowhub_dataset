-- "kesplus_workflow"."kes_app_pending_assign" definition

-- drop table

drop table if exists "kesplus_workflow"."kes_app_pending_assign";

create table "kesplus_workflow"."kes_app_pending_assign" (
	"id" character varying(32 char) not null,
	"module_code" character varying(50 char) null,
	"dept_id" character varying(32 char) null,
	"pending_id" character varying(32 char) not null,
	"assignee_id" character varying(32 char) not null,
	"assignee_dept_id" character varying(32 char) null,
	"assignee_name" character varying(32 char) null,
	"assignee_dept_name" character varying(128 char) null,
	"create_time" datetime null,
	"create_by" character varying(32 char) null,
	"update_time" datetime null,
	"update_by" character varying(32 char) null,
	constraint "pk_kes_app_pending_assign" primary key (id)
);


create index inxex_kes_app_pending_assign_pending_id on kesplus_workflow.kes_app_pending_assign using btree (pending_id);
create index inxex_kes_app_pending_assign_assignee_id on kesplus_workflow.kes_app_pending_assign using btree (assignee_id);