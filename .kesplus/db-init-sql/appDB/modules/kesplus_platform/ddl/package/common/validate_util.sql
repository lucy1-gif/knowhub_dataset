CREATE OR REPLACE PACKAGE "kesplus_platform"."validate_util" AUTHID CURRENT_USER AS
    /**
     * 判断是否为数字或英文字母
     */
    FUNCTION isCharDigit(str text) RETURNS boolean;
    /**
     * 判断是否为日期
     */
    function isDate(str text) returns boolean;
    /**
     * 判断是否为数字
     */
    function isDigit(str text) returns boolean;

    /**
     * 判断是否为json类型(数字类型处理有问题)
     */
    function isJson(str text) returns boolean;

    /**
     * 判断是否为time类型
     */
    function isTime(str text) returns boolean;

    /**
     * 判断是否为timestamp类型
     */
    function isTimestamp(str text) returns boolean;

    FUNCTION isCommonResult(res jsonb) RETURN boolean;
    /**
     * 密码规则校验
     * 必须包含字母和数字,至少一个大写字母、一个小写字母和一个特殊字符，长度至少包含8个字符，
     */
    function password_check(str text) return boolean;
    /**
     * 字符校验
     * 字母开头、不能全部为数字,不能有特殊字符
     */
    function text_check(str text) return boolean;

     /**
     * 判断手机号格式是否正确
     */
    function is_phone_number(str text) return boolean;

     /**
     * 判断邮箱格式是否正确
     */
    function is_email(str text) return boolean;

     /**
     * 检查输入数据是否为期待长度
     */
    function is_correct_length(input_data text,expected_length integer) return boolean;
end;


CREATE OR REPLACE PACKAGE BODY "kesplus_platform"."validate_util" AS WRAPPED
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
END;

