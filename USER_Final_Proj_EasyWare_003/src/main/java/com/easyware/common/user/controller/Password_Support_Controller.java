/**
* 작업 날짜 : 2015. 11. 18.
* 구현 내용 :   
*  
* @author By Byeong Gi Kim 
*/
package com.easyware.common.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.easyware.common.user.service.Password_Support_Mail_Service;
import com.easyware.common.user.vo.Member_Vo;

@Controller
public class Password_Support_Controller {
	
	
	@Autowired
	private Password_Support_Mail_Service password_Support_Main_Service;
	
	
	@RequestMapping(value="/user/passwordSupport/insert")
	public String Password_Mail_Controller(Member_Vo vo){
		String msg ="";		
		System.out.println("이메일로 비번찾기 컨트롤러 호출 확인 !!!!!!!");
		int res =password_Support_Main_Service.sendMail(vo);
		return "redirect:/index";
	}
	
	
	@RequestMapping(value="/user/passwordSupport")
	public String View_Password_Mail_Controller(Member_Vo vo){
		return "/user/passwordSupport";
	}
}
