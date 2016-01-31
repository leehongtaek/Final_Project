package com.easyware.board.manage.dao;

public interface Board_Admin_Dao {
	public Object selectList(String sqlId, Object data);

	public Object selectOne(String sqlId, Object data);

	public Object insert(String sqlId, Object data);

	public Object delete(String sqlId, Object data);

	public Object update(String sqlId, Object data);
}
