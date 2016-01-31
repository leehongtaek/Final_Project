/**
* 작업 날짜 : 2015. 11. 25.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.easyware.report.vo;

public class ApprReport_Vo {
	
	private int appr_num; 			/* 결재번호 */
	private int report_num; 		/* 보고서번호 */
	private String mem_code; 		/* 승인자 */
	private int appr_turn; 			/* 결재순번 길이값과 같은놈이 최종 승인자*/
	private String report_apprday; 	/* 결재날짜 */
	private String appr_state; 		/* 승인상태 0 미확인,1승인, 2반려*/
	
	
	public int getAppr_num() {
		return appr_num;
	}
	public void setAppr_num(int appr_num) {
		this.appr_num = appr_num;
	}
	public int getReport_num() {
		return report_num;
	}
	public void setReport_num(int report_num) {
		this.report_num = report_num;
	}
	public String getMem_code() {
		return mem_code;
	}
	public void setMem_code(String mem_code) {
		this.mem_code = mem_code;
	}
	public int getAppr_turn() {
		return appr_turn;
	}
	public void setAppr_turn(int appr_turn) {
		this.appr_turn = appr_turn;
	}
	public String getReport_apprday() {
		return report_apprday;
	}
	public void setReport_apprday(String report_apprday) {
		this.report_apprday = report_apprday;
	}
	public String getAppr_state() {
		return appr_state;
	}
	public void setAppr_state(String appr_state) {
		this.appr_state = appr_state;
	}
}
