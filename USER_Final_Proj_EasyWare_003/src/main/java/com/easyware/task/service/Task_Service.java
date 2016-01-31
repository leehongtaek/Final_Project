/**
* 작업 날짜 : 2015. 11. 24.
* 구현 내용 : Task에서 사용하는 Service를 interface로 만들어서 상속하여 객체간의 
* 		     의존성 낮춤 
* @author Byeong Gi Kim 
*/
package com.easyware.task.service;

import java.util.HashMap;

import com.easyware.utility.Paging_Vo;
import com.easyware.utility.Search_Vo;

public interface Task_Service {
	
	
	/**
	 * 
	 * @param params
	 * @return
	 */
	abstract public Object task_Add(Object... params);
	/**
	 * 
	 * @param data
	 * @return
	 */
	abstract public Object[] task_List(HashMap<String, Object> data);
	/** 
	 * 
	 * @param params
	 * @return
	 */
	abstract public Object[] task_Detail(Object... params);
	/**
	 * 
	 * @param params
	 * @return
	 */
	abstract public Object task_Modify(Object... params);
	/**
	 * 
	 * @param data
	 * @return
	 */
	abstract public Object[] task_Assignee_List(HashMap<String, Object> data);
	/**
	 * 
	 * @param params
	 * @return
	 */
	public Object task_Assignee_List_Detail(Object... params);
	/**
	 * 
	 * @param params
	 * @return
	 */
	public Object task_Assignee_Modify(Object...params);
	/**
	 * 
	 * @param params
	 * @return
	 */
	public Object task_Assignee_Modify_State(Object...params);
	/**
	 * 
	 * @param params
	 * @return
	 */
	public Object task_Task_Assignee_Delete(Object...params);
	/**
	 * 
	 * @param pvo
	 * @param svo
	 * @return
	 */
	public Object[] task_Search_Assignee(Paging_Vo pvo,Search_Vo svo);
	/**
	 * 
	 * @param pvo
	 * @param svo
	 * @return
	 */
	public Object[] task_Search_Task(Paging_Vo pvo,Search_Vo svo);
	/**
	 * 
	 * @param assignee_assignee
	 * @return
	 */
	public Object task_Assignee_Dashboard_List(String assignee_assignee);

}
