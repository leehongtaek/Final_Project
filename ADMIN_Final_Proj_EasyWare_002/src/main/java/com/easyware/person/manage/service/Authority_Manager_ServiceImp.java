/**
* 작업 날짜 : 2015. 11. 18.
* 구현 내용 :   
*  
* @author By Byeong Gi Kim 
*/
package com.easyware.person.manage.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.easyware.person.manage.dao.Authority_Manager_Dao;
import com.easyware.person.manage.vo.Authority_Vo;
import com.easyware.utility.PagingUtill;

@Service
public class Authority_Manager_ServiceImp implements Authority_Manager_Service{

	@Autowired
	private Authority_Manager_Dao dao;
	
	@Override
	public Object[] authority_Menager_List(HashMap<String,Object> data) {
		int res = (int) dao.selectOne("auth.totalCnt", "");
		PagingUtill pUtill = new PagingUtill(res, 10,5 , (int)data.get("currentpage"));
		data.putAll(pUtill.page_dataMap());
		Object [] result = {dao.selectList("auth.list", data),pUtill.page_dataMap()};
		return result;
	}
	@Transactional
	@Override
	public Object authority_Menager_Insert(Authority_Vo vo) {
		return dao.insert("auth.insert", vo);
	}
	@Transactional
	@Override
	public Object authorrty_Menager_Update(Authority_Vo vo) {
		return dao.update("auth.update", vo);

	}
	@Transactional
	@Override
	public Object authorrty_Menager_Delete(Authority_Vo vo) {
		return dao.delete("auth.delete", vo);
	}

}
