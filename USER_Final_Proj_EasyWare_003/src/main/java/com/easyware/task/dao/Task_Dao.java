/**
* 작업 날짜 : 2015. 11. 12.
* 구현 내용 :   
*  
* @author By Byeong Gi Kim 
*/
package com.easyware.task.dao;

public interface Task_Dao {
	// TASK와 관련된 CRUD 인터페이스 정의
	public Object selectList(String sqlId,Object data);
	public Object selectOne(String sqlId,Object data);
	public Object insert(String sqlId,Object data);
	public Object delete(String sqlId,Object data);
	public Object update(String sqlId,Object data);
}
