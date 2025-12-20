CREATE OR REPLACE PACKAGE "kesplus_workflow"."pkg_kesplus_process_api" AUTHID CURRENT_USER AS
    /**
     * plsql-api
	 * 流程执行操作
	 * 提供给业务表单调用
	 * @param formData 表单信息,包括流程信息
	 * @param callbackProcedureName 业务表单回调函数完整名称
	 */
	PROCEDURE execute_process(formData jsonb, callbackProcedureName varchar);
	/*
	 * 
	 * plsql-api
	 * */
	FUNCTION get_his_assignee_by_task_id(v_task_id varchar) RETURNS jsonb;
		/**
	 * restful-api接口实现
	 * @Description 获取流程实例操作日志
	 * @param configId varchar 配置id
	 * @param taskId varchar 任务id
	 * RETURN 返回流程实例操作日志
	 */
	FUNCTION current_and_next_task(configId varchar, taskId varchar) RETURN JSON;
	/**
	 * restful-api接口实现
	 * @Description 流程模板部署
	 * @param processKey 流程编号/流程标识
	 * @param tenantId 租户id
	 * RETURN 返回流程编号/流程定义id/租户
	 */
	FUNCTION deployment(processKey varchar, tenantId varchar) RETURN JSON;
	/**
	 * restful-api接口实现
	 * @Description 获取当前流程节点及流程变量
	 * @param taskId 任务流程配置id
	 * RETURN 返回当前流程节点及流程变量
	 */
	FUNCTION listVariablesByProcess(configId varchar) RETURN JSON;
	
		/**
	 * restful-api接口实现
	 * @Description 获取当前任务节点及流程变量
	 * @param taskId 任务id
	 * RETURN 返回当前任务节点及流程变量
	 */
	FUNCTION listVariablesByTask(taskId varchar) RETURN JSON;
	/**
	 * restful-api接口实现
	 * @Description 流程预启动
	 * @param configId 流程配置id
	 * @param variables 流程变量/参数
	 * RETURN 返回当前节点及后续节点相关信息
	 */
	FUNCTION mockStartProcess(configId varchar, variables JSON) RETURN JSON;
	/**
	 * restful-api接口实现
	 * @Description 流程预提交
	 * @param taskId 任务流程配置id
	 * @param variables 流程变量/参数
	 * RETURN 返回当前节点及后续节点相关信息
	 */
	FUNCTION mockCompleteTask(taskId varchar, variables json) RETURN JSON;
	  /**
     * restful-api接口实现/kesplus_workflow/instance/op
	 * @Description 流程操作
	 * @param processInstanceId 流程实例id
	 * @param op 流程操作
	 * @param reason 流程操作原因流程
	 * RETURN 返回json
	 */
	FUNCTION op_process_instance(processInstanceId varchar,op varchar,reason varchar) RETURN JSON;
	
	/**
	 * restful-api接口实现
	 * @Description 撤回操作功能(审批人收回已提交的待办任务,前提是后续节点未进行审批)
	 * @param taskOpId varchar 审批人审批操作记录id
	 * @return json
	 */
	FUNCTION op_task(taskOpId varchar,op varchar,reason varchar) RETURN JSON;
	
	
	/**
	* restful-api接口实现
	* @Description 模板定义_新增
	* @param text jsonData 实体参数
	* @return json 模板定义数据
	*/
    FUNCTION add_modeler(jsonData text) RETURN JSON;
	/**
	* restful-api接口实现
	* @Description 模板定义_删除
	* @param varchar ids 模板定义多个id
	* @return boolean 操作结果
	*/
    FUNCTION del_modelers(ids varchar) RETURN boolean;
	/**
	* restful-api接口实现
	* @Description 模板定义_更新
	* @param text jsonData 实体参数
	* @return json 模板定义数据
	*/
    FUNCTION update_modeler(jsonData text) RETURN JSON;
	/**
	* restful-api接口实现
	* @Description 模板定义_详情
	* @param text 模板定义id 
	* @return json 模板定义数据
	*/
    FUNCTION get_modeler_by_id(id_ varchar) RETURN JSON;
	
	/**
	* restful-api接口实现
	* @Description 模板定义_根据流程标识查询内容
	* @param 流程标识
	* @return 模板定义内容
	*/
    FUNCTION get_xml_content(processKey varchar) RETURN varchar;
    
	/**
	* restful-api接口实现
	* @Description 模板定义_启用或挂起
	* @param id_ 模板定义id 
	* @param enabled 启用或挂起标志
	* @return boolean 操作结果
	*/
    FUNCTION disabled_modeler(id_ varchar, enabled int) RETURN boolean;
	/**
	* restful-api接口实现
	* @Description 模板定义_分页查询
	* @param text jsonData 查询条件
	* @return JSON 分页查询列表
	*/
    FUNCTION page_modeler(jsonData text) RETURN JSON;
	/**
	* restful-api接口实现
	@Description 模板定义_获取流程配置
	* @param formCode 表单编号
	* @return json 流程配置
	*/
    FUNCTION list_config_by_form(formCode varchar) RETURN JSON;
	
	
    /**
	 * restful-api接口实现
	 * @Description 模板定义_获取公共流程参数
	 */
    FUNCTION list_process_variables() RETURN JSON;
    /**
	 * restful-api接口实现
	 * @Description 模板定义_获取流程按钮
	 */
    FUNCTION list_process_buttons() RETURN JSON;
	
	
	
     /**
	 * restful-api接口实现
	 * @Description 模板定义版本_详情
	 * @param processKey 流程标识
	 * @param processVersion 流程版本
	 * @return json流程模板详情
	 */
    FUNCTION get_modeler_by_version(processKey varchar, processVersion int) RETURN JSON;
	/**
	* restful-api接口实现
	* @Description 模板定义版本_删除
	* @param varchar ids 模板定义版本多个id
	* @return boolean 操作结果
	*/
    FUNCTION del_modeler_versions(ids varchar) RETURN boolean;
	
	/**
	* restful-api接口实现
	* @Description 模板定义版本_分页
	* @param text jsonData 查询条件
	* @return JSON 分页查询列表
	*/
    FUNCTION page_modeler_versions(jsonData text) RETURN JSON;
    /**
	 * restful-api接口实现
	 * @Description 模板定义版本_激活
	 * @param id 模板定义版本id
	 * @return boolean 操作结果
	 */
    FUNCTION active_modeler_versions(id varchar) RETURN boolean;
   
     /**
	 * restful-api接口实现************、、、、、、、、、、、
	 * @Description 模板定义版本_激活
     * 获取流程配置,若版本为空,则获取当前激活版本
     * @param processKey varchar 流程标识
     * @param processVersion int 流程版本,可为空
     * @return json 版本集合
     */
    FUNCTION list_config_by_process(processKey varchar, processVersion int) RETURN JSON;
    
    /**
	 * restful-api接口实现
	 * @Description 获取流程详细定义信息(返回base64的xml数据)
	 * 优先通过processInstanceId流程实例id获取当前实例的详细定义信息(返回base64的xml数据)
	 * 最低通过processDefId流程定义id获取当前实例的详细定义信息(返回base64的xml数据)
	 * @param processInstanceId 流程实例id
	 * @param processDefId 流程定义id
	 * RETURN 返回base64的xml数据
	 */
	FUNCTION get_process_bpmn(processInstanceId varchar, processDefId varchar)RETURN TEXT;
	/**
	 * restful-api接口实现
	 * @Description 获取流程操作记录
	 * @param processInstanceId 流程实例id
	 * RETURN 返回流程操作记录
	 */
	FUNCTION get_process_detail(processInstanceId varchar)RETURN JSON;
	/**
     * restful-api接口实现/starter/page
	 * @Description 分页查询我发起的流程列表
	 * @param jsonData : 查询条件
	 * RETURN 返回我发起的流程列表表
	 */
	FUNCTION page_by_starter(jsonData TEXT) RETURN JSON;
	/**
	 * restful-api接口实现
	 * @Description 流程图
	 * @param processInstanceId : 查询条件
	 * RETURN 流程图
	 */
	FUNCTION get_process_instance_flows(processInstanceId varchar) RETURN jsonb;
	
	
	/**
     * restful-api接口实现
	 * @Description 分页查询待办任务列表
	 * @param jsonData : 查询条件
	 * RETURN 返回待办任务列表
	 */
	FUNCTION page_pending_todo(jsonData TEXT) RETURN JSON;
	/**
	 * restful-api接口实现
	 * @Description 分页查询已办任务列表
	 * @param jsonData : 查询条件
	 * RETURN 返回已办任务列表
	 */
	FUNCTION page_pending_done(jsonData TEXT) RETURN JSON;
	
	/**
	 * restful-api接口实现
	 * @Description 查询办理详情
	 * 先从已办查询，如果已办不存在则在待办进行查询
	 * @param id : 查询条件id
	 * RETURN 返回办理详情
	 */
	FUNCTION get_pending_by_id(id varchar,taskOpId varchar,pendingType varchar) RETURN JSON;
	
	FUNCTION get_pending_by_id(id varchar) RETURN JSON;
END;

CREATE OR REPLACE PACKAGE BODY "kesplus_workflow"."pkg_kesplus_process_api" AS WRAPPED
ry2n83mlcUboqmGJRfE0Oidkyz7yKUjNj9cQKtG9b5u1A4jtRBebeFyMM2ev
XsaFwV9Gqdb1MB+/XKK9Tl3fQixd/4JjRHdpcJSuSy6uMp1yBQ/Nd2Djuq1c
XmNkLin0ZeRgoOvxmt8u++nz843xXutZO9Nu14ZM1Xq0dFyTNi0hWCCR0Usu
SbZ7felgDvb7Sbgh0ebeelT2PKLpgEOtuOBKBzjDWilrx5AsHoOLeqqJwZO0
Pc+wEvmrLwvv5rqCUYjbhSSFG35vEsRtWBQbOebgIjUuV/LEXs5CECDcmw++
+usnkb5/cuCBPD8m6OdOF6y9MGzUBOnbAGKfz28hpl/SkuU0IEL3fE6VQKkY
fj5izo4GxPgPpAo2PwSQjCMhzSdTCiDGSxzj4Fu05GcoMDTXeJXS0tFaJ+Zw
aT9ciVP59r4SXgewVOYyKR03sjMRqplPc4LGr3Bb5ffwACyfUapT7pCNw3Fe
dNcfNYP8zWf3e+xUpLn8puhbhWWZYvKP5Yc8mDhlqql/eBcZeQhSxZA5JYiF
2AFUYwlEcGmVYYn/QfX5de1XRb5cn5cK5tbqce/2bCn8o1V7xZ8gKWGHuNPW
t/zZMrOm+yCaEW8KMeDnqMNos/picka1XvpXxO6VWXSW+hT4ZNEi425k5ybq
uOQ8lwsw3VisxEkrUIJq11ltJm5DzNWYH+0Bz0ak8NqWur9Kh9ZrrNc6v8h7
Rg3UYMDyASV2jfvJhXhpwhdAcEmxPVvIU8eagUZOO54rGaHZwUHuer4NiCMl
qrH2eq5/5CQeVMtb2nQQUzYItrb1VTHzl8m+qifcwvVSH/usHAdFK8r64Xbc
dO6lnG8M1k4bPZcjb6VJkt6hVNZZqevqYJXSFNwN5Nqj3t0gFAqY2923cDFn
pyJwgOLYvsBnVCrrvkJjng8leiYUAHXxYO/palxWfm8djseJnESTuTQCxBhk
2iQKw+Npo+2QjikubxpX8dAp8rMBa8FJh6wY2x4h4oTFgx/w/pHi/DKDrYjh
UM3gBRhnAz/laPqqy9MeIltJOnYTzaiuxK+sfCaXu0lfepOXtnGtfHxrSBIZ
4gB7UlJ6nIX7ovpbw1zTDY5kdoCP3MOPtKfCSqQzTZKqpP1xxzs+aYBOFWlV
ICXDhfJyfbXkB6gcToT+/xhXFICRNvbBYc/RNyqE7bgap9nNStNZCLh3L1Qz
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
zzFhra6b6GJHIIO0sXeRszfDzbxflyU=
END;

