CREATE OR REPLACE TRIGGER "kesplus_base"."kesplus_tr_user_dept_cache_user" AFTER UPDATE OR DELETE OR INSERT ON "kesplus_base"."kesplus_user_dept" FOR EACH ROW
BEGIN
    delete FROM "kesplus_platform"."kesplus_sys_cache" where "cache_type" = 'USER' and "cache_key" like OLD.user_id || '%';
END;