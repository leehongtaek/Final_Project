/**
* 작업 날짜 : 2015. 11. 12.
* 구현 내용 :   
*  
* @author By Byeong Gi Kim 
*/
package com.easyware.timecard.service;

import java.util.Calendar;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easyware.timecard.dao.TimeCard_Dao;
import com.easyware.timecard.vo.TimeCard_Vo;
import com.easyware.utility.PagingUtill;

@Service
public class TimeCard_ServiceImp implements TimeCard_Service{

	@Autowired
	private TimeCard_Dao dao;
	
	
	/**
	 * 출근으로 지정한 Calendar 객체를 구하는 Method
	 * @return
	 */
	private Calendar Work_Start(){
		// 출근 시간 구하기 
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.HOUR_OF_DAY,9);
		cal.set(Calendar.MINUTE,1);
		cal.set(Calendar.SECOND,0);
		cal.set(Calendar.MILLISECOND, 0);
		return cal;
	}
	/**
	 * 퇴근 시간으로 지정한 Calendar 객체를 구하는 메소드
	 * @return
	 */
	private Calendar Work_End(){
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.HOUR_OF_DAY,18);
		cal.set(Calendar.MINUTE,1);
		cal.set(Calendar.SECOND,0);
		cal.set(Calendar.MILLISECOND, 0);
		return cal;
	}
	
	/**
	 * 출근 시간 이후 정상출근, 지각으로 근태 상태 분기
	 */
	@Override
	public Object timecard_Add(TimeCard_Vo vo) {
		// 출근 시간 지정 하기(09:00) 
		Calendar work_start_time = Work_Start();
		
		// 현재 시간 구하기
		Calendar now = Calendar.getInstance();
		
		if(now.before(work_start_time)) vo.setTc_state("0");     //  9 시 이전 출근은 0:정상출근
		else if(now.after(work_start_time)) vo.setTc_state("1"); //  9 시 1분 후는 1: 지각으로 처리
 			
		return dao.insert("timecard.insert_work_start", vo);
	}
	
	
	
	/**
	 * 퇴근 시간 정상출근,조퇴 등의 근태 상태 분기
	 */
	@Override
	public Object timecard_Modify_Tcwork_End(TimeCard_Vo vo) {
		// 퇴근 시간 지정 하기(18:00) 
		Calendar work_end_time = Work_End();
		
		// 현재 시간 구하기
		Calendar now = Calendar.getInstance();
		
		
		String tc_state=(String)dao.selectOne("timecard.tc_state_check", vo);
		       
		// 근태 상태 변경 로직 
														    
		if("0".equals(tc_state)&&now.before(work_end_time)) {
			tc_state = "2"; // 정상 출근 / 조퇴 
		} else if("1".equals(tc_state) && now.before(work_end_time) ){ 
			// 지각 출근 / 조퇴
			tc_state = "3";
		} else if ("0".equals(tc_state)) {
			//  정상 출근 /정상 퇴근
			tc_state = "Y";
		} else if("1".equals(tc_state)){ 
			// 지각 / 정상 퇴근
			tc_state = "1";	
		} 
		
		
		// 외출 여부 확인 후 퇴근 처리
		if ("5".equals(tc_state)&& now.before(work_end_time)) {
			// 정상출근 / 외출 / 조퇴
			tc_state = "7";
		} else if("6".equals(tc_state) && now.before(work_end_time)){
			// 지각 / 외출 / 조퇴 
			tc_state = "8";
		} else if("5".equals(tc_state)){
			// 정상 출근 / 외출  / 퇴근 
			tc_state = "5";
		} else if("6".equals(tc_state)){
			// 지각/ 외출  / 퇴근 
			tc_state = "6";
		}
		
		
		
		 vo.setTc_state(tc_state);    
 					
		return dao.update("timecard.update_work_end", vo);
	}
	
	
	/**
	 * 외출 시작 
	 */
	@Override
	public Object timecard_Modify_Tcgoout_Start(Object... params) {

		String tc_state=(String)dao.selectOne("timecard.tc_state_check", params[0]);
		
		if ("0".equals(tc_state)) tc_state = "5";     // 정상 출근, 외출
		else if("1".equals(tc_state)) tc_state = "6"; // 지각 , 외출
		
		// 외출 여부 체크 
		TimeCard_Vo vo=((TimeCard_Vo)params[0]);		
		vo.setTc_state(tc_state);
		
		// 상태변경     
		dao.update("timecard.update_tc_state", vo);
		return dao.update("timecard.update_goout_start", vo);
	}
	
	@Override
	public Object timecard_Search_Add_Check(Object... params) {
		return dao.selectOne("timecard.work_start_check", params[0]);
	}

	
	@Override
	public Object[] timecard_list(HashMap<String, Object> data) {
		      
		int total_cnt= (int) dao.selectOne("timecard.total",data);
		
		PagingUtill util = new PagingUtill(total_cnt, 10, 3, (int) data.get("currentpage") );
		
		data.putAll(util.page_dataMap());
		Object[] result= {dao.selectList("timecard.paging", data),data};
		return result;
	}
	
	@Override
	public Object timecard_Search_Etc_Data(Object... params) {
		return dao.selectOne("timecard.select_work_etc", params[0]);
	}

	
	@Override
	public Object timecard_Modify_Etc(Object... params) {
		return dao.update("timecard.update_etc", params[0]);
	}

	

	@Override
	public Object timecard_Modify_Tcgoout_End(Object... params) {
		return dao.update("timecard.update_goout_end", params[0]);
	}


	@Override
	public Object[] timecard_DashBoard_list(String mem_code) {
		Object[] result= {dao.selectList("timecard.list", mem_code)};
		return result;
	}

}
