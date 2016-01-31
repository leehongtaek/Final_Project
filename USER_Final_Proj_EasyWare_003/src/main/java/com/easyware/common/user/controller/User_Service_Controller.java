/**
* 작업 날짜 : 2015. 11. 14.
* 구현 내용 :   
*  
* @author By kira 
*/
package com.easyware.common.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.easyware.common.user.service.User_Service;
import com.easyware.common.user.vo.Member_Vo;

@Controller
public class User_Service_Controller {
	
	@Autowired
	User_Service service;
	
	
	
	
	@RequestMapping(value="/user/{serviceName}")
	public ModelAndView  User_Service(
			@PathVariable(value="serviceName") String serviceName,
			Member_Vo vo, HttpServletResponse response
			) throws IOException
	{	ModelAndView mv =new ModelAndView("/signup_result");
		System.out.println("service"+serviceName);
		System.out.println(vo.getMem_id());
		System.out.println(vo.getMem_pwd());
		System.out.println(vo.getMem_name());
		System.out.println(vo.getPosit_num());
		System.out.println(vo.getDept_num());
		System.out.println(vo.getMem_tel());
		System.out.println(vo.getMem_email());
		System.out.println(vo.getMem_hiredate());
		System.out.println(vo.getMem_birthdate());
		System.out.println(vo.getMem_roadaddr());
		System.out.println(vo.getMem_jibunaddr());
		System.out.println(vo.getMem_detailaddr());
		
		if ("idchk".equals(serviceName)) {
			PrintWriter out=response.getWriter();
			out.println(service.user_idChk(vo));
			out.flush();
			out.close(); 
		} else if ("add".equals(serviceName)){
			int res = (int) service.user_Add(vo);
			if (res !=1) mv.setViewName("/error/signup");
			
		} 
		return mv;
	}
	

	@RequestMapping(value={"/user/deptInfo.json",})
	public @ResponseBody List<HashMap<String,Object>> dept_Info(){
		
		return (List<HashMap<String, Object>>) service.user_Search_Dept();
	}
	
	@RequestMapping(value={"/user/positInfo.json"})
	public @ResponseBody List<HashMap<String,Object>> posit_Info(){
			
		return (List<HashMap<String, Object>>) service.user_Search_Posit();
	}
	@RequestMapping(value={"/user/user_search_List.json"})
	public @ResponseBody List<HashMap<String,Object>> user_search_List(
			Member_Vo vo 
			){
		
		return (List<HashMap<String, Object>>) service.user_search_List(vo);
	}
	
	
	
	
}
