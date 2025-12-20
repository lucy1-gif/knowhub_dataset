CREATE OR REPLACE PACKAGE "kesplus_workflow"."error_code" AUTHID CURRENT_USER AS
    WORKFLOW_ASSIGNEES_NULL CONSTANT TEXT := 'kesplus_workflow_1000';
    WORKFLOW_ASSIGNEES_PATH_NULL CONSTANT TEXT := 'kesplus_workflow_1001';
    WORKFLOW_PENDING_NO_EXISTS CONSTANT TEXT := 'kesplus_workflow_1002';
    WORKFLOW_PENDING_COMPLETED CONSTANT TEXT := 'kesplus_workflow_1003'; 
    WORKFLOW_PENDING_NO_PERMISSION CONSTANT TEXT := 'kesplus_workflow_1004'; 



    FLOW_ID_NULL CONSTANT TEXT := 'kesplus_workflow_1008';
    FORM_NO_IS_NULL CONSTANT TEXT := 'kesplus_workflow_1009';
    FORM_ID_IS_NULL CONSTANT TEXT := 'kesplus_workflow_1010';
    MISSING_PARAMETERS CONSTANT TEXT := 'kesplus_workflow_1011';
    UNDEFINED_PROCESS_DEFINITION CONSTANT TEXT := 'kesplus_workflow_1012'; 
    OPINIONS_IS_NULL CONSTANT TEXT := 'kesplus_workflow_1013'; 
    TASK_IS_NULL CONSTANT TEXT := 'kesplus_workflow_1014';  
    PROCESS_ID_EXISTS CONSTANT TEXT := 'kesplus_workflow_1015';
    PROCESS_NOT_PUBLISH CONSTANT TEXT := 'kesplus_workflow_1016';
    PROCESS_VARIABLE_EMPTY CONSTANT TEXT := 'kesplus_workflow_1017';
    PROCESS_NOT_SPECIFIED CONSTANT TEXT := 'kesplus_workflow_1018'; 
    APPROVER_NOT_SPECIFIED CONSTANT TEXT := 'kesplus_workflow_1019'; 
    USERS_NOT_NULL CONSTANT TEXT := 'kesplus_workflow_1020'; 
    PREV_TASK_OP_ID_NULL CONSTANT TEXT := 'kesplus_workflow_1021'; 
    REJECTFIRSTTASK_NOT_SUPPORT CONSTANT TEXT := 'kesplus_workflow_1022'; 
    START_PROCESS_FAIL CONSTANT TEXT := 'kesplus_workflow_1023'; 
    CALLBACK_ERROR CONSTANT TEXT := 'kesplus_workflow_1024'; 
    NOT_SUPPORT_WITHDRAW CONSTANT TEXT := 'kesplus_workflow_1025'; 
    ENTER_DATA_NULL CONSTANT TEXT := 'kesplus_workflow_1026'; 
    SELECT_DELETE_DATA CONSTANT TEXT := 'kesplus_workflow_1027'; 
    PUBLISHED_PROCESS_NOT_DELETE CONSTANT TEXT := 'kesplus_workflow_1028'; 
    ACTIVE_PROCESS_NOT_DELETE CONSTANT TEXT := 'kesplus_workflow_1029'; 
    ID_NOT_NULL CONSTANT TEXT := 'kesplus_workflow_1030'; 
    MODELER_NOT_EXISTS CONSTANT TEXT := 'kesplus_workflow_1031'; 
    PROCESS_TYPE_ERROR CONSTANT TEXT := 'kesplus_workflow_1032'; 
    ACTIVE_PROCESS_NOT_UPDATE CONSTANT TEXT := 'kesplus_workflow_1033'; 
    PROCESS_VERSION_ERROR CONSTANT TEXT := 'kesplus_workflow_1034'; 
    PROCESS_NOT_EXISTS CONSTANT TEXT := 'kesplus_workflow_1035'; 
    FORM_CODE_NOT_NULL CONSTANT TEXT := 'kesplus_workflow_1036'; 
    PROCESS_DEFINITION_NOT_EXISTS CONSTANT TEXT := 'kesplus_workflow_1037'; 
    PROCESS_DEFINITION_ERROR CONSTANT TEXT := 'kesplus_workflow_1038'; 
    PROCESS_KEY_NOT_NULL CONSTANT TEXT := 'kesplus_workflow_1039'; 
    MODELER_IS_NULL CONSTANT TEXT := 'kesplus_workflow_1040'; 
    PARSER_EX_ERROR CONSTANT TEXT := 'kesplus_workflow_1041'; 
    KESBPMNDATA_SUBMIT_ERROR CONSTANT TEXT := 'kesplus_workflow_1042'; 
    CONDITION_IS_NOT_EXISTS CONSTANT TEXT := 'kesplus_workflow_1043'; 
    TASKID_IS_NULL CONSTANT TEXT := 'kesplus_workflow_1044'; 
    TASKID_NOT_EXISTS CONSTANT TEXT := 'kesplus_workflow_1045'; 
    TASKDEFKEY_NOT_EXISTS CONSTANT TEXT := 'kesplus_workflow_1046'; 
    NEXTTASKNODE_ERROR CONSTANT TEXT := 'kesplus_workflow_1047'; 
    ENDNODE_IS_NULL CONSTANT TEXT := 'kesplus_workflow_1048'; 
    PROCESS_DEFINITION_NOT_NULL CONSTANT TEXT := 'kesplus_workflow_1049'; 
    NEXTTASKDEF_ERROR CONSTANT TEXT := 'kesplus_workflow_1050'; 
    NEXTTASKDEFKEY_MORE CONSTANT TEXT := 'kesplus_workflow_1051'; 
    PROCESS_INSTANCE_ID_NOT_EXISTS CONSTANT TEXT := 'kesplus_workflow_1052'; 
    ASSIGNEE_USER_NOT_EXISTS CONSTANT TEXT := 'kesplus_workflow_1053'; 
    CALCULATE_ERROR CONSTANT TEXT := 'kesplus_workflow_1054'; 
    USER_TASK_ERROR CONSTANT TEXT := 'kesplus_workflow_1055'; 
    USER_REJECT_TASK_ERROR CONSTANT TEXT := 'kesplus_workflow_1056'; 
 
    PROCEDURE exception(v_code TEXT,v_cn_msg TEXT,v_en_msg TEXT);
    
    PROCEDURE exception(v_code text, v_array varchar[],v_cn_msg TEXT,v_en_msg TEXT);
    
    PROCEDURE exception(v_code text, v_msg text,v_cn_msg TEXT,v_en_msg TEXT);
    PROCEDURE insert_i18n(v_code text, v_cn_msg TEXT,v_en_msg TEXT);
