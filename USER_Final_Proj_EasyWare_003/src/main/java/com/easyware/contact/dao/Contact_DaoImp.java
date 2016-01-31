/**
* 작업 날짜 : 2015. 11. 12.
* 구현 내용 :   
*  
* @author By Byeong Gi Kim 
*/
package com.easyware.contact.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Contact_DaoImp implements Contact_Dao{
	
	@Autowired
	private SqlSessionTemplate SqlSessionTemplate;

	@Override
	public Object insert(String sqlId, Object data) {
		return SqlSessionTemplate.insert(sqlId,data);
	}

	@Override
	public Object delete(String sqlId, Object data) {
		return SqlSessionTemplate.delete(sqlId,data);
	}

	@Override
	public Object update(String sqlId, Object data) {
		return SqlSessionTemplate.update(sqlId,data);
	}

	@Override
	public Object selectList(String sqlId, Object data) {
		return SqlSessionTemplate.selectList(sqlId,data);
	}

	@Override
	public Object selectOne(String sqlId, Object data) {
		return SqlSessionTemplate.selectOne(sqlId,data);
	}

}
