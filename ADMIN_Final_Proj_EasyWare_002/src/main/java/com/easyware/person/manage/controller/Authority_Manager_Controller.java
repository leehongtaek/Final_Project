/**
* 작업 날짜 : 2015. 11. 18.
* 구현 내용 :   
*  
* @author By Byeong Gi Kim 
*/
package com.easyware.person.manage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.easyware.person.manage.service.Authority_Manager_Service;
import com.easyware.person.manage.vo.Authority_Vo;
import com.easyware.utility.Paging_Vo;

@Controller
public class Authority_Manager_Controller {
	
	@Autowired
	private Authority_Manager_Service service;
	
	@RequestMapping(value="/authManager")
	public  ModelAndView authManager_List(Paging_Vo vo)
	{	
		ModelAndView mv = new ModelAndView("/authManager");
		if (vo.getCurrentpage() == 0) vo.setCurrentpage(1);
		
		Object[] result = service.authority_Menager_List(vo.getMap());
		
		mv.addObject("list",result[0]);
		mv.addObject("pagingData",result[1]);
		return mv;
	}
	@RequestMapping(value="/authManager/update" , method=RequestMethod.POST)
	public void authManager_Update(Authority_Vo vo)
	{	
		System.out.println("---------------------");
		System.out.println(vo.getMem_id());
		System.out.println(vo.getMem_code());
		System.out.println(vo.getRole_auth());
		
		Integer res =(Integer) service.authorrty_Menager_Delete(vo);
		if (res > 0 ) res=(Integer) service.authority_Menager_Insert(vo);
		
	}
	
}
