/**
* 작업 날짜 : 2015. 11. 18.
* 구현 내용 :   
*  
* @author By Byeong Gi Kim 
*/
package com.easyware.person.manage.vo;

public class Authority_Vo {
	/*
	DEPT_NAME, 
	POSIT_NAME, 
	MEM_NAME, 
	MEM_CODE, 
	MEM_ID, 
	ROLE_AUTH*/
	
	private String dept_name;
	private String posit_name;
	private String mem_name;
	private String mem_code;
	private String mem_id;
	private String role_auth;
	
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	public String getPosit_name() {
		return posit_name;
	}
	public void setPosit_name(String posit_name) {
		this.posit_name = posit_name;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_code() {
		return mem_code;
	}
	public void setMem_code(String mem_code) {
		this.mem_code = mem_code;
	}
	public String getRole_auth() {
		return role_auth;
	}
	public void setRole_auth(String role_auth) {
		this.role_auth = role_auth;
	}
	
}
