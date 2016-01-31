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
public class Report_Approval_ServiceImp implements Report_Approval_Service{

	@Autowired
	private Report_Dao dao;

	@Override
	public Object approval_Add(Object... params) {
		// TODO Auto-generated method stub
		return null;
	}

	// update가 두개라서 @Transactional걸어줌
	@Transactional
	@Override
	public Object approval_Modify(Object... params) {
		//appr_state : 1
		//report_num : 28
		//appr_turn : 1
		
		ApprReport_Vo apprVo = ((ApprReport_Vo)params[0]);
		Report_Vo reportVo = new Report_Vo();
		
		int repNum = apprVo.getReport_num();
		
		//승인하기전 레포트 상태 확인
		String report_state = (String) dao.selectOne("report.reportState", repNum);
		
		// 레포트에 결재 대기중인 member 총 수
		int reportMemCnt = (int) dao.selectOne("report.reportMemberCount", repNum);
		System.err.println("reportMemCnt 결재 대기중의 총 멤버수 : " + reportMemCnt);
		//사용안함 System.err.println("report_state 확인!!!! : " + report_state);
		
		for(int i = 1; i <= reportMemCnt; i++) {
			if(apprVo.getAppr_turn() - reportMemCnt == 0){
				//총 count수와 Appr_turn을 빼서 나온값이 0과 같다면 마지막 승인자
				//이기 때문에 Appr_state만 2로 update 해주고 
				//report_state를  2인 승인완료로 update
				
				//기안취소상태의 문서를 승인할 경우가 있어서
				//레포트상태가 0이 아닐때만 수행
				if(!(report_state.equals("0"))){
					apprVo.setAppr_state("2");
					System.err.println("====Appr_state=== 최종 승인자 : 1 ----> 2로 update");
					dao.update("report.approvalModify", apprVo);
					
					//report_state를  2인 승인완료로 update
					reportVo.setReport_state("2");
					reportVo.setReport_num(apprVo.getReport_num());
					dao.update("report.approvalFinalModify", reportVo);
					break;
				}else{
					System.err.println("재출자가 기안 취소하였습니다.");
					return "approvalCance";
				}
			}else{
				if(!(report_state.equals("0"))){
					//레포트 번호로 찾아서 appr_turn 1번의 appr_state를 2로 update
					apprVo.setAppr_state("2");
					System.err.println((reportMemCnt - i) + "번째 승인자 Appr_state=== : 1 ----> 2로 update");
					dao.update("report.approvalModify", apprVo);
					
					//appr_turn를 +1 해서 레포트 번호와 찾은 다음 appr_state를 1로 변경
					int turnNum = apprVo.getAppr_turn();	
					++turnNum; //1증가해서 다음 결재자의 결재 상태값 결재중인 1로 update
					apprVo.setAppr_turn(turnNum);
					apprVo.setAppr_state("1");
					dao.update("report.approvalModify", apprVo);
					break;
				}else{
					System.err.println("재출자가 기안 취소하였습니다.");
					return "approvalCance";
				}
			}
		}
		return "approval";
	}
	@Override
	public Object approval_Delete(Object... params) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object approval_Detail(Object... params) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object approval_List(Object... params) {
		return dao.selectList("report.ApprovalList", params[0]);
	}

	@Override
	public Object approval_Search(Object... params) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object approval_Total(Object... params) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object approval_Count(Object... params) {
		return dao.selectOne("report.ApprovalCount", params[0]);
	}
	
	//반려 update
	// update가 두개라서 @Transactional걸어줌
	@Transactional
	@Override
	public Object approval_Refuse_Modify(Object... params) {
		
		Report_Vo reportvo = ((Report_Vo)params[0]);
		
		if(reportvo.getReport_state().equals("3")){
			//레포트 상태를 반려로 update report_state = '3'
			dao.update("report.reportRefuseModify", params[0]);
			
			//반려 누른 member의 appr_state = '3'(반려) 으로 update
			dao.update("report.approvalRefuseModify", params[0]);
			
		}else if(reportvo.getReport_state().equals("1")){
			//레포트 상태를 결재진행중으로 update report_state = '1'
			dao.update("report.reportRefuseModify", params[0]);
			
			//다시재출 누른 member의 appr_state = '1'(결재진행중) 으로 update
			dao.update("report.approvalRefuseModify", params[0]);
			
		}else if(reportvo.getReport_state().equals("0")){
			//결재진행중인 레포트를 기안취소(임시저장으로 수정) update report_state = '0'
			dao.update("report.reportRefuseModify", params[0]);
			
			//기안취소 누르면 레포트에 걸려있는 모든 결재자의
			//appr_state = '0' 으로 update
			dao.update("report.approvalRefuseModify", params[0]);
		}
		
				
		return null;
	}

	@Override
	public Object[] report_Modify_Detail(Object... params) {
		Object[] result = { dao.selectOne("report.reportAddDetail", params[0]),
				dao.selectList("report.getApprDetail", params[0]) };
		return result;
	}
	//반려된 보고서 내용 제목 수정
	@Override
	public Object report_Refuse_Modify(Object... params) {
		
		return dao.update("report.reportRefuseUpdate", params[0]);
	}


}
