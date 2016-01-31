/**
* 작업 날짜 : 2015. 11. 17.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.easyware.report.service;


public interface Report_Doc_Service {
	
	public Object doc_Add(Object... params);
	public Object doc_Modify(Object... params);
	public Object doc_Delete(Object... params);
	public Object doc_Detail(Object... params);
	public Object doc_List(Object... params);
	public Object doc_getForm(Object... params);
}
