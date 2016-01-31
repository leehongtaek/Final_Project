/**
* 작업 날짜 : 2015. 11. 12.
* 구현 내용 :   
*  
* @author By Byeong Gi Kim 
*/
package com.easyware.common.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.easyware.common.user.dao.User_Dao;

@Service
public class User_ServiceImp implements User_Service{

	@Autowired
	private User_Dao dao;
	
	@Transactional
	@Override
	public Object user_Add(Object... params) {
		return dao.insert("user.add", params[0]);
	}

	@Override
	public Object user_Modify(Object... params) {
		
		return null;
	}

	@Override
	public Object user_Destory(Object... params) {
		return dao.update("user.profile_update", params[0]);
	}


	@Override
	public Object user_idChk(Object... params) {
		return dao.selectOne("user.idcheck", params[0]);
	}

	@Override
	public Object user_Search_Dept(Object... params) {
		return dao.selectList("user.deptInfo", "");
	}

	@Override
	public Object user_Search_Posit(Object... params) {
		return dao.selectList("user.positInfo", "");
	}

	@Override
	public Object user_email_send(Object... params) {
		return dao.selectOne("user.email_check", params[0]);
	}

	@Override
	public Object user_search_List(Object... params) {
		return dao.selectList("user.user_search_list", params[0]);
		
	}
	
	
	
}
