/**
* 작업 날짜 : 2015. 11. 16.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.easyware.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easyware.board.dao.Board_Dao;
import com.easyware.board.vo.Bbs_Commboard_Vo;
import com.easyware.board.vo.Bbs_Search_Vo;
import com.easyware.board.vo.Bbs_Vo;

@Service
public class Board_ServiceImp implements Board_Service {

	@Autowired
	private Board_Dao dao;

	@Override
	public void insertBbs(Bbs_Vo vo) {
		dao.insert("board.insert", vo);
	}

	@Override
	public Object getList(Bbs_Search_Vo vo) {
		// TODO Auto-generated method stub
		return dao.selectList("board.list", vo);
	}

	@Override
	public int getTotalCount(Bbs_Vo vo) {
		return (int) dao.selectOne("board.listTotal", vo.getBoard_code());
	}

	@Override
	public Object getDetail(int board_num) {
		return dao.selectOne("board.detail", board_num);
	}

	@Override
	public int getSearchCount(Bbs_Search_Vo vo) {
		// TODO Auto-generated method stub
		return (int) dao.selectOne("board.searchTotalcnt", vo.getBoard_code());
	}

	@Override
	public int getCommcnt(Bbs_Commboard_Vo cvo) {
		// TODO Auto-generated method stub
		return (int) dao.selectOne("board.commcnt", cvo);
	}

	@Override
	public void insertComm(Bbs_Commboard_Vo vo) {
		dao.insert("board.insertcomm", vo);
	}

	@Override
	public List<Bbs_Commboard_Vo> getCommList(int board_num) {
		return (List<Bbs_Commboard_Vo>) dao.selectList("board.listcomm", board_num);
	}

	@Override
	public void BbsHitUp(int board_num) {
		dao.update("board.hitup", board_num);

	}

	@Override
	public void likenum(int board_num) {
		dao.update("board.likenum", board_num);

	}

	@Override
	public Object deleteBoard(int num) {
		dao.delete("board.delete", num);
		return null;
	}

	@Override
	public Object modifyBoard(Bbs_Vo vo) {
		return dao.update("board.modify", vo);
	}

	@Override
	public Object search(Bbs_Search_Vo vo) {
		List<Bbs_Vo> list = (List<Bbs_Vo>) dao.selectList("board.search", vo);
		return list;
	}

	@Override
	public List<Bbs_Vo> getmainlist() {
		List<Bbs_Vo> list = (List<Bbs_Vo>) dao.selectList("board.main_list", "");
		return list;
	}

}
