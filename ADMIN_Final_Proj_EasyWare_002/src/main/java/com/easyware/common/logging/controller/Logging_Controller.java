/**
* 작업 날짜 : 2015. 12. 2.
* 구현 내용 :   
*  
* @author By Byeong Gi Kim 
*/
package com.easyware.common.logging.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.easyware.common.logging.service.Logging_User_Connect_Service;
import com.easyware.common.logging.vo.Logging_Connect_Vo;
import com.easyware.utility.Paging_Vo;
import com.easyware.utility.Search_Vo;

@Controller
public class Logging_Controller {
	
	@Autowired
	Logging_User_Connect_Service service;
	
	@RequestMapping(value="/logging/connect_list")
	public ModelAndView Logggin_Connent_List(Paging_Vo vo){
		ModelAndView mv = new ModelAndView("/logging/connect_list");
		
		
		Object[] result=service.Logging_User_Connect_List(vo.getMap());
		mv.addObject("list", result[0]);
		mv.addObject("pagingData", result[1]);
		return mv;
	}
	
	@RequestMapping(value="/logging/connect_search_list")
	public ModelAndView Logggin_Connent_List(Paging_Vo pvo,Search_Vo svo,Logging_Connect_Vo vo){
		ModelAndView mv = new ModelAndView("/logging/connect_search_list");
		
		pvo.getMap().putAll(svo.getMap()); 
		pvo.getMap().putAll(vo.getMap());    
		System.err.println("::::::::::::::::::::::::::");
		System.err.println(pvo.getMap().toString());
		System.err.println("::::::::::::::::::::::::::");
		Object[] result=service.Logging_User_Connect_Search_List(pvo.getMap());
		mv.addObject("list", result[0]);
		mv.addObject("pagingData", result[1]);
		mv.addObject("svo", svo);
		mv.addObject("pvo", pvo);  
		mv.addObject("vo", vo);  
		  
		return mv;
	}
}
