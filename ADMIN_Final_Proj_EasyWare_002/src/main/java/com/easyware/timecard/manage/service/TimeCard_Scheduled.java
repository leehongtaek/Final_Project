/**
* 작업 날짜 : 2015. 11. 16.
* 구현 내용 :   
*  
* @author By Byeong Gi Kim 
*/
package com.easyware.timecard.manage.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.easyware.timecard.manage.dao.TimeCard_Dao;

@Component
public class TimeCard_Scheduled {
	
	@Autowired
	private TimeCard_Dao dao;
	
	// cron="초 분 시 일 월 요일 [년도]"
	@Scheduled(cron="0 50 23 * * *")
    public void update_Work_State() throws IOException {
		String path=TimeCard_Scheduled.class.getResource("timecard_Setting.properties").getPath();
		
		dao.update("timecard.insert_absent", "");
		System.err.println("스케줄러 테스트:::::::::::::::::::::::::::::::::::::::::::::::::");
    }
}
