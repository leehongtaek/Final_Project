/**
* 작업 날짜 : 2015. 11. 16.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.easyware.roomrent.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easyware.roomrent.dao.RoomRent_Dao;
import com.easyware.roomrent.vo.Rent_Vo;
import com.easyware.roomrent.vo.Room_Vo;
import com.easyware.roomrent.vo.Search_Vo;

@Service
public class RoomRent_ServiceImp implements RoomRent_Service{

	@Autowired
	private RoomRent_Dao dao;
	
	// 시설정보 추가 - 관리자
	@Override
	public Object room_Add(Room_Vo vo) {
		dao.insert("room_Rent.room_Insert", vo);
		return null;
	}

	// 시설예약 정보 추가 - 사용자
	@Override
	public Object rent_Add(Rent_Vo vo) {
		dao.insert("room_Rent.rent_Insert", vo);
		return null;
	}

	// 시설정보 List
	@Override
	public Object room_List() {
		List<Room_Vo> list = (List<Room_Vo>) dao.selectList("room_Rent.room_List", "");
		return list;
	}

	// 시설예약 정보 List - 사용자
	@Override
	public Object rent_List(String mem_code) {
		List<Rent_Vo> list = (List<Rent_Vo>) dao.selectList("room_Rent.rent_List", mem_code);
		System.out.println("Service에서 mem_code"+mem_code);
		return list;
	}
	
	// 시설예약 정보 List - 운영자
	@Override
	public Object manage_List() {
		List<Rent_Vo> list = (List<Rent_Vo>) dao.selectList("room_Rent.rent_manage_List", "");
		return list;
	}

	// 날짜별 시설정보 상세보기 - 사용자
	@Override
	public Object rent_Detail(String date) {
		List<Rent_Vo> list = (List<Rent_Vo>) dao.selectList("room_Rent.rent_Detail", date);
		return list;
	}
	
	// 시설예약 정보 수정을 위한 상세보기 - 사용자
	@Override
	public Object rent_Modify_Detail(int num) {
		Rent_Vo vo = (Rent_Vo) dao.selectOne("room_Rent.rent_Modify_Detail", num);
		return vo;
	}
	
	// 시설정보 수정을 위한 상세보기 - 운영자
	@Override
	public Object room_Modify_Detail(int num) {
		Room_Vo vo = (Room_Vo) dao.selectOne("room_Rent.room_Modify_Detail", num);
		return vo;
	}

	// 시설 예약 정보 수정 - 사용자
	@Override
	public Object rent_Modify(Rent_Vo vo) {
		dao.update("room_Rent.rent_Modify", vo);
		return null;
	}
	
	// 시설 정보 수정 - 운영자
	@Override
	public Object room_Modify(Room_Vo vo) {
		dao.update("room_Rent.room_Modify", vo);
		return null;
	}

	// 시설 예약 정보 삭제 - 사용자
	@Override
	public Object rent_Destory(int num) {
		dao.delete("room_Rent.rent_Delete", num);
		return null;
	}

	// 시설 정보 삭제 - 운영자
	@Override
	public Object room_Destory(int num) {
		dao.delete("room_Rent.room_Delete", num);
		return null;
	}

	// 시설 정보 검색 - 운영자
	@Override
	public Object room_Search(Search_Vo vo) {
		List<Room_Vo> list = (List<Room_Vo>) dao.selectList("room_Rent.room_Search", vo);
		return list;
	}

	
}
