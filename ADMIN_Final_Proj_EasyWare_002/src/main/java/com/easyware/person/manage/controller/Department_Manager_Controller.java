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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.easyware.person.manage.service.Department_Manager_Service;

@Controller
public class Department_Manager_Controller {
	
	@Autowired
	private Department_Manager_Service department_Manager_Service;
	
	@RequestMapping(value="/deptMangager")
	public  ModelAndView Department_List()
	{
		List<HashMap<String, Object>> list=
		(List<HashMap<String, Object>> )department_Manager_Service.department_Menager_List();
		ModelAndView mv = new ModelAndView("/deptMangager");
		mv.addObject("list",list);
		return mv;
	}
	
	
	@RequestMapping(value="/deptMangager/{serviceName}", method=RequestMethod.POST)
	public  ModelAndView Department_Service(
			@PathVariable("serviceName") String serviceName, 
			@RequestParam(required=false) String dept_name,
			@RequestParam(required=false) Integer dept_num
			)
	{	
		ModelAndView mv =new ModelAndView("redirect:/deptMangager");
		if ("update".equals(serviceName)) {
			System.out.println("update::::::::::::");
			HashMap<String, Object> data = new HashMap<>();
			data.put("dept_name", dept_name);
			data.put("dept_num", dept_num);
			department_Manager_Service.department_Menager_Update(data);
			mv= null;
		} else if("delete".equals(serviceName)){
			System.out.println("delete::::::::::::");
			department_Manager_Service.department_Menager_Delete(dept_num);
			mv= null;
		} else if("insert".equals(serviceName)){
			System.out.println("delete::::::::::::");
			department_Manager_Service.department_Menager_Insert(dept_name);
			
		}
		
		return mv;
		
	}
	
	
	
}
