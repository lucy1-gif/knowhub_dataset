CREATE OR REPLACE TRIGGER "kesplus_base"."kesplus_tr_role_cache_user" AFTER UPDATE OR DELETE OR INSERT ON "kesplus_base"."kesplus_base_role" FOR EACH ROW
BEGIN
    delete FROM "kesplus_platform"."kesplus_sys_cache" where "cache_type" = 'USER' and "cache_key" like OLD.id || '%' and OLD.id in (
        select "user_id" from "kesplus_base"."kesplus_user_role" where "role_id" = OLD.id
    );
END;