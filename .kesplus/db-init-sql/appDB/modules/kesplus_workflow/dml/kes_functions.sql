INSERT INTO kesplus_workflow.kes_functions ("id","category","directory_code","name","schema_name","return_type","owner_name","parameters","app_id","module_id","parent_id","content","create_time","update_time","is_rest","api_directory_id","method","module_path","api_path","return_value_type","tenant_id","auth_status","role_ids","remark","update_by","create_by","obj_type","sort_num","api_title") VALUES ('71277a741e0a47a4b9200fad348915a0',5,'procedures','correct_biz_data_after_import','kesplus_workflow',NULL,NULL,'[{"paramId": "paramId-0", "dataType": "jsonb", "required": 1, "paramName": "params", "paramType": "IN"}]','${appId}','aa428946184940fd91ed903e6791b095','4','create or replace procedure "kesplus_workflow"."correct_biz_data_after_import"(params jsonb)  as
/**
 * @Description 用来导入数据后进行数据修正,名称固定
 * @Param params
 *
 */
declare

begin

end;',sysdate,NULL,0,NULL,NULL,NULL,NULL,'NONE','0',1,NULL,NULL,NULL,'${currentUserId}','obj',NULL,NULL);