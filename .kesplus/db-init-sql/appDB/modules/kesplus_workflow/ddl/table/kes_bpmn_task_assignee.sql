drop table if exists "kesplus_workflow"."kes_bpmn_task_assignee";
create table "kesplus_workflow"."kes_bpmn_task_assignee" (
	    "id" character varying(32 char) not null,
    	"task_id" character varying(32 char) not null,
    	"assignee_id" character varying(32 char) not null,
    	"assignee_name" character varying(64 char) null,
    	"assignee_dept_id" character varying(32 char) null default 0,
    	"assignee_dept_name" character varying(64 char) null,
    	"task_op_id" character varying(64 char) null,
	constraint "pkey_bpmn_task_assignee" primary key (id)
);
create index idx_kes_bpmn_task_assignee_assignee_id_assignee_dept_id on "kesplus_workflow".kes_bpmn_task_assignee using btree (assignee_id, assignee_dept_id);
create index idx_kes_bpmn_task_task_id on "kesplus_workflow".kes_bpmn_task_assignee using btree (task_id);

create index inxex_kes_bpmn_task_assignee_task_op_id on kesplus_workflow.kes_bpmn_task_assignee using btree (task_op_id);
create index inxex_kes_bpmn_task_assignee_assignee_id on kesplus_workflow.kes_bpmn_task_assignee using btree (assignee_id);