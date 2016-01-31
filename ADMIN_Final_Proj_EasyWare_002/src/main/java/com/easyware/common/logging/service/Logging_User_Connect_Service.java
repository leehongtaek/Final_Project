/**
* 작업 날짜 : 2015. 11. 29.
* 구현 내용 :   
*  
* @author By kira 
*/
package com.easyware.common.logging.service;

import java.util.HashMap;

import com.easyware.common.security.Member_Vo_Security;

public interface Logging_User_Connect_Service {
	public Object[] Logging_User_Connect_List(HashMap<String, Object> data);
	public Object[] Logging_User_Connect_Search_List(HashMap<String, Object> data);
	public Object Logging_User_Connect_Login(Member_Vo_Security vo);
	public Object Logging_User_Connect_Login_fail(Member_Vo_Security vo);
	public Object Logging_User_Connect_Logout(Member_Vo_Security vo);
}
