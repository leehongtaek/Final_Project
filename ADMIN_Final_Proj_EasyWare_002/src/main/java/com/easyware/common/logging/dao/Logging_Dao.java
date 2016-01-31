/**
* 작업 날짜 : 2015. 11. 12.
* 구현 내용 :   
*  
* @author By Byeong Gi Kim 
*/
package com.easyware.common.logging.dao;

public interface Logging_Dao {
	public Object selectList(String sqlId,Object data);
	public Object selectOne(String sqlId,Object data);
	public Object insert(String sqlId,Object data);
	public Object delete(String sqlId,Object data);
	public Object update(String sqlId,Object data);
}
