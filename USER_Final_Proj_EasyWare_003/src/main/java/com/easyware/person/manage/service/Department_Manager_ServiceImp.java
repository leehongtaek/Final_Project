/**
* 작업 날짜 : 2015. 11. 14.
* 구현 내용 :   
*  
* @author By kira 
*/
package com.easyware.person.manage.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.easyware.person.manage.dao.Department_Manager_Dao;

@Service
public class Department_Manager_ServiceImp implements Department_Manager_Service{

	@Autowired
	private Department_Manager_Dao dao;
	
	
	@Override
	public Object department_Menager_List() {
		return dao.selectList("dept.list", "");
	}

	@Transactional
	@Override
	public Object department_Menager_Insert(String dept_name) {
		return dao.insert("dept.insert", dept_name);
	}
	
	@Transactional
	@Override
	public Object department_Menager_Update(HashMap<String, Object> data) {
		return dao.update("dept.update", data);
	}

	@Transactional
	@Override
	public Object department_Menager_Delete(int dept_num) {
		return dao.delete("dept.delete", dept_num);
	}
	
}
