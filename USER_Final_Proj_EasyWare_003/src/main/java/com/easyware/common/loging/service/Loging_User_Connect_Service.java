/**
* 작업 날짜 : 2015. 11. 29.
* 구현 내용 :   
*  
* @author By kira 
*/
package com.easyware.common.loging.service;

import com.easyware.common.security.Member_Vo_Security;

public interface Loging_User_Connect_Service {
	public Object Loging_User_Connect_List(Member_Vo_Security vo);
	public Object Loging_User_Connect_Login(Member_Vo_Security vo);
	public Object Loging_User_Connect_Login_fail(Member_Vo_Security vo);
	public Object Loging_User_Connect_Logout(Member_Vo_Security vo);
}
