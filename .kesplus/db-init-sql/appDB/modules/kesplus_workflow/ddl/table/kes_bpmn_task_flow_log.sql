-- "kesplus_workflow"."kes_bpmn_task_flow_log" definition

-- drop table

drop table if exists "kesplus_workflow"."kes_bpmn_task_flow_log";

create table "kesplus_workflow"."kes_bpmn_task_flow_log" (
	    "id" character varying(64 char) not null,
    	"name" character varying(64 char) null,
    	"business_id" character varying(64 char) null,
    	"process_id" character varying(64 char) null,
    	"flow_text" text null,
    	"create_time" datetime null,
	constraint "pk_kes_bpmn_task_flow_log" primary key (id)
);