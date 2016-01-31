/**
* 작업 날짜 : 2015. 11. 16.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.easyware.board.controller;

import java.security.Principal;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.easyware.board.service.Board_Service;
import com.easyware.board.vo.Bbs_Commboard_Vo;
import com.easyware.board.vo.Bbs_Paging_Vo;
import com.easyware.board.vo.Bbs_Search_Vo;
import com.easyware.board.vo.Bbs_Vo;
import com.easyware.common.security.Member_Vo_Security;

@Controller
public class Board_Controller {

	@Autowired
	private Board_Service service;

	// 게시판 리스트
	@RequestMapping(value = "/board/board_L_list")
	public ModelAndView list(Integer page, Bbs_Search_Vo vo, Principal principal, Bbs_Vo bvo) {
		// 총 갯수 , view 지정
		int totalRows = service.getTotalCount(bvo);
		ModelAndView mav = new ModelAndView("/board/board_L_list");

		// 페이징 로직
		Bbs_Paging_Vo pageInfo = makePageVO(page, totalRows);
		vo.setBegin(String.valueOf(pageInfo.getStartRow()));
		vo.setEnd(String.valueOf(pageInfo.getEndRow()));

		// service
		Object list = service.getList(vo);
		if (principal != null)
			mav.addObject("principal", principal.getName());

		// model and view
		mav.addObject("list", list);
		mav.addObject("pageInfo", pageInfo);
		mav.addObject("board_code", vo.getBoard_code());
		mav.addObject("mem_name", bvo.getMem_name());
		return mav;
	}

	// 게시판 Detail
	@RequestMapping(value = "/board/board_L_detail", method = RequestMethod.GET)
	public ModelAndView detail(int board_num, Principal principal, Bbs_Vo bvo, Bbs_Commboard_Vo cvo) {
		Bbs_Vo vo = (Bbs_Vo) service.getDetail(board_num);

		// 댓글 리스트
		List<Bbs_Commboard_Vo> cList = service.getCommList(board_num);
		// 조회수 1 업
		service.BbsHitUp(board_num);
		// 댓글 수 카운트
		int comm_count = (int) service.getCommcnt(cvo);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/board/board_L_detail");
		mav.addObject("vo", vo);
		mav.addObject("coList", cList);
		mav.addObject("pricipal", principal.getName());
		mav.addObject("board_code", bvo.getBoard_code());
		mav.addObject("comm_count", comm_count);
		return mav;

	}

	// 게시물 작성 Form
	@RequestMapping(value = "/board/board_L_write")
	public ModelAndView write(Bbs_Search_Vo vo) {
		vo.getBoard_code();
		System.out.println("board_code:" + vo.getBoard_code());
		return new ModelAndView("/board/board_L_write", "board_code", vo.getBoard_code());
	}

	// 게시물 등록
	@RequestMapping(value = "/board/insert", method = RequestMethod.POST)
	public ModelAndView insert(Bbs_Vo vo) {

		String mem_code = "";
		String mem_name = "";

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object pricipal = auth.getPrincipal();
		if (pricipal != null && pricipal instanceof Member_Vo_Security) {
			mem_code = ((Member_Vo_Security) pricipal).getMem_code();
			mem_name = ((Member_Vo_Security) pricipal).getMem_name();

		}

		vo.setMem_code(mem_code);
		vo.setMem_name(mem_name);
		service.insertBbs(vo);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/board/board_L_list?board_code=" + vo.getBoard_code());
		return mav;
	}

	// 게시물 수정 페이지
	@RequestMapping(value = "/board/board_L_modify", method = RequestMethod.GET)
	public ModelAndView board_L_modify(Bbs_Vo bvo, Principal principal) {
		Bbs_Vo vo = (Bbs_Vo) service.getDetail(bvo.getBoard_num());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/board/board_L_modify");
		mav.addObject("vo", vo);
		mav.addObject("bvo", bvo);
		mav.addObject("pricipal", principal.getName());
		return mav;
	}

	// 게시물 수정
	@RequestMapping(value = "/board/modify", method = RequestMethod.POST)
	public ModelAndView board_L_modifybbs(Bbs_Vo vo) {
		service.modifyBoard(vo);
		return new ModelAndView("redirect:/board/board_L_list?board_code=" + vo.getBoard_code());

	}

	// 게시물 삭제
	@RequestMapping(value = "/board/board_L_delete", method = RequestMethod.GET)
	public ModelAndView board_L_delete(String board_num, int board_code, Bbs_Vo vo) {
		int numv = Integer.parseInt(board_num);
		service.deleteBoard(numv);
		return new ModelAndView("redirect:/board/board_L_detail?board_code=" + board_code + "&board_num=" + board_num);
	}

	// 게시판 검색
	@RequestMapping(value = "/board/search", method = RequestMethod.POST)
	public ModelAndView search(Integer page, Bbs_Search_Vo vo, Bbs_Vo bvo) {
		int totalRows = service.getTotalCount(bvo);
		Bbs_Paging_Vo pageInfo = makePageVO(page, totalRows);
		vo.setBegin(String.valueOf(pageInfo.getStartRow()));
		vo.setEnd(String.valueOf(pageInfo.getEndRow()));
		List<Bbs_Vo> list = (List<Bbs_Vo>) service.search(vo);
		ModelAndView mav = new ModelAndView("/board/board_L_list");
		mav.addObject("list", list);
		mav.addObject("pageInfo", pageInfo);
		mav.addObject("board_code", bvo.getBoard_code());
		// model and view
		return mav;

	}

	// 게시판 추천
	@RequestMapping(value = "/board/likenum", method = RequestMethod.GET)
	public ModelAndView likenum(int board_num, int board_code) {

		System.err.println(board_num);
		System.err.println(board_code);

		service.likenum(board_num);
		return new ModelAndView("redirect:/board/board_L_detail?board_code=" + board_code + "&board_num=" + board_num);

	}

	// 페이징 처리
	public Bbs_Paging_Vo makePageVO(Integer page, int totalRows) {

		Bbs_Paging_Vo pageInfo = new Bbs_Paging_Vo();
		int rowsPerPage = 7; //
		int pagesPerBlock = 5; //
		if (page == null)
			page = 0;
		if (page == 0)
			page = 1; //
		int currentPage = page; //
		int currentBlock = 0; //
		if (currentPage % pagesPerBlock == 0) { //
			currentBlock = currentPage / pagesPerBlock;
		} else { //
			currentBlock = currentPage / pagesPerBlock + 1;
		}
		int startRow = (currentPage - 1) * rowsPerPage + 1; //
		int endRow = currentPage * rowsPerPage;//

		//
		System.out.println("totalRows:" + totalRows);
		//
		int totalPages = 0;
		if (totalRows % rowsPerPage == 0) {
			totalPages = totalRows / rowsPerPage;
		} else {
			totalPages = totalRows / rowsPerPage + 1;
		}
		//
		int totalBlocks = 0;
		if (totalPages % pagesPerBlock == 0) {
			totalBlocks = totalPages / pagesPerBlock;
		} else {
			totalBlocks = totalPages / pagesPerBlock + 1;
		}
		//
		pageInfo.setCurrentPage(currentPage);
		pageInfo.setCurrentBlock(currentBlock);
		pageInfo.setRowsPerPage(rowsPerPage);
		pageInfo.setPagesPerBlock(pagesPerBlock);
		pageInfo.setStartRow(startRow);
		pageInfo.setEndRow(endRow);
		pageInfo.setTotalRows(totalRows);
		pageInfo.setTotalPages(totalPages);
		pageInfo.setTotalBlocks(totalBlocks);

		return pageInfo;
	}


	// ================================Ajax================================
	// 댓글 등록
	@RequestMapping(value = "/board/insertcomm.json")
	public @ResponseBody void comm_insert(Bbs_Commboard_Vo vo) {

		String mem_code = "";
		String mem_name = "";

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object pricipal = auth.getPrincipal();
		if (pricipal != null && pricipal instanceof Member_Vo_Security) {
			mem_code = ((Member_Vo_Security) pricipal).getMem_code();
			mem_name = ((Member_Vo_Security) pricipal).getMem_name();
		}
		vo.setMem_code(mem_code);
		vo.setMem_name(mem_name);
		vo.setComm_reip("000.000.000");
		service.insertComm(vo);

	}

}