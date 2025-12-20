DROP TABLE IF EXISTS "kesplus_app"."kes_ldap";

CREATE TABLE "kesplus_app"."kes_ldap" (
    "id" character varying(32 char) NOT NULL,
	"urls" character varying(512 char) NULL,
	"user_dn" character varying(128 char) NULL,
	"base" character varying(128 char) NULL,
	"password" character varying(128 char) NULL,
	"create_time" date NULL,
	"create_by" character varying(128 char) NULL,
	"enabled" integer NULL DEFAULT 1,
	CONSTRAINT "pk_app_ldap" PRIMARY KEY (id)
);

-- Column comments

COMMENT ON COLUMN "kesplus_app"."kes_ldap"."id" IS 'id';
COMMENT ON COLUMN "kesplus_app"."kes_ldap"."urls" IS '服务地址';
COMMENT ON COLUMN "kesplus_app"."kes_ldap"."user_dn" IS '用户';
COMMENT ON COLUMN "kesplus_app"."kes_ldap"."base" IS 'base';
COMMENT ON COLUMN "kesplus_app"."kes_ldap"."password" IS '密码';
COMMENT ON COLUMN "kesplus_app"."kes_ldap"."enabled" IS '是否启用 0否 1是';