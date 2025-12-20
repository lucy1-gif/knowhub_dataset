INSERT INTO kesplus_base.kesplus_base_role (
	"id","name","code","description","global_flag","role_level","data_scope","classify","role_type","hidden_flag","db_role_code","enabled","create_by","create_time","update_by","update_time","tenant_id","module_id","dept_id","obj_type","parent_id","sort_num"
) VALUES (
	'dfb8894291c34ac28e3458bba277e0ff','系统管理',NULL,NULL,false,-1,NULL,2,1,false,NULL,1,'${currentUserId}',SYSDATE,NULL,NULL,'0','dfb8894291c34ac28e3458bba277e0ff',NULL,'dir','0', 1);
INSERT INTO kesplus_base.kesplus_base_role ("id","name","code","description","global_flag","role_level","data_scope","classify","role_type","hidden_flag","db_role_code","enabled","create_by","create_time","update_by","update_time","tenant_id","module_id","dept_id","obj_type","parent_id","sort_num") VALUES
    ('4fc4d87dcab3488cb3d7487a58928af3','开发管理角色','developmentRole','拥有开发的业务应用的所有功能数据权限',true,1,'0',2,2,false,'r:${appCode}:developmentRole',1,'${currentUserId}',SYSDATE,NULL,NULL,'0','dfb8894291c34ac28e3458bba277e0ff','0','obj','dfb8894291c34ac28e3458bba277e0ff',3);

