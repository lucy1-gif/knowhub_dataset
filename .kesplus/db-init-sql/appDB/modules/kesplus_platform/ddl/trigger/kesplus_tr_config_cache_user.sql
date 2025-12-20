CREATE OR REPLACE TRIGGER "kesplus_platform"."kesplus_tr_config_cache_user" AFTER UPDATE OR DELETE OR INSERT ON "kesplus_platform"."kesplus_sys_config" FOR EACH ROW
BEGIN
    delete FROM "kesplus_platform"."kesplus_sys_cache" where "cache_type" = 'USER';
END;