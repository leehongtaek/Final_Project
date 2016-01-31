/**
* 작업 날짜 : 2015. 11. 18.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.easyware.roomrent.manage.service;

import com.easyware.roomrent.manage.vo.RoomRent_ManageVo;

public interface RoomRent_Manage_Service {
	
	public Object room_Add(RoomRent_ManageVo vo);
	public Object room_List();
	public Object rent_List();
	public Object room_Detail(int num);
	public Object room_Modify(RoomRent_ManageVo vo);
	public Object rent_Destory(int num);
}
