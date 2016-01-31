/**
* 작업 날짜 : 2015. 11. 17.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.easyware.report.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.easyware.report.dao.Report_Dao;
import com.easyware.report.vo.ApprReport_Vo;
import com.easyware.report.vo.Report_Vo;
import com.easyware.task.vo.Assignee_Vo;

@Service
public class Report_Workflow_ServiceImp implements Report_Workflow_Service{

	@Autowired
	private Report_Dao dao;

	@Override
	public Object workflow_Add(Object... params) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object workflow_Modify(Object... params) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object workflow_Delete(Object... params) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object workflow_Detail(Object... params) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object workflow_List(Object... params) {
		return dao.selectList("report.workflowList", params[0]);
	}

	@Override
	public Object workflow_Search(Object... params) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object workflow_Total(Object... params) {
		return dao.selectOne("report.workflowTotal", params[0]);
	}
	@Override
	public Object workflow_ApprMember_List(Object... params) {
		return dao.selectList("report.workflowApprMemberList", params[0]);
	}

	@Override
	public Object report_Index_Count(Object... params) {
		return dao.selectOne("report.reportIndexCount", params[0]);
	}

	@Override
	public Object workflow_List_Paging(HashMap<String, Object> map) {
		return dao.selectList("report.workflowListPaging", map);
	}

	
}
