/**
* 작업 날짜 : 2015. 11. 24.
* 구현 내용 :   
*  
* @author By Byeong Gi Kim 
*/
package com.easyware.task.service;

import java.util.HashMap;
import java.util.HashSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.easyware.task.dao.Task_Dao;
import com.easyware.task.vo.Assignee_Vo;
import com.easyware.task.vo.Task_Vo;
import com.easyware.utility.PagingUtill;
import com.easyware.utility.Paging_Vo;
import com.easyware.utility.Search_Vo;

@Service
public class Task_ServiceImp implements Task_Service{

	@Autowired
	private Task_Dao dao;

	/**
	 * 기본적인 페이징 정보를  초기화하는 메소드이다.
	 * @param data
	 * @return
	 */
	private HashMap<String, Object> pageData_Initialize(HashMap<String, Object> data)
	{
		
		int page_per_record_cnt = (int) data.get("page_per_record_cnt");
		int group_per_page_cnt  = (int) data.get("group_per_page_cnt");
		int currentpage         = (int) data.get("currentpage");
		 
		if (page_per_record_cnt == 0) data.put("page_per_record_cnt", 10);
		if (group_per_page_cnt == 0)  data.put("group_per_page_cnt", 3);
		if (currentpage==0) 		  data.put("currentpage", 1);
		
		return data;
	}
	
	@Override 
	public Object[] task_List(HashMap<String, Object> data) 
	{ 
		// 총갯수 반환 
		int total_record =(int) dao.selectOne("task.cnt_list_task", (String)data.get("task_organizer"));
		
		data=pageData_Initialize(data);		
		
		int page_per_record_cnt = (int) data.get("page_per_record_cnt");
		int group_per_page_cnt  = (int) data.get("group_per_page_cnt");
		int currentpage 		= (int) data.get("currentpage");
		 
		PagingUtill  pu = new PagingUtill(total_record, page_per_record_cnt, group_per_page_cnt, currentpage);
		// 페이징 데이터와 병합
		data.putAll(pu.page_dataMap());
		Object[] result = {
				             dao.selectList("task.list_task", data)
				            ,pu.page_dataMap()
				          };
		return result;
	}
	
	
	
	/**
	 * Hashset을 통해서 중복된 사원 코드를 제거한다.
	 * @param data
	 * @return
	 */
	private HashSet<String> remove_Mem_Code_Duplication(String[] data)
	{
		HashSet<String> set = new HashSet<>();
		for (String mem_code : data) {
			set.add(mem_code);
		}
		return set;
	}
	
	
	/**
	 * task를 추가하는 서비스를 구현한 메소드이다.
	 */
	@Transactional
	@Override
	public Object task_Add(Object... params) 
	{   // 중복되는 사원 정보를 제거하는 메소드 호출 
		HashSet<String> mem_code= remove_Mem_Code_Duplication((String[]) params[1]);
		
		Task_Vo tvo=(Task_Vo) params[0];
		dao.insert("task.add", tvo);
		
		int task_num =(int)dao.selectOne("task.insert_return", tvo);
		
		for (String code : mem_code) {		
			
			Assignee_Vo avo = new Assignee_Vo();
			avo.setTask_num(task_num);
			avo.setAssignee_comment(""); 
			avo.setAssignee_assignee(code.split("/")[1]);
			dao.insert("task.add_assignee",avo);
		}
		
		return null;
	}
	

	@Override
	public Object[] task_Detail(Object... params) 
	{
		Object[] result=
			{ 
				dao.selectOne("task.list_detail", params[0])
			   ,dao.selectList("task.list_detail_assignee_list",params[0] )
			};
		return result;
	}
	
	
	
	
	@Override
	public Object task_Modify(Object... params) 
	{
		return dao.update("task.update_task", params[0]); 
	}

	
	@Override
	public Object task_Assignee_Modify(Object... params) 
	{
		return dao.update("task.update_assignee", params[0]); 
	}

