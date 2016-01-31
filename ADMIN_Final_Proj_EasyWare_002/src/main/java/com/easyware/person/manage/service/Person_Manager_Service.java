/**
* 작업 날짜 : 2015. 11. 14.
* 구현 내용 :   
*  
* @author By kira 
*/
package com.easyware.person.manage.service;

import java.util.HashMap;

import com.easyware.person.manage.vo.Person_Vo;

public interface Person_Manager_Service {
	public Object[] person_Manage_List(HashMap<String, Object> data);
	public Person_Vo person_Manage_Detail(Person_Vo vo);
	public void person_Manage_Update(Person_Vo vo);
	public Object[] person_Manage_Search_List(HashMap<String, Object> data);
}
