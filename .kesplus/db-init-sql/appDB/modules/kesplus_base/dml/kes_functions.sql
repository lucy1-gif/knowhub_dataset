INSERT INTO kesplus_base.kes_functions ("id","category","directory_code","name","schema_name","return_type","owner_name","parameters","app_id","module_id","parent_id","content","create_time","update_time","is_rest","api_directory_id","method","module_path","api_path","return_value_type","tenant_id","auth_status","role_ids","remark","update_by","create_by","obj_type","sort_num","api_title") VALUES ('71277a741e0a47a4b9cc0fad348915a0',5,'procedures','correct_biz_data_after_import','kesplus_base',NULL,NULL,'[{"paramId": "paramId-0", "dataType": "jsonb", "required": 1, "paramName": "params", "paramType": "IN"}]','${appId}','dfb8894291c34ac28e3458bba277e0ff','4',
'CREATE OR REPLACE PROCEDURE kesplus_base.correct_biz_data_after_import(params jsonb)
AS
/**
 * 用来导入数据后进行数据修正,名称固定
 */
DECLARE
	v_source_app_code varchar;
	v_app_code varchar;
	v_app_id varchar;
	v_reg varchar;
	v_replacement varchar;
	v_current_user_id varchar;
	v_tenant_id varchar;
BEGIN
    SELECT ka."id", ka."code" INTO v_app_id, v_app_code FROM "kesplus_platform"."kes_application" ka LIMIT 1;
    v_source_app_code := params->>''sourceAppCode'';
    v_current_user_id := params->>''currentUserId'';
    v_tenant_id := ''0'';
    v_reg := FORMAT(''(:%s:)|(:\$\{appCode\}:)'', v_source_app_code);
    v_replacement := FORMAT('':%s:'', v_app_code);

	UPDATE kesplus_base."kesplus_base_role" t SET t."db_role_code" = regexp_replace(t."db_role_code", v_reg, v_replacement), t."create_by" = v_current_user_id, t.create_time=sysdate, t.tenant_id = v_tenant_id WHERE 1=1;
	UPDATE kesplus_base."kesplus_base_policy" t SET t."db_role_code" = regexp_replace(t."db_role_code", v_reg, v_replacement), t."create_by" = v_current_user_id, t.create_time=sysdate WHERE 1=1;

    UPDATE kesplus_base."kesplus_base_policy_db" t
		SET t."db_role_code" = regexp_replace(t."db_role_code", v_reg, v_replacement)
		, t."create_policy" = regexp_replace(t."create_policy", v_reg, v_replacement)
		, t."grant_auth" = regexp_replace(t."grant_auth", v_reg, v_replacement)
		, t."revoke_auth" = regexp_replace(t."revoke_auth", v_reg, v_replacement)
		, t."create_by" = v_current_user_id
		, t.create_time=SYSDATE
		, t.tenant_id = v_tenant_id
	WHERE 1=1;

	UPDATE kesplus_base."kesplus_base_menu" t SET t."create_by" = v_current_user_id, t.create_time=sysdate WHERE 1=1;
	UPDATE kesplus_base."kesplus_base_permission" t SET t."create_by" = v_current_user_id, t.create_time=sysdate WHERE 1=1;
	UPDATE kesplus_base."kesplus_base_role_permission" t SET t."create_by" = v_current_user_id, t.create_time=sysdate WHERE 1=1;
	UPDATE kesplus_base."kesplus_base_role_policy" t SET t."create_by" = v_current_user_id, t.create_time=sysdate WHERE 1=1;

	UPDATE kesplus_app."kesplus_sys_restful_permission" t SET t."create_by" = v_current_user_id, t.create_time=sysdate, t.tenant_id = v_tenant_id WHERE 1=1;
	UPDATE kesplus_app."kesplus_sys_restful" t SET t."create_by" = v_current_user_id, t.create_time=sysdate, t.app_id = v_app_id, t.tenant_id = v_tenant_id WHERE 1=1;

END correct_biz_data_after_import;'
,sysdate,NULL,0,NULL,NULL,NULL,NULL,'NONE','0',1,NULL,NULL,NULL,'${currentUserId}','obj',NULL,NULL);