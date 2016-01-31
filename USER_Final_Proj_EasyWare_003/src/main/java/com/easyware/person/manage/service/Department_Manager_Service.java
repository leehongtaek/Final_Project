/**
* 작업 날짜 : 2015. 11. 14.
* 구현 내용 :   
*  
* @author By kira 
*/
package com.easyware.person.manage.service;

import java.util.HashMap;

public interface Department_Manager_Service {
	public Object department_Menager_List();
	public Object department_Menager_Insert(String dept_name);
	public Object department_Menager_Update(HashMap<String, Object> data);
	public Object department_Menager_Delete(int dept_num);
}
