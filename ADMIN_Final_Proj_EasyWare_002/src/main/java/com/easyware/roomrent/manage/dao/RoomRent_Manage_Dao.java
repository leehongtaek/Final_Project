/**
* 작업 날짜 : 2015. 11. 18.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.easyware.roomrent.manage.dao;

public interface RoomRent_Manage_Dao {
	
	public Object selectList(String sqlId,Object data);
	public Object selectOne(String sqlId,Object data);
	public Object insert(String sqlId,Object data);
	public Object delete(String sqlId,Object data);
	public Object update(String sqlId,Object data);

}
