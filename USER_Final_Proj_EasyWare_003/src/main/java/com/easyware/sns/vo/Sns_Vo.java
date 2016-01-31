/**
* 작업 날짜 : 2015. 11. 18.
* 구현 내용 :   
*  
* @author By kosta 
*/
package com.easyware.sns.vo;

public class Sns_Vo {
	private int sns_num;
	private String mem_code;
	private String mem_name;
	private int dept_num;
	private String sns_date;
	private String sns_title;
	private String sns_content;
	
	
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public int getSns_num() {
		return sns_num;
	}
	public void setSns_num(int sns_num) {
		this.sns_num = sns_num;
	}
	public String getMem_code() {
		return mem_code;
	}
	public void setMem_code(String mem_code) {
		this.mem_code = mem_code;
	}
	public int getDept_num() {
		return dept_num;
	}
	public void setDept_num(int dept_num) {
		this.dept_num = dept_num;
	}
	public String getSns_date() {
		return sns_date;
	}
	public void setSns_date(String sns_date) {
		this.sns_date = sns_date;
	}
	public String getSns_title() {
		return sns_title;
	}
	public void setSns_title(String sns_title) {
		this.sns_title = sns_title;
	}
	public String getSns_content() {
		return sns_content;
	}
	public void setSns_content(String sns_content) {
		this.sns_content = sns_content;
	}
	
	
}
