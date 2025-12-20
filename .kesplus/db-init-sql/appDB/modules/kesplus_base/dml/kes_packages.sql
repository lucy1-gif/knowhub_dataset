INSERT INTO kesplus_base.kes_packages ("id","parent_id","module_id","app_id","schema_name","authid_name","name","header_content","body_content","type","remark","create_time","update_time","update_by","create_by","tenant_id","obj_type","sort_num") VALUES
	 ('a2eb1ca1615048ac876e3577ebf9ef2d','5','dfb8894291c34ac28e3458bba277e0ff','e32e248da25c448ab9eff93c7a74025a','kesplus_base','current_user','kesplus_pkg_dept','CREATE OR REPLACE PACKAGE "kesplus_base"."kesplus_pkg_dept" AUTHID CURRENT_USER AS
	 /**
     * @Description 组织新增
     * @param jsonData 组织信息
     * @Return 组织详情
     */
	FUNCTION add(jsonData text) return JSON;
    /**
    * @Description 组织删除
    * @param id 组织id
    */
    PROCEDURE delete(id varchar);
    /**
     * @Description 更新组织信息
     * @param jsonData 组织信息
     * @Return 组织详情
     */
    FUNCTION update(jsonData text) return JSON;
    /**
     * @Description 根据id更新组织信息
     * @param jsonData 组织信息
     * @Return 组织详情
     */
	FUNCTION get_by_id(id varchar) RETURN JSON;
	/**
     * @Description 修改组织上级组织
     * @param newPid 新父级id
     * @param id 组织id
     * @Return boolean
     */
	FUNCTION move_dept(newPid varchar, id varchar) RETURN boolean;
	/**
     * @Description 组织关联用户
     * @param uid 用户id
     * @param id 组织id
     * @Return boolean
     */
	FUNCTION add_dept_user(id varchar, uid varchar) RETURN boolean;
	/**
	 * 获取组织
	 * 若deptName有值,则筛选整个树,
	 * 否则,为懒加载,即,获取当前pid的子组织
	 */
	FUNCTION tree_dept_lazy(pid varchar, deptName varchar) RETURN JSON;
	/**
     * @Description 通过组织名称筛选,或者组织树
     * @param enabled 状态
     * @param deptName 组织名称
     * @Return 组织详情
     */
	FUNCTION get_dept_by_name(enabled varchar, deptName varchar) RETURN JSON;
    /**
     * @Description 获取当前关联组织
     * @param id 状态
     * @param deptName 组织名称
     * @param enabled 状态
     * @Return 组织树形列表
     */
	FUNCTION tree_current_cascade_dept(id text, deptName text, enabled int) RETURN JSON;
    /**
     * @Description 获取树形列表
     * @param ids 组织id 多个 逗号分隔
     * @param id 组织id
     * @Return 组织树形列表
     */
	FUNCTION tree_part(id text, ids TEXT[]) RETURN JSON;
	/**
     * @Description 获取当前父级id的子组织,可以通过状态筛选
     * @param enabled 状态
     * @param id 组织id
     * @Return 组织列表
     */
	FUNCTION list_current_children (id varchar, enabled varchar) RETURN JSON;
	/**
     * @Description 修改组织状态,启用/停用
     * @param enabled 状态
     * @param id 组织id
     * @Return boolean
     */
	FUNCTION change_dept_enabled(id varchar, enabled int) RETURN boolean;
	/**
     * @Description 获取组织详细信息
     * @param deptId 组织id
     * @Return 详细信息
     */
	FUNCTION get_company(deptId varchar) RETURN JSON;
	/**
     * @Description LDAP导入逻辑
     * @param jsonData 导入数据
     * @Return 导入计数
     */
	FUNCTION batch_insert_dept(jsonData text) return json;
   	FUNCTION tree_charge_dept_by_user_id (v_user_id varchar) RETURN JSONB;
   	FUNCTION list_dept_root_by_manager (managerUserId varchar) RETURNS varchar[];
END;','CREATE OR REPLACE PACKAGE BODY "kesplus_base"."kesplus_pkg_dept" AS WRAPPED
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
ynXUd1Kdzy8ocX7+dhuZhIiqd4dfhQuhNqA+CEwESZ+8mLwS1ml1C8YG8hux
6JpuA4d6v2/tSDdN/N0DSUOuuLkbN+LCzhmZBjqKqi7o6+m8rsSrOXVgJEBs
dO3Wj1v6oAkp2mmbklsOSZLBGhgXBMaBKOUqj/hAAyumAD3VETFjgSTk/nGv
xjR0C9qJIZXOAnS9f00Nf2RzB+h95p8SAvEBZlb/JIIGgzvUWRCuYsRWbLmY
U97LxGAIo7ZbKaitiI/T9hLjl38yaVdp2471vj8pHELt87K4nkziR6EKaAe9
hl/i/2+xAnp34i0k1/6GTjSFtG7nDEuATWlrVe+Clcn2xGGWt+ghXvzkbC2D
5SheAdq8j10WR/3Wu0bhrqmbmdZbJpWjFXqlY62Zpwc9gKdY0cQRqXY0ThMs
pTyefNl1xLao+ulJKgJq7PfMXgksMD9S2tIaNp6n3k7tmKMImVZs/Xr0Mn8w
R1vPQJZbr4mxuBenmskWbK/z1lZwPRHOlAyYjYb70mtupKZ32UOBGfT8tIgB
cpORv2vKL0F/lSd8VFltfqgU6sEdG1qAjSyE43XTZsDh+5GuzaxNgycrx4oh
QpVn6ILfWqvyhY0eOGe58T3NWdVlDV+BaOIADf1MdPGDqcf+vbTN4fAl4fU4
PZX+oggXBv7g4uZI2tRlwWo5SrGO+1zjzVSy86x2MHENblYEs2Cx+zi+DUNZ
54jcPXxUWW1+qBTqwR0bWoCNLIT7muosLacrVJ+Mxz5ctHncOH8su8FNqOcP
qclYNDsn+XkOIZRoOlQsj++1hKrbJVNAxBq6hiGo4jQTe5fO9ju6hhGeWBrC
fqKgDPCgQv45lkOUGZ9P9gaAZoC1VD/IYwkEs8EF5JLvU8HnejfgXThAEUTM
P7jnbWnZw1c+PCMzjI28O2E1QPH9T7eRKgZ6SjpbL8BWT59t/Pg7TtwhTjcp
g4Ya2zLrkw/8ipeiXRSSZsXO2/4iXSMzbbLVH97V5dU3Vf0StvZltrM8ezTK
J956h8suY/XXhpA38mRsbwBKTZaq5VJFlhP99z0UpihqoGz4kiwzPpxo8UDy
KuVx1HtHRJUmQOeC92cfWAemS4PfbHb1gEbetPeeQejLWeQ2Zqwk0Ecg5hrc
HP2yxHIgiwiGMCWjBcX0IQw9387xPGCFG0xLl/H2LGSY8epaQr2/n6H2X3BT
869IHG88+vjzmpWyKoi7erkNmd6oLgPU5EtFSk586yOkSOFeP5mYiw2TT/tn
KKMLq5Kc30cKCayG6/Dx4bSFddvSNLx0zl1WTD05AhSGoDMFpatpUqTkFpqK
Gu529YBG3rT3nkHoy1nkNmasRwmhV3N1C5bM+RF3zzG3j47wcrHmOOvEIVla
hw5P+N9VyqzA2inIYZklYqSTHAWvja6FIgvmh1hHZURk8ELRlQR+xCxZPF5e
LgE9yUWE/MCuI2LsaoAmT0ruj7BON3QN0TpLoJjyMCvPqozqaoNHsY+HnuKI
oCqit9Hcsv5Q6qdcUBmZXHU0AyevwTFrC9RNBQm1hWRNinQL8IYiYjVQcG5z
PTa62lFFtulHyTaOAzHKAbaGgNd3u92GCIYZthO/58iGKs/Id2PCCKjh7Bhw
7o2uhSIL5odYR2VEZPBC0ZVbLHvArSQI/M3kwTQ12MX6riNi7GqAJk9K7o+w
Tjd0DdE6S6CY8jArz6qM6mqDR7GPh57iiKAqorfR3LL+UOqnX0NSXrE82ttF
bLWvOz89xU/8zHQ4YSSSoKPYsJlbpf2JVREQ6WrRJeJs3EWvM05hbnqwxagX
O/z9D9hHIbCouaMPGYhSgMJTExFy7bsDjptvUHSbTbgmwzGo9CezPvHKXFAZ
mVx1NAMnr8ExawvUTYDb4GogHBIGcesO2pHUjFeLXV+AoksgymUqbWTgoLfe
YYkh5NlC/hpUjUD0E8vkEyLlwyEPAMq75T3mg0nXVA0eTEZn/y2z+a40xRoH
x+xDDFAOX/NvRo0nTJGYHbk02RN9/JVJbNMleiaiRHfzXVJDoraowIG4ncN1
UYjcRumBXG4X0qeqZ0px/j1lpU8yJUTQRL5ej9eyPOkI1H5XOLhDlBmfT/YG
gGaAtVQ/yGMJNLuICVxWTfKwJchk0ZlSi/M7u7Br6BLaO3lB1I2fAICSmXql
yMKaKONzR4u/BEOCPORWlFx3CsJMJRqSFIOFE6tk03vLAfsjTQdr0OjbSmhf
0wyxTw2m+q/8hhlf4u2vADQHw6ZuyQ3YMQOVn6BAglRg9hKU9QgUa0KfNjlt
GdGECwTxHDRtY8gOYXVWTvuAKL4e9EcvR27vXgxKpTWdytItgkxQjJOpQ5Hm
knwOiXwAAAAAAAAAAAAAAAAAAAAA
END;','package',NULL,SYSDATE,SYSDATE,NULL,'546508b9842c4e3698a1f2d3ae6fa917','0','obj',1),
	 ('125bcaea3bac47f7a2189bbb69137fed','5','dfb8894291c34ac28e3458bba277e0ff','e32e248da25c448ab9eff93c7a74025a','kesplus_base','current_user','kesplus_pkg_dictionary','CREATE OR REPLACE PACKAGE "kesplus_base"."kesplus_pkg_dictionary" AUTHID CURRENT_USER AS
	/**
     * @Description 添加字典
     * @param jsonData 字典信息
     * @Return 字典详情
     */
	FUNCTION add(jsonData text) RETURN JSON;
	/**
     * @Description 批量添加
     * @param jsonData 字典信息
     * @Return null
     */
	FUNCTION add_batch(jsonData text) RETURN JSON;
	/**
     * @Description 更新字典
     * @param jsonData 字典信息
     * @Return 字典详情
     */
	FUNCTION update(jsonData text)RETURN JSON;
    /**
     * @Description 删除字典-批量
     * @param ids 字典id 逗号分隔
     * @Return boolean
     */
    FUNCTION delete(ids varchar) RETURN boolean;
	/**
     * @Description 删除字典
     * @param ids 字典id
     */
	PROCEDURE del(id varchar);
    /**
     * @Description 唯一检查
     */
	FUNCTION check_form_unique(id varchar, pid varchar, name varchar, code varchar) RETURN boolean;
	/**
     * @Description 查询字典详情
     * @param id 字典id
     * @Return 字典详情
     */
	FUNCTION get_dictionary(id varchar) RETURN JSON;
    /**
     * @Description 查询字典详情
     * @param id 字典id
     * @Return 字典详情
     */
	FUNCTION get_by_id(id varchar) RETURN JSON;
    /**
     * @Description 查询字典详情 -根据code查询
     * @param id 字典id
     * @Return 字典详情
     */
	FUNCTION get_by_code(code varchar) RETURN JSON;
	/**
     * @Description 添加字典值
     * @param jsonData 字典信息
     * @Return 字典详情
     */
	FUNCTION add_val(jsonData text) RETURN JSON;
	/**
     * @Description 更新字典值
     * @param jsonData 字典信息
     * @Return 字典详情
     */
	FUNCTION update_val(jsonData text)RETURN JSON;
	/**
     * @Description 删除字典所有值
     * @param dictionaryId 根节点id
     * @Return boolean
     */
	FUNCTION delete_val_by_dictionary(dictionaryId varchar) RETURN boolean;
    /**
     * @Description 查询字典值
     * @param id 字典id
     * @Return 字典值
     */
	FUNCTION get_val_by_id(id varchar) RETURN JSON;
	/**
     * @Description 获取字典值详细情况
     * @param id 字典id
     * @Return 字典值详细情况
     */
	FUNCTION get_dictionary_val(id varchar) RETURN JSON;
    /**
     * @Description 获取字典
     * @param code 字典编码
     * @param val 字典值
     * @Return 字典详情
     */
	FUNCTION get_one_by_val(code varchar, val varchar) RETURN JSON;
	/**
     * @Description 根据字典编号和值获取描述
     * @param code 字典编码
     * @param val 字典值
     * @Return 字典描述
     */
	FUNCTION get_name_by_val(code varchar, val varchar) RETURN varchar;
	/**
     * @Description 根据字典编号和值获取完整描述
     * @param code 字典编码
     * @param val 字典值
     * @Return 字典完整描述
     */
	FUNCTION get_fullname_by_val(code varchar, val varchar) RETURN varchar;
	/**
     * @Description 根据字典编号和值获取描述数组
     * @param code 字典编码
     * @param val 字典值
     * @Return 字典描述数组
     */
	FUNCTION get_names_by_val(code varchar, val varchar) RETURN varchar[];
	/**
     * @Description 根据字典编号、描述、上级值获取当前值
     * @param code 字典编码
     * @param name 字典名称
     * @param parentVal 上级字典值
     * @Return 字典描述
     */
	FUNCTION get_val_by_name(code varchar, name varchar, parentVal varchar) RETURN varchar;
	/**
     * @Description 根据编号和上级值获取值集
     * @param code 字典编码
     * @param filters 过滤数据
     * @param parentVal 上级字典值
     * @Return 字典列表
     */
	FUNCTION list_by_parent_val(code varchar, parentVal varchar, filters JSON) RETURN JSON;
    /**
     * @Description 根据根节点id和上级值获取值集
     * @param dictionaryId 字典根节点id
     * @param filters 过滤数据
     * @param parentId 上级字典id
     * @Return 字典列表
     */
	FUNCTION list_by_parent(dictionaryId varchar, parentId varchar, filters JSON) RETURN JSON;
    /**
     * @Description 查询字典树形列表
     * @param dictionaryId 字典根节点id
     * @param filters 过滤数据
     * @param parentId 上级字典id
     * @param maxLevel 最大层级
     * @Return 字典树形列表
     */
	FUNCTION tree_by_parent(dictionaryId varchar, parentId varchar, maxLevel int, filters JSON) RETURN JSON;
	/**
     * @Description 树状查询字典值集
     * @param code 字典编码
     * @param filters 过滤数据
     * @Return 字典树形列表
     */
	FUNCTION tree_by_code(code varchar, filters JSON) RETURN JSON;
	/**
     * @Description 分页查询字典-树形
     * @param page 当前页
     * @param size 每页大小
     * @param blurry 过滤内容
     * @Return 字典树形列表
     */
	FUNCTION page_for_tree(page int, size int, blurry varchar) RETURN JSON;
	/**
     * @Description 分页查询字典
     * @param jsonData 查询数据
     * @Return 字典分页数据
     */
	FUNCTION page_dictionary(jsonData text) RETURN JSON;
    /**
     * @Description 字典唯一校验
     */
	PROCEDURE check_unique(beanObj JSON, TYPE_ int DEFAULT 0);
    /**
     * @Description 字典值唯一校验
     */
	PROCEDURE check_unique_val(beanObj JSON, TYPE_ int DEFAULT 0);
	/**
     * @Description 字典搜索树
     * @param jsonData 查询数据
     * @Return 字典树形列表
     */
	FUNCTION search_tree(jsonData text) RETURN JSON;
    /**
     * @Description 节点构造函数
     * @param jsonArray 总数据
     * @param pid 父级节点id
     * @param returnJson 组装后数据
     * @Return 字典树形列表
     */
	FUNCTION loop_node(jsonArray JSON,pid varchar,returnJson json) RETURN JSON;
    /**
     * @Description 根据字典编码以键值对的形式获取字典子集数据的值和名称
     * @param code 字典编码
     * @Return {值：名称}
     */
	FUNCTION get_val_name_pairs(code$ varchar) RETURN JSON;
	FUNCTION tree_by_path(id varchar) RETURN jsonb;
	FUNCTION list_by_codes(jsonData json) RETURN jsonb;
	FUNCTION get_dictionary_code() return jsonb;
    _SCHEMA_NAME constant text := ''kesplus_base'';
    _TABLE_NAME constant text := ''kesplus_dictionary'';
    _PK_COLUMN constant text := ''id'';
END;','CREATE OR REPLACE PACKAGE BODY "kesplus_base"."kesplus_pkg_dictionary" AS WRAPPED
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
2UIGO3fNwlb+BYaghthge6YpTpMqQ6mSjOubEVxlfNmMWH7GIuUQJYUMfe5t
jlxLMTkGDTD4uuKPCFWsxcIwSaD15azC8vLpfuXEsb+AzlmZ8Lnu51vBe5wD
nnkzNmDYynCrTcCn8VDVCTfe7QBf71IXvefkk7NOyoswLQlUbw1xUEhbHoj1
ouiPjPc0kiqMyFtvcvjysVc+mSgeRXFoHHbL4AW6F1uoPHzo+ali5E98P7oX
vRQ/aEgQUikfQd79/G8irFhdWHsGn977pxf0pS3Pod7YLcxVNXchW+HMV9oH
NE1lrHAB0kqZjdz3LWVskAf0IFA2E1FMMBxpuMnvsjsJvTwyJEFvVAnjs/ke
dnyX+oLRC2TZzRi5Gl/kdwp1n2IrO/bYG+7WGpZh+eA+LZf+a4CdRAIvLk5s
ykD2rOItAX5liwq/QFxL/QB8SuuO0ee86d73XPyqo+y+dHvCGyf/y0GRuTuz
0/OmSrIEcavTNtLlil5+BhctSupKuPeUUm8cGQje/dEbdTzAmhc72TegTxo0
IaWC9W6f1JBuKq0Pt3GDwJ0v58qqRgi7l8PtGymW21kH2mBrXK81PSPYqgjk
cD8xbmOlwBG8sheCwsvYH+dxI+nzSB8VZvq+s68gj8m78TiTtyjgdx/q6DhR
5zVhJZOx3y+D0xgzFfbZq4/k7gGWT7x42FIvSPkuD/vkZZ7wYjm/b9HFL+UD
IL3i5OY/lyCeKn9LJZxQw32Tdi0czY/V9pW756iqdPwv8C7tp8ixrrElCWPO
uN1gbiARVAW0GwlpSvG1M7WZ6mFwYNMfjGun6+7ITE4A39saKlHvFUWUkO9I
GYoKtz9RpK0+dFZ8jtUx5wycUTpXsCGQffutFeiwu165nxEz8Og36JPbLPxQ
Kw+hieUaE/hnMNRUNuaqoW34nhJ6tlI4KypmZMxMm1X23LT77w8spnPyKH82
yVJ6cIqm1PUikIzcpMTezcb2AAueusNGTAICoxFbSN+IyIhYWue89yOUOjrL
y+P8r+mXu1MX3/zbwDpHNoC7NxlZyGLdhQN5ETPw6Dfok9ss/FArD6GJ5W+C
2EJtf2fkhQN1HBkJ82tt2yTHmp7tTj2tg+boBMzv1nivEvydiy9sGTjhyrZC
QeyqKgFbu2TBAL8EB/55b7EO5/bXaH6uRcyanx/CeK690pXPp+oHvyOCRgRl
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
PgahoBZMzxB1kg==
END;','package',NULL,SYSDATE,SYSDATE,NULL,'546508b9842c4e3698a1f2d3ae6fa917','0','obj',2),
	 ('1e3eed789be44c0099ac62511bd8cf54','5','dfb8894291c34ac28e3458bba277e0ff','e32e248da25c448ab9eff93c7a74025a','kesplus_base','current_user','kesplus_pkg_execution','CREATE OR REPLACE PACKAGE "kesplus_base"."kesplus_pkg_execution" AUTHID CURRENT_USER AS
    /**
     * @Description 创建快照
     * @param code 编码
     * @Return boolean
     */
	FUNCTION create_snapshot(code text) RETURN boolean;
    /**
     * @Description 删除快照
     * @param id 快照id
     * @Return boolean
     */
	FUNCTION delete_snapshot(id text) RETURN boolean;
    /**
     * @Description 快照分页数据
     * @param pageIndex 页数
     * @param pageSize 每页数量
     * @param code 快照code
     * @param flag 标识
     * @param snapshotId 快照id
     * @param queryType 查询类型
     * @param startTime 开始时间
     * @param endTime 结束时间
     * @Return 快照列表数据
     */
	FUNCTION page_snapshots(pageIndex int, pageSize int, code text, flag boolean, snapshotId text, queryType int, startTime text, endTime text) RETURN JSONb;
    /**
     * @Description SQL分析
     * @param snapshotId1 快照1
     * @param snapshotId2 快照2
     * @param moduleId 模块id
     * @param threshold 标识
     * @param limitSize 大小
     * @Return 分析数据列表
     */
	FUNCTION analysis_sql_execution(snapshotId1 text, snapshotId2 text, moduleId text, threshold int, limitSize int) RETURN JSONb;
	_MAX_DEEP_LEVEL INT := 99;
	_MAX_NODE_SIZE INT := 10;
	_SCHEMA_NAME varchar := ''kesplus_base'';
	_TB_SNAPSHOT VARCHAR := ''kesplus_snapshot'';
	_TB_EXECUTION VARCHAR := ''kesplus_query_execution'';
END;','CREATE OR REPLACE PACKAGE BODY "kesplus_base"."kesplus_pkg_execution" AS WRAPPED
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
LlgLe5YCoUZgQQyLM86VCx+hvMbSk3ggLpF6SA==
END;','package',NULL,SYSDATE,SYSDATE,NULL,'546508b9842c4e3698a1f2d3ae6fa917','0','obj',3),
	 ('eb9bb7d995514c7fbd3d0c3fe5a30c5d','5','dfb8894291c34ac28e3458bba277e0ff','e32e248da25c448ab9eff93c7a74025a','kesplus_base','current_user','kesplus_pkg_job','CREATE OR REPLACE PACKAGE "kesplus_base"."kesplus_pkg_job" AUTHID CURRENT_USER AS
	/**
     * @Description 新增岗位
     * @param jsonData 岗位信息
     * @Return 岗位详情
     */
    FUNCTION add(jsonData TEXT) RETURN JSON;
    /**
     * @Description 删除岗位
     * @param id 岗位id
     * @Return boolean
     */
    FUNCTION delete(id varchar) RETURN boolean;
	/**
     * @Description 修改岗位
     * @param jsonData 岗位信息
     * @Return 岗位详情
     */
    FUNCTION update(jsonData TEXT) RETURN JSON;
	/**
     * @Description 批量删除岗位
     * @param ids 岗位id 逗号分隔
     * @Return boolean
     */
    FUNCTION delete_batch(ids varchar) RETURN boolean;
	/**
     * @Description 岗位详情
     * @param id 岗位id
     * @Return 岗位详情
     */
    FUNCTION get_job(id varchar) RETURN JSON;
    /**
     * @Description 岗位详情
     * @param id 岗位id
     * @Return 岗位详情
     */
	FUNCTION get_by_id(id varchar) RETURN JSON;
	/**
     * @Description 更改岗位状态
     * @param id 岗位id
     * @param enabled 岗位状态
     * @Return boolean
     */
	FUNCTION change_job_enabled(id varchar, enabled int) RETURN boolean;
	/**
     * @Description 列表查询岗位
     * @param ids 岗位id 逗号分隔
     * @param blurry 查询内容
     * @param jobType 岗位类型
     * @param enabled 岗位状态
     * @Return 岗位列表
     */
	FUNCTION list_job(ids varchar, blurry varchar, enabled varchar, jobType varchar) RETURN JSON;
	/**
     * @Description 分页查询岗位
     * @param page 当前页
     * @param size 每页个数
     * @param blurry 查询内容
     * @param jobType 工作类型
     * @param enabled 状态
     * @Return 岗位列表
     */
	FUNCTION page_job(page integer, SIZE integer, blurry varchar, enabled varchar, jobType varchar) RETURN JSON;
	/**
     * @Description 新增岗位分配
     * @param id 岗位id
     * @param userDeptIds 用户组织id
     * @Return boolean
     */
	FUNCTION add_relation(id varchar, userDeptIds varchar) RETURN boolean;
	/**
     * @Description 移除岗位关联
     * @param id 岗位id
     * @param userDeptIds 用户组织id
     * @Return boolean
     */
	FUNCTION remove_relation(id varchar, userDeptIds varchar) RETURN boolean;
	/**
     * @Description 修改岗位关联
     * @param id 岗位id
     * @param userDeptIds 用户组织id
     * @Return boolean
     */
	FUNCTION update_relation(id varchar, userDeptIds varchar) RETURN boolean;
	/**
     * @Description 修改岗位关联
     * @param ids 岗位id
     * @param deptId 组织id
     * @param userId 用户id
     * @Return boolean
     */
	FUNCTION update_relation_by_user(userId varchar, deptId varchar, ids varchar) RETURN boolean;
    /**
     * @Description 查询岗位列表-根据组织id
     * @param deptId 组织id
     * @Return 岗位列表
     */
    FUNCTION list_by_dept(deptId varchar) RETURN JSON;
    /**
     * @Description 查询岗位分页列表
     * @param page 当前页
     * @param size 每页个数
     * @param jobName 岗位名称
     * @param deptId 部门id
     * @Return 分页列表
     */
	FUNCTION page_job_by_dept(page integer, SIZE integer, jobName varchar, deptId varchar)RETURN JSON;
END;','CREATE OR REPLACE PACKAGE BODY "kesplus_base"."kesplus_pkg_job" AS WRAPPED
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
aPji29GLsd4MzsWsDcrhKohQSz0yGwB6rzaWWRKOburoxLj6KyCT/fOhlSCy
2rSNXyIwOvVnEHcKmX+KhU5woBOCIIHg7rry9dyWFXWuWdM5tKR/nlyul8a9
CdFQZgpPkS5QnJCtOywpZdTdxT22cMc3VUReFBth1wxsQoacjxFVyf/UJYQx
zxT9tyL801zeg5EsxVL/ziyEpxEBRSwATuyfBaiSJqgRm67pVNwXftcFJmqv
gfLgj9Wvmkh5SJphHVDiWJNvPVcykkliTA9ufidRdFKK7g6x9GL91PX4JHNn
EcNTt8YjtrVgmEpOFyConWQLQ0uXZ27WUJ+k44FnMxlxQ3asS2yi0cLrI9MM
FzcrD457RURSaA66TmGmwbNpX6tjR0ne2MheoKHcLl+N/A6FZZCRKU8sI9fJ
2qqaYUyJsT43Ldh0gzVLIMdRkdDUtVmguaYKlqIoK5EhSdha3aBHLsOR6s2S
vm/hq3ERS42Hx1PCb0I7YLwiiiT3cIIRaK1rvn1IpRkaSbMxZ64eqpA7jziI
jOK4mj88uVt5bn1kw6O8gVIh9mv2G2J2ZK28m7tjx0sJ2s9xgQE8rnkPSVQ7
Ojvd1oI2j7VKjvS/lvF5PSUYWR8UF2+nfKCeSfZtnbuIBDFTMA0jQmz+grRh
dS7px5PBbfS4T3eIx0fzhAYPxhw6CzhY/hVCE4wX3zxA/An3uvnqNUXiGSVR
3ihkoR7G/Ib4uq0XItGerNNNAiUirHoXUJcgqt+kLO9GVxfUoVfFAvcIP15l
0W7XE8VSpXODZTTMUrlvfIXRzsDkSdAseF8DLKQNcsix/vYSURfz2RmzBMwx
VxudFErIwZaYyQE6FCe79rfNVX3LUr0OrPLV9IcPOTLCqv2txSROeigkz6OV
rf9rz/Mn7YrG5QrqnHAyaEbNMqFMEWaTdiBGjx2vEQU8+3VqeTXY/ISmfECC
iC018kCnDBcWlOotZm18UzUou4H3xFU1QmILIUNXQvHLyKCWnSgi8uaFIxSm
Hs24YDRmgWkW7l3watjF4KG0cIY0p/Ublayta0qS+819ZJLdChPNfQGhGgdu
aUYG3QQv2llklRo2z0apV5c/oPIYPEkH+UM2VKXXfIj6xln7gcjUwivcxSgS
AiH4zeBOcIH2UzGlePfW0xgMQ8Y+KR9nkCM7LdhiQXHLMRUUf+xOHMoXhrTZ
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
TmMEau9AQb01pgrcdepvoK6x2CuS21LqqUQ=
END;','package',NULL,SYSDATE,SYSDATE,NULL,'546508b9842c4e3698a1f2d3ae6fa917','0','obj',4),
	 ('e21cad66701a449ea919040f330d417e','5','dfb8894291c34ac28e3458bba277e0ff','e32e248da25c448ab9eff93c7a74025a','kesplus_base','current_user','kesplus_pkg_menu','CREATE OR REPLACE PACKAGE "kesplus_base"."kesplus_pkg_menu" AUTHID CURRENT_USER AS
    /**
     * @Description 查询菜单详情
     * @param id 菜单id
     * @Return 菜单详情
     */
	FUNCTION get_by_id(id varchar) RETURN JSON;
	/**
     * @Description 修改菜单状态
     * @param id 菜单id
     * @param enabled 菜单状态值
     * @Return 菜单详情
     */
	FUNCTION change_menu_enabled(id varchar, enabled int) RETURN boolean;
	/**
     * @Description 查询当前用户菜单数据
     * @Return 菜单树形列表
     */
	FUNCTION tree_menus_by_owner() RETURN JSON;
END;','CREATE OR REPLACE PACKAGE BODY "kesplus_base"."kesplus_pkg_menu" AS WRAPPED
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
Di8zJ3tsxzQhpko=
END;','package',NULL,SYSDATE,SYSDATE,NULL,'546508b9842c4e3698a1f2d3ae6fa917','0','obj',5),
	 ('9edd0d534e1f4986aac68c650aa13a95','5','dfb8894291c34ac28e3458bba277e0ff','e32e248da25c448ab9eff93c7a74025a','kesplus_base','current_user','kesplus_pkg_permission','CREATE OR REPLACE PACKAGE "kesplus_base"."kesplus_pkg_permission" AUTHID CURRENT_USER AS
    /**
     * @Description 查询当前角色code数组
     * @Return 角色code数组
     */
	FUNCTION list_by_owner() RETURN text[];
    /**
     * @Description 查询权限树形数据
     * @Return 权限树形数据
     */
	FUNCTION tree_all() RETURN jsonb;
    /**
     * @Description 根据表单编号获取表单下表字段的权限
     * @param formCode 表单编号
     * @param authType 权限类型,支持''SELECT'', ''UPDATE'', ''INSERT'', ''DELETE'',默认为''SELECT''
     * @param TYPE 查询模式 0-黑名单模式,其它-白名单模式
     * @Return 权限树形数据
     */
	FUNCTION list_field_permission(formCode TEXT, authType TEXT, TYPE int) RETURN text[];
END;','CREATE OR REPLACE PACKAGE BODY "kesplus_base"."kesplus_pkg_permission" AS WRAPPED
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
END;','package',NULL,SYSDATE,SYSDATE,NULL,'546508b9842c4e3698a1f2d3ae6fa917','0','obj',6),
	 ('3e2926f76d9e4b8fa6e636db1cabf550','5','dfb8894291c34ac28e3458bba277e0ff','e32e248da25c448ab9eff93c7a74025a','kesplus_base','current_user','kesplus_pkg_policy','CREATE OR REPLACE PACKAGE "kesplus_base"."kesplus_pkg_policy" AUTHID CURRENT_USER AS
	/**
     * @Description 查询策略详情
     * @param id 策略id
     * @Return 策略详情
     */
	FUNCTION get(id TEXT) RETURN JSONB;
	/**
     * @Description 查询策略下级列表--懒加载
     * @param parentId 策略id
     * @param objType 节点类型
     * @Return 策略列表
     */
	FUNCTION list_children(parentId TEXT, objType TEXT) RETURN jsonb;
	/**
     * @Description 获取当前模块数据,tree状数据返回
     * @param moduleId 模块id
     * @Return 策略tree状数据
     */
	FUNCTION tree(moduleId TEXT) RETURN jsonb;
	/**
     * @Description 获取所有模块数据,tree状数据返回
     * @Return 策略tree状数据
     */
	FUNCTION tree_all() RETURN jsonb;
    /**
     * @Description 查询策略参数定义-分页数据
     * @param page 当前页
     * @param size 每页个数
     * @param blurry 查询内容
     * @Return 策略定义列表
     */
	FUNCTION page_policy_param_define(page integer, size integer, blurry text) RETURN JSONB;
    /**
     * @Description 保存策略参数定义
     * @param jsonData 策略信息
     * @Return 策略定义id
     */
	FUNCTION save_policy_param_define(jsonData text) RETURN jsonb;
END;','CREATE OR REPLACE PACKAGE BODY "kesplus_base"."kesplus_pkg_policy" AS WRAPPED
7VIHUwRQPn/cyviuph/+xPrmvk1iuB1TDds6Bh1dNquPkbWMDNFvglSnMPsv
W8lrktCLmUr+A/LQHWYN4O4Fbfy0DkrfkTTD1iPZDR3MTLDXwNihNn6Wk0yT
ao02G6fyoh/aaUzz69HzQUz/LvHHWMGO24dd/5KZzsmCV7JlczJaxrJvuNDo
9FazxC8hMbEux9IpW5rv89dhzVnDlz80guVaSUpShGcVC+IdDP28q31gRjGI
/Kjx6RQhJAduguJFB4fUIZjoxGxQyUOpx2mmG/3SFoHv6kiVr934SFAlCsIZ
0jRmWxQZnl4aYFNNkykcEqhL32na2zGQQY1yfTPAKrdDlQCHEsrdEjyKOPmz
1t+lXJ+2rQ1siqH2NiM49yF6gm4wZKggHEygLpq1QXb9YP/weE1ZTmpFZ040
KPfFF99ZpaeRvOyinsJjPuOkkkUyeL8Y3bc2ynb64fhlI9qsO+4UuRGDE5GT
gyrgMnV6AoROcitlyL7nNTOTVtTGQdsqiftobsb3dRPDjH9SGeITDwSdW5hs
oDyoN1wgS6lbshAb63Enl+DblHt33wnNCck3G13Nm5uvnZ5mSuAM3tEwSiuZ
ZJ9TTcT5T64mjJA+ndXc/6xi70846GFzDCraVIifJNr10GQ8HNgaKN9teOjo
jdHUoZORdvQg4oxPGY8iWI/7CqHH+Gh394i3rIGcFD27PwIrsjdLI480/6Zi
xn8Rl6ikDMGk8eDp4/W7GoIj04T9foIikk7Rr6F0LXzjYxb+R5QuRtn2mWgy
F/08IjF+CvIRtQdQvK27z/2xjVvBPL0iAJxkHFcYHRScBzyG/OM/jNZpeS6r
jUTk6Nyq/QE5IsHmK5/CdiHw7uvQjP52wQioN190olxMscEuEuPsluZwxDR2
If8Hd0iWuam5z+yr8bmz7B5iqBCLAWQlIkpqfcKu7f7a7Zas5W7jDfTwMT7z
w9gV1rECLlNPTd9yuc9OfA0XVNxJkugGK9lY/k3zbphzjBYq5n04xcss37T5
Rxd5C4RYmoJcuCRd8O8X+YtGY1SrkuToDvHo6EP/6+0WYLxZ6ToJXpOfrPRQ
z6gy+PcaDtWDbiozTEDMufyry0iAz5E881AFZBLApcKZiHZ3e/AIuPMevABi
RXfD3WKUer89RPpeP9nGzYRHk4cgKERDKCjFNyxfrd/mjm5M1C9q0S6gd21F
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
eCL2BwoRBqfD5aA=
END;','package',NULL,SYSDATE,SYSDATE,NULL,'546508b9842c4e3698a1f2d3ae6fa917','0','obj',7),
	 ('8376de5ef43f454083ebaa942383b434','5','dfb8894291c34ac28e3458bba277e0ff','e32e248da25c448ab9eff93c7a74025a','kesplus_base','current_user','kesplus_pkg_role','CREATE OR REPLACE PACKAGE "kesplus_base"."kesplus_pkg_role" AUTHID CURRENT_USER AS
    /**
     * @Description 添加角色
     * @param jsonData 角色数据
     * @Return 角色详情
     */
	FUNCTION add(jsonData text) RETURN jsonb;
    /**
     * @Description 删除角色
     * @param id 角色id
     * @Return boolean
     */
    FUNCTION delete(id text) RETURN boolean;
    /**
     * @Description 更新角色
     * @param jsonData 角色数据
     * @Return 角色详情
     */
    FUNCTION update(jsonData text) RETURN jsonb;
    /**
     * @Description 更新详情
     * @param id 角色id
     * @Return 角色详情
     */
    FUNCTION get(id text) RETURN jsonb;
    /**
     * @Description 更新详情
     * @param id 角色id
     * @Return 角色详情
     */
    FUNCTION get_with_auth(id text) RETURN jsonb;
    /**
     * @Description 模块授权
     * @param jsonData 角色数据
     * @Return boolean
     */
    FUNCTION grant_auth(jsonData TEXT) RETURN boolean;
    /**
     * @Description 用户授权
     * @param id 角色id
     * @param users 用户信息
     * @Return boolean
     */
    FUNCTION grant_user(id TEXT, users jsonb) RETURN boolean;
    /**
     * @Description 取消用户授权
     * @param id 角色id
     * @param userId 用户id
     * @param deptId 组织id
     */
    PROCEDURE revoke_user_role(id text, userId text, deptId text);
    /**
     * @Description 根据角色，查询当前角色关联的用户
     * @name "kesplus_base"."kesplus_pkg_role".list_user_by_role
     * @Examples select "kesplus_base"."kesplus_pkg_role".list_user_by_role(roleId, blurry, deptId);
     * @param roleId IN TEXT 当前角色ID
     * @param blurry IN TEXT 筛选字段，包括用户名、姓名、手机号
     * @param deptId IN TEXT 筛选字段，部门ID
     * @return JSONB 用户信息
     */
    FUNCTION list_user_by_role(roleId TEXT, blurry TEXT, deptId TEXT) RETURN JSONB;
    /**
     * @Description 用户分页列表-根据角色
     * @param page 当前页
     * @param size 每页个数
     * @param blurry 查询内容
     * @param roleId 角色id
     * @param deptId 部门id
     * @Return 用户信息列表
     */
    FUNCTION page_user_by_role(page integer, SIZE integer, roleId TEXT, blurry TEXT, deptId TEXT) RETURN JSONB;
    /**
     * @Description 角色分页列表-根据组织
     * @param page 当前页
     * @param size 每页个数
     * @param roleName 角色名称
     * @param deptId 部门id
     * @Return 角色信息列表
     */
    FUNCTION page_role_by_dept(page integer, SIZE integer, roleName TEXT, deptId TEXT)RETURN JSONB;
    /**
     * @Description 查询所有角色
     * @Return 角色列表
     */
    FUNCTION list_all_roles() RETURN jsonb;
    /**
     * @Description 获取当前用户角色
     * @Return 角色编码
     */
    FUNCTION get_current_role_codes() RETURN TEXT;
    /**
     * @Description 角色分页列表
     * @param page 当前页
     * @param size 每页个数
     * @param blurry 查询内容
     * @Return 角色列表
     */
    FUNCTION page(page integer, SIZE integer, blurry TEXT) RETURN JSONB;
	/**
     * @Description 下级角色列表-懒加载
     * @param parentId 上级角色id
     * @param objType 节点类型
     * @Return 角色列表
     */
	FUNCTION list_children(parentId TEXT, objType TEXT) RETURN jsonb;
	/**
     * @Description 获取当前模块数据,tree状数据返回
     * @param moduleId 模块id
     * @Return 角色树形列表
     */
	FUNCTION tree(moduleId TEXT) RETURN jsonb;
	/**
     * @Description 获取所有模块数据,tree状数据返回
     * @Return 角色树形列表
     */
	FUNCTION tree_all() RETURN jsonb;
	FUNCTION tree_classify() RETURN jsonb;
end kesplus_pkg_role;','CREATE OR REPLACE PACKAGE BODY "kesplus_base"."kesplus_pkg_role" AS WRAPPED
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
+pQ1/BJP8/1ZUnQAAAAAAAAAAAAAAAAAAAAA
END;','package',NULL,SYSDATE,SYSDATE,NULL,'546508b9842c4e3698a1f2d3ae6fa917','0','obj',8),
	 ('1789b94082bd41bb8b352651c186e640','5','dfb8894291c34ac28e3458bba277e0ff','e32e248da25c448ab9eff93c7a74025a','kesplus_base','current_user','kesplus_pkg_serial_numbers','CREATE OR REPLACE PACKAGE "kesplus_base"."kesplus_pkg_serial_numbers" AUTHID CURRENT_USER AS
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
    TB_NAME VARCHAR := ''kesplus_serial_numbers'';
    PK_COLUMN_NAME VARCHAR := ''id'';
    CONDITIONS json := ''[{"blurry":"code","queryType":"like","keyName":"code"},{"blurry":"name","queryType":"like","keyName":"name"}]''::json;
end;','CREATE OR REPLACE PACKAGE BODY "kesplus_base"."kesplus_pkg_serial_numbers" AS WRAPPED
JRg2h7P8/vjdlgRpsm7+XhtMoHzF45IPBI3jvdgmEdNNDF+Cf6x0EoTU/s9o
B1o3byywPJxg388uXmkHzicthfYxQjaE1DihkafnqXT0pMP2jle80AZ/l525
oF0pRwuAHDuJtApvFZTu8lUagX9rTnzb7AqQYOwEGleA/eZI9CyviIZZg+Vv
2IV2jCswDaAT1K54lfqe6hSfckBABiQStEwZWQeglcpBR6k0Uf0D2V7Ly3Ap
PlMiMZ7cKf/+OKUZPSbVR21a9zx/X4JorXxvapSkrpVvZnk8IKHUh7w2wJiw
F8xl/uULcUcps8A+/+nLKbiaRFxcALOIO/p4UpRQP5jGC7VpYRX/cmWJhTAu
JPkQ9smOrQYWq3NoA5t8N7fLHs35BG/7K3crgDcwvZ7vaneJjpaDcTN9alME
brSZXuXwwRVSKGKW6UEkUGfQxYocqtXKVhvx7L7PFjKi77vdmgP3MB6yHq0F
dGvYvRA/SeMqF1CeMcixcpiLQ9STIIwxtzj2w/u9NLXEdTcVITa0RISmhuLy
9U5N/myMJjaZr+9XcDDcVY80mln1FUz5yoIKBT/tPEgVBm7w3SIm8BJDg5W3
4IgXcWxVqLxUTqf6C3fVcUzKNlt3+3cwpz4G9BW+VGD2EpT1CBRrQp82OW0Z
0QwwGOgYMKJh5oJrIjCWMOATrw+ymtsiV0j0AqKCQonYIKijUq2AABJ0PBH4
8ahPTSUYNoez/P743ZYEabJu/l4AQc9H3qrh0S2mxMb/ieFcvLLQ/YpG2Ugi
zcOGGSLldP6dOyz5XhX+1bsk8OB7FfIMN7vykxgvmoCLehwW0p6NeMEQ9BFT
blft6hL/gsZOR6C46fcEiDnlzWVTXiL2StyYvNKrLjUUIJVXoXYAnEnX4mtu
Lsf3uqiB1MGtFS+PUkPlgfGJTRxjY/gs+jDVwdGrR2eXQoGSKkxeZtpGr4Bz
pqYqDqLhe2qSdJEjKPj2M6Uc230pRd5UQGYxeAZYMxUfvn7uzTHSjjdwRQMm
oE0AXTovZUa+q2EcsPr1il090tPSRgBcAHWWwIiEkRnOvQUtefY3wxDY5Qk/
ZRDFPQDIsQt2+iYiulvvbaks8iKMCqtBTqEkdIuUS+vljxa763YhYoKl7YVE
9BkQpgXIkgoSRdKxacZlZNCTjNlbwtVuUDqjTOnyt1vUK3UYJyFhzLtwXhQP
wkua9sFO2Tqsu01oZI7prjArRI+IEhJ3kulU5lTV3Vas3gJRuWTOuBHnOdQW
uy6QlQB8CUmBFjAeUGqDwFCZM2JtlStf705j5WgcH+sAJ/AMq26gHLAAF1Zn
Qp9/tcHWdvWR5XnE0sNE4CVT9G96G49FnWhf2KYrynuadKg/Zxtn/ek1cSFk
lepFBQKPxSGdC5u3pYuMkxWqQZwsmrqCwlTjpybt01mB2fPyU0zEvoV0qDeq
+3g0E7a2Ri8urXYdVibcguEnZ7EXgdaIm/XdUCjZ9jt78kqKCHW62Vnu6y0+
+ESaLSIUwfjr+sX9UI1WwTD8+UG/KFbSSTuZbpw8sobpu1Wtax4Zwqi+8B1s
CWdktqlfcxXnqcjXbOUBHREls5WIbsUP55Mu8rXkfR6v6h2CAPZ0xNKi1HUC
JKpzLWoQ3LwgWGpqHh4rMNxQXIhAdD7w049iZc9Syk0H2OmVRdhQrP97Psn9
fWDvbVJqltUF8/eKTnFmZ/9wFgRf/nyZg5cNJ5mzaX+ZL8yNCNtdyF5vu6zG
/FFFIvQbHkglaPfvuUNljvxEhz2WG4nl1xLq0DTu5KPZxaqU2J0TBXDL/4zL
IMmvDdXbkBAXAK15oOoKWA0/59S5CY3Qv3Y+Bnli5Y5RL9FFrP35a536jqc0
x7XlEkGUcwdtBvUUOfh3Fo8sudPlIKtoI8WqQXKT/aPjJeeljzy9kK0BetVY
m+IONYuJskBTuRWMVKkatZfx45nagolumTmfXRHq9SzIcOq8pYe6Hdu1qa9s
0FDgZWOIh7oJwXjPVt1YyTa1gAYGWgj86Kb4GaPY5tEKKBv6I00UWft5d2Rn
JSoA0b2XOScF4uL1jW25wp9PfnpfQh0xiAGc1U6F4F6OMCeLidJgJ6L9bIct
8AtY8CnhbGTtbU5ARzmi76fK2tmxyrwlFacAar5tX/C6FQ+gQM0VtIyFeF89
/UK/O57rBeO16B/hp7E0v49Z16mKL5Jv8D8lg9yU2CApQvOMlbdQNn/Fkw0T
fq7jFLTzph5pb4qOPO+HAnPRtJmOjdamp6nIMYKCVRlMLMP8+DM0hsnSwXNt
v4OVt+CIF3FsVai8VE6n+gt3F8HCSDGJ+1efksWKxa0e4UDfGk33Wc01J/Ed
dBKaWTXFLXCwfCoN7Jpy4GwlCHRPEN0LQJa9hihETPCcyjOh9AIKQ4wNgQJe
+j9qPElsitxYkdBQaqn3BFuiuT7Ja1c8HIAwYi7MJ0QktDd4ODUxKfkqVbFH
mUx73vimkn15CA70b3obj0WdaF/YpivKe5p0qD9nG2f96TVxIWSV6kUFAjsz
QUKsmtPwzGviqLvFjRC7fDSPQDA3VdvgrZb6T1Go27cyHWWzLWnsQNgCn2Vt
1IBgARcg1DrYrOxjXhice8QVrff+F7O9b42bpmi2zJGkulSSidt+/U+0E/pS
tv9zE2OGDy4BUlvA0OyDvTi+FwwmXk1JowK/gzqDrRq0sJYqIRY8f9LLP5CF
OeXQw5v3PkiSStErhADmZaaGDJtLob7D16ODJ3avQz5V948+2gHwgtac4ytL
ZrNEuwhDszDb9RoL/LYCdaGd4OhBuTouOQOmV6fsghnjIofbidtE2SL+qyr+
GJqrpxgzEnG38DdpkqU3GdUZFQwdMAx2eEFHRinKZxSL9FGZ+HUJoZI5RA8o
3CDsv43S7pJRXXLAgY4WC6azQgezNC7D7Nic4dLvY6SZkDHCSgYDNaMt5VZ8
V9z8Ct0IC2w0GFJL/m48iPwL26d4d/fSNjubdhLV24UBOtcYwECb8OFyD+A6
+DLEK1d0qJTmn/PtaYp1dAiLh/BgFjoZP9Uu0wWBJWYJMKGnYS7bYWuSf1CU
XOg2iV70mgbvYb9OCAploHcKjV8swwS74hmO6cC3wSVhulGBg1enYld4irNW
D4taq8fcfBqCcS3FgmCG0hXKhJGmg4g6r/LH7+UKBFes5dV6Iut9r6klCvky
i7vahZRoPyAgEy7SA9ZGIgCcZBxXGB0UnAc8hvzjPxuOPliroMLPjlTcw7HR
1CgmlB0ecFqlEAEsX+zqQzEECVj7tINhMrCutSD3uuTyIlGFooTbig9dZ6Sw
GNAAwmihk+4NUgIpYna8lYek1X4zblsf00g1KIZZttknvGAzuLAlRAhVCs1X
88nFbHwkKJtAMtbuoJtpc8RGBAF2tQGOOkexBvF2MzRsCqEwh8DoV3ojVPXa
8SI8IeN9McJccB9s9hLOzDJQ9mQNVJyT/v5FsnGdwldBqw913daJ9RloT4xz
hqmAGAmhIer7lOr8000vXc0hhYH6F2Zy+Uw8MGEiwb9LmYacl5s9ZYfSaYGj
GsPNHXajEQBptt68fZkFJsnhch4vZ+V5jgP2THAMXIf3IEtlN+f2EksF6RKQ
3PKHrrhii7r0E2h4xScPhWMMqh6Rnhy5f//1+9qJ7rDw/2H3QPurIleYnRJ5
xNVcWhJqSS+K1fHqKyRGxnJKkua81K+hJlp2REkBoq73i9kPUWCqUzyCPWLm
xdzU6xQ6xXMrVKM+cL6Dbl7MvqWmHN25V+Gk6GtnbFw3JT8pfxZbRWhYn8CU
sSn2EOMC8F4kZC9DudECdvw2dEHj1ucaZAVXXs9uJpZVIDJImd/aINcO+Oty
bekILFhk98Xlno79gsb75s9gAMo9wDugChuHs7p39Uj4D8K/WByjfHResEQp
yIoDPeCKYg9i1TGN0kmeuzgwaN9KaPwAwFFr6PCGqcAv0d9eZ/wke3K+lNNq
ifGpAWC2vTrUox/KiDDNcMh8Inhm0k6FTBv9VkSS1L6avHoIZpmEf7sIm4Y9
MKdUW3ALaI+4TY5MBonACE4DQuY1lWSMkBEexzOiMzuGcwYxX11Ip9XfBnCk
GmO4izIWSTGQwXkN4I2eq5bKWc5+a7Ggwexb3xZZ8WZL0rwPu4NldDArJ8Iw
9J2l0yDXzWp9nulDMAI/9sJijjNGdkJTS6cZYmZJBEZxC9LXl9i1sbuCCLA4
cA9zxQQMR5ayPvrEQJoBHUgDFebQI/r7i0JsSzX+t1cB9qmYY2mQtbum6Cis
PkbWkHZGG0uqcUgJ5NR5X5oXl85JEj2Xw4O3F1RpoFu3m09uPQsZYS/bUJeF
ryCqt94hrX0dl6dDFn4QhuW8CoqII0XzVmXducG9lccGBrBjWYWi1p0Ypu+L
bRurB+Wdl4cv6q/n2HNyXZ+DichpA9r3gKaqhTv60GoIlrq1xvKoImFT5BC+
XixyUp+gaGQV6SetploOhWWQkSlPLCPXydqqmmFMXWXv20/cPb1/3Z3pBjpY
j/r08T5ybIGPm7NcsBY/e6gqP0vMTgXFAj+PySI543iZtAyDCJpazjKPOW62
13mxtQ55jSJam4whajL7rjXTRV9sQZ+1ktGWMXEKSDvF0AJGEN3QwQbNbamU
k94lekkoW2WV0J/X1baHobKfrIjIeVYupuq3/MAm24H356WBHjupaMDSSFVc
eA14c/kNJuPR1Qmr3hlkCfnT1nmY6X2uzdG1UQty4fI1ZEcIoY7DXByKcphu
jYZduBFcvIOy8fs2/t/SoPzCWiTxXuHSDaei5/dU1d1WrN4CUblkzrgR5znU
FrsukJUAfAlJgRYwHlBqg/GtqSpFLRAka297VX7c71VWpI5p2tRr3/Qfcvjg
+SVwPQGyxVPR5sYQMQDG6DO7FiJUztjDbjf28s9DL/7hByD7fpeQ/yyf/s4z
pZgsiDbMpz3y9lWxZ6IM0XT6wONQuL8HapOwo5o9L7mkAcs+dRR/UM/sBSuj
/5Eo4wXqKFc/y3xNkzxBY2eURx+GRhVTeL/OEej+mWCXK/yNoSx5CnRh7yPa
tYr3hHSIjW/jhiZCc5sd0j0ijeREQPz9u6J9szA0LKZT5jEriaco3TuECtZ3
8jchFfQWbLzs/vI8tb5AgZATNqNjkA6QRu8ibACOC53yddixJ8PAaEy0EPAr
pwB81eV4fxevrv0zcuHtc5MuRULY6ltpIJDab0lnhALyjiVe3gBHoqIFarSI
xwzt5mw96ZaQdV9yz38szbdSUTRrNlif6qMWDnrH30gioja1N9/KGOIzUqvg
4yOtcNPTEk6ZXFlsvhdbtKd9uHD9yTKlL3Jx4i5pKsnnF0R5gpX5cfKjn9FN
28QM9yML0XEOX2Gdm/I0ybJqKce0UP0Nxphs1mqyqFozy5c7FAWyZ+GIrhXa
w9DTzuedYnVHrWoLjdCDjrjWNYuYrivdGZ61AYAf7xmILXXRQgLm9zoezJML
6k+dtWILRrbdkvu8qdsV7uwbEMUOJ6E1a2a+0aTPmNtAAG+Pjb9EjmlhsbeK
hcY3e1qUPdxQIVJ58tWjuoHRlLFL3lx9yNSqYuNDowXp2H0haLhpfRpSB+vV
gvxfFCbxW8bLUdFhlmjxZrmb7JNGaO4toHWM5fuiJuXLi0KTsQHClT4pvC/+
3gcpsj/sB+7tesxZIe7OZAWrvLC0jdT0YDUBOhQnu/a3zVV9y1K9DqzylDZ2
w3iQq477Ir6g+cNj+2e3a2U9SXL0Jm/n+fEd48mIqds7l7/EE1Js2T/bnIWQ
DfvgKzNmTiCYu5pooebWc7NmeZ0gN36zEJ/lDLzcwkOZGWIXZZc/GqalF84P
5cZ0LUV0c87+CZxxAAZzA9BKO6X9utbzmAz0pIJDEVvJzChqAfInnkwZhgwp
QSuSlk5a1zP8hxlylYdLZXjwXm8PnYug0wBB7poTtsPzkJO/Y6aDGfS5RPia
zjDt/dzpnYpEhv2GcOvOt3uFWL9ElyDP3fpE4xFbWwMOlKNk2/aY9k5rEUUw
xldw+zlXNOhHptCOH1EWMNa80Ao8z9IH4ihXkMciPwt3EcCmm0HfjmNG24E9
aVYY8ZMszZpHaHHAN4BMWaGNDuPPN7ZZqQmmnoRsaYlVERDpatEl4mzcRa8z
TmFif12ORu4lBmes52iLYcxYT1yIcSCgrjSrtg5mwayYcWWKnm9jEgwZT57O
nJNgzXlxBoTuRAw7ls1ilFNE5hscbYNn0cVEq89RIZmjW/eQmsEDNDHu1YdH
4srM0veguKSquT/z7mUZOp1JUtUf144rwTX+M7aZc3w6ezpwmUIVzYYjA+5W
LkS4Jmn7i6GujDCyPaZqxL8HL7AD1+CCGCV7bWSis0jE2H7NRmmS8Yxyq/8E
JZ5VBk2+gfnuvqFdlnK+7Q/O4BmgKfxBujO65HvNZpknSee64cW8tshD00xd
Crv1Ve72ZHGcna7EnFJ3FGhodBAuJ1LVh7I7XJ/pkwWdiT0/NopXPbNojWYo
FUIZI5054bPQ2fI7jNobTHCFLpxwBJuNx+Sba2BfCi0vDueITjORpg473EaD
pstBQD+SSK4Hv05ke1TzHd4edzgEa6JlVW5TEgbCDxI6FY5Xck4m+tDG0Q8D
Q1bxfbjkgjFScUVrNwhnYGSAwWPaAutRgz+BbSnjk8WylbDnavQSfWjby92j
teLWoELcVrhv9NqUr7oWPqb3DZK7XzlAaJBmleyEW7qju9hdYs2BHpbW7uyC
GfkotHOO+URt5z2Pig6Hy1kRml2U7sbXiO81gPhPDNPKdGZNrOApGquIP5y9
GH7xmuF/2Pt+ezAGK772ezqFGFNkgrNsHash4aSs9Lb+KxshQ5oYaYJI8FFZ
8NjvmnbbzkzNNji6T5r0jtXKhXYCLd0wj0dcTdcxNG43QYPfMUqwX5o4liFC
pxhGKrLT8kpmDDnS2autmk7H44cmBfMDSW1korNIxNh+zUZpkvGMcqtjp3bg
OeCgoNNnGZvdSiBrZs4Aj5ykhzvf6kwgYfkbIpeCa9DcBwmEPxOWIhBMwrJA
kAn6gETKcirtpx3C4aT/0Vy9chXyh5xyWJw5LHhG+QrQUYvrwLxVPU3SY73y
8rt3KFUvQCHmjaG2OR6P/2eWbXKeZCIKU/zC5BBpkNH8iNaWtMKl9BF7jnzV
5+awbnT5kEK/365PImLTDNELHYE/xnSn9jnBXT/+uWFjp/3d4fWndgIiHTHQ
7FhmzCBgCZqMOxXXDOlGo6ZoFm4waBi+UKOc2fMf226Exfmnykx4FsCgVIAH
yghJ0vRGxYrUClgpCa+b9IAN56nT651ct2uHLruF0HvwxHsErVmFEAQmYfbv
jO/VAUBXK3hlXQ9xIREvufVa2XlF/r92powCAa5ukMpZabYipMRuOshg/s/2
f+YmvvpoHQL9B4Kn4nH246P0T2fHUOQ8N9DxFfDjfHAL4BiGzyOV8Z4n+pfZ
tSW7oUFepTGEuBXXIOdQl5PAP4QbPADmaxIz3hMvntp3vcr7VRA/uYp4SHhD
yq8YKypOcxjHZNYRtlGPbgrCgrhi0goxVOUg5pUD/Al8SYlpVULc
END;','package',NULL,SYSDATE,SYSDATE,NULL,'546508b9842c4e3698a1f2d3ae6fa917','0','obj',9),
	 ('3bf241290bc24db1a6503d53bb5f97bf','5','dfb8894291c34ac28e3458bba277e0ff','e32e248da25c448ab9eff93c7a74025a','kesplus_base','current_user','kesplus_pkg_sso','CREATE OR REPLACE PACKAGE "kesplus_base"."kesplus_pkg_sso" AUTHID CURRENT_USER AS
    /**
     * @Description 新增配置
     * @param jsonData 配置信息
     * @Return 配置详情
     */
	FUNCTION add(jsonData text) RETURN JSONB ;
    /**
     * @Description 修改配置
     * @param jsonData 配置信息
     * @Return 配置详情
     */
	FUNCTION update(jsonData text)RETURN JSONB ;
    /**
     * @Description 删除配置
     * @param id 配置id
     * @Return boolean
     */
	FUNCTION delete(id text) RETURN boolean;
    /**
     * @Description 获取配置
     * @param id 配置id
     * @Return 配置信息
     */
	FUNCTION get_sso_config(id text) RETURN JSONB;
    /**
     * @Description 配置详情
     * @param id 配置id
     * @Return 配置详情
     */
	FUNCTION get_by_id(id text) RETURN JSONB;
    /**
     * @Description 列表查询配置
     * @param blurry 查询内容
     * @param type 类型
     * @param enabled 状态
     * @param page 当前页
     * @param size 每页个数
     * @Return 岗位列表
     */
	FUNCTION page_sso_config(page int, SIZE int, blurry text, TYPE int, enabled int) RETURN JSONB;
    /**
     * @Description 使用base64格式解密
     * @param resourceCode 第三方平台编码
     * @param encryptToken 加密token
     * @Return 解密数据
     */
	FUNCTION decrypt_from_token(resourceCode text, accessToken text) RETURN JSONB;
    /**
     * @Description 加密数据使用base64格式解密
     * @param resourceCode 第三方平台编码
     * @param accessToken token
     * @param ssoData 请求数据
     * @param res 解密结果
     */
	PROCEDURE decrypt_from(resourceCode text, accessToken text, ssoData INOUT text, res OUT jsonB);
    /**
     * @Description 使用base64格式加密
     * @param resourceCode 第三方平台编码
     * @param 加密后数据
     */
	FUNCTION encrypt_to_token(resourceCode text) RETURN text;
    /**
     * @Description 使用base64格式加密
     * @param resourceCode 第三方平台编码
     * @param encryptToken 加密token
     * @param ssoResult 加密后数据
     */
	PROCEDURE encrypt_to(resourceCode text, ssoResult INOUT text, encryptToken OUT text);
    /**
     * @Description 变更配置状态
     * @param resourceCode 第三方平台编码
     * @param encryptToken 加密token
     * @Return 解密数据
     */
	FUNCTION change_sso_enabled(id text, enabled int) RETURN boolean;
    /**
     * @Description 获取模式名
     * @Return 模式数组
     */
	FUNCTION list_schemas() RETURN text[];
    /**
     * @Description 获取模式下包名
     * @param schemaName 模式名
     * @param configType 配置类型
     * @Return 包名数组
     */
	FUNCTION list_packages(schemaName text, configType int) RETURN text[];
    /**
     * @Description 获取包下的函数或存储过程
     * @param schemaName 模式名
     * @param configType 配置类型
     * @param packageName 包名
     * @Return 函数名数组
     */
	FUNCTION list_functions(schemaName text, packageName text, configType int) RETURN text[];
    /**
     * @Description 数据唯一校验
     */
	PROCEDURE check_unique(beanObj JSONB, TYPE int DEFAULT 0);
END;','CREATE OR REPLACE PACKAGE BODY "kesplus_base"."kesplus_pkg_sso" AS WRAPPED
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
9Tk=
END;','package',NULL,SYSDATE,SYSDATE,NULL,'546508b9842c4e3698a1f2d3ae6fa917','0','obj',10);
INSERT INTO kesplus_base.kes_packages ("id","parent_id","module_id","app_id","schema_name","authid_name","name","header_content","body_content","type","remark","create_time","update_time","update_by","create_by","tenant_id","obj_type","sort_num") VALUES
	 ('42b415837fd54314a94d54beb87a610c','5','dfb8894291c34ac28e3458bba277e0ff','e32e248da25c448ab9eff93c7a74025a','kesplus_base','current_user','kesplus_pkg_sso_functions','CREATE OR REPLACE PACKAGE "kesplus_base"."kesplus_pkg_sso_functions" AUTHID CURRENT_USER AS
	 /**
     * @Description 加密数据使用base64格式解密
     * @param resourceCode 第三方平台编码
     * @param accessToken token
     * @param ssoData 请求数据
     * @param res 解密结果
     */
	PROCEDURE base64_decrypt_from(resourceCode text, accessToken text, ssoData INOUT text, res OUT jsonb);
	/**
     * @Description 使用base64格式加密
     * @param resourceCode 第三方平台编码
     * @param encryptToken 加密token
     * @param ssoResult 加密后数据
     */
	PROCEDURE base64_encrypt_to(resourceCode text, ssoResult INOUT text, encryptToken OUT text) ;
    /**
     * @Description 请求数据解密
     * @param ssoData 解密数据
     */
	PROCEDURE decrypt_sso_data(ssoData INOUT text);
    /**
     * @Description 返回数据加密
     * @param ssoResult 加密后数据
     */
	PROCEDURE encrypt_sso_result(ssoResult INOUT text);
END;','CREATE OR REPLACE PACKAGE BODY "kesplus_base"."kesplus_pkg_sso_functions" AS WRAPPED
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
+aF8aifqfjOFbEqzvuIS5D1IVE6s
END;','package',NULL,SYSDATE,SYSDATE,NULL,'546508b9842c4e3698a1f2d3ae6fa917','0','obj',11),
	 ('e4ca636c2f4a45e085c8b6a431412d94','5','dfb8894291c34ac28e3458bba277e0ff','e32e248da25c448ab9eff93c7a74025a','kesplus_base','current_user','kesplus_pkg_user','CREATE OR REPLACE PACKAGE "kesplus_base"."kesplus_pkg_user" AUTHID CURRENT_USER AS
	/**
	 * @Description 新增用户
	 * @param jsonData 用户信息
	 * @Return 返回用户详情
	 */
	FUNCTION add(jsonData text) return JSON;
    /**
	 * @Description 删除用户
	 * @param id 用户id
	 * @Return 无
	 */
    FUNCTION delete(id varchar) RETURN boolean;
    /**
	 * @Description 更新用户
	 * @param jsonData 用户信息
	 * @Return 返回用户详情
	 */
    FUNCTION update(jsonData text) RETURN JSON;
    /**
	 * @Description 根据用户id获取用户信息
	 * @param id 用户id
	 * @param deptId 组织id
	 * @Return 返回用户详情
	 */
    FUNCTION get_user(id varchar, deptId varchar DEFAULT NULL) RETURN JSON;
     /**
     * @Description 根据id查询用户详情
     * @param id 用户id
     * @Return 返回用户详情
     */
	FUNCTION get_by_id(id varchar) RETURN JSON;
    /**
     * @Description 根据用户名查询用户详情
     * @param username 用户名
     * @Return 返回用户详情
     */
	FUNCTION get_by_username(username varchar) RETURN JSON;
    /**
     * @Description 根据用户id和组织id删除用户
     * @param id 用户id
     * @param deptId 部门id
     * @Return boolean
     */
	FUNCTION delete_user_dept(id varchar, deptId varchar) RETURN boolean;
    /**
     * @Description 设置默认组织
     * @param id 用户id
     * @param deptId 部门id
     * @Return boolean
     */
	FUNCTION set_default_dept(id varchar, deptId varchar)RETURN boolean;
    /**
     * @Description 设置登录默认组织
     * @param id 用户id
     * @param deptId 部门id
     * @Return boolean
     */
	FUNCTION set_login_dept(id varchar, deptId varchar)RETURN boolean;
    /**
     * @Description 用户分页查询-根据组织id
     * @param page 当前页
     * @param size 每页个数
     * @param blurry 查询内容
     * @param enabled 启用状态
     * @param orderColumns 排序数据
     * @param deptId 部门id
     * @Return 用户信息列表
     */
	FUNCTION page_dept_user(page integer, SIZE integer, blurry varchar, enabled int, CASCADE boolean, deptId varchar, params json, orderColumns varchar)RETURN JSON;
    /**
     * @Description 用户列表查询
     * @param username 用户名
     * @param deptId 部门id
     * @Return 用户信息列表
     */
	FUNCTION list_user(username varchar, deptId varchar)RETURN JSON;
    /**
     * @Description 重置密码
     * @param id 用户id
     * @param pwd 新密码
     * @Return boolean
     */
	FUNCTION reset_password(id varchar, pwd varchar)RETURN boolean;
    /**
     * @Description 更新密码
     * @param oldPwd 旧密码
     * @param pwd 新密码
     * @Return boolean
     */
	FUNCTION update_password(oldPwd varchar, pwd varchar)RETURN boolean;
    /**
     * @Description 更新手机号
     * @param phone 手机号
     * @param pwd 密码
     * @Return boolean
     */
	FUNCTION update_phone(pwd varchar, phone varchar)RETURN boolean;
    /**
     * @Description 更新邮箱
     * @param email 邮箱
     * @param pwd 密码
     * @Return boolean
     */
	FUNCTION update_email(pwd varchar, email varchar)RETURN boolean;
    /**
     * @Description 用户登录
     * @param uuid 验证码key
     * @param captchaValue 验证码值
     * @param username 用户名
     * @param password 密码
     * @param email 邮箱
     * @param isRememberMe 是否记住
     * @Return token、用户信息
     */
	FUNCTION login(uuid varchar, captchaValue varchar, username varchar, password varchar, isRememberMe varchar) RETURN JSON;
    /**
     * @Description 内部用户登录
     * @param username 用户名
     * @param expireDay 超时时间
     */
	FUNCTION login(username varchar, expireDay int) RETURN JSON;
    /**
     * @Description ldap登录
     * @param username 用户名
     * @param password 密码
     * @Return token、用户信息
     */
	FUNCTION login_ldap(username varchar, password varchar, uuid varchar, captchaValue varchar) RETURN JSON;
    /**
     * @Description 变更登录组织
     * @param deptId 组织id
     * @Return token、用户信息
     */
	FUNCTION change_login_dept(deptId varchar) RETURN JSON;
    /**
     * @Description 获取用户token信息
     * @param deptId 组织id
     * @Return token、用户信息
     */
	FUNCTION user_login(userId varchar, deptId varchar DEFAULT NULL) RETURN JSON;
    /**
     * @Description 变更用户状态
     * @param deptId 组织id
     * @param enabled 状态
     * @param id 用户id
     * @Return token、用户信息
     */
	FUNCTION change_user_enabled(id varchar, deptId varchar, enabled int) RETURN boolean;
    /**
     * @Description 变更用户状态
     * @param deptId 组织id
     * @param enabled 状态
     * @param id 用户id
     * @Return token、用户信息
     */
	FUNCTION add_user_roles(id varchar, deptId varchar, roleIds varchar) RETURN boolean;
    /**
     * @Description 用户锁定检查
     * @param _username 用户名
     */
    procedure check_lock(_username varchar) ;
    function lock_user(userName varchar,isLock boolean,increment int default 100) return int;
    /**
     * @Description 批量插入用户信息
     * @param jsonData 用户信息
     * @Return 插入统计数据
     */
    FUNCTION batch_insert_user(jsonData text) return json;
    /**
     * @Description 根据当前部门id查询用户
     * @param userJson 用户信息
     * @Return user信息
     */
    FUNCTION get_user_top_dept(userJson json) RETURN varchar;
    /**
     * @Description 获取用户角色id
     * @param userId 用户id
     * @param deptId 组织id
     * @param tenantId 租户id
     * @Return 角色id
     */
    FUNCTION get_user_role_ids(userId varchar, deptId varchar, tenantId varchar) RETURN varchar[];
    /**
     * @Description 获取用户角色版本
     * @param userId 用户id
     * @param deptId 组织id
     * @Return 角色版本
     */
    FUNCTION get_user_role_version(userId varchar, deptId varchar) RETURN varchar;
    /**
     * @Description 获取用户分页列表-根据组织id
     * @param page 当前页
     * @param size 每页大小
     * @param deptId 组织id
     * @param realName 用户姓名
     * @Return 用户列表
     */
    FUNCTION page_user_by_dept(page integer, SIZE integer, realName varchar, deptId varchar)RETURN JSON;
    /**
     * @Description 根据组织id获取用户列表
     * @param pid 组织id
     * @Return 用户列表
     */
    FUNCTION get_child_dept_user(pid varchar) RETURN JSON;
    /**
     * @Description 根据用户id获取用户列表
     * @param ids 用户id 逗号分隔
     * @Return 用户列表
     */
    FUNCTION get_users_detail(ids varchar) RETURN JSON;
    FUNCTION list_users_by_dept_id(deptId varchar) RETURN JSON;
    LOGIN_ERROR_COUNT int := 5;
END;','CREATE OR REPLACE PACKAGE BODY "kesplus_base"."kesplus_pkg_user" AS WRAPPED
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
hN01ah8/Vu7OQxdu1fCE4bXzTYBr1kovv33MXWiJku4tspihDBdPNV0OJHfU
acJZbg3RYbl1qGte8zxL3uJs7QkeYdpIEOfh+qoLEG5fX7+fZ2yR8IkRmWnY
PZbNlX4RM3ziHUzgCYChxf4RHvkoDtpTnQk7nfBzpEX81mAScBJgfmtrk8tj
XhfV45tityboR0MdVhCag8gQSOmDRblSxw/LEknppSW6nM+NKxpZEpmJsPrB
u7Irty96eqBwLfFCFjYJCCq1kCE6tSduODkSLd2EXdMc99wuDdaHQBEz8Og3
6JPbLPxQKw+hieWBVo6ANOtkcrzGQOflxTiFf4L0ELKqFyKaeabQBg4HQykD
6di873xdI5hJmOjjA4w4esoCffVwQBp3MDRf+P7eqkfJUWukL9wHvN8kqvOA
G2B3f03DMnENMwJdup9TU+KmDt8Lw1GSvEirvPWsamoy4Zttd3KUcwNb2KmJ
COWfJneB0EA/dcJqhlVQSAxENEPiuln8iIusiH6qB4r7613FDytTc+mBG6Jt
/pOuG39o4pg2uQLBy34dPVVfc6adIR/S7ngup/dKR4n/ADC5Sha9oOAM7m5f
08mu0hqyTw8rHSIAnGQcVxgdFJwHPIb84z/tQpgrc6ZIOI7bC2S2hJg1au/t
0WCiDJYB+iSWSTYJuq8zrjl/rYa2/twJpe2nu20ht4nP0Vfe4tj4bK8oi9fN
+ITq+ZFnlR57pjGhO3SWza6Vf2W/TSvIW25/HPeRshsXo3ZSR9u9Eddcw/pS
g/zn3VE1mwmnPRaZLfWFUvwI3YtkTEzRsQexiz7YmbF8Fcz9MJsv2Ib3B0Ph
Hw/JaN3w4biIwohYk3Lq5WjXa2c6MPqd7YohUZgr47oN+5jOIJYs8vaUYhYc
pmCnLHJGb9/nIqZPIVWhL9gejlinf+/qL4zD4Ufk4AIm8e9M6eiMqk3fZJr7
ZratD5rfCdeXqBuLoPUnJKW+yGPQL/LLWTlJ9cQ5g5gK/WirUTRK2VAR+81p
b/wE0fWZQ2mk4syNyYbUU08inbaS8AoE3Vw3DO9XkZ8jA92RROzeL9C9PVCp
Nz84ygXKtgAfzIgo4/SRq7L6K5UM2WtYU5DlOTlD0yu9dy+17Oq58UTMln/1
9C27m3GZHivPdzEHKw2qftufioXtqv93px4Ta+MZRcLuUdige1LQBXdOn2u7
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
U8OUd1rHSZzh1jPUf/fBumRhM98KalNrVj5oz0LvbK/GxSSddDiHaMvICeXG
oSTTs86fnHkFo2LQUE6pwQoNPl2gMH2Oo/RmbXdGBErVUcNfnKAPxPxfP8UF
wC9XNnDaTH/XCR8DZLweZZqHve3AuVXnNBYeIC9/QvxtpOPJ7koExC0Szeje
i53B3hHG4iZhMh2G8BjK6w1+7hZeLqgTL7SuPFnvihfgtMo4XoovaoixNeNH
Np7QSF3SYnnz9Zov3qcTToCQIeYMXKiRS4C84dzq3EZrlDz04ONMevxIv5Vr
DeWvS8fX6nlpylqyeK1AfPGaIwpjhU33gNOFJWuG/b4CdIPCVydgPr5oQxQI
Kn6z9tusvNdrHvXg2mHVceUe8goT0ffYdkB5JlbMh+rkxagNCa3+LC4BsrV1
X32fOSnTGfWmjdN4rkyXmlsQUCF0qaftWnR7araqL3nMwqGP09mpCuadl8kj
1ZO1Rub/cddb72aeW98HWZQDhywKhQXCr1wYSEJf5GZqBYg2j3jSqpJ/+D6g
gBGFxg+vQaOjd2iO2g06ZnFyiwQSuWZ1iqZdRVvjfu9qxxBk8bsx/U/5hGD4
e/1zd7oU+9II4CdBFuUSFTqSPq2Wo3bYMUwdzyYHnjVurnn/7jwO//38UHTA
T1k6LIAgxf7+L5buB0X/tkXuARQgKcM/1z1RYVa2CbgrgEIxVf7bkLq5WOEF
WWLy9p3/SkjoLGwPbbXL7E/xhKqc3VSfeBLXMJKQbpt650EiEOEgoWffrErT
1ox/kpl6pcjCmijjc0eLvwRDgrKGz8sV6Td4S99xwSP+S9FoqOVJpySICcuA
F24+XK0ykVE0lJCRgTQI1E4S/vETFIPmp8BCyMD+0HGXQSw701/QvRNQQp29
sgfIWBTATIooy+T+hInQ2a39Ur5APqZFQkue1KZUOHb9BB6bJxcbdygbpuWd
BrKjmPPFhLEx90iscM8bNPOpZIxUh35CWUtD/mGbUeuseeOoMJqqUPtfsV1O
7yK17Xu1lxWW+ayUvb3GDpcAi8O7ELzuurDU+rf7Ok2W83Jz933E4F1PsN85
a8S2IwtgnqNVWlQ1GFciGmFdjNFK3CGM2x4mm2tcSNclXNuTnxxmUrwMkdsr
E69/T4hxfU7r6sqBqvOWxfQoY1GmgMW0hJpIGPS99URMuld/q54Ns3ZkNOeB
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
bBt/YA==
END;','package',NULL,SYSDATE,SYSDATE,NULL,'546508b9842c4e3698a1f2d3ae6fa917','0','obj',12);

INSERT INTO kesplus_base.kes_packages ("id","parent_id","module_id","app_id","schema_name","authid_name","name","header_content","body_content","type","remark","create_time","update_time","update_by","create_by","tenant_id","obj_type","sort_num") VALUES
     ('db626b8ccd4147469aefbcdccaf63c18','5','dfb8894291c34ac28e3458bba277e0ff','e32e248da25c448ab9eff93c7a74025a','kesplus_base','current_user','kes_plus_pkg_selector','CREATE OR REPLACE PACKAGE "kesplus_base"."kes_plus_pkg_selector" AUTHID CURRENT_USER AS
    /**
     * 树形查询-懒加载
     */
	FUNCTION tree_relation_lazy(pid varchar, title varchar) RETURN JSON;
    /**
     * 树形查询-全加载
     */
	FUNCTION tree_relation(pid varchar, title varchar) RETURN JSON;
	/**
	 * 对外提供的restful API
	 */
	FUNCTION page_selector_candidates(actors JSON, assignType varchar, variables JSON, pageIndex int, pageSize int, ids varchar, blurry varchar) RETURN JSON;
    /**
	 * 获取全部筛选数据
	 */
	FUNCTION get_selector_candidates_all(actors JSON, variables JSON) RETURN JSON;
	/**
	 * 第一次请求,需要计算全部类型,并且需要计算出左侧的筛选数据
	 */
	FUNCTION page_selector_candidates_first(actors JSON, variables JSON) RETURN JSON;
	FUNCTION get_candidates_filters(candidates json, assignType text) RETURN JSON;
	/**
	 * 非第一次请求,只需要计算当前tab页下的分页数据即可
	 */
	FUNCTION page_selector_candidates_simple(actors JSON, assignType varchar, variables JSON, pageIndex int, pageSize int, ids varchar, blurry varchar) RETURN JSON;
    /**
     * 根据关系获取条件列表
     */
	FUNCTION list_candidates_by_relations(relations JSON, variables JSON, assignType varchar) RETURN JSON;
    /**
     * 根据类型获取条件列表
     */
	PROCEDURE list_candidates_by_type(typeActors JSON, relationCandidatas JSON, assignType varchar, table1 OUT JSON, table2 OUT JSON);
    /**
     * 根据类型获取条件分页列表
     */
	FUNCTION page_candidates_by_type(table1 json, table2 json, assignType varchar, pageIndex int, pageSize int, ids varchar, blurry varchar) RETURN JSON;
    /**
     * 所有条件列表
     */
	FUNCTION list_all_candidates(userTable1 json, userTable2 json, deptTable1 json, deptTable2 json, roleTable1 json, roleTable2 json, jobTable1 json, jobTable2 json) RETURN JSON;
    /**
     * 检查-所有用户
     */
	FUNCTION check_is_for_alluser(assignType varchar, table1 json) RETURN boolean;
    /**
     * 获取执行SQL-所有用户
     */
	FUNCTION get_execute_sql_for_alluser() RETURN varchar;
    /**
     *  获取执行SQL
     */
	FUNCTION get_execute_sql(assignType varchar) RETURN varchar;
    /**
     * 获取关系详情
     */
	FUNCTION get_relation_by_code(code varchar) RETURN JSON;
    /**
     * 执行关系
     */
	FUNCTION execute_relation(one JSON, variables json) RETURN varchar;
	_SCHEMA_NAME VARCHAR := ''kesplus_base'';
	_TYPES VARCHAR[] := ARRAY[''user'', ''dept'', ''role'', ''position''];
	_TYPE_RELATION VARCHAR := ''relation'';
END;','CREATE OR REPLACE PACKAGE BODY "kesplus_base"."kes_plus_pkg_selector" AS WRAPPED
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
ZgQcLbB4I77PKTPOlQsfobzG0pN4IC6Rekg=
END;','package',NULL,SYSDATE,SYSDATE,NULL,NULL,NULL,'obj',13);
