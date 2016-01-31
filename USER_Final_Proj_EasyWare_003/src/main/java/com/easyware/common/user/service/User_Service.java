/**
* 작업 날짜 : 2015. 11. 12.
* 구현 내용 :   
*  
* @author By Byeong Gi Kim 
*/
package com.easyware.common.user.service;

public interface User_Service {
	public Object user_Add(Object... params);
	public Object user_Modify(Object... params);
	public Object user_Destory(Object... params);
	public Object user_Search_Dept(Object... params);
	public Object user_Search_Posit(Object... params);
	public Object user_idChk(Object... params);
	public Object user_email_send(Object... params);
	public Object user_search_List(Object... params);
}
