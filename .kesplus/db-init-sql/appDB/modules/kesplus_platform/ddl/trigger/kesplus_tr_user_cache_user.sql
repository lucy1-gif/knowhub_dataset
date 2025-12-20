CREATE OR REPLACE TRIGGER "kesplus_platform"."kesplus_tr_user_cache" AFTER UPDATE OR DELETE ON "kesplus_platform"."kes_sys_user" FOR EACH ROW
BEGIN
    delete FROM "kesplus_platform"."kesplus_sys_cache" where "cache_type" = 'USER' and "cache_key" like OLD.id || '%';
END;