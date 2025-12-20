
/*流程操作*/
INSERT INTO kesplus_workflow.kesplus_module_permission ("id","module_code","dept_id","name","code","obj_type","parent_id","status","create_by","create_time","update_by","update_time","module_id","remark","sort_num") VALUES
	('388ec252d8104e2f84b105dd11416efc','kesplus_workflow','0','流程操作','workflowprocess','dir','14','1','0',SYSDATE,NULL,NULL,'aa428946184940fd91ed903e6791b095',NULL,NULL),
	('a45dd81e232d4036b989d0a5f3285ce8','kesplus_workflow','0','流程启动执行','workflow:POST:start','obj','388ec252d8104e2f84b105dd11416efc','1','546508b9842c4e3698a1f2d3ae6fa917',SYSDATE,NULL,NULL,'aa428946184940fd91ed903e6791b095',NULL,NULL),
    ('FBF6A4B8C2E44CDD80764CEDBCD8EA2A','kesplus_workflow','0','流程预启动  ','workflow:POST:mockstart','obj','388ec252d8104e2f84b105dd11416efc','1','546508b9842c4e3698a1f2d3ae6fa917',SYSDATE,NULL,NULL,'aa428946184940fd91ed903e6791b095',NULL,NULL),
	('0F68EABF8AEF454FA34047C8D2ABDD9B','kesplus_workflow','0','流程处理执行','workflow:POST:complete','obj','388ec252d8104e2f84b105dd11416efc','1','546508b9842c4e3698a1f2d3ae6fa917',SYSDATE,NULL,NULL,'aa428946184940fd91ed903e6791b095',NULL,NULL),
	('01643E4E477D43208F81A998BCE08F37','kesplus_workflow','0','流程预处理','workflow:POST:mockcomplete','obj','388ec252d8104e2f84b105dd11416efc','1','546508b9842c4e3698a1f2d3ae6fa917',SYSDATE,NULL,NULL,'aa428946184940fd91ed903e6791b095',NULL,NULL),
	('A340F00D3F734FB9A41604F36723A8AD','kesplus_workflow','0','流程撤销','workflow:POST:process_retract','obj','388ec252d8104e2f84b105dd11416efc','1','546508b9842c4e3698a1f2d3ae6fa917',SYSDATE,NULL,NULL,'aa428946184940fd91ed903e6791b095',NULL,NULL),
	('0F003BA3DBDF4B12B1D5B3181AF915D2','kesplus_workflow','0','任务撤回','workflow:POST:task_cancel','obj','388ec252d8104e2f84b105dd11416efc','1','546508b9842c4e3698a1f2d3ae6fa917',SYSDATE,NULL,NULL,'aa428946184940fd91ed903e6791b095',NULL,NULL),
    ('F41B7328849B41E5B8F9D28E48FA5EED','kesplus_workflow','0','流程实例详情','workflow:GET:instance_detail','obj','388ec252d8104e2f84b105dd11416efc','1','546508b9842c4e3698a1f2d3ae6fa917',SYSDATE,NULL,NULL,'aa428946184940fd91ed903e6791b095',NULL,NULL),
	('F08B64E9BC8646ED90911BECDE6F084E','kesplus_workflow','0','流程实例操作日志','workflow:GET:instance_log','obj','388ec252d8104e2f84b105dd11416efc','1','546508b9842c4e3698a1f2d3ae6fa917',SYSDATE,NULL,NULL,'aa428946184940fd91ed903e6791b095',NULL,NULL),
	('F25038C28DC34999B8FDD16392503EA8','kesplus_workflow','0','获取当前流程节点及流程变量','workflow:GET:process_currentAndVariables','obj','388ec252d8104e2f84b105dd11416efc','1','546508b9842c4e3698a1f2d3ae6fa917',SYSDATE,NULL,NULL,'aa428946184940fd91ed903e6791b095',NULL,NULL),
	('C14DD8D1565648EC95B086715A81D598','kesplus_workflow','0','获取当前任务节点及流程变量','workflow:GET:task_currentAndVariables','obj','388ec252d8104e2f84b105dd11416efc','1','546508b9842c4e3698a1f2d3ae6fa917',SYSDATE,NULL,NULL,'aa428946184940fd91ed903e6791b095',NULL,NULL),
	('CA333DA423924DDF80C87CDAB29B3F5E','kesplus_workflow','0','获取流程追踪记录','workflow:GET:log_flows','obj','388ec252d8104e2f84b105dd11416efc','1','546508b9842c4e3698a1f2d3ae6fa917',SYSDATE,NULL,NULL,'aa428946184940fd91ed903e6791b095',NULL,NULL),
	('6204A4160C4F426091F5A09D18F37E30','kesplus_workflow','0','获取流程实例操作日志','workflow:GET:log_currentAndNext','obj','388ec252d8104e2f84b105dd11416efc','1','546508b9842c4e3698a1f2d3ae6fa917',SYSDATE,NULL,NULL,'aa428946184940fd91ed903e6791b095',NULL,NULL),
    ('1A5E721B8C634857930824564A058B44','kesplus_workflow','0','任务驳回','workflow:POST:task_reject','obj','388ec252d8104e2f84b105dd11416efc','1','546508b9842c4e3698a1f2d3ae6fa917',SYSDATE,NULL,NULL,'aa428946184940fd91ed903e6791b095',NULL,NULL);

