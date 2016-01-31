/**
* 작업 날짜 : 2015. 11. 17.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.easyware.report.service;


public interface Report_Approval_Service {
	
	public Object approval_Add(Object... params);
	public Object approval_Modify(Object... params);
	public Object approval_Delete(Object... params);
	public Object approval_Detail(Object... params);
	public Object approval_List(Object... params);
	public Object approval_Search(Object... params);
	public Object approval_Total(Object... params);
	public Object approval_Count(Object... params);
	public Object approval_Refuse_Modify(Object... params);
	public Object report_Refuse_Modify(Object... params);
	public Object[] report_Modify_Detail(Object... params);
	

	
}
