/**
* 작업 날짜 : 2015. 11. 17.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.easyware.report.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.easyware.common.security.Member_Vo_Security;
import com.easyware.report.service.Report_Approval_Service;
import com.easyware.report.vo.ApprReport_Vo;
import com.easyware.report.vo.Report_Vo;
import com.easyware.report.vo.WorkFlow_Vo;

@Controller
public class Report_Approval_Controller {

	@Autowired
	private Report_Approval_Service service;
	
	//에러페이지 이동
	@RequestMapping(value="/report/report_appr_cancel")
	public String errorPage(){
		return "/report/report_appr_cancel";
	} 
       
	// 결제할 보고서 리스트
	// A.APPR_STATE = '1' 과 A.MEM_CODE = #{REPORT_WRITER} 로 출력
	@RequestMapping(value = "/report/report_appr_list")
	public ModelAndView reportApprList() {
		System.err.println("========================================================");
		String report_writer = "";
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object pricipal = auth.getPrincipal();
		if (pricipal != null && pricipal instanceof Member_Vo_Security) {
			report_writer = ((Member_Vo_Security) pricipal).getMem_code();
		}

		System.err.println("===============report_writer : " + report_writer);
		List<WorkFlow_Vo> list = (List<WorkFlow_Vo>) service.approval_List(report_writer);

		
		ModelAndView mav = new ModelAndView("/report/report_appr_list");
		mav.addObject("list", list);

		return mav;
	}
	//승인 버튼 눌렀을 때 appr_turn을 받아 다음 결재자를 appr_turn +1 로 찾아 해주고 
	//appr_state 를 1(결재중)로 변경하고 자신은 appr_state를 2(결재완료)으로 update해준다
	@RequestMapping(value= "/report/approval_modify_ok")
	public ModelAndView approvalModifyOk(ApprReport_Vo vo){
		
		
		System.err.println("appr_state : " + vo.getAppr_state()); // 결재상태
		System.err.println("report_num : " + vo.getReport_num()); // 결재할 레포트번호
		System.err.println("appr_turn : " + vo.getAppr_turn());   // 결재할 순서
		
		ModelAndView mav = new ModelAndView();
		
		//결재중 제출자가 기안취소를 할 경우 approvalCance를 리턴하여 에러페이지로 이동
		String result = (String) service.approval_Modify(vo);
		if(result.equals("approvalCance")){
			mav.setViewName("redirect:/report/report_appr_cancel");
		}else{
			mav.setViewName("redirect:/report/report_appr_list");
		}
		return mav;
	}
	// 보고서 반려 및 반려 취소, 기안 취소까지
	@RequestMapping(value= "/report/approval_refuse_ok/{cmd}/{report_num}")
	public ModelAndView approvalRefuseModifyOk(
			@PathVariable(value="cmd") String cmd,
			@PathVariable(value="report_num") String report_num){
		
		System.err.println("=======================================cmd : " + cmd);
		int repNum = Integer.parseInt(report_num);
		Report_Vo vo = new Report_Vo();
		ModelAndView mav = new ModelAndView();
		// 반려와 반려 취소 구분(refuse 반려, refuseCancel 반려취소,
		// approvalCance기안취소, reportModify반려상태에서 문서수정 )
		if(cmd.equals("refuse")){
			vo.setReport_num(repNum);
			vo.setReport_state("3");
			service.approval_Refuse_Modify(vo);
			mav.setViewName("redirect:/report/report_appr_list");
			
		}else if(cmd.equals("refuseCancel")) {
			vo.setReport_num(repNum);
			vo.setReport_state("1");
			service.approval_Refuse_Modify(vo);
			mav.setViewName("redirect:/report/report_workflow_list?workflowType=4");
			
		}else if(cmd.equals("approvalCance")){
			vo.setReport_num(repNum);
			vo.setReport_state("0");
			service.approval_Refuse_Modify(vo);
			mav.setViewName("redirect:/report/report_add_list");
			
		}else if(cmd.equals("reportModify")){
			//반려 수정 버튼
			Object[] result = service.report_Modify_Detail(repNum);

			mav.addObject("vo", result[0]);
			mav.addObject("list", result[1]);
			mav.setViewName("/report/report_refuseModify");
		}
		return mav;
	}

	//반려된 보고서 제목 내용 수정
	@RequestMapping(value="/report/report_refuseModify_ok")
	public ModelAndView reportRefuseModifyOk(Report_Vo vo){
		
		service.report_Refuse_Modify(vo);
		
		ModelAndView mav = new ModelAndView("redirect:/report/report_workflow_list?workflowType=4");
		return mav;
	}
	
	// 결재 할 보고서 count 
	@RequestMapping(value = { "/report/approvalCount.json" })
	public @ResponseBody int approvalCount() {
		System.err.println("Ajax Test=============================== ");

		String report_writer = "";
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object pricipal = auth.getPrincipal();
		if (pricipal != null && pricipal instanceof Member_Vo_Security) {
			report_writer = ((Member_Vo_Security) pricipal).getMem_code();
		}

		return (int) service.approval_Count(report_writer);
	}
	
}
