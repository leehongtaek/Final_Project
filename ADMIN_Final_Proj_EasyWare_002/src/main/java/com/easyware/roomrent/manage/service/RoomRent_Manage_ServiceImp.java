/**
* 작업 날짜 : 2015. 11. 18.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.easyware.roomrent.manage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easyware.roomrent.manage.dao.RoomRent_Manage_Dao;
import com.easyware.roomrent.manage.vo.RoomRent_ManageVo;

@Service
public class RoomRent_Manage_ServiceImp implements RoomRent_Manage_Service{

	@Autowired
	private RoomRent_Manage_Dao dao;
	
	@Override
	public Object room_Add(RoomRent_ManageVo vo) {
		dao.insert("room_Rent.room_Insert", vo);
		return null;
	}

	@Override
	public Object room_List() {
		List<RoomRent_ManageVo> list = (List<RoomRent_ManageVo>) dao.selectList("room_Rent.room_List", "");
		return list;
	}

	@Override
	public Object rent_List() {
		List<RoomRent_ManageVo> list = (List<RoomRent_ManageVo>) dao.selectList("room_Rent.rent_List", "");
		return list;
	}

	@Override
	public Object room_Detail(int num) {
		RoomRent_ManageVo vo = (RoomRent_ManageVo) dao.selectOne("room_Rent.room_Detail", num);
		return vo;
	}

	@Override
	public Object room_Modify(RoomRent_ManageVo vo) {
		dao.update("room_Rent.room_Modify", vo);
		return null;
	}

	@Override
	public Object rent_Destory(int num) {
		dao.delete("room_Rent.room_Delete", num);
		return null;
	}
	
	

}
