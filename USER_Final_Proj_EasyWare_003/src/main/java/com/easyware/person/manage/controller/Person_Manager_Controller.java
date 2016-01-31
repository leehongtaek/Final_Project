/**
* 작업 날짜 : 2015. 11. 14.
* 구현 내용 :   
*  
* @author By kira 
*/
package com.easyware.person.manage.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.easyware.person.manage.service.Department_Manager_Service;
import com.easyware.person.manage.service.Person_Manager_Service;
import com.easyware.person.manage.service.Position_Manager_Service;
import com.easyware.person.manage.vo.Person_Vo;
import com.easyware.utility.Paging_Vo;

@Controller
public class Person_Manager_Controller {
	
	@Autowired
	private Person_Manager_Service service;
	@Autowired
	private Department_Manager_Service d_Service;
	@Autowired
	private Position_Manager_Service p_Service;
	
	
	@RequestMapping(value="/personManager")
	public ModelAndView person_manager_list(
			Paging_Vo pvo)
	{	
		ModelAndView mv = new ModelAndView("/personManager");
		// 페이징 초기화
		int currentpage=pvo.getCurrentpage();
		if (currentpage == 0) pvo.setCurrentpage(1);
		
		
		Object[] result = service.person_Manage_List(pvo.getMap());
		
		mv.addObject("list", result[0]);
		mv.addObject("pagingData", result[1]);
		return mv;
	}
	
	
	@RequestMapping(value="/personManager/detail")
	public ModelAndView person_manager_datail(
			Person_Vo vo)
	{	
		
		// System.out.println("mem_code"+vo.getMem_code());
		
		ModelAndView mv = new ModelAndView("/personManager/detail");
		Person_Vo result=service.person_Manage_Detail(vo);
		List<HashMap<String, Object>> dept=
				(List<HashMap<String, Object>>) d_Service.department_Menager_List();
		List<HashMap<String, Object>> posit = 
				(List<HashMap<String, Object>>) p_Service.position_Menager_List();
		
		mv.addObject("vo", result);
		mv.addObject("dept", dept);
		mv.addObject("posit", posit);
		return mv;
	}
	
	
	@RequestMapping(value="/personManager/update" , method=RequestMethod.POST)
	public String person_manager_update(
			Person_Vo vo)
	{	
		System.out.println("LOG update ::: TEST");
		service.person_Manage_Update(vo);
		return "redirect:/personManager";
	}
	
	
	@RequestMapping(value="/personManager/search" ,method=RequestMethod.GET)
	public ModelAndView person_manager_search(
			Paging_Vo pvo)
	{
		ModelAndView mv = 
				new ModelAndView("/personManager/search");
		// 페이징 초기화
		int currentpage=pvo.getCurrentpage();
		if (currentpage == 0) pvo.setCurrentpage(1);
		
		
		// 서비스로 데이터 전달 
		Object[] result = service.person_Manage_Search_List(pvo.getMap());
		mv.addObject("list", (List<HashMap<String, Object>>)result[0]);
		mv.addObject("pagingData", result[1]);
		mv.addObject("search",pvo);
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
