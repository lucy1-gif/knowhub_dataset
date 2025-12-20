CREATE OR REPLACE TRIGGER "${moduleSchema}"."kesplus_tr_module_policy_db" AFTER INSERT OR UPDATE OR DELETE ON "${moduleSchema}"."kesplus_module_policy_db" FOR EACH ROW
BEGIN
	IF TG_OP = 'insert' THEN
        INSERT INTO "kesplus_base"."kesplus_base_policy_db" (
            "id", "db_role_code", "schema_name", "table_name", "policy_id", "policy_name", "auth_type", "column_flag", "table_columns", "create_policy", "drop_policy", "grant_auth", "revoke_auth", "create_by", "create_time", "update_by", "update_time", "dept_id", "module_id", "tenant_id"
        ) VALUES(
            new."id", new."db_role_code", new."schema_name", new."table_name", new."policy_id", new."policy_name", new."auth_type", new."column_flag", new."table_columns", new."create_policy", new."drop_policy", new."grant_auth", new."revoke_auth", new."create_by", new."create_time", new."update_by", new."update_time", new."dept_id", new."module_id", new."tenant_id"
        );
	ELSEIF TG_OP = 'update' THEN
		UPDATE "kesplus_base"."kesplus_base_policy_db"
        SET "db_role_code"=new."db_role_code", "schema_name"=new."schema_name", "table_name"=new."table_name", "policy_id"=new."policy_id", "policy_name"=new."policy_name", "auth_type"=new."auth_type", "column_flag"=new."column_flag", "table_columns"=new."table_columns", "create_policy"=new."create_policy", "drop_policy"=new."drop_policy", "grant_auth"=new."grant_auth", "revoke_auth"=new."revoke_auth", "update_by"=new."update_by", "update_time"=new."update_time"
        WHERE "id"=old."id";
	ELSE   --delete
		DELETE FROM "kesplus_base"."kesplus_base_policy_db" WHERE "id"=OLD.id;
	END IF;

END;