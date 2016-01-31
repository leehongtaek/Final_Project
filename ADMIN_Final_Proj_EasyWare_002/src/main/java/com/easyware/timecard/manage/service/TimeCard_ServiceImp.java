/**
* 작업 날짜 : 2015. 11. 23.
* 구현 내용 :   
*  
* @author By Byeong Gi Kim 
*/
package com.easyware.timecard.manage.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easyware.timecard.manage.dao.TimeCard_Dao;

@Service
public class TimeCard_ServiceImp implements TimeCard_Service{
	
	@Autowired
	private TimeCard_Dao dao;

	@Override
	public Object[] timecard_list(HashMap<String, Object> data) {
		return null;
	}

	@Override
	public Object timecard_Properties_Load() throws FileNotFoundException, IOException {
		String path=TimeCard_Scheduled.class.getResource("timecard_Setting.properties").getPath();
		Properties prop = new Properties();
		prop.load(new FileInputStream(new File(path)));
		return prop;
	}

	@Override
	public Object timecard_Properties_Save(Properties prop) throws FileNotFoundException, IOException {
		String path=TimeCard_Scheduled.class.getResource("timecard_Setting.properties").getPath();
		prop.store(new PrintWriter(new File(path)), "timecardList");
		return null;
	}
	
	

}
