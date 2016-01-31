/**
* 작업 날짜 : 2015. 11. 18.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.easyware.roomrent.manage.vo;

public class RoomRent_ManageVo {
	
	private int room_num, room_limit;
	private String room_name, room_loc;
	private int rent_num;
	private String rent_reason;
	private String rent_date_start;
	private String rent_date_end;
	private String rent_time_start;
	private String rent_time_end;
	private String mem_code;
	private String mem_name;
	public int getRoom_num() {
		return room_num;
	}
	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}
	public int getRoom_limit() {
		return room_limit;
	}
	public void setRoom_limit(int room_limit) {
		this.room_limit = room_limit;
	}
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	public String getRoom_loc() {
		return room_loc;
	}
	public void setRoom_loc(String room_loc) {
		this.room_loc = room_loc;
	}
	public int getRent_num() {
		return rent_num;
	}
	public void setRent_num(int rent_num) {
		this.rent_num = rent_num;
	}
	public String getRent_reason() {
		return rent_reason;
	}
	public void setRent_reason(String rent_reason) {
		this.rent_reason = rent_reason;
	}
	public String getRent_date_start() {
		return rent_date_start;
	}
	public void setRent_date_start(String rent_date_start) {
		this.rent_date_start = rent_date_start;
	}
	public String getRent_date_end() {
		return rent_date_end;
	}
	public void setRent_date_end(String rent_date_end) {
		this.rent_date_end = rent_date_end;
	}
	public String getRent_time_start() {
		return rent_time_start;
	}
	public void setRent_time_start(String rent_time_start) {
		this.rent_time_start = rent_time_start;
	}
	public String getRent_time_end() {
		return rent_time_end;
	}
	public void setRent_time_end(String rent_time_end) {
		this.rent_time_end = rent_time_end;
	}
	public String getMem_code() {
		return mem_code;
	}
	public void setMem_code(String mem_code) {
		this.mem_code = mem_code;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
}
