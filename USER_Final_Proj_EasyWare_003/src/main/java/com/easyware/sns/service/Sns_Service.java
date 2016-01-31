/**
* 작업 날짜 : 2015. 11. 16.
* 구현 내용 :   
*  
* @author By kosta 
*/
package com.easyware.sns.service;


import java.util.HashMap;
import java.util.List;

import com.easyware.sns.vo.Sns_Vo;


public interface Sns_Service {
	public Object sns_Add(Sns_Vo vo);
	public Object sns_Modify(int sns_num);
	public Object sns_Destory(Object... params);
	public Object sns_Search(Object... params);
	
	public List<Sns_Vo> sns_list_prepend(HashMap<String, Object> data);
	
	public List<Sns_Vo> sns_list_first(HashMap<String, Object> data);
	
	public List<Sns_Vo> sns_list_append(HashMap<String, Object> data);
	
}
