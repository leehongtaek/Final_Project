/**
* 작업 날짜 : 2015. 11. 12.
* 구현 내용 :   
*  
* @author By Byeong Gi Kim 
*/
package com.easyware.timecard.manage.service;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.Properties;

public interface TimeCard_Service {
	public Object[] timecard_list(HashMap<String, Object> data);
	public Object timecard_Properties_Load() throws FileNotFoundException, IOException ;
	public Object timecard_Properties_Save(Properties prop) throws FileNotFoundException, IOException ;
}
