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

import com.easyware.person.manage.dao.Person_Manager_Dao;
import com.easyware.person.manage.vo.Person_Vo;
import com.easyware.utility.PagingUtill;

@Service
public class Person_Manager_ServiceImp implements Person_Manager_Service{
	
	
	@Autowired
	private Person_Manager_Dao dao;
	
	@Transactional
	@Override
	public Object[] person_Manage_List(HashMap<String, Object> data) {
		int total_record =(int) dao.selectOne("person.totalcnt","");
		PagingUtill utill = new PagingUtill(total_record, 10, 5, (int) data.get("currentpage"));
		// 반환되는 result 실제 데이터 , 페이징에 필요한 데이터 
		Object[] result= {dao.selectList("person.list", utill.page_dataMap()),utill.page_dataMap()};
		return result;
	}
	
	@Transactional
	@Override
	public void person_Manage_Update(Person_Vo vo) {
		dao.update("person.update", vo);
	}
	
	@Transactional
	@Override
	public Person_Vo person_Manage_Detail(Person_Vo vo) {
		String mem_code=vo.getMem_code();
		return (Person_Vo) dao.selectOne("person.info", mem_code);
	}

	@Override
	public Object[] person_Manage_Search_List(HashMap<String, Object> data) {
		int total_record =(int) dao.selectOne("person.searchTotalcnt", data);
		PagingUtill utill = new PagingUtill(total_record, 10, 5, (int) data.get("currentpage"));
		// 검색 데이터 병합
		data.putAll(utill.page_dataMap());
		// 반환되는 result 실제 데이터 , 페이징에 필요한 데이터  
		Object[] result= {dao.selectList("person.searchList", data),utill.page_dataMap()};
		return result;
	}
	
}
