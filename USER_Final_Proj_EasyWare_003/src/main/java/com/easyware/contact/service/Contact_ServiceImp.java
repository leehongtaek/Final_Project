/**
* 작업 날짜 : 2015. 11. 16.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.easyware.contact.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easyware.common.user.vo.Member_Vo;
import com.easyware.contact.dao.Contact_Dao;

@Service
public class Contact_ServiceImp implements Contact_Service {
	
	@Autowired
	private Contact_Dao dao;
	
	@Override
	public Object contact_Add(Object... params) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object contact_Modify(Object... params) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object contact_Destory(Object... params) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object contact_Search(Object... params) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object[] contact_List(HashMap<String, Object> data) {
	
		return null;
	}

	@Override
	public Object contact_ListTest(Object... params) {
		return dao.selectList("contact.listAll",params[0]);
	}

	@Override
	public Object contact_Total(Object... params) {
		return dao.selectOne("contact.total", params[0]);
	}

	@Override
	public Object contact_pagingList(HashMap<String, Object> map) {

		return dao.selectList("contact.paging", map);
	}

}
