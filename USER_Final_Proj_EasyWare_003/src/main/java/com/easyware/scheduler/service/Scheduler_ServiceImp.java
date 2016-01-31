/**
* 작업 날짜 : 2015. 11. 16.
* 구현 내용 :   
*  
* @author By kosta 
*/
package com.easyware.scheduler.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easyware.scheduler.dao.Scheduler_Dao;
import com.easyware.scheduler.vo.Scheduler_Vo;
@Service
public class Scheduler_ServiceImp implements Scheduler_Service{

	@Autowired
	private Scheduler_Dao dao;
	
	
	@Override
	public Object scheduler_Add(Scheduler_Vo vo) {
		dao.insert("scheduler.insert", vo);
		return null;
	}
	@Override
	public Object scheduler_Modify(Scheduler_Vo vo) {
		
		dao.update("scheduler.update",vo);
		return null;
	}
	@Override
	public Object scheduler_Check(int sched_num) {
		
		dao.update("scheduler.check",sched_num);
		return null;
	}

	@Override
	public Object scheduler_Destory(int sched_num) {
		dao.delete("scheduler.delete", sched_num);
		return null;
	}

	@Override
	public Object scheduler_Search(int sched_num) {
		return dao.selectOne("scheduler.data", sched_num);
	}

	@Override
	public List<Scheduler_Vo> scheduler_list_PersonalSchedule(String mem_code){
		List<Scheduler_Vo> result= (List<Scheduler_Vo>) dao.selectList("scheduler.list", mem_code);
		return result;
	}
	@Override
	public List<Scheduler_Vo> scheduler_list_PersonalSchedule_30(String mem_code) {
		List<Scheduler_Vo> result= (List<Scheduler_Vo>) dao.selectList("scheduler.list_30", mem_code);
		return result;
	}
	@Override
	public List<Scheduler_Vo> scheduler_list_newPersonalSchedule(String mem_code) {
		List<Scheduler_Vo> result= (List<Scheduler_Vo>) dao.selectList("scheduler.newdata", mem_code);
		return result;
	}
	@Override
	public Object[] scheduler_list_CommonSchedule(HashMap<String, Object> data) {
		// TODO Auto-generated method stub
		return null;
	}

}
