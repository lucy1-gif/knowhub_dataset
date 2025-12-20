CREATE OR REPLACE PACKAGE "kesplus_base"."kesplus_pkg_serial_numbers" AUTHID CURRENT_USER AS
    /**
     * @Description 添加序列号
     * @param jsonData 序列号数据
     * @Return 序列号详情
     */
    function add(jsonData text) return json;
    /**
     * @Description 删除序列号
     * @param ids 序列号id 逗号分隔
     * @Return null
     */
    function del(ids varchar) return json;
    /**
     * @Description 更新序列号
     * @param jsonData 序列号数据
     * @Return 序列号详情
     */
    function update(jsonData text) return json;
    /**
     * @Description 查询详情
     * @param id_ 序列号id
     * @Return 序列号详情
     */
    function get_by_id(id_ varchar) return json;
    /**
     * @Description 查询序列号列表
     * @param jsonData 过滤条件
     * @Return 序列号列表
     */
    function list(jsonData text) return json;
    /**
     * @Description 查询序列号分页列表
     * @param jsonData 过滤条件
     * @Return 序列号列表
     */
    function page(jsonData text) return json;
    /**
     * @Description 根据code获取制定模板的流水号
     * @param code VARCHAR 模板code
     * @Return json
     */
    function generate_serial_number(_code VARCHAR) RETURNS json;
    /**
     * @Description 根据code获取制定模板的流水号
     * @param code VARCHAR 模板code
     * @Return 字符串
     */
    function generate(_code VARCHAR) RETURNS text;
    TB_NAME VARCHAR := 'kesplus_serial_numbers';
    PK_COLUMN_NAME VARCHAR := 'id';
    CONDITIONS json := '[{"blurry":"code","queryType":"like","keyName":"code"},{"blurry":"name","queryType":"like","keyName":"name"}]'::json;
end;

CREATE OR REPLACE PACKAGE BODY "kesplus_base"."kesplus_pkg_serial_numbers" AS WRAPPED
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
END;

