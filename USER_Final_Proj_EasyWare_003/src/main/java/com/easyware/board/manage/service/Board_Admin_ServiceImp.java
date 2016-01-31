package com.easyware.board.manage.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.easyware.board.manage.dao.Board_Admin_Dao;
import com.easyware.board.vo.Bbs_Vo;
import com.easyware.utility.PagingUtill;

@Service
public class Board_Admin_ServiceImp implements Board_Admin_Service {

	@Autowired
	private Board_Admin_Dao dao;

	@Transactional
	@Override
	public Object[] Board_Admin_List(HashMap<String, Object> data) {
		int total_record = (int) dao.selectOne("board_admin.totalcnt", "");
		PagingUtill utill = new PagingUtill(total_record, 10, 5, (int) data.get("currentpage"));
		// 반환되는 result 실제 데이터 , 페이징에 필요한 데이터
		Object[] result = { dao.selectList("board_admin.list", utill.page_dataMap()), utill.page_dataMap() };
		return result;
	}

	@Transactional
	@Override
	public void Board_Admin_Update(Bbs_Vo vo) {
		dao.update("board_admin.update", vo);
	}

	@Override
	public Object[] Board_Admin_Search_List(HashMap<String, Object> data) {
		int total_record = (int) dao.selectOne("board_admin.searchTotalcnt", data);
		PagingUtill utill = new PagingUtill(total_record, 10, 5, (int) data.get("currentpage"));
		// 검색 데이터 병합
		data.putAll(utill.page_dataMap());
		// 반환되는 result 실제 데이터 , 페이징에 필요한 데이터
		Object[] result = { dao.selectList("board_admin.searchList", data), utill.page_dataMap() };
		return result;
	}

	@Override
	public Bbs_Vo Board_Admin_Detail(Bbs_Vo vo) {
		String mem_code=vo.getMem_code();
		return (Bbs_Vo) dao.selectOne("board_admin.detail", mem_code);
	}


}