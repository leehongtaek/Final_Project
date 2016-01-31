/**
* 작업 날짜 : 2015. 11. 26.
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.easyware.common.security.Member_Vo_Security;
import com.easyware.report.service.Report_Doc_Service;
import com.easyware.report.service.Report_Add_Service;
import com.easyware.report.vo.ApprReport_Vo;
import com.easyware.report.vo.DocForm_Vo;
import com.easyware.report.vo.Report_Vo;

@Controller
public class Report_Add_Controller {

	@Autowired
	private Report_Add_Service service;

	// 보고서 임시 저장 및 재출
	@RequestMapping(value = "/report/report_write_add_ok", method = RequestMethod.POST)
	public ModelAndView reportWriteAddOk(String[] mem_code, Report_Vo vo) {
		/*
		 * int i = 1; for (String string : mem_code) { System.err.println(
		 * "승인자들 확인 : " + i + "번째" + string); i++; }
		 */
		String report_writer = "";
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object pricipal = auth.getPrincipal();
		if (pricipal != null && pricipal instanceof Member_Vo_Security) {
			report_writer = ((Member_Vo_Security) pricipal).getMem_code();
		}
		
		
		vo.setReport_writer(report_writer);
		System.err.println("getReport_report_state : " + vo.getReport_state());
		System.err.println("getReport_writer : " + vo.getReport_writer());
		System.err.println("getReport_title : " + vo.getReport_title());

		ModelAndView mav = new ModelAndView();
		service.report_Write_Add(vo, mem_code);
		
		if(vo.getReport_state().equals("1")) {
			//재출하면 보고서 workflow 리스트로 이동
			mav.setViewName("redirect:/report/report_workflow_list?workflowType=4");
		}else{
			//임시저장하면 임시저장 리스트로 이동
			mav.setViewName("redirect:/report/report_add_list");
		}
		return mav;
	}

	// 임시 저장된 레포트 리스트
	@RequestMapping(value = "/report/report_add_list")
	public ModelAndView reportAddList() {

		String mem_code = "";
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object pricipal = auth.getPrincipal();
		if (pricipal != null && pricipal instanceof Member_Vo_Security) {
			mem_code = ((Member_Vo_Security) pricipal).getMem_code();
		}
		System.err.println("========================mem_code : " + mem_code);

		List<Report_Vo> list = (List<Report_Vo>) service.report_Add_List(mem_code);

		ModelAndView mav = new ModelAndView("/report/report_add_list");
		mav.addObject("list", list);

		return mav;
	}

	// 임시 저장 레포트 가져오기 
	@RequestMapping(value = "/report/report_add_detail/{report_num}")
	public ModelAndView reportAddDetail(
			@PathVariable(value = "report_num") String report_num) {

		int repNum = Integer.parseInt(report_num);
		System.err.println("====================레포트 번호 : " + repNum);

		Object[] result = service.report_Add_Detail(repNum);

		ModelAndView mav = new ModelAndView("/report/report_add_detail");
		mav.addObject("vo", result[0]);
		mav.addObject("list", result[1]);
		return mav;
	}

	// 임시 저장한 레포트 수정
	@RequestMapping(value = "/report/report_add_modify_ok", method = RequestMethod.POST)
	public ModelAndView reportAddModifyOk(String[] mem_code, Report_Vo vo) {

		System.err.println("getReport_report_state : " + vo.getReport_state());
		System.err.println("getReport_writer : " + vo.getReport_writer());
		System.err.println("getReport_title : " + vo.getReport_title());
		
		ModelAndView mav = new ModelAndView();
		if(vo.getReport_state().equals("1")) {
			
			//제출하면 보고서 workflow 리스트로 이동
			mav.setViewName("redirect:/report/report_workflow_list?workflowType=4");
		}else{
			//수정하고 임시저장 리스트로 이동
			mav.setViewName("redirect:/report/report_add_list");
		}
		service.report_Add_Modify(vo, mem_code);
		return mav;
	}

	// 보고서 delete 삭제 하고 리스트로 이동
	@RequestMapping(value = "/report/report_add_delete_ok/{report_num}")
	public ModelAndView reportAddDeleteOk(@PathVariable(value = "report_num") String report_num) {
		int repNum = Integer.parseInt(report_num);
		service.report_Add_Delete(repNum);
		return new ModelAndView("redirect:/report/report_add_list");
	}
}
