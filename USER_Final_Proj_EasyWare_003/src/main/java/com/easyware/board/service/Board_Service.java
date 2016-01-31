/**
* 작업 날짜 : 2015. 11. 16.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.easyware.board.service;

import java.util.List;

import com.easyware.board.vo.Bbs_Commboard_Vo;
import com.easyware.board.vo.Bbs_Vo;
import com.easyware.utility.Search_Vo;
import com.easyware.board.vo.Bbs_Search_Vo;

public interface Board_Service {
	// 게시물 등록
	public void insertBbs(Bbs_Vo vo);

	// 게시물 리스트
	public Object getList(Bbs_Search_Vo vo);

	// 게시물 상세보기
	public Object getDetail(int board_num);

	// 게시물 검색
	public Object search(Bbs_Search_Vo vo);

	// 게시물 검색 카운트
	public int getSearchCount(Bbs_Search_Vo vo);

	// 모든 게시물 수 카운트
	public int getTotalCount(Bbs_Vo vo);

	// 댓글 수 카운트
	public int getCommcnt(Bbs_Commboard_Vo cvo);

	// 조회수 1 증가
	public void BbsHitUp(int num);

	// 게시물 추천 기능
	public void likenum(int board_num);

	// 게시물 삭제
	public Object deleteBoard(int num);

	// 게시물 수정
	public Object modifyBoard(Bbs_Vo vo);

	// 댓글등록
	public void insertComm(Bbs_Commboard_Vo vo);

	// 댓글 출력
	public List<Bbs_Commboard_Vo> getCommList(int comm_num);

	// 메인 index 공지사항 출력
	public List<Bbs_Vo> getmainlist();
}
