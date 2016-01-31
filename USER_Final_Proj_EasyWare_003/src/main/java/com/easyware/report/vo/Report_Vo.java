/**
* 작업 날짜 : 2015. 11. 17.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.easyware.report.vo;

public class Report_Vo {
	
	private int report_num; 		/* 보고서번호 */
	private String report_writer;	/* 제출자	*/
	private String report_title; 	/* 제목 */
	private String report_content;	/* 내용 */
	private String report_regdate; 	/* 임시저장일 */
	private String report_subdate; 	/* 제출일 */
	private String report_state; 	/* 결재상태 */
	private String report_dday;		/* 결재기한 */
	private int file_num; 			/* 파일번호 */
	public int getReport_num() {
		return report_num;
	}
	public void setReport_num(int report_num) {
		this.report_num = report_num;
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
	public String getReport_regdate() {
		return report_regdate;
	}
	public void setReport_regdate(String report_regdate) {
		this.report_regdate = report_regdate;
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
	public String getReport_dday() {
		return report_dday;
	}
	public void setReport_dday(String report_dday) {
		this.report_dday = report_dday;
	}
	public int getFile_num() {
		return file_num;
	}
	public void setFile_num(int file_num) {
		this.file_num = file_num;
	}
}
