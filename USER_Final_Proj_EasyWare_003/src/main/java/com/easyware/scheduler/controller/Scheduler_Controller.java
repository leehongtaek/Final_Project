/**
* 작업 날짜 : 2015. 11. 16.
* 구현 내용 :   
*  
* @author By kosta 
*/
package com.easyware.scheduler.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.easyware.common.security.Member_Vo_Security;
import com.easyware.scheduler.service.Scheduler_Service;
import com.easyware.scheduler.vo.Scheduler_Vo;

@Controller
public class Scheduler_Controller {
	
	@Autowired
	private Scheduler_Service service;
	
	@RequestMapping(value="/scheduler/scheduler_index")
	public ModelAndView scheduler_index( ){
		ModelAndView mav = new ModelAndView("/scheduler/scheduler_index");
		String mem_code="";
		Authentication auth=SecurityContextHolder.getContext().getAuthentication();
		Object pricipal=auth.getPrincipal();
		if (pricipal !=null && pricipal instanceof Member_Vo_Security) {
			mem_code=((Member_Vo_Security)pricipal).getMem_code();
		}
		
		List<Scheduler_Vo> list=service.scheduler_list_PersonalSchedule(mem_code);
		mav.addObject("list",list);
		
		return mav;
	}
	
	@RequestMapping(value="/scheduler/scheduler_big")
	public String scheduler_big( ){
		
		
		return "/scheduler/scheduler_big";
	}
	@RequestMapping(value="/scheduler/scheduler")
	public ModelAndView scheduler( ){
		
		String mem_code="";
		int dept_num  = 0;
		
		Authentication auth=SecurityContextHolder.getContext().getAuthentication();
		Object pricipal=auth.getPrincipal();
		if (pricipal !=null && pricipal instanceof Member_Vo_Security) {
			mem_code=((Member_Vo_Security)pricipal).getMem_code();
			dept_num=((Member_Vo_Security)pricipal).getDept_num();
		}
		ModelAndView mav = new ModelAndView("/scheduler/scheduler");
		mav.addObject("mem_code",mem_code);
		mav.addObject("dept_num",dept_num);
		
		return mav;
		
		
	}
	@RequestMapping(value="/scheduler/scheduler_insert")
	public String scheduler_insert(Scheduler_Vo vo) {
		String mem_code="";
		Authentication auth=SecurityContextHolder.getContext().getAuthentication();
		Object pricipal=auth.getPrincipal();
		if (pricipal !=null && pricipal instanceof Member_Vo_Security) {
			mem_code=((Member_Vo_Security)pricipal).getMem_code();
		}
		vo.setMem_code(mem_code);
		service.scheduler_Add(vo);
		
		
		return "redirect:/scheduler/scheduler_index";
	}
	//=================================================================RESPONSE BODY
	@RequestMapping(value="/scheduler/scheduler_update.json")
	public @ResponseBody List<Scheduler_Vo> scheduler_update(){
		String mem_code="";
		Authentication auth=SecurityContextHolder.getContext().getAuthentication();
		Object pricipal=auth.getPrincipal();
		if (pricipal !=null && pricipal instanceof Member_Vo_Security) {
			mem_code=((Member_Vo_Security)pricipal).getMem_code();
		}
		
		List<Scheduler_Vo> list=service.scheduler_list_newPersonalSchedule(mem_code);
		return list;
	}
	
	@RequestMapping(value="/scheduler/scheduler_insert.json")
	public @ResponseBody void scheduler_add(Scheduler_Vo vo) {
		String mem_code="";
		Authentication auth=SecurityContextHolder.getContext().getAuthentication();
		Object pricipal=auth.getPrincipal();
		if (pricipal !=null && pricipal instanceof Member_Vo_Security) {
			mem_code=((Member_Vo_Security)pricipal).getMem_code();
		}
		vo.setMem_code(mem_code);
		service.scheduler_Add(vo);
		
	}
	
	@RequestMapping(value="/scheduler/scheduler_check")
	public @ResponseBody void scheduler_check(String sched_num) {
		service.scheduler_Check(Integer.parseInt(sched_num));
	}
	@RequestMapping(value="/scheduler/scheduler_data")
	public @ResponseBody Scheduler_Vo scheduler_data(String sched_num) {
		return (Scheduler_Vo) service.scheduler_Search(Integer.parseInt(sched_num));
	}
	
	
	@RequestMapping(value="/scheduler/scheduler_event.json")
	public @ResponseBody List<Scheduler_Vo> scheduler_event(HttpServletResponse response) throws IOException {
		String mem_code="";
		Authentication auth=SecurityContextHolder.getContext().getAuthentication();
		Object pricipal=auth.getPrincipal();
		if (pricipal !=null && pricipal instanceof Member_Vo_Security) {
			mem_code=((Member_Vo_Security)pricipal).getMem_code();
		}
		List<Scheduler_Vo> list=service.scheduler_list_PersonalSchedule(mem_code);
		return list;
	}
	@RequestMapping(value="/scheduler/scheduler_event_30.json")
	public @ResponseBody List<Scheduler_Vo> scheduler_event_30(HttpServletResponse response) throws IOException {
		String mem_code="";
		Authentication auth=SecurityContextHolder.getContext().getAuthentication();
		Object pricipal=auth.getPrincipal();
		if (pricipal !=null && pricipal instanceof Member_Vo_Security) {
			mem_code=((Member_Vo_Security)pricipal).getMem_code();
		}
		List<Scheduler_Vo> list=service.scheduler_list_PersonalSchedule_30(mem_code);
		return list;
	}
	
	@RequestMapping(value="/scheduler/scheduler_modify")
	public @ResponseBody void scheduler_modify(Scheduler_Vo vo) {
		service.scheduler_Modify(vo);
	}
	
	@RequestMapping(value="/scheduler/scheduler_delete")
	public @ResponseBody void scheduler_delete(String sched_num) {
		service.scheduler_Destory(Integer.parseInt(sched_num));
	}
	
}
