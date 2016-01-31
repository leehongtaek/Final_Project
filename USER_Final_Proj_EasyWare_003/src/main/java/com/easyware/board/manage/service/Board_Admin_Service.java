package com.easyware.board.manage.service;

import java.util.HashMap;

import com.easyware.board.vo.Bbs_Vo;

public interface Board_Admin_Service {
	public Object[] Board_Admin_List(HashMap<String, Object> data);

	public Bbs_Vo Board_Admin_Detail(Bbs_Vo vo);

	public void Board_Admin_Update(Bbs_Vo vo);

	public Object[] Board_Admin_Search_List(HashMap<String, Object> data);
}
