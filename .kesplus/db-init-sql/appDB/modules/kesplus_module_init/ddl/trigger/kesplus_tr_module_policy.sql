CREATE OR REPLACE TRIGGER "${moduleSchema}"."kesplus_tr_module_policy" AFTER INSERT OR UPDATE OR DELETE ON "${moduleSchema}"."kesplus_module_policy" FOR EACH ROW
DECLARE
    parent_id_ text;
    top_id_ text;
BEGIN
    select id into top_id_ from kesplus_app."kes_app_directory" where "directory_code" = 'policys';
    IF NEW."parent_id" = top_id_ THEN
            parent_id_ := NEW."module_id";
    ELSE
            parent_id_ := NEW."parent_id";
    END IF;
	IF TG_OP = 'insert' THEN
        INSERT INTO "kesplus_base"."kesplus_base_policy"(
            "id", "code", "name", "description", "db_role_code", "enabled", "params", "tables", "create_by", "create_time", "update_by", "update_time", "dept_id", "module_id", "tenant_id", "parent_id", "obj_type", "sort_num"
        )VALUES(
            new."id", new."code", new."name", new."description", new."db_role_code", new."enabled", new."params", new."tables", new."create_by", new."create_time", new."update_by", new."update_time", new."dept_id", new."module_id", new."tenant_id", parent_id_, new."obj_type", new."sort_num"
        );
	ELSEIF TG_OP = 'update' THEN
		UPDATE "kesplus_base"."kesplus_base_policy"
        SET "code"=new."code", "name"=new."name", "description"=new."description", "db_role_code"=new."db_role_code", "enabled"=new."enabled", "params"=new."params", "tables"=new."tables", "create_by"=new."create_by", "create_time"=new."create_time", "update_by"=new."update_by", "update_time"=new."update_time", "dept_id"=new."dept_id", "module_id"=new."module_id", "tenant_id"=new."tenant_id", "parent_id"=parent_id_, "obj_type"=new."obj_type", "sort_num"=new."sort_num"
        WHERE "id"=old."id";
	ELSE   --delete
		DELETE FROM "kesplus_base"."kesplus_base_policy" WHERE "id"=OLD.id;
	END IF;

END;