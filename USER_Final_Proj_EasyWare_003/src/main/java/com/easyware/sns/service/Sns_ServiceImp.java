/**
* 작업 날짜 : 2015. 11. 16.
* 구현 내용 :   
*  
* @author By kosta 
*/
package com.easyware.sns.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easyware.sns.dao.Sns_Dao;
import com.easyware.sns.vo.Sns_Vo;

@Service
public class Sns_ServiceImp implements Sns_Service{

	@Autowired
	private Sns_Dao dao;

	@Override
	public Object sns_Add(Sns_Vo vo) {
		dao.insert("sns.insert", vo);
		return null;
	}

	@Override
	public Object sns_Modify(int sns_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object sns_Destory(Object... params) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object sns_Search(Object... params) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Sns_Vo> sns_list_prepend(HashMap<String, Object> data) {
		
		return (List<Sns_Vo>)dao.selectList("sns.listget", data);
	}

	@Override
	public List<Sns_Vo> sns_list_first(HashMap<String, Object> data) {
		
		return (List<Sns_Vo>)dao.selectList("sns.firstlist", data);
	}

	@Override
	public List<Sns_Vo> sns_list_append(HashMap<String, Object> data) {
		//dao.selectList("sns.listlog", data);
		return (List<Sns_Vo>)dao.selectList("sns.listlog", data);
	}

	
	

}
