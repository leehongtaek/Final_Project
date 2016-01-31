/**
* 작업 날짜 : 2015. 11. 17.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.easyware.report.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.easyware.report.service.Report_Doc_Service;
import com.easyware.report.vo.DocForm_Vo;

@Controller
public class Report_Doc_Controller {

	@Autowired
	private Report_Doc_Service service;

	// 보고서 양식 입력 폼으로 이동
	@RequestMapping(value = "/report/doc_add")
	public ModelAndView docAdd() {
		
		ModelAndView mav = new ModelAndView("/report/doc_add");
		int doc_num = 1;
		String doc_form = (String) service.doc_getForm(doc_num);
		mav.addObject("doc_form", doc_form);
		return mav;
	}

	// 보고서 양식 insert 하고 리스트로 이동
	@RequestMapping(value = "/report/doc_add_ok", method = RequestMethod.POST)
	public ModelAndView docAddOk(DocForm_Vo vo) {
		service.doc_Add(vo);
		return new ModelAndView("redirect:/report/doc_list/");
	}

	// 보고서 양식 modify 하고 리스트로 이동
	@RequestMapping(value = "/report/doc_modify_ok", method = RequestMethod.POST)
	public ModelAndView docModifyOk(DocForm_Vo vo) {
		service.doc_Modify(vo);
		return new ModelAndView("redirect:/report/doc_list");
	}

	// 보고서 양식 delete 삭제 하고 리스트로 이동
	@RequestMapping(value = "/report/doc_delete_ok/{doc_num}")
	public ModelAndView docDeleteOk(@PathVariable(value = "doc_num") String doc_num) {
		int num = Integer.parseInt(doc_num);
		service.doc_Delete(num);
		return new ModelAndView("redirect:/report/doc_list");
	}

	// 보고서 양식 리스트 가져오는 페이지
	@RequestMapping(value = "/report/doc_list")
	public ModelAndView docList() {
		ModelAndView mav = new ModelAndView("/report/doc_list");
		List<DocForm_Vo> list = (List<DocForm_Vo>) service.doc_List("");
		mav.addObject("list", list);
		return mav;
	}

	// 보고서 양식 Detail 페이지
	@RequestMapping(value = "/report/doc_detail/{doc_num}")
	public ModelAndView docDetail(@PathVariable(value = "doc_num") String doc_num) {
		int num = Integer.parseInt(doc_num);
		DocForm_Vo vo = (DocForm_Vo) service.doc_Detail(num);
		System.out.println("양식 이름 : " + vo.getDoc_name());
		ModelAndView mav = new ModelAndView();

		mav.setViewName("/report/doc_detail");
		mav.addObject("vo", vo);
		return mav;
	}

	// 보고서 작성할 리스트
	@RequestMapping(value = "/report/report_write_list")
	public ModelAndView reportWriteList() {
		ModelAndView mav = new ModelAndView("/report/report_write_list");
		List<DocForm_Vo> list = (List<DocForm_Vo>) service.doc_List("");
		mav.addObject("list", list);
		return mav;
	}

	// 보고서 작성 폼 이동
	@RequestMapping(value = "/report/report_write_add/{doc_num}")
	public ModelAndView reportWriteAdd(@PathVariable(value = "doc_num") String doc_num) {
		int num = Integer.parseInt(doc_num);
		DocForm_Vo vo = (DocForm_Vo) service.doc_Detail(num);
		System.out.println("양식 이름 : " + vo.getDoc_name());
		ModelAndView mav = new ModelAndView();

		mav.setViewName("/report/report_write_add");
		mav.addObject("vo", vo);
		return mav;
	}
}
