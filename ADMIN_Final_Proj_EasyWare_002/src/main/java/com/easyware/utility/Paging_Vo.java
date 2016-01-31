/**
* 작업 날짜 : 2015. 11. 14.
* 구현 내용 :   
*  
* @author By kira 
*/
package com.easyware.utility;

import java.util.HashMap;

public class Paging_Vo {
	private HashMap<String, Object> data = new HashMap<>();
	private int currentpage;    // 현재 페이지 currentpage
	private int orderType;      // 정렬 타입 DESC:1  ASC:2
	private int group_per_page_cnt;		// 가져올 자료의 수
	private int page_per_record_cnt;    // 페이지 갯수
	
	// 상세 검색
	private String search_title;// 제목 
	private String search_content;// 내용
	
	// 일반 검색
	private int searchType;     // 검색기준
	private String searchValue; // 검색값
	
	public HashMap<String,Object> getMap(){
		// HashMap<String, Object> 
		// 페이징
		this.data.put("currentpage", this.currentpage);
		this.data.put("orderType", this.orderType);
		this.data.put("group_per_page_cnt", this.group_per_page_cnt);
		this.data.put("page_per_record_cnt", this.page_per_record_cnt);
		
		// 일반 검색
		this.data.put("searchValue", this.searchValue);
		this.data.put("searchType", this.searchType);
		
		// 상세검색
		this.data.put("search_title", this.search_title);
		this.data.put("search_content", this.search_content);
		
		return data;
	}

	public int getCurrentpage() {
		return currentpage;
	}

	public void setCurrentpage(int currentpage) {
		this.currentpage = currentpage;
	}

	public int getOrderType() {
		return orderType;
	}

	public void setOrderType(int orderType) {
		this.orderType = orderType;
	}

	public int getGroup_per_page_cnt() {
		return group_per_page_cnt;
	}

	public void setGroup_per_page_cnt(int group_per_page_cnt) {
		this.group_per_page_cnt = group_per_page_cnt;
	}

	public int getPage_per_record_cnt() {
		return page_per_record_cnt;
	}

	public void setPage_per_record_cnt(int page_per_record_cnt) {
		this.page_per_record_cnt = page_per_record_cnt;
	}

	public String getSearch_title() {
		return search_title;
	}

	public void setSearch_title(String search_title) {
		this.search_title = search_title;
	}

	public String getSearch_content() {
		return search_content;
	}

	public void setSearch_content(String search_content) {
		this.search_content = search_content;
	}


	public int getSearchType() {
		return searchType;
	}

	public void setSearchType(int searchType) {
		this.searchType = searchType;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}
	
	
	
}
