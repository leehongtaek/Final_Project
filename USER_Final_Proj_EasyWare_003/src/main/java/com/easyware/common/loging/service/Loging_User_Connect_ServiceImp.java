/**
* 작업 날짜 : 2015. 11. 29.
* 구현 내용 :   
*  
* @author By kira 
*/
package com.easyware.common.loging.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easyware.common.loging.dao.Logging_Dao;
import com.easyware.common.security.Member_Vo_Security;

@Service
public class Loging_User_Connect_ServiceImp implements Loging_User_Connect_Service{

	@Autowired
	private Logging_Dao dao;
	
	@Override
	public Object Loging_User_Connect_List(Member_Vo_Security vo) {
		
		return null; 
	}


	@Override
	public Object Loging_User_Connect_Login(Member_Vo_Security vo) {
		dao.insert("loging_user_connect.login", vo);
		return null;
	}

	@Override
	public Object Loging_User_Connect_Login_fail(Member_Vo_Security vo) {
		dao.insert("loging_user_connect.login_fail", vo);
		return null;
	}

	@Override
	public Object Loging_User_Connect_Logout(Member_Vo_Security vo) {
		dao.insert("loging_user_connect.logout", vo);
		return null;
	}

}
