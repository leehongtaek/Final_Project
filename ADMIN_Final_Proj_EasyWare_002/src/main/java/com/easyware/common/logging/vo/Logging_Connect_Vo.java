/**
* 작업 날짜 : 2015. 12. 2.
* 구현 내용 :   
*  
* @author By Byeong Gi Kim 
*/
package com.easyware.common.logging.vo;

import java.util.HashMap;

public class Logging_Connect_Vo {
	/*
	LOG_ID	VARCHAR2(50 BYTE)
	LOG_TYPE	CHAR(1 BYTE)
	MEM_CODE	VARCHAR2(50 BYTE)
	MEM_ID	VARCHAR2(30 BYTE)
	MEM_NAME	VARCHAR2(30 BYTE)
	MEM_IP	VARCHAR2(50 BYTE)
	LOG_DATE	DATE
	*/
	
	private String log_id;
	private String log_type;
	private String mem_code;
	private String mem_id;
	private String mem_name;
	private String mem_ip;
	private String log_date;
	
	private HashMap<String, Object> data = new HashMap<>();
	public HashMap<String, Object> getMap(){
		this.data.put("log_id",this.log_id);
		this.data.put("log_type",this.log_type);
		this.data.put("mem_code",this.mem_code);
		this.data.put("mem_id",this.mem_id);
		this.data.put("mem_name",this.mem_name);
		this.data.put("mem_ip",this.mem_ip);
		this.data.put("log_date",this.log_date);
		return data; 
	}
	
	
	public String getLog_id() {
		return log_id;
	}
	public void setLog_id(String log_id) {
		this.log_id = log_id;
	}
	public String getLog_type() {
		return log_type;
	}
	public void setLog_type(String log_type) {
		this.log_type = log_type;
	}
	public String getMem_code() {
		return mem_code;
	}
	public void setMem_code(String mem_code) {
		this.mem_code = mem_code;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_ip() {
		return mem_ip;
	}
	public void setMem_ip(String mem_ip) {
		this.mem_ip = mem_ip;
	}
	public String getLog_date() {
		return log_date;
	}
	public void setLog_date(String log_date) {
		this.log_date = log_date;
	}
	
	
	
}
