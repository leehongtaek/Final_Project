/**
* 작업 날짜 : 2015. 11. 17.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.easyware.report.service;

import java.util.HashMap;

public interface Report_Workflow_Service {
	
	public Object workflow_Add(Object... params);
	public Object workflow_Modify(Object... params);
	public Object workflow_Delete(Object... params);
	public Object workflow_Detail(Object... params);
	public Object workflow_List(Object... params);
	public Object workflow_List_Paging(HashMap<String, Object> map);
	public Object workflow_Search(Object... params);
	public Object workflow_Total(Object... params);
	public Object workflow_ApprMember_List(Object... params);
	public Object report_Index_Count(Object... params);
	
	
}
