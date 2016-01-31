/**
* 작업 날짜 : 2015. 11. 16.
* 구현 내용 :   
*  
* @author By kosta 
*/
package com.easyware.scheduler.service;

import java.util.HashMap;
import java.util.List;

import com.easyware.scheduler.vo.Scheduler_Vo;

public interface Scheduler_Service {
	public Object scheduler_Add(Scheduler_Vo vo);
	public Object scheduler_Modify(Scheduler_Vo vo);
	public Object scheduler_Check(int sched_num);
	public Object scheduler_Destory(int sched_num);
	public Object scheduler_Search(int sched_num);
	public List<Scheduler_Vo> scheduler_list_PersonalSchedule(String data);
	public List<Scheduler_Vo> scheduler_list_PersonalSchedule_30(String data);
	public List<Scheduler_Vo> scheduler_list_newPersonalSchedule(String data);
	public Object[] scheduler_list_CommonSchedule(HashMap<String, Object> data);
}
