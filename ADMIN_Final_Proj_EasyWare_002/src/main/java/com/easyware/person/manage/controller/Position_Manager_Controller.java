/**
* 작업 날짜 : 2015. 11. 17.
* 구현 내용 :   
*  
* @author By Byeong Gi Kim 
*/
package com.easyware.person.manage.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.easyware.person.manage.service.Position_Manager_Service;

@Controller
public class Position_Manager_Controller {
	
	@Autowired
	private Position_Manager_Service position_Manager_Service;
	
	@RequestMapping(value="/positManager")
	public  ModelAndView Department_List()
	{
		List<HashMap<String, Object>> list=
		(List<HashMap<String, Object>> )position_Manager_Service.position_Menager_List();
		ModelAndView mv = new ModelAndView("/positManager");
		mv.addObject("list",list);
		return mv;
	}
	
	

	@RequestMapping(value="/positManager/{serviceName}", method=RequestMethod.POST)
	public  ModelAndView Department_Service(
			@PathVariable("serviceName") String serviceName, 
			@RequestParam(required=false) String posit_name,
			@RequestParam(required=false) Integer posit_num
			)
	{	
		ModelAndView mv =new ModelAndView("redirect:/positManager");
		if ("update".equals(serviceName)) {
			System.out.println("update::::::::::::");
			HashMap<String, Object> data = new HashMap<>();
			data.put("posit_name", posit_name);
			data.put("posit_num", posit_num);
			position_Manager_Service.position_Menager_Update(data);
			mv= null;
		} else if("delete".equals(serviceName)){
			System.out.println("delete::::::::::::");
			position_Manager_Service.position_Menager_Delete(posit_num);
			mv= null;
		} else if("insert".equals(serviceName)){
			System.out.println("insert::::::::::::");
			position_Manager_Service.position_Menager_Insert(posit_name);
			
		}
		
		return mv;
		
	}
	
	
	
	
}
