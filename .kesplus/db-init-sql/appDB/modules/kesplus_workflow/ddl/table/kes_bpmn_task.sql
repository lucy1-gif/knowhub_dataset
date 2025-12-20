-- "kesplus_workflow"."kes_bpmn_task" definition

-- drop table

drop table if exists "kesplus_workflow"."kes_bpmn_task";

create table "kesplus_workflow"."kes_bpmn_task" (
	    "id" character varying(32 char) not null,
    	"process_instance_id" character varying(64 char) not null,
    	"execution_id" character varying(64 char) null,
    	"create_by" character varying(32 char) not null,
    	"create_time" datetime not null,
    	"task_def_key" character varying(64 char) null,
    	"prev_task_def_key" character varying(64 char) null,
    	"task_status" smallint not null default 0,
    	"task_result" character varying(32 char) null,
    	"complete_time" datetime null,
    	"handler_id" character varying(32 char) null,
    	"handler_name" character varying(64 char) null,
    	"handler_dept_id" character varying(32 char) null default 0,
    	"handler_dept_name" character varying(64 char) null,
    	"dept_id" character varying(32 char) null default null::varchar,
    	"module_code" character varying(128 char) null default null::varchar,
    	"task_id" character varying(64 char) not null,
    	"task_name" character varying(128 char) null,
    	"prefix_id" character varying(64 char) null default 0::varchar,
    	"can_retract" integer null,
    	"op_status" smallint null default 0,
    	"update_by" varchar null,
    	"update_time" datetime null,
    	"variables" json null,
    	"task_flows" jsonb null,
	constraint "pk_kes_bpmn_task" primary key (id)
);
create index idx_kes_bpmn_task_process_instance_id_execution_id on "kesplus_workflow".kes_bpmn_task using btree (process_instance_id, execution_id);
create index idx_kes_bpmn_task_process_instance_id_task_def_key on "kesplus_workflow".kes_bpmn_task using btree (process_instance_id, task_def_key);

create index inxex_kes_bpmn_task_process_instance_id on kesplus_workflow.kes_bpmn_task using btree (process_instance_id);
create index inxex_kes_bpmn_task_prefix_id on kesplus_workflow.kes_bpmn_task using btree (prefix_id);
create index inxex_kes_bpmn_task_task_id on kesplus_workflow.kes_bpmn_task using btree (task_id);

-- column comments

comment on column "kesplus_workflow"."kes_bpmn_task"."process_instance_id" is '流程实例id';
comment on column "kesplus_workflow"."kes_bpmn_task"."execution_id" is '当前执行id';
comment on column "kesplus_workflow"."kes_bpmn_task"."task_def_key" is '流程节点定义id';
comment on column "kesplus_workflow"."kes_bpmn_task"."task_status" is '任务状态';
comment on column "kesplus_workflow"."kes_bpmn_task"."task_result" is '任务结果';
comment on column "kesplus_workflow"."kes_bpmn_task"."complete_time" is '办结时间';
comment on column "kesplus_workflow"."kes_bpmn_task"."task_id" is '任务id';
comment on column "kesplus_workflow"."kes_bpmn_task"."task_name" is '节点名称';