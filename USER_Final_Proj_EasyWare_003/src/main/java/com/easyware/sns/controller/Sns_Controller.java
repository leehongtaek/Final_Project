/**
* 작업 날짜 : 2015. 11. 16.
* 구현 내용 :   
*  
* @author By kosta 
*/
package com.easyware.sns.controller;

import java.util.HashMap;
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
import com.easyware.sns.service.Sns_Service;
import com.easyware.sns.vo.Sns_Vo;

@Controller
public class Sns_Controller {
	
	@Autowired
	private Sns_Service service;
	
	@RequestMapping(value="/sns/sns")
	private ModelAndView sns_index() {
		ModelAndView mav =new ModelAndView("/sns/sns");
		String mem_code="";
		
			Authentication auth=SecurityContextHolder.getContext().getAuthentication();
			Object pricipal=auth.getPrincipal();
			if (pricipal !=null && pricipal instanceof Member_Vo_Security) {
				mem_code=((Member_Vo_Security)pricipal).getMem_code();
			}
		mav.addObject("member",mem_code);
		
		return mav;
	}
	
	
	
	
	
	
	@RequestMapping(value="/scheduler/sns_insert.json")
	public @ResponseBody void sns_insert(Sns_Vo vo){
		String mem_code="";
		String mem_name="";
		int dept_num  = 0;
		System.out.println("Log:::::::::::::"+vo.getSns_title()+vo.getSns_content());
		Authentication auth=SecurityContextHolder.getContext().getAuthentication();
		Object pricipal=auth.getPrincipal();
		if (pricipal !=null && pricipal instanceof Member_Vo_Security) {
			mem_code=((Member_Vo_Security)pricipal).getMem_code();
			mem_name=((Member_Vo_Security)pricipal).getMem_name();
			dept_num=((Member_Vo_Security)pricipal).getDept_num();
		}
		vo.setMem_code(mem_code);
		vo.setDept_num(dept_num);
		vo.setMem_name(mem_name);
		vo.setSns_title(mem_code);
		
		service.sns_Add(vo);
	}
	

	
	@RequestMapping(value="/scheduler/sns_firstupdate.json")
	private @ResponseBody List<Sns_Vo> sns_firstupdate() {
		//String mem_code="";
		int dept_num  = 0;
		Authentication auth=SecurityContextHolder.getContext().getAuthentication();
		Object pricipal=auth.getPrincipal();
		if (pricipal !=null && pricipal instanceof Member_Vo_Security) {
			//mem_code=((Member_Vo_Security)pricipal).getMem_code();
			dept_num=((Member_Vo_Security)pricipal).getDept_num();
		}
		
		//ModelAndView mav =new ModelAndView("/sns/sns");
		//mav.addObject("member",mem_code);
		
		HashMap<String, Object> data = new HashMap<>();
		data.put("dept_num", dept_num);
		List<Sns_Vo> list = service.sns_list_first(data);
		return list;
	}
	@RequestMapping(value="/scheduler/sns_update.json")
	public @ResponseBody List<Sns_Vo> sns_update(int recent){
		int dept_num  = 0;
		Authentication auth=SecurityContextHolder.getContext().getAuthentication();
		Object pricipal=auth.getPrincipal();
		if (pricipal !=null && pricipal instanceof Member_Vo_Security) {
			dept_num=((Member_Vo_Security)pricipal).getDept_num();
		}
		HashMap<String, Object> data = new HashMap<>();
		data.put("dept_num", dept_num);
		data.put("recent", recent);
		
		List<Sns_Vo> list = service.sns_list_prepend(data);
		return list;
		
	}
	
	@RequestMapping(value="/scheduler/sns_log.json")
	public @ResponseBody List<Sns_Vo> sns_log(int decent){
		int dept_num  = 0;
		Authentication auth=SecurityContextHolder.getContext().getAuthentication();
		Object pricipal=auth.getPrincipal();
		if (pricipal !=null && pricipal instanceof Member_Vo_Security) {
			dept_num=((Member_Vo_Security)pricipal).getDept_num();
		}
		HashMap<String, Object> data = new HashMap<>();
		data.put("dept_num", dept_num);
		data.put("decent", decent);
		
		List<Sns_Vo> list = service.sns_list_append(data);
		return list;
	}
	
	
}
