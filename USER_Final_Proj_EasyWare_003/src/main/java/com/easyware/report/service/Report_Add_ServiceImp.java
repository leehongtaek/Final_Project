/**
* 작업 날짜 : 2015. 11. 17.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.easyware.report.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.easyware.report.dao.Report_Dao;
import com.easyware.report.vo.ApprReport_Vo;
import com.easyware.report.vo.Report_Vo;

@Service
public class Report_Add_ServiceImp implements Report_Add_Service {

	@Autowired
	private Report_Dao dao;
 
	@Override
	public Object report_Add_Delete(Object... params) {
		return dao.delete("report.reportAddDelete", params[0]);
	}

	// 한 메소드에 insert 메소드 두번 호출..
	// 한개라도 실패하면 transaction처리로 둘다 취소시킴
	@Transactional
	@Override
	public Object report_Add_Modify(Object... params) {
		
		//Report_Vo의 date로 레포트 update
		dao.update("report.reportAddModify", params[0]);  
		String[] mem_code = (String[]) params[1];
		
		int report_num = ((Report_Vo) params[0]).getReport_num();
		// report 수정시 기존 결재자 delete 후 다시 insert 함..
		dao.delete("report.apprDelete", report_num);

		Report_Vo vo = ((Report_Vo)params[0]);
		
		// vo에 넣는 순서대로 계층 입력(turn)
		// mem_code가 null이면 승인자 insert 안함
		if (mem_code != null) {
			int turn = 1;
			for (String code : mem_code) {

				ApprReport_Vo avo = new ApprReport_Vo();
				avo.setReport_num(report_num);
				avo.setMem_code(code);
				avo.setAppr_turn(turn);
				
				if(vo.getReport_state().equals("1") && turn == 1) {
					avo.setAppr_state("1");
				}else{
					avo.setAppr_state("0");
				}
				dao.insert("report.apprAdd", avo);
				++turn;
			}
		} else {
			System.err.println("==================승인자 없음!!====================");
		}
		return null;
	}


	@Override
	public Object report_Add_List(Object... params) {
		String report_writer = (String) params[0];
		return dao.selectList("report.reportAddList", report_writer);
	}

	// 한 메소드에 insert 메소드 두번 호출..
	// 한개의 insert가 실패하면 transaction처리로 둘다 취소시킴
	@Transactional
	@Override
	public Object report_Write_Add(Object... params) {
		
		//Report_Vo의 date로 레포트 update
		dao.insert("report.reportWriteAdd", params[0]);
		String[] mem_code = (String[]) params[1];
		
		//방금 작성한 레포트의 번호를가져옴
		int report_num = (int) dao.selectOne("report.getReportNum", params[0]);
		System.err.println("==============report_num : " + report_num);
		
		Report_Vo vo = ((Report_Vo)params[0]);
		// vo에 넣는 순서대로 계층 입력(turn)
		// mem_code가 null이면 결재자는 insert 안함
		if (mem_code != null) {
			int turn = 1;
			for (String code : mem_code) {
				ApprReport_Vo avo = new ApprReport_Vo();
				avo.setReport_num(report_num);  //레포트번호
				avo.setMem_code(code);			//선택한 결재자들의 사원번호
				avo.setAppr_turn(turn);			//결재 순서
				
				//레포트의 상태가 1(결재중)이면서 첫번째 결재자는 결재상태를 1(결재중)로 입력
				if(vo.getReport_state().equals("1") && turn == 1) {
					avo.setAppr_state("1");
				}else{
					avo.setAppr_state("0");
				}
				dao.insert("report.apprAdd", avo);
				++turn;
			}
		} else {
			System.err.println("==================승인자 없음!!====================");
		}
		return null;
	}

	// 레포트 디테일(레포트와 승인자때문에 배열로 리턴함)
	@Override
	public Object[] report_Add_Detail(Object... params) {
		Object[] result = { dao.selectOne("report.reportAddDetail", params[0]),
				dao.selectList("report.getApprDetail", params[0]) };
		return result;
	}

	@Override
	public Object ApprMember_Modify(Object... params) {
		// TODO Auto-generated method stub
		return dao.update("report.ApprMemberModify", params[0]);
	}
}
