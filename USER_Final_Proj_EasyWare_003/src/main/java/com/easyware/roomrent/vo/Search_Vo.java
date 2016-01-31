/**
* 작업 날짜 : 2015. 11. 26.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.easyware.roomrent.vo;

public class Search_Vo {
	
	private String searchValue, searchType;
	private String rent_date_start;

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

	public String getRent_date_start() {
		return rent_date_start;
	}

	public void setRent_date_start(String rent_date_start) {
		this.rent_date_start = rent_date_start;
	}

}
