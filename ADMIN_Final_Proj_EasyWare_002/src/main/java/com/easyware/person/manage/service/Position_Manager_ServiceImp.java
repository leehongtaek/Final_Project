/**
* 작업 날짜 : 2015. 11. 17.
* 구현 내용 :   
*  
* @author By Byeong Gi Kim 
*/
package com.easyware.person.manage.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easyware.person.manage.dao.Position_Manager_Dao;

@Service
public class Position_Manager_ServiceImp implements Position_Manager_Service{

	@Autowired
	private Position_Manager_Dao dao;

	@Override
	public Object position_Menager_List() {
		return dao.selectList("posit.list", "");
	}

	@Override
	public Object position_Menager_Insert(String posit_name) {
		return dao.insert("posit.insert", posit_name);
	}

	@Override
	public Object position_Menager_Update(HashMap<String, Object> data) {
		return dao.update("posit.update", data);
	}

	@Override
	public Object position_Menager_Delete(int posit_num) {
		return dao.delete("posit.delete", posit_num);
	}
	




}
