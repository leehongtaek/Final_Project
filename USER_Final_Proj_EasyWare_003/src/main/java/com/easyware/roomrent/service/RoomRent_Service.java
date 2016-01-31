/**
* 작업 날짜 : 2015. 11. 16.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.easyware.roomrent.service;

import com.easyware.roomrent.vo.Rent_Vo;
import com.easyware.roomrent.vo.Room_Vo;
import com.easyware.roomrent.vo.Search_Vo;

public interface RoomRent_Service {
	public Object room_Add(Room_Vo vo); // Object... : object 배열
	public Object rent_Add(Rent_Vo vo);
	public Object room_List();
	public Object rent_List(String mem_code);
	public Object manage_List();
	public Object rent_Detail(String date);
	public Object rent_Modify(Rent_Vo vo);
	public Object room_Modify(Room_Vo vo);
	public Object rent_Modify_Detail(int num);
	public Object room_Modify_Detail(int num);
	public Object rent_Destory(int num);
	public Object room_Destory(int num);
	public Object room_Search(Search_Vo vo);
}