end;

CREATE OR REPLACE PACKAGE BODY "kesplus_workflow"."error_code" AS WRAPPED
wypMLXfr9S2VPyB/zrYi9yunXtPKl0Jb11kbp4klN3LMAFGiNC7DAt4wKLIT
uYq5jyOzlSmLq7cmhhGPl3p7a9H8Aq1PYyAw8nR2c+V/hylaaCEK6U5AhrLv
0vlcFrtw+yQD9/3j+kmNivnM0RJN1MH7TJog1VK8xz593/jrMQ6asR5pFfnP
X3DvSn8fOGLRbdskx5qe7U49rYPm6ATM7244590jCVmUTIPwzx5nba8tnCTV
gSeSevYYqx6Ci6b2wypMLXfr9S2VPyB/zrYi9yunXtPKl0Jb11kbp4klN3Lr
DFy2WGYW+XQoVg0P097lhUaRz+glfkkOpVieUOzNY8ivJoByWo7tvVX9ZeVu
7VNxddrYJhJUPUEY0e7h05mQWNJaluvKD9OSxYVjOw7dBe7g5Q1efDUs+1IL
63EmPMRcxoTz+d1un0U/CVbuTMRC6tFMpKtdtQrg0Eiar8MTCUkH+UM2VKXX
fIj6xln7gchuCQsLO9hqVG0re8ZacU3YaaKvGW5Pr6q/fOFDK368UKy0CTyr
zrN4+4PMRWz3HhFsYnVSHTa6y+G1XBtg0zNUD9xGBhvUdreqTIuPe6vTwk72
wIJssAmsXj7xxZW3CNZVcfzhWEMitPsEbHavQyOV9nFTUFmpIeqai8g+LmJx
PPD91XOM/uF+fiSBqMlHOH80gv4CldSxM/8oJY/qfBtEc18nhWwqgMNhOpwV
A0+eIyetMsTFtEDK63FF/LJtLayDpQ8XXkpoMxhUZ3ZxCEuF3xUDRFIByIx8
Z0egQjtBNTZrNNbXrfiiESgFn4KPJOenYTEDgWPAC+CvW2Nb1ZvA7GimXA22
6CtbIFu8AO7FsDMao9uZojwYiZFGnZXx3eIBkMYFsIm1VrshcE8IVSoljyOz
lSmLq7cmhhGPl3p7a9H8Aq1PYyAw8nR2c+V/hylv2yGXCNfrvFUIBCjO8wVP
ftEdnNyb0n31vD7C4qIBeDcIK5yGEmKhdVpXwEHlq/iNjS1qSLdL0ps96x6b
ryhcl0z95qP4onj7qGkmP9A7jyo9kcD67IsERifpWi4f/d8L4tz7Udvlck31
xm44qhDdwbsYbFEnQgMLakhcVmNtj0pg5cyOmmUa9UGnqx81OSxwLfFCFjYJ
CCq1kCE6tSdu5dhynicPzeZZha2HolvEt35KDWvEt7N8l4eTK6/2C40gW9RH
vfWlBW5LIWaYkoj+ywH9yr+tVr3zAr7/rqtQsXMGBFrj9eSwdtQJkPoM1yqJ
CkJJ83pmdb4BzcURUUDAdnZZ9k6nfuRad64SqjHMThaEmLvxEXaM8ixaJEdd
SCDptWYEU6Mo564kBaSm6KbMaOcNt8i9XmN6D1dn0VcX3ADVmVs4JSNrmkUu
mY+o1i3CgEFG677f/XOmlRa7xK+StlSny0n/WQ7wk3+h9O7QBFYpZMBIjRFJ
3QO0Nnh2Fr/f3I8FBdxTD0Pm5G5Eel+f
END;

