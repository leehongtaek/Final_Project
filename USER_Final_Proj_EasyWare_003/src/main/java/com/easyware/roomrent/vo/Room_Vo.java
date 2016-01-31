/**
* 작업 날짜 : 2015. 11. 16.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.easyware.roomrent.vo;

public class Room_Vo {
	
	private int room_num, room_limit;
	private String room_name, room_loc;
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
	
	

}
