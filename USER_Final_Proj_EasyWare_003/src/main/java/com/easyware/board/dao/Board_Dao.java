/**
* 작업 날짜 : 2015. 11. 16.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.easyware.board.dao;

public interface Board_Dao {

	public Object selectList(String sqlId, Object data);

	public Object selectOne(String sqlId, Object data);

	public Object insert(String sqlId, Object data);

	public Object delete(String sqlId, Object data);

	public Object update(String sqlId, Object data);

	public int selectOne(String string);

}
