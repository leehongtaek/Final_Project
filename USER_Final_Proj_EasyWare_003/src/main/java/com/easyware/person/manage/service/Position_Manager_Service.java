/**
* 작업 날짜 : 2015. 11. 14.
* 구현 내용 :   
*  
* @author By kira 
*/
package com.easyware.person.manage.service;

import java.util.HashMap;

public interface Position_Manager_Service {
	public Object position_Menager_List();
	public Object position_Menager_Insert(String posit_name);
	public Object position_Menager_Update(HashMap<String, Object> data);
	public Object position_Menager_Delete(int posit_num);
}
