/**
* 작업 날짜 : 2015. 11. 24.
* 구현 내용 :   
*  
* @author By Byeong Gi Kim 
*/
package com.easyware.task.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.easyware.common.security.Member_Vo_Security;
import com.easyware.task.service.Task_Service;
import com.easyware.task.vo.Assignee_Vo;
import com.easyware.task.vo.Task_Vo;
import com.easyware.utility.Paging_Vo;
import com.easyware.utility.Search_Vo;

@Controller
public class Task_Controller {
	
	@Autowired
	private Task_Service service;
	
	@RequestMapping(value="/task/add")
	public String task_add()
	{
		return "/task/add";
	}
	
	
	
	/**
	 * 로그인한 사용자의 사원코드를 스프링 시큐리티에서 관리하는 Authentication을 가져온다.
	 * @return mem_code :Stirng
	 */
	private String getMem_Code()
	{
		String mem_code="";
 		Authentication auth=SecurityContextHolder.getContext().getAuthentication();
		Object pricipal=auth.getPrincipal();
		if (pricipal !=null && pricipal instanceof Member_Vo_Security) {
			mem_code=((Member_Vo_Security)pricipal).getMem_code();
		}
		
		return mem_code;
	}

	/**
	 * task 리스트를 항목을 불러온다.
	 * @param vo
	 * @return
	 */
	@RequestMapping("/task/list")
	public ModelAndView task_list(Paging_Vo vo)
	{
		ModelAndView mv = new ModelAndView("/task/list");	
		String task_organizer=getMem_Code();
		vo.getMap().put("task_organizer", task_organizer);
		
		Object[] result=service.task_List(vo.getMap());
		mv.addObject("list", result[0]);
		mv.addObject("pagingData", result[1]);
		return mv;
	}
	/**
	 * task 항목을 추가한다.
	 * @param mem_code
	 * @param vo
	 * @return
	 */
	@RequestMapping(value="/task/insert",method=RequestMethod.POST)
	public String task_insert(String[] mem_code,Task_Vo vo)
	{
	
		service.task_Add(vo,mem_code);
		return "redirect:/task/list";
	}
	
	/**
	 * task 항목을 수정한다.
	 * @param vo
	 * @return
	 */
	@RequestMapping(value="/task/task_update",method=RequestMethod.POST)
	public ModelAndView task_Modify(Task_Vo vo)
	{
		ModelAndView mv = new ModelAndView("redirect:/task/list");
		
		service.task_Modify(vo);
		return mv;
	}
	
	/**
	 * task 상세 정보 페이지에 정보를 가져온다.
	 * @param vo
	 * @return
	 */
	@RequestMapping("/task/detail")
	public ModelAndView task(Task_Vo vo)
	{
		ModelAndView mv = new ModelAndView("/task/detail");
		String task_organizer=getMem_Code();		
		vo.setTask_organizer(task_organizer);
		
		Object[] result=service.task_Detail(vo);
		mv.addObject("vo",result[0]);
		mv.addObject("alist",result[1]);
		return mv;
	}
	
	/**
	 * 부여받은(assignee된) task 정보를 가져온다.
	 * @param vo
	 * @return
	 */
	@RequestMapping("/task/assignee_list")
	public ModelAndView task_Assignee_List(Paging_Vo vo)
	{
		ModelAndView mv = new ModelAndView("/task/assignee_list");		
		String assignee_assignee=getMem_Code();
		vo.getMap().put("assignee_assignee", assignee_assignee);
		
		Object[] result=service.task_Assignee_List(vo.getMap());
		mv.addObject("list",result[0]);
		mv.addObject("pagingData", result[1]);
		return mv;
	}
	
	
	/**
	 * 부여받은 task에 상세 정보를 불러온다.
	 * @param task_num
	 * @return
	 */
	@RequestMapping("/task/assignee_list_detail")
	public ModelAndView task_Assignee_List_Detail(Integer task_num)
	{
		ModelAndView mv = new ModelAndView("/task/assignee_detail");
		String assignee_assignee=getMem_Code();
		
		HashMap<String, Object> data = new HashMap<>();
		data.put("task_num", task_num);
		data.put("assignee_assignee", assignee_assignee);
		mv.addObject("vo",service.task_Assignee_List_Detail(data)); 
		return mv;
	}
	
	/**
	 * 부여받은 task 내용을 수정한다.
	 * @param vo
	 * @return
	 */
	@RequestMapping(value="/task/assignee_update",method=RequestMethod.POST)
	public ModelAndView task_Update_Assignee(Assignee_Vo vo)
	{
		ModelAndView mv = new ModelAndView("redirect:/task/assignee_list");
		service.task_Assignee_Modify(vo);
		return mv;
	}
	
	/**
	 * 부여받은 task를 완료 상태로 변경한다.
	 * @param vo
	 * @return
	 */
	// assignee_update_state 
	@RequestMapping(value="/task/assignee_update_state")
	public ModelAndView task_Update_Assignee_state(Assignee_Vo vo)
	{ 
		ModelAndView mv = new ModelAndView("redirect:/task/detail?task_num="+vo.getTask_num());
		service.task_Assignee_Modify_State(vo);
		return mv;
	}
	/**
	 * task를 삭제시  task 삭제 프로시져를 호출한다.
	 * @param vo
	 * @return
	 */
	// task.task_assignee_delete_procedure
	@RequestMapping(value="/task/task_delete", method=RequestMethod.POST)
	public ModelAndView task_Update_Assignee_state(Task_Vo vo)
	{ 
		ModelAndView mv = new ModelAndView("redirect:/task/list");
		
		service.task_Task_Assignee_Delete(vo);
		return mv;
	}
	 
	/**
	 * 부여받은 task 목록들을 상세 검색하는 기능을 수행한다.
	 * @param pvo
	 * @param svo
	 * @return
	 */
	// 검색
	@RequestMapping(value="/task/search_assignee", method=RequestMethod.GET)
	public ModelAndView task_Seach_Assignee(Paging_Vo pvo,Search_Vo svo)
	{ 
		ModelAndView mv = new ModelAndView("/task/assignee_search_list");
		
		String assignee_assignee=getMem_Code();
		svo.getMap().put("assignee_assignee",assignee_assignee );        
		
		Object[] result=service.task_Search_Assignee(pvo,svo);
		mv.addObject("list",result[0]);
		mv.addObject("pagingData",result[1]); 
		mv.addObject("svo",svo); 
		return mv;      
	}
	
	/**
	 * task 목록들을 상세 검색하는 기능을 수행한다.
	 * @param pvo
	 * @param svo
	 * @return
	 */
	// 검색
	@RequestMapping(value="/task/search_task", method=RequestMethod.GET)
	public ModelAndView task_Search_Task(Paging_Vo pvo,Search_Vo svo)
	{ 
		ModelAndView mv = new ModelAndView("/task/search_list");
		
		String task_organizer=getMem_Code();
		svo.getMap().put("task_organizer",task_organizer );        
		
		Object[] result=service.task_Search_Task(pvo,svo);
		mv.addObject("list",result[0]);
		mv.addObject("pagingData",result[1]);
		mv.addObject("svo",svo);
		return mv;
	}

	
	
}
