/**
* 작업 날짜 : 2015. 11. 12.
* 구현 내용 :   
*  
* @author By Byeong Gi Kim 
*/
package com.easyware.timecard.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.easyware.common.security.Member_Vo_Security;
import com.easyware.timecard.service.TimeCard_Service;
import com.easyware.timecard.vo.TimeCard_Vo;
import com.easyware.utility.Paging_Vo;

@Controller
public class TimeCard_Controller {
	
	@Autowired
	TimeCard_Service service;
	
	// URL 매핑 방식 /serviceName/serviceFuntion/param
	// 				/서비스명/서비스기능/파마리터 
	@RequestMapping(value="/serviceName/serviceFuntion/param")
	public String admin_timeCard(){
		
		return "/";
	}             
	
	
	/**
	 * 로그인한 사용자의 사원코드를 스프링 시큐리티에서 관리하는 Authentication을 가져온다.
	 * @return mem_code :Stirng
	 */
	private String getMem_Code(){
		String mem_code="";
 		Authentication auth=SecurityContextHolder.getContext().getAuthentication();
		Object pricipal=auth.getPrincipal();
		if (pricipal !=null && pricipal instanceof Member_Vo_Security) {
			mem_code=((Member_Vo_Security)pricipal).getMem_code();
		}
		
		return mem_code;
	}
	
	
	@RequestMapping(value="/timecard")
	public ModelAndView timeCard( Paging_Vo pvo){
		// 시 큐 리티에서 사용자 정보 가져오기 
		String mem_code = getMem_Code();
		
		/*Authentication auth=SecurityContextHolder.getContext().getAuthentication();
		Object pricipal=auth.getPrincipal();
		if (pricipal !=null && pricipal instanceof Member_Vo_Security) {
			mem_code=((Member_Vo_Security)pricipal).getMem_code();
		}*/
		
		// 페이징 초기화
		int currentpage=pvo.getCurrentpage();
		if (currentpage == 0) pvo.setCurrentpage(1);
		// System.out.println("currentpage::::::::::::::::"+currentpage);
		
		// 사원 코드 데이터 맵 추가 
		HashMap<String, Object> data = pvo.getMap();
		data.put("mem_code",mem_code );
			
		
		// 전송 후 리스트 결과 반환 
		Object[] datas=service.timecard_list(data);
		ModelAndView mv=new ModelAndView("/timecard");
		mv.addObject("list",datas[0]);
		mv.addObject("pagingData",datas[1]);
		return mv;
	}                                             
	
	@RequestMapping(value="/timecard_update",method={RequestMethod.POST,RequestMethod.GET})
	public String timeCard_Update(String cmd,HttpServletResponse response,
			TimeCard_Vo vo, String selectedDay, String tcetc) throws IOException{
		
		String mem_code = getMem_Code();
		
		/*Authentication auth=SecurityContextHolder.getContext().getAuthentication();
		Object pricipal=auth.getPrincipal();
		if (pricipal !=null && pricipal instanceof Member_Vo_Security) {
			mem_code=((Member_Vo_Security)pricipal).getMem_code();
		}*/
		
		vo.setMem_code(mem_code);
		vo.setDay(selectedDay);
		vo.setTcetc(tcetc);
		
		// System.out.println("seleced_Day:::::::"+selectedDay);
		
		// COMMAND PATTEN 
		if ("etc_data".equals(cmd)) {
			PrintWriter out=response.getWriter();
			out.println(service.timecard_Search_Etc_Data(vo)); // etc 정보 가져옴
			out.flush();
			out.close();
		} else if ("etc".equals(cmd)){
			service.timecard_Modify_Etc(vo);
		} else if ("tcgoout_start".equals(cmd)){
			service.timecard_Modify_Tcgoout_Start(vo);
		} else if ("tcgoout_end".equals(cmd)){
			service.timecard_Modify_Tcgoout_End(vo);
		}  else if ("tcwork_end".equals(cmd)){
			service.timecard_Modify_Tcwork_End(vo);
		}
		
		return null;
	}             
	
}
