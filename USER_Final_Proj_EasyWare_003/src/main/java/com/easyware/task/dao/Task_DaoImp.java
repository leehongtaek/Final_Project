/**
* 작업 날짜 : 2015. 11. 12.
* 구현 내용 :   
*  
* @author By Byeong Gi Kim 
*/
package com.easyware.task.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Task_DaoImp implements Task_Dao{
	
	@Autowired
	private SqlSessionTemplate SqlSessionTemplate;
	
	// TASK와 관련된 CRUD 인터페이스를 구현함 
	// 아래와 같이 간단하게 Mybatis를 Mapper 등록된 sql문을 호출하고 
	// data를 인자로 넘겨주는 구조로 설계함
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
