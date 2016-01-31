/**
* 작업 날짜 : 2015. 11. 14.
* 구현 내용 :   
*  
* @author By kira 
*/
package com.easyware.utility;

import java.util.HashMap;

public class Search_Vo { 
	private String start_time;  // 시작일
	private String end_time;    // 종료일 
	       
	private int dept_num; 	// 부서번호
	private int posit_num;	// 직급번호 
	
	private String searchValue; // 검색 값
	private String searchType;  // 검색 타입
	
	private String task_state; // 승인 처리 여부
	
	private HashMap<String, Object> data = new HashMap<>();
	
	public HashMap<String,Object> getMap(){
		// HashMap<String, Object> 
		// 페이징
		this.data.put("start_time", this.start_time);
		this.data.put("end_time", this.end_time);
		this.data.put("dept_num", this.dept_num); 
		this.data.put("posit_num", this.posit_num);
		
		// 일반 검색
		this.data.put("searchValue", this.searchValue);
		this.data.put("searchType", this.searchType);
		
		// 승인 여부
		this.data.put("task_state", this.task_state);
		return data;
	}

	public String getStart_time() {
		return start_time;
	}

	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}

	public String getEnd_time() {
		return end_time;
	}

	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}

	public int getDept_num() {
		return dept_num;
	}

	public void setDept_num(int dept_num) {
		this.dept_num = dept_num;
	}

	public int getPosit_num() {
		return posit_num;
	}

	public void setPosit_num(int posit_num) {
		this.posit_num = posit_num;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getTask_state() {
		return task_state;
	}

	public void setTask_state(String task_state) {
		this.task_state = task_state;
	}

	
	
	
	
	
}
