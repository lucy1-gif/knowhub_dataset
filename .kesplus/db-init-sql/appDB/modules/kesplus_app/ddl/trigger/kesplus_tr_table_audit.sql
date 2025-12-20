CREATE OR REPLACE FUNCTION kesplus_app.kesplus_tr_table_audit()
 RETURNS trigger
AS 
DECLARE
	v_req_id varchar;
	v_cache_data jsonb;
	v_cache_array jsonb := jsonb_build_array();
BEGIN
	v_req_id := "kesplus_platform".CACHE.get_request() #>> ARRAY['requestHeader', 'options', 'requestId'];
    kesplus_platform.setting('audit.flag',true);
	v_cache_data := jsonb_build_object('table_name',TG_TABLE_NAME,
									   'operation_type',TG_OP,
									 	'old_values',OLD,
									 	'new_values',NEW,
									 	'create_time',SYSDATE);
	IF v_req_id IS NOT NULL THEN
		v_cache_array := NVL(kesplus_platform.setting(v_req_id),jsonb_build_array());
		kesplus_platform.setting(v_req_id,v_cache_array || v_cache_data);
	END IF;

	RETURN NULL;
EXCEPTION WHEN OTHERS THEN
	RAISE NOTICE '审计日志触发器运行错误';
	RETURN NULL;
END
;
