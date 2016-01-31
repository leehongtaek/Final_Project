/**
* 작업 날짜 : 2015. 11. 17.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.easyware.report.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easyware.report.dao.Report_Dao;


@Service
public class Report_Doc_ServiceImp implements Report_Doc_Service {

	@Autowired
	private Report_Dao dao;

	@Override
	public Object doc_Add(Object... params) {
		return dao.insert("report.docAdd", params[0]);
	}

	@Override
	public Object doc_Detail(Object... params) {
		return dao.selectOne("report.docDetail", params[0]);
	}

	@Override
	public Object doc_List(Object... params) {
		return dao.selectList("report.docList", params[0]);
	}

	@Override
	public Object doc_Modify(Object... params) {
		return dao.update("report.docModify", params[0]);
	}

	@Override
	public Object doc_Delete(Object... params) {
		return dao.delete("report.docDelete", params[0]);
	}

	@Override
	public Object doc_getForm(Object... params) {
		return dao.selectOne("report.docgetForm", params[0]);
	}

}
