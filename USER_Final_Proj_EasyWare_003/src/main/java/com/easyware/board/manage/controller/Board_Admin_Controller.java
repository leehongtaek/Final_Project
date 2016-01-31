/**
* 작업 날짜 : 2015. 12. 1.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.easyware.board.manage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.easyware.board.manage.service.Board_Admin_Service;
import com.easyware.board.service.Board_Service;
import com.easyware.board.vo.Bbs_Search_Vo;
import com.easyware.utility.Paging_Vo;

@Controller
public class Board_Admin_Controller {

	@Autowired
	private Board_Admin_Service service;
	
	//운영중인 게시판 리스트 출력
	@RequestMapping(value = "/board/board_L_admin")
	public ModelAndView boardlist(Paging_Vo pvo) {
		ModelAndView mav = new ModelAndView("/board/board_L_admin_index");
		// 페이징 초기화
		int currentpage = pvo.getCurrentpage();
		if (currentpage == 0)
			pvo.setCurrentpage(1);
		Object[] result = service.Board_Admin_List(pvo.getMap());
		mav.addObject("list", result[0]);
		mav.addObject("pagingData", result[1]);
		return mav;
	}

}