/*流程建模*/
INSERT INTO kesplus_workflow.kesplus_module_permission ("id","module_code","dept_id","name","code","obj_type","parent_id","status","create_by","create_time","update_by","update_time","module_id","remark","sort_num") VALUES
	/* ('ad5ff20030d6443ca00cb5f4e1d6bdbc','kesplus_workflow','0','流程建模','workflowdesign','dir','14','1','0',SYSDATE,NULL,NULL,'aa428946184940fd91ed903e6791b095',NULL,NULL) */
    ('160b87e1e6b24afb8dbc510317af194b','kesplus_workflow','0','模板新增','modeler:POST:add','obj','ad5ff20030d6443ca00cb5f4e1d6bdbc','1','546508b9842c4e3698a1f2d3ae6fa917',SYSDATE,NULL,NULL,'aa428946184940fd91ed903e6791b095',NULL,NULL),
	('1085761a76dd49aeb9f9a08cd77ce1bc','kesplus_workflow','0','模板删除','modeler:DELETE:del','obj','ad5ff20030d6443ca00cb5f4e1d6bdbc','1','546508b9842c4e3698a1f2d3ae6fa917',SYSDATE,NULL,NULL,'aa428946184940fd91ed903e6791b095',NULL,NULL),
	('559edcf722fa429ebcea7083654dded3','kesplus_workflow','0','模板更新','modeler:PUT:update','obj','ad5ff20030d6443ca00cb5f4e1d6bdbc','1','546508b9842c4e3698a1f2d3ae6fa917',SYSDATE,NULL,NULL,'aa428946184940fd91ed903e6791b095',NULL,NULL),
	('2d6ffebb284d4d86afe919f728019446','kesplus_workflow','0','模板查询','modeler:GET:page','obj','ad5ff20030d6443ca00cb5f4e1d6bdbc','1','546508b9842c4e3698a1f2d3ae6fa917',SYSDATE,NULL,NULL,'aa428946184940fd91ed903e6791b095',NULL,NULL),
	('ce73a45055234bc186b74d29013e1dc8','kesplus_workflow','0','获取模板详情','modeler:GET:detail','obj','ad5ff20030d6443ca00cb5f4e1d6bdbc','1','546508b9842c4e3698a1f2d3ae6fa917',SYSDATE,NULL,NULL,'aa428946184940fd91ed903e6791b095',NULL,NULL),
	('dab7e26eef934834bb605e6f4e67d6ab','kesplus_workflow','0','获取模板对应流程按钮','modeler:GET:buttons','obj','ad5ff20030d6443ca00cb5f4e1d6bdbc','1','546508b9842c4e3698a1f2d3ae6fa917',SYSDATE,NULL,NULL,'aa428946184940fd91ed903e6791b095',NULL,NULL),
	('62b5c41c2f3248888debdfd921f5d423','kesplus_workflow','0','获取模板对应公共流程参数','modeler:GET:variables','obj','ad5ff20030d6443ca00cb5f4e1d6bdbc','1','546508b9842c4e3698a1f2d3ae6fa917',SYSDATE,NULL,NULL,'aa428946184940fd91ed903e6791b095',NULL,NULL),
    ('1d2cd141df174042b55d0879f394fffb','kesplus_workflow','0','模板启用或挂起','modeler:PUT:disable','obj','ad5ff20030d6443ca00cb5f4e1d6bdbc','1','546508b9842c4e3698a1f2d3ae6fa917',SYSDATE,NULL,NULL,'aa428946184940fd91ed903e6791b095',NULL,NULL),
	('58563673a0014030bcd844dbe1e2945d','kesplus_workflow','0','获取模板对应流程图','modeler:GET:content','obj','ad5ff20030d6443ca00cb5f4e1d6bdbc','1','546508b9842c4e3698a1f2d3ae6fa917',SYSDATE,NULL,NULL,'aa428946184940fd91ed903e6791b095',NULL,NULL),
    ('5fb7d2d6c6164e5c891eb2e6dee7f98d','kesplus_workflow','0','获取模板对应取流程配置','modeler:GET:config','obj','ad5ff20030d6443ca00cb5f4e1d6bdbc','1','546508b9842c4e3698a1f2d3ae6fa917',SYSDATE,NULL,NULL,'aa428946184940fd91ed903e6791b095',NULL,NULL),

	('b8d2f9adb83b45f9a6fe34662ecc7a92','kesplus_workflow','0','模板版本查询','modeler_version:GET:page','obj','ad5ff20030d6443ca00cb5f4e1d6bdbc','1','546508b9842c4e3698a1f2d3ae6fa917',SYSDATE,NULL,NULL,'aa428946184940fd91ed903e6791b095',NULL,NULL),
	('1417c98fbe6a4ece813fbbe3d45bc97a','kesplus_workflow','0','模板版本删除','modeler_version:DELETE:del','obj','ad5ff20030d6443ca00cb5f4e1d6bdbc','1','546508b9842c4e3698a1f2d3ae6fa917',SYSDATE,NULL,NULL,'aa428946184940fd91ed903e6791b095',NULL,NULL),
	('9227fa93b9dd45eebb6cf7b1b9d3fa38','kesplus_workflow','0','获取模板版本详情','modeler_version:DELETE:del','obj','ad5ff20030d6443ca00cb5f4e1d6bdbc','1','546508b9842c4e3698a1f2d3ae6fa917',SYSDATE,NULL,NULL,'aa428946184940fd91ed903e6791b095',NULL,NULL),
	('a11751ab862743238ea12fbae97ffef9','kesplus_workflow','0','模板版本激活','modeler_version:PUT:active','obj','ad5ff20030d6443ca00cb5f4e1d6bdbc','1','546508b9842c4e3698a1f2d3ae6fa917',SYSDATE,NULL,NULL,'aa428946184940fd91ed903e6791b095',NULL,NULL),
	('415745dd85684f889904f5cbeec39c11','kesplus_workflow','0','流程模板发布','modeler_deployment:POST:deployment','obj','ad5ff20030d6443ca00cb5f4e1d6bdbc','1','546508b9842c4e3698a1f2d3ae6fa917',SYSDATE,NULL,NULL,'aa428946184940fd91ed903e6791b095',NULL,NULL);

