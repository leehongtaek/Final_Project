/**
* 작업 날짜 : 2015. 11. 16.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.easyware.roomrent.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.easyware.common.security.Member_Vo_Security;
import com.easyware.roomrent.service.RoomRent_Service;
import com.easyware.roomrent.vo.Rent_Vo;
import com.easyware.roomrent.vo.Room_Vo;
import com.easyware.roomrent.vo.Search_Vo;

@Controller
public class RoomRent_Controller {
	
	@Autowired
	private RoomRent_Service service;

	// 사용자의 mem_code를 가져와 시설예약정보를 추가한다.
	@RequestMapping(value="/roomrent/rent_Insert", method=RequestMethod.POST)
	public ModelAndView rent_Insert(Rent_Vo vo){
		String mem_code="";
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object pricipal = auth.getPrincipal();
		if (pricipal != null && pricipal instanceof Member_Vo_Security) {
			mem_code = ((Member_Vo_Security)pricipal).getMem_code();
		}
		vo.setMem_code(mem_code);
		service.rent_Add(vo);
		return new ModelAndView("redirect:/roomrent/room_rent_list");
	}
	
	@RequestMapping(value="/roomrent/room_Insert", method=RequestMethod.POST)
	public ModelAndView room_Insert(Room_Vo vo){
		service.room_Add(vo);
		return new ModelAndView("redirect:/roomrent/manage_rent_List");
	}
	
	@RequestMapping(value="/roomrent/room_rent_list")
	public String room_rent_list(){
		return "/roomrent/room_rent_list";
	}
	
	@RequestMapping(value="/roomrent/room_List", method=RequestMethod.GET)
	public @ResponseBody List<Room_Vo> room_List() throws IOException{
		List<Room_Vo> list = (List<Room_Vo>) service.room_List();
		return list;
	} 
	
	@RequestMapping(value="/roomrent/rent_List", method=RequestMethod.GET)
	public @ResponseBody List<Rent_Vo> rent_List(HttpServletRequest request) throws IOException{
		String mem_code = (String) request.getSession().getAttribute("mem_code");
		List<Rent_Vo> list = (List<Rent_Vo>) service.rent_List(mem_code);
		return list;
	}
	
	@RequestMapping(value="/roomrent/manage_rent_List", method=RequestMethod.GET)
	public ModelAndView manage_rent_List(Search_Vo vo) throws IOException{
		List<Rent_Vo> list = (List<Rent_Vo>) service.manage_List();
		List<Room_Vo> room = (List<Room_Vo>) service.room_Search(vo);
		ModelAndView mav = new ModelAndView("/roomrent/room_rent_manage_list");
		mav.addObject("list", list);
		mav.addObject("room", room);
		System.out.println("searchVal : " + vo.getSearchValue());
		System.out.println("searchType : " + vo.getSearchType());
		mav.addObject("searchValue", vo.getSearchValue()); //검색어
		mav.addObject("searchType", vo.getSearchType()); //검색종류 -> 제목? 작성자? 내용?
		return mav;
	}
	

	@RequestMapping(value="/roomrent/rent_Detail", method=RequestMethod.GET)
	public ModelAndView rent_Detail(String rent_date_start){
		List<Rent_Vo> list = (List<Rent_Vo>) service.rent_Detail(rent_date_start);
		ModelAndView mav = new ModelAndView("/roomrent/room_rent_detail");
		mav.addObject("list", list);
		return mav;
	}

	@RequestMapping(value="/roomrent/rent_Modify", method=RequestMethod.POST)
	public ModelAndView rent_Modify(Rent_Vo vo){
		service.rent_Modify(vo);
		return new ModelAndView("redirect:/roomrent/room_rent_list");
	}
	
	@RequestMapping(value="/roomrent/room_Modify", method=RequestMethod.POST)
	public ModelAndView room_Modify(Room_Vo vo){
		System.out.println("MODIFY START");
		service.room_Modify(vo);
		return new ModelAndView("redirect:/roomrent/manage_rent_List");
	}
	
	@RequestMapping(value="/roomrent/rent_Modify_Detail", method=RequestMethod.GET)
	public ModelAndView rent_Modify_Detail(String rent_num){
		int numv = Integer.parseInt(rent_num);
		Rent_Vo vo = (Rent_Vo) service.rent_Modify_Detail(numv);
		ModelAndView mav = new ModelAndView("/roomrent/room_rent_modify");
		mav.addObject("vo", vo);
		return mav;
	}
	
	// room_Modify_Detail
	@RequestMapping(value="/roomrent/room_Modify_Detail", method=RequestMethod.GET)
	public ModelAndView room_Modify_Detail(String room_num){
		int numv = Integer.parseInt(room_num);
		System.out.println("ROOM_NUM : "+numv);
		Room_Vo vo = (Room_Vo) service.room_Modify_Detail(numv);
		ModelAndView mav = new ModelAndView("/roomrent/room_modify");
		System.out.println("LOG:::::" + vo.getRoom_name());
		mav.addObject("vo", vo);
		return mav;
	}
	
	@RequestMapping(value="/roomrent/rent_Delete", method=RequestMethod.GET)
	public ModelAndView rent_Delete(String rent_num){
		int numv = Integer.parseInt(rent_num);
		service.rent_Destory(numv);
		return new ModelAndView("redirect:/roomrent/room_rent_list");
	}
	
	@RequestMapping(value="/roomrent/room_Delete", method=RequestMethod.GET)
	public ModelAndView room_Delete(String room_num){
		int numv = Integer.parseInt(room_num);
		service.room_Destory(numv);
		return new ModelAndView("redirect:/roomrent/manage_rent_List");
	}
	
	@RequestMapping(value="/roomrent/manage_rent_Delete", method=RequestMethod.GET)
	public ModelAndView manage_rent_Delete(String rent_num){
		int numv = Integer.parseInt(rent_num);
		service.rent_Destory(numv);
		return new ModelAndView("redirect:/roomrent/manage_rent_List");
	}

	@RequestMapping(value="/roomrent/room_List_Excel")
	public ModelAndView room_Excel(Search_Vo vo){

		List<Room_Vo> listbook = (List<Room_Vo>) service.room_Search(vo);
		return new ModelAndView("excelView", "listbook", listbook);
	}

	
	
}
