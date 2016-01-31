/**
* 작업 날짜 : 2015. 11. 26.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.easyware.report.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.easyware.common.security.Member_Vo_Security;
import com.easyware.report.service.Report_Workflow_Service;
import com.easyware.report.vo.Report_Vo;
import com.easyware.report.vo.WorkFlow_Vo;
import com.easyware.utility.PagingUtill;

@Controller
public class Report_Workflow_Controller {

	@Autowired
	private Report_Workflow_Service service;
	
	@Autowired
	private HashMap<String, Object> pagingData;
	
	
	// workflow 리스트
//	@RequestMapping(value = "/report/report_workflow_list/{workflowType}")
//	public ModelAndView workflowList(
//			@PathVariable(value = "workflowType") String workflowType) {
//		String report_writer = "";
//		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//		Object pricipal = auth.getPrincipal();
//		if (pricipal != null && pricipal instanceof Member_Vo_Security) {
//			report_writer = ((Member_Vo_Security) pricipal).getMem_code();
//		}
//		
//		HashMap<String, String> map = new HashMap<String, String>();
//		//전체문서,진행중,최종문서,반려문서 판단..
//		map.put("workflowType", workflowType);
//		map.put("REPORT_WRITER", report_writer);
//		
//		System.err.println("========================mem_code : " + report_writer);
//		List<WorkFlow_Vo> list = (List<WorkFlow_Vo>) service.workflow_List(map);
//		
//		for(WorkFlow_Vo vo : list) {
//			System.err.println("getMem_name : "+vo.getMem_name());
//			System.err.println("getReport_state : "+vo.getReport_state());
//			System.err.println("getAppr_state : "+vo.getAppr_state());
//		}
//		
//
//		ModelAndView mav = new ModelAndView("/report/report_workflow_list");
//		mav.addObject("list", list);
//		mav.addObject("workflowType", workflowType);
//		
//		return mav;
//	}
	
	
	// workflow 리스트
		@RequestMapping(value = "/report/report_workflow_list")
		public ModelAndView workflowListPaging(Integer workflowType, Integer currentpage) {
			
			String report_writer = "";
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			Object pricipal = auth.getPrincipal();
			if (pricipal != null && pricipal instanceof Member_Vo_Security) {
				report_writer = ((Member_Vo_Security) pricipal).getMem_code();
			}
			
			System.err.println("currentpage : " + currentpage);
			System.err.println("workflowType====== : " + workflowType);
			// 1. 페이지 유틸을 생성
			int total_record = (int) service.workflow_Total("");
			
			//프로퍼티즈 속성으로 뺀다.
			int page_per_record_cnt = 5; // 페이지에서 보여줄 게시물 수
			int group_per_page_cnt = 5; // 페이지의 갯수
			if (currentpage == null) {
				currentpage = 1; // 현재 페이지
			}
			
			// DI를 한다.
			PagingUtill pg = new PagingUtill(total_record, page_per_record_cnt, group_per_page_cnt, currentpage);
			
			pagingData = (HashMap<String, Object>) pg.page_dataMap();
			pagingData.put("REPORT_WRITER", report_writer);
			pagingData.put("WORKFLOWTYPE", workflowType);
			
			List<WorkFlow_Vo> list = 
					(List<WorkFlow_Vo>) service.workflow_List_Paging(pagingData);
			
			
			for(WorkFlow_Vo vo : list) {
				System.err.println("getMem_name : "+vo.getMem_name());
				System.err.println("getReport_state : "+vo.getReport_state());
			}

			ModelAndView mav = new ModelAndView("/report/report_workflow_list");
			mav.addObject("list", list);
			mav.addObject("pagingData", pagingData);
			mav.addObject("currentpage",currentpage);
			mav.addObject("workflowType", workflowType);
			
			return mav;
		}
	
	//report_num에 걸려있는 승인자 가져오는 Ajax 컨트롤러
	@RequestMapping(value={"/report/apprMember.json"})
	public @ResponseBody List<HashMap<String,Object>> apprMemberList(String report_num){
			System.err.println("Ajax Test================report_num : " + report_num);
			int repNum = Integer.parseInt(report_num);
			
		return (List<HashMap<String, Object>>) service.workflow_ApprMember_List(repNum);
	}
}