/*我发起的-待办任务-已办流程*/
INSERT INTO kesplus_workflow.kesplus_module_permission ("id","module_code","dept_id","name","code","obj_type","parent_id","status","create_by","create_time","update_by","update_time","module_id","remark","sort_num") VALUES
	/*
	('c857eb980b764926b0cd81a577ca3cae','kesplus_workflow','0','我发起的','workflowlaunch','dir','14','1','0',SYSDATE,NULL,NULL,'aa428946184940fd91ed903e6791b095',NULL,NULL),
	('1ce2974e3afe4a77a10890924301a903','kesplus_workflow','0','待办任务','workflowtodo','dir','14','1','0',SYSDATE,NULL,NULL,'aa428946184940fd91ed903e6791b095',NULL,NULL),
	('52e6643983044ab5beebd9f834399aa5','kesplus_workflow','0','已办流程','workflowdone','dir','14','1','0',SYSDATE,NULL,NULL,'aa428946184940fd91ed903e6791b095',NULL,NULL)
	 */
	('e8f9af9fa6b24909be62dc5ef539934e','kesplus_workflow','0','我发起的查询','workflow_starter:GET:page','obj','c857eb980b764926b0cd81a577ca3cae','1','546508b9842c4e3698a1f2d3ae6fa917',SYSDATE,NULL,NULL,'aa428946184940fd91ed903e6791b095',NULL,NULL),
	('171defea52d24981af58ab943717ba96','kesplus_workflow','0','待办任务查询','workflow_todo:GET:page','obj','1ce2974e3afe4a77a10890924301a903','1','546508b9842c4e3698a1f2d3ae6fa917',SYSDATE,NULL,NULL,'aa428946184940fd91ed903e6791b095',NULL,NULL),
	('374c0abf30a84d86b5252a28c2b26b78','kesplus_workflow','0','已办流程查询','workflow_done:GET:page','obj','52e6643983044ab5beebd9f834399aa5','1','546508b9842c4e3698a1f2d3ae6fa917',SYSDATE,NULL,NULL,'aa428946184940fd91ed903e6791b095',NULL,NULL);


INSERT INTO kesplus_workflow.kesplus_module_permission ("id","module_code","dept_id","name","code","obj_type","parent_id","status","create_by","create_time","update_by","update_time","module_id","remark","sort_num") VALUES
	 ('ed941eb3beb643fa9dbdee3b0bb6d841','kesplus_workflow',NULL,'流程操作','workflow:POST:process_op','obj','388ec252d8104e2f84b105dd11416efc','1','546508b9842c4e3698a1f2d3ae6fa917','''2024-08-29 16:09:02''',NULL,NULL,'aa428946184940fd91ed903e6791b095',NULL,1),
	 ('ec477d5ca0e4434fb9632386f343011f','kesplus_workflow',NULL,'待阅事宜查询','workflow_review:GET:page','obj','67133038befd435ea2d0a372aab567a9','1','546508b9842c4e3698a1f2d3ae6fa917','''2024-09-09 15:06:11''',NULL,NULL,'aa428946184940fd91ed903e6791b095',NULL,1),
	 ('ee3211853a854726991b7436f22f55cb','kesplus_workflow',NULL,'已阅事宜查询','workflow_read:GET:page','obj','6eea2a29eb5440e79b8339668632148e','1','546508b9842c4e3698a1f2d3ae6fa917','''2024-09-09 15:06:46''',NULL,NULL,'aa428946184940fd91ed903e6791b095',NULL,1);