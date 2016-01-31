/**
* 작업 날짜 : 2015. 11. 23.
* 구현 내용 :   
*  
* @author By Byeong Gi Kim 
*/
package com.easyware.timecard.manage.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.easyware.timecard.manage.service.TimeCard_Service;

@Controller
public class TimeCard_Manager_Controller {
	
	@Autowired
	private TimeCard_Service service;
	
	@RequestMapping("/timecardManager")
	public ModelAndView getList() throws FileNotFoundException, IOException{
		ModelAndView mv = new ModelAndView("/timecardManager");
		mv.addObject("prop", service.timecard_Properties_Load());
		return mv;
	}
	@RequestMapping("/timecardManager/insert")
	public ModelAndView insert(String full_time , 
			String start_time,
			String end_time) throws FileNotFoundException, IOException{
		ModelAndView mv = new ModelAndView("redirect:/timecardManager");
		Properties prop =  new Properties();
		prop.setProperty("full_time", full_time);
		prop.setProperty("start_time", start_time);
		prop.setProperty("end_time", end_time);
		service.timecard_Properties_Save(prop);
		return mv;
	}
	
	
		
}
