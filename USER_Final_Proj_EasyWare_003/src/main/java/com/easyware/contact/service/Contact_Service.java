/**
* 작업 날짜 : 2015. 11. 16.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.easyware.contact.service;

import java.util.HashMap;

public interface Contact_Service {
	public Object contact_Add(Object... params);
	public Object contact_Modify(Object... params);
	public Object contact_Destory(Object... params);
	public Object contact_Search(Object... params);
	public Object contact_ListTest(Object... params);
	public Object contact_Total(Object... params);
	public Object contact_pagingList(HashMap<String, Object> map);
	public Object[] contact_List(HashMap<String, Object> data);
}
