package com.easyware.common.user.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSeparatorUI;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.easyware.common.security.Member_Vo_Security;
import com.easyware.common.user.vo.Member_Vo;

@Controller
public class User_View_Mapping_Controller {
	

	@RequestMapping(value="/login")
	public String login(Principal principal){
		if (principal !=null ) {
			String username =principal.getName();
			System.out.println("username ::::::::::"+username);
		}
		return "/login";
	}
	
	
	@RequestMapping(value="/index")
	public String index(){
		return "/index";
	}
	
	
	/*@RequestMapping(value="/logout")
	public String logout(){
		return "/logout";
	}*/
	
	@RequestMapping(value="/logout-success")
	public String logout_success(){
		return "/logout-success";
	}
	
	
	
	
	
	@RequestMapping(value="/")
	public ModelAndView admin(HttpServletRequest request){
		Member_Vo vo = new Member_Vo();
		HttpSession session=request.getSession();
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object priciple=auth.getPrincipal();
		if(priciple !=null && priciple instanceof Member_Vo_Security){
			session.setAttribute("mem_code",((Member_Vo_Security)priciple).getMem_code());
			session.setAttribute("posit_num", ((Member_Vo_Security)priciple).getPosit_num());
			session.setAttribute("mem_name", ((Member_Vo_Security)priciple).getMem_name());
			

			
		}
		
		
		return new ModelAndView("/");
	}
	
	@RequestMapping(value="/denied")
	public String denied(){
		return "/denied";
	}
	
	
	
	
	@RequestMapping(value="/{menu}")
	public String adminMenu(
			@PathVariable(value="menu") String meun 
			){
		return "/"+meun;
	}

	
	
	

	
	
}
