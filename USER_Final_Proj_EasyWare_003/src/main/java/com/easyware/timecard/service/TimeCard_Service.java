/**
* 작업 날짜 : 2015. 11. 12.
* 구현 내용 :   
*  
* @author By Byeong Gi Kim 
*/
package com.easyware.timecard.service;

import java.util.HashMap;

import com.easyware.timecard.vo.TimeCard_Vo;

public interface TimeCard_Service {
	public Object timecard_Add(TimeCard_Vo vo);
	public Object timecard_Search_Add_Check(Object... params);
	public Object timecard_Search_Etc_Data(Object... params);
	public Object timecard_Modify_Tcgoout_Start(Object... params);
	public Object timecard_Modify_Tcgoout_End(Object... params);
	public Object timecard_Modify_Tcwork_End(TimeCard_Vo vo);
	public Object timecard_Modify_Etc(Object... params);
	public Object[] timecard_list(HashMap<String, Object> data);
	public Object[] timecard_DashBoard_list(String mem_code);
}
