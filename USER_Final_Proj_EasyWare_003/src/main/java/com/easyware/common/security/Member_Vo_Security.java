/**
* 작업 날짜 : 2015. 11. 12.
* 구현 내용 :   
*  
* @author By Byeong Gi Kim 
*/
package com.easyware.common.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class Member_Vo_Security implements UserDetails{

/*  MEMBER TABLE 구조
	MEM_CODE    VARCHAR2(50 BYTE)
	MEM_ID	 	VARCHAR2(30 BYTE)
	MEM_PWD	    VARCHAR2(30 BYTE)
	MEM_NAME	VARCHAR2(30 BYTE)
	DEPT_NUM	NUMBER
	POSIT_NUM	NUMBER
	MEM_TEL	VARCHAR2(20 BYTE)
	MEM_EMAIL	VARCHAR2(30 BYTE)
	MEM_HIREDATE	DATE
	MEM_BIRTHDATE	DATE
	MEM_POST	CHAR(6 BYTE)
	MEM_ROADADDR	VARCHAR2(300 BYTE)
	MEM_JIBUNADDR	VARCHAR2(300 BYTE)
	MEM_DETAILADDR	VARCHAR2(300 BYTE)
	MEM_STATE	CHAR(1 BYTE)*/
	
	
	
	private String mem_code; 		// 1.  사원번호
	private String mem_id;			// 2.  아이디
	private String mem_pwd;			// 3.  패스워드
	private String mem_name;		// 4.  이름
	private int posit_num;			// 5.  직급번호
	private int dept_num;			// 6.  부서번호
	private String mem_tel;			// 7.  전화번호
	private String mem_email;		// 8.  이메일
	private String mem_hiredate; 	// 9. 입사일
	private String mem_birthdate; 	// 10. 생년월일
	private String mem_post;		// 11. 우편번호
	private String mem_roadaddr;	// 12. 도로명주소
	private String mem_jibunaddr;	// 13. 지번 주소
	private String mem_detailaddr;	// 14. 상세주소
	private String mem_state;  		// 15. 멤버 상태
	private String mem_ip;			// 16. 접속 주소
	
	public String getMem_ip() {
		return mem_ip;
	}

	

	public void setMem_ip(String mem_ip) {
		this.mem_ip = mem_ip;
	}

	private List<GrantedAuthority> authorities; 
	
	
	
	public Member_Vo_Security() {}



	public Member_Vo_Security(
		String mem_code, 
		String mem_id, 
		String mem_pwd, 
		String mem_name, 
		int dept_num,   
		int posit_num,
		String mem_tel, 
		String mem_email, 
		String mem_hiredate, 
		String mem_birthdate, 
		String mem_post,
		String mem_roadaddr, 
		String mem_jibunaddr, 
		String mem_detailaddr, 
		String mem_state) {
		this.mem_code = mem_code;
		this.mem_id = mem_id;
		this.mem_pwd = mem_pwd;
		this.mem_name = mem_name;
		this.posit_num = posit_num;
		this.dept_num = dept_num;
		this.mem_tel = mem_tel;
		this.mem_email = mem_email;
		this.mem_hiredate = mem_hiredate;
		this.mem_birthdate = mem_birthdate; 
		this.mem_post = mem_post;
		this.mem_roadaddr = mem_roadaddr;
		this.mem_jibunaddr = mem_jibunaddr;
		this.mem_detailaddr = mem_detailaddr;
		this.mem_state = mem_state;
		this.authorities = new ArrayList<GrantedAuthority>();
	}

	
	
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

	public void setAuthorities(List<GrantedAuthority> authorities) {
		this.authorities = authorities;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return this.authorities = authorities;
		
	}

	@Override
	public String getPassword() {
		return this.mem_pwd;
	}
	
	// MEMBER CODE 
	@Override
	public String getUsername() {
		return this.mem_id;
	}

	@Override
	public boolean isAccountNonExpired() {
		
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}


	
	
	
}
