/**
* 작업 날짜 : 2015. 11. 20.
* 구현 내용 :   
*  
* @author By Byeong Gi Kim 
*/
package com.easyware.websocket.controller;

import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.easyware.common.security.Member_Vo_Security;

@Controller
public class Chat_Controller {
	
	
	@RequestMapping(value="/chat")
	public ModelAndView chat(HttpSession session){
		ModelAndView mv=new ModelAndView("/chat");
		String mem_code="";
		String mem_name="";
		int dept_num=0;
		Authentication auth=SecurityContextHolder.getContext().getAuthentication();
		Object pricipal=auth.getPrincipal();
		if (pricipal !=null && pricipal instanceof Member_Vo_Security) {
			mem_code=((Member_Vo_Security)pricipal).getMem_code();
			dept_num=((Member_Vo_Security)pricipal).getDept_num();
			mem_name=((Member_Vo_Security)pricipal).getMem_name();
		}
		mv.addObject("mem_code", mem_code);
		mv.addObject("dept_num", dept_num);
		mv.addObject("mem_name", mem_name);
		return mv;
	}
}
