/**
* 작업 날짜 : 2015. 11. 18.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.easyware.roomrent.manage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.easyware.roomrent.manage.service.RoomRent_Manage_Service;
import com.easyware.roomrent.manage.vo.RoomRent_ManageVo;

@Controller
public class RoomRent_Manage_Controller {
	
	@Autowired
	private RoomRent_Manage_Service service;

	@RequestMapping(value="/roomrent/room_Insert", method=RequestMethod.POST)
	public ModelAndView room_Insert(RoomRent_ManageVo vo){
		service.room_Add(vo);
		return new ModelAndView("redirect:/roomrent/room_rent_manage_list");
	}
	
	@RequestMapping(value="/roomrent/room_rent_manage_list")
	public String room_rent_manage_list(){
		return "/roomrent/room_rent_manage_list";
	}
	
	@RequestMapping(value="/roomrent/room_List", method=RequestMethod.GET)
	public @ResponseBody List<RoomRent_ManageVo> room_List(){
		List<RoomRent_ManageVo> list = (List<RoomRent_ManageVo>) service.room_List();
		return list;
	}
	
	@RequestMapping(value="/roomrent/rent_List", method=RequestMethod.GET)
	public ModelAndView rent_List(){
		List<RoomRent_ManageVo> list = (List<RoomRent_ManageVo>) service.rent_List();
		ModelAndView mav = new ModelAndView("/roomrent/room_rent_manage_list");
		System.out.println("LOG::::::::::::"+list.get(0).getRoom_loc());
		String room_loc = list.get(0).getRoom_loc();
		mav.addObject("list", list);
		mav.addObject("room_loc", room_loc);
		return mav;
	}
	
	@RequestMapping(value="/roomrent/room_Detail", method=RequestMethod.GET)
	public ModelAndView room_Detail(int num){
		RoomRent_ManageVo vo = (RoomRent_ManageVo) service.room_Detail(num);
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", vo);
		return mav;
	}
	
	@RequestMapping(value="/roomrent/room_Modify", method=RequestMethod.POST)
	public ModelAndView room_Modify(RoomRent_ManageVo vo){
		service.room_Modify(vo);
		return new ModelAndView("redirect:/roomrent/room_rent_manage_list");
	}
}
