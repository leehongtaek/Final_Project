/**
* 작업 날짜 : 2015. 11. 29.
* 구현 내용 :   
*  
* @author By kira 
*/
package com.easyware.common.logging.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easyware.common.logging.dao.Logging_Dao;
import com.easyware.common.security.Member_Vo_Security;
import com.easyware.utility.PagingUtill;

@Service
public class Logging_User_Connect_ServiceImp implements Logging_User_Connect_Service{

	@Autowired
	private Logging_Dao dao;
	
	@Override
	public Object[] Logging_User_Connect_Search_List(HashMap<String, Object> data) {
		System.err.println(":::::::::::::::::::::::::::::::::::::::::::::::::::::::");
		int total_record= (int)dao.selectOne("logging_user_connect.cnt_search_list", data);
		System.err.println(":::::::::::::::::::::::::::::::::::::::::::::::::::::::");
		int page_per_record_cnt = (int) data.get("page_per_record_cnt");
		int group_per_page_cnt= (int) data.get("group_per_page_cnt");
		int currentpage= (int) data.get("currentpage");
		 
		if (page_per_record_cnt ==0) page_per_record_cnt = 10;
		if (group_per_page_cnt ==0) group_per_page_cnt = 3;
		if (currentpage==0) currentpage=1;
		PagingUtill pu =  new PagingUtill(total_record, page_per_record_cnt, group_per_page_cnt, currentpage);
		
		data.putAll(pu.page_dataMap());
		
		return new Object[]            
				{   
				dao.selectList("logging_user_connect.search_list",data) , pu.page_dataMap()
				};
	}
	
	
	@Override
	public Object[] Logging_User_Connect_List(HashMap<String, Object> data) {
		int total_record= (int)dao.selectOne("logging_user_connect.cnt_list", "");
		
		int page_per_record_cnt = (int) data.get("page_per_record_cnt");
		int group_per_page_cnt= (int) data.get("group_per_page_cnt");
		int currentpage= (int) data.get("currentpage");
		 
		if (page_per_record_cnt ==0) page_per_record_cnt = 10;
		if (group_per_page_cnt ==0) group_per_page_cnt = 3;
		if (currentpage==0) currentpage=1;
		
		PagingUtill pu =  new PagingUtill(total_record, page_per_record_cnt, group_per_page_cnt, currentpage);
		data.putAll(pu.page_dataMap());
		
		return new Object[]          
				{ 
				dao.selectList("logging_user_connect.list",data), pu.page_dataMap()
				};
	}


	@Override
	public Object Logging_User_Connect_Login(Member_Vo_Security vo) {
		dao.insert("loging_user_connect.login", vo);
		return null;
	}

	@Override
	public Object Logging_User_Connect_Login_fail(Member_Vo_Security vo) {
		dao.insert("loging_user_connect.login_fail", vo);
		return null;
	}

	@Override
	public Object Logging_User_Connect_Logout(Member_Vo_Security vo) {
		dao.insert("loging_user_connect.logout", vo);
		return null;
	}


	

}
