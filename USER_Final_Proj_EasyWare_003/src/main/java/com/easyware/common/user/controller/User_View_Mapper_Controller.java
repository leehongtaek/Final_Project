package com.easyware.common.user.controller;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.easyware.board.service.Board_Service;
import com.easyware.board.vo.Bbs_Vo;
import com.easyware.common.security.Member_Vo_Security;
import com.easyware.person.manage.service.Person_Manager_Service;
import com.easyware.person.manage.vo.Person_Vo;
import com.easyware.report.service.Report_Workflow_Service;
import com.easyware.task.service.Task_Service;
import com.easyware.timecard.service.TimeCard_Service;
import com.easyware.timecard.vo.TimeCard_Vo;

@Controller
public class User_View_Mapper_Controller {
	
	@Autowired
	private TimeCard_Service service;
	@Autowired
	private Person_Manager_Service p_service;
	@Autowired
	private Task_Service t_service;
	@Autowired
	private Board_Service b_service;
	@Autowired
	private Report_Workflow_Service r_service;
	
	
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
	
	
	@RequestMapping(value="/logout")
	public String logout(){
		return "/logout";
	}
	
	@RequestMapping(value="/logout-success")
	public String logout_success(){
		return "/logout-success";
	}
	
	@RequestMapping(value="/denied")
	public String denied(){
		return "/denied";
	}
	
	@RequestMapping(value="/signup")
	public String signup(){
		return "/signup";
	}
	
	@RequestMapping(value="/signup_result") 
	public String signup_result(){
		return "/signup_result";
	}
	
	
	
	@RequestMapping(value="/")
	public ModelAndView admin(HttpServletRequest request){
		ModelAndView mv=new ModelAndView("/");
		HttpSession session=request.getSession();
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object priciple=auth.getPrincipal();
		String mem_code = "";
		if(priciple !=null && priciple instanceof Member_Vo_Security){
			session.setAttribute("mem_code",((Member_Vo_Security)priciple).getMem_code());
			session.setAttribute("posit_num", ((Member_Vo_Security)priciple).getPosit_num());
			session.setAttribute("mem_name", ((Member_Vo_Security)priciple).getMem_name());
			session.setAttribute("dept_num", ((Member_Vo_Security)priciple).getDept_num());
			mem_code = 	((Member_Vo_Security)priciple).getMem_code();
						    
		}
		
		TimeCard_Vo vo = new TimeCard_Vo();
		vo.setMem_code(mem_code);
		int res = (int)service.timecard_Search_Add_Check(vo);
		
		
		// 중복 체크 확인 후 출근 체크
		if (res == 0)  service.timecard_Add(vo);
		Object[] datas=service.timecard_DashBoard_list(mem_code);
		mv.addObject("timecardlist", datas[0]);
		
		
		// TASK 리스트
		String assignee_assignee = mem_code;
		Object assign = t_service.task_Assignee_Dashboard_List(assignee_assignee);  
		mv.addObject("assign_list", assign);
		
		//board_main_list
		List<Bbs_Vo> boardlist = b_service.getmainlist();
		mv.addObject("b_list",boardlist);
		
		//REPORT MAIN LIST
		Map<String, String> index_count =  (Map<String, String>) r_service.report_Index_Count(mem_code);
		mv.addObject("index_count",index_count);
		return mv;
	}
	  

	
	@RequestMapping(value="/profile")
	public ModelAndView profile(){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object priciple=auth.getPrincipal();
		String mem_code = "";
		if(priciple !=null && priciple instanceof Member_Vo_Security){
			mem_code = 	((Member_Vo_Security)priciple).getMem_code();
		}
		Person_Vo vo = new Person_Vo();
		vo.setMem_code(mem_code);  
		Person_Vo rvo = p_service.person_Manage_Detail(vo);
		ModelAndView mv = new ModelAndView("/profile");
		mv.addObject("vo", rvo);
		return mv;
	}
	@RequestMapping(value="/profile/update")
	public ModelAndView profile_update(Person_Vo vo){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object priciple=auth.getPrincipal();
		String mem_code = "";
		if(priciple !=null && priciple instanceof Member_Vo_Security){
			mem_code = 	((Member_Vo_Security)priciple).getMem_code();
		}
		vo.setMem_code(mem_code);  
		p_service.person_Manage_Update(vo);
		ModelAndView mv = new ModelAndView("redirect:/profile");
		return mv;
	}
	@RequestMapping(value="/setting")
	public String setting(){
		return "/setting";
	}

	
	
	
	

	
	
}