	// 위임자가 받은 TASK 관련 정보 가져옴 
	@Override
	public Object[] task_Assignee_List(HashMap<String, Object> data) 
	{
		// 총갯수 반환 
		int total_record =(int) dao.selectOne("task.cnt_list_assignee", (String)data.get("assignee_assignee"));
		
		data=pageData_Initialize(data);
		
		int page_per_record_cnt = (int) data.get("page_per_record_cnt");
		int group_per_page_cnt= (int) data.get("group_per_page_cnt");
		int currentpage= (int) data.get("currentpage");
		
		PagingUtill  pu = new PagingUtill(total_record, page_per_record_cnt, group_per_page_cnt, currentpage);
		// 페이징 데이터와 병합
		data.putAll(pu.page_dataMap());
		 
		Object[] result = {
				            dao.selectList("task.list_assignee", data)
				            ,pu.page_dataMap()
				           };
		return result;
	} 
	
	
	
	// 위임자가 받은 TASK Assignee 상세 정보 가져옴 
	@Override
	public Object task_Assignee_List_Detail(Object... params)
	{
		return dao.selectOne("task.list_assignee_detail", params[0]);
	}

	@Override
	public Object task_Assignee_Modify_State(Object... params) 
	{
		/*assignee_num */
		dao.update("task.update_assignee_state", params[0]);
		// assignee_state 상태 검사
		int res =(int) dao.selectOne("task.check_assignee_state", params[0]);
		// 모두 Y 면 Task 상태도 Y 로 변환
		if (res == 0) dao.update("task.update_task_state", params[0]); 
		return null;
	}

	
	@Transactional
	@Override 
	public Object task_Task_Assignee_Delete(Object... params) 
	{
		// 삭제 프로시져 실행 
		return dao.delete("task.task_assignee_delete_procedure",params[0]);
	}
 
	
	@Override
	public Object[] task_Search_Assignee(Paging_Vo pvo,Search_Vo svo) 
	{
		HashMap<String, Object> paging_Data=pvo.getMap();
		int total_record=(int)dao.selectOne("task.cnt_task_search_assignee", svo.getMap());
		// System.err.println("res svo 반환결과"+total_record);
		
		paging_Data=pageData_Initialize(paging_Data);
		
		// 페이징 설정
		int page_per_record_cnt = (int) paging_Data.get("page_per_record_cnt");
		int group_per_page_cnt= (int) paging_Data.get("group_per_page_cnt");
		int currentpage= (int) paging_Data.get("currentpage");
		
		PagingUtill  pu = new PagingUtill(total_record, page_per_record_cnt, group_per_page_cnt, currentpage);
		svo.getMap().putAll(pu.page_dataMap());
		
		
		return new Object[]
				{
				  dao.selectList("task.task_search_assignee_list", svo.getMap())
				  ,pu.page_dataMap()
				};
	}

	@Override
	public Object[] task_Search_Task(Paging_Vo pvo,Search_Vo svo) 
	{
		HashMap<String, Object> paging_Data=pvo.getMap();
		int total_record=(int)dao.selectOne("task.cnt_task_search_task", svo.getMap());
		
		paging_Data=pageData_Initialize(paging_Data);
		
		// 페이징 설정
		int page_per_record_cnt = (int) paging_Data.get("page_per_record_cnt");
		int group_per_page_cnt= (int) paging_Data.get("group_per_page_cnt");
		int currentpage= (int) paging_Data.get("currentpage");
		
		PagingUtill  pu = new PagingUtill(total_record, page_per_record_cnt, group_per_page_cnt, currentpage);
		svo.getMap().putAll(pu.page_dataMap());
		
		
		return new Object[]
				{
				  dao.selectList("task.task_search_task_list", svo.getMap())
				  ,pu.page_dataMap()
				};
	}

	@Override
	public Object task_Assignee_Dashboard_List(String assignee_assignee) 
	{
		return dao.selectList("task.dashboard_list", assignee_assignee);
	}

	

}
