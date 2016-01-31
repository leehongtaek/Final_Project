/**
* 작업 날짜 : 2015. 11. 16.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.easyware.contact.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.easyware.contact.service.Contact_Service;
import com.easyware.utility.PagingUtill;

@Controller
public class Contact_Controller {
	
	@Autowired
	private Contact_Service service;

	// URL 매핑 방식 /serviceName/serviceFuntion/param
	// /서비스명/서비스기능/파마리터
	@RequestMapping(value="/contact/contact_index")
	public String index() {
		return "/contact/contact_index";
	}
/*	@RequestMapping(value="/contact/contact_list")
	public ModelAndView getList(){
		ModelAndView mav = new ModelAndView("/contact/contact_list");
		List<HashMap<String, String>> list = (List<HashMap<String, String>>)service.contact_ListTest("");
		System.out.println("직급 : " + list.get(0).get("POSIT_NAME"));
		System.out.println("회원이름 : " + list.get(0).get("MEM_NAME"));
		System.out.println("부서 이름 : " + list.get(0).get("DEPT_NAME"));
		System.out.println("전화 번호 : " + list.get(0).get("MEM_TEL"));
		mav.addObject("list", list);
		return mav;
	}*/
	private HashMap<String, Object> pagingData;

	@RequestMapping(value = "/contact/contact_list")
	public ModelAndView getPaginList(
			@RequestParam(value="currentpage", required=false) Integer currentpage) {
		ModelAndView mav = new ModelAndView("/contact/contact_list");

		// 1. 페이지 유틸을 생성
		int total_record = (int) service.contact_Total("");
		
		//프로퍼티즈 속성으로 뺀다.
		int page_per_record_cnt = 10; // 페이지에서 보여줄 게시물 수
		int group_per_page_cnt = 5; // 페이지의 갯수
		if (currentpage == null) {
			currentpage = 1; // 현재 페이지
		}
		// DI를 한다.
		PagingUtill pg = new PagingUtill(total_record, page_per_record_cnt, group_per_page_cnt, currentpage);
		
		pagingData = (HashMap<String, Object>) pg.page_dataMap();
		List<HashMap<String, Object>> list = 
				(List<HashMap<String, Object>>) service.contact_pagingList(pagingData);
		System.out.println("직급 : " + list.get(0).get("POSIT_NAME"));
		System.out.println("회원이름 : " + list.get(0).get("MEM_NAME"));
		System.out.println("부서 이름 : " + list.get(0).get("DEPT_NAME"));
		System.out.println("전화 번호 : " + list.get(0).get("MEM_TEL"));
		mav.addObject("list", list);

		//List<TBboardVO> listvo = dao.getList();
		mav.addObject("pagingData", pagingData);
		mav.addObject("currentpage",currentpage);
		return mav;
	}
}
