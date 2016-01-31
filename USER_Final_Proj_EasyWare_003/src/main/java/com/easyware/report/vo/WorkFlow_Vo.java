/**
* 작업 날짜 : 2015. 12. 1.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.easyware.report.vo;

public class WorkFlow_Vo {
	
	private int report_num;
	private int rnum;
	private int currentpage;
	private String mem_code;
	private String appr_turn;
	private String appr_state;
	private String report_writer;
	private String report_title;
	private String report_content;
	private String report_subdate;
	private String report_state;
	private String mem_name;
	private String workflowType;
	
	
	
	
	public int getCurrentpage() {
		return currentpage;
	}
	public void setCurrentpage(int currentpage) {
		this.currentpage = currentpage;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getWorkflowType() {
		return workflowType;
	}
	public void setWorkflowType(String workflowType) {
		this.workflowType = workflowType;
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
	public String getAppr_turn() {
		return appr_turn;
	}
	public void setAppr_turn(String appr_turn) {
		this.appr_turn = appr_turn;
	}
	public String getAppr_state() {
		return appr_state;
	}
	public void setAppr_state(String appr_state) {
		this.appr_state = appr_state;
	}
	public String getReport_writer() {
		return report_writer;
	}
	public void setReport_writer(String report_writer) {
		this.report_writer = report_writer;
	}
	public String getReport_title() {
		return report_title;
	}
	public void setReport_title(String report_title) {
		this.report_title = report_title;
	}
	public String getReport_content() {
		return report_content;
	}
	public void setReport_content(String report_content) {
		this.report_content = report_content;
	}
	public String getReport_subdate() {
		return report_subdate;
	}
	public void setReport_subdate(String report_subdate) {
		this.report_subdate = report_subdate;
	}
	public String getReport_state() {
		return report_state;
	}
	public void setReport_state(String report_state) {
		this.report_state = report_state;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	
	

}
