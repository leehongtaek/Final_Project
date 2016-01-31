/**
* 작업 날짜 : 2015. 11. 13.
* 구현 내용 :   
*  
* @author By Byeong Gi Kim 
*/
package com.easyware.person.manage.vo;

import java.util.List;

import org.springframework.security.core.GrantedAuthority;

public class Person_Vo {
	private String mem_code; 		// 1.  사원번호
	private String mem_id;			// 2.  아이디
	private String mem_pwd;			// 3.  패스워드
	private String mem_name;		// 4.  이름
	private int posit_num;			// 5.  직급번호
	private String posit_name;		//     직급이름
	private int dept_num;			// 6.  부서번호
	private String dept_name;		//     부서이름
	private String mem_tel;			// 7.  전화번호
	private String mem_email;		// 8.  이메일
	private String mem_hiredate; 	// 9. 입사일
	private String mem_birthdate; 	// 10. 생년월일
	private String mem_post;		// 11. 우편번호
	private String mem_roadaddr;	// 12. 도로명주소
	private String mem_jibunaddr;	// 13. 지번 주소
	private String mem_detailaddr;	// 14. 상세주소
	private String mem_state;  		// 15. 멤버 상태
	private List<GrantedAuthority> authorities; 
	public String getMem_code() {
		return mem_code;
	}
	public void setMem_code(String mem_code) {
		this.mem_code = mem_code;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pwd() {
		return mem_pwd;
	}
	public void setMem_pwd(String mem_pwd) {
		this.mem_pwd = mem_pwd;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public int getPosit_num() {
		return posit_num;
	}
	public void setPosit_num(int posit_num) {
		this.posit_num = posit_num;
	}
	public int getDept_num() {
		return dept_num;
	}
	public void setDept_num(int dept_num) {
		this.dept_num = dept_num;
	}
	public String getMem_tel() {
		return mem_tel;
	}
	public void setMem_tel(String mem_tel) {
		this.mem_tel = mem_tel;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getMem_hiredate() {
		return mem_hiredate;
	}
	public void setMem_hiredate(String mem_hiredate) {
		this.mem_hiredate = mem_hiredate;
	}
	public String getMem_birthdate() {
		return mem_birthdate;
	}
	public void setMem_birthdate(String mem_birthdate) {
		this.mem_birthdate = mem_birthdate;
	}
	public String getMem_post() {
		return mem_post;
	}
	public void setMem_post(String mem_post) {
		this.mem_post = mem_post;
	}
	public String getMem_roadaddr() {
		return mem_roadaddr;
	}
	public void setMem_roadaddr(String mem_roadaddr) {
		this.mem_roadaddr = mem_roadaddr;
	}
	public String getMem_jibunaddr() {
		return mem_jibunaddr;
	}
	public void setMem_jibunaddr(String mem_jibunaddr) {
		this.mem_jibunaddr = mem_jibunaddr;
	}
	public String getMem_detailaddr() {
		return mem_detailaddr;
	}
	public void setMem_detailaddr(String mem_detailaddr) {
		this.mem_detailaddr = mem_detailaddr;
	}
	public String getMem_state() {
		return mem_state;
	}
	public void setMem_state(String mem_state) {
		this.mem_state = mem_state;
	}
	
	public List<GrantedAuthority> getAuthorities() {
		return authorities;
	}
	public void setAuthorities(List<GrantedAuthority> authorities) {
		this.authorities = authorities;
	}
	
	public String getPosit_name() {
		return posit_name;
	}
	public void setPosit_name(String posit_name) {
		this.posit_name = posit_name;
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	
}
