/**
* 작업 날짜 : 2015. 11. 18.
* 구현 내용 :   
*  
* @author By Byeong Gi Kim 
*/
package com.easyware.person.manage.service;

import java.util.HashMap;

import com.easyware.person.manage.vo.Authority_Vo;

public interface Authority_Manager_Service {
	public Object[] authority_Menager_List(HashMap<String,Object> data);
	public Object authority_Menager_Insert(Authority_Vo vo);
	public Object authorrty_Menager_Update(Authority_Vo vo);
	public Object authorrty_Menager_Delete(Authority_Vo vo);
}
