/**
* 작업 날짜 : 2015. 11. 14.
* 구현 내용 :   
*  
* @author By kira 
*/
package com.easyware.person.manage.dao;

public interface Department_Manager_Dao {
	public Object selectList(String sqlId,Object data);
	public Object selectOne(String sqlId,Object data);
	public Object insert(String sqlId,Object data);
	public Object delete(String sqlId,Object data);
	public Object update(String sqlId,Object data);
}
