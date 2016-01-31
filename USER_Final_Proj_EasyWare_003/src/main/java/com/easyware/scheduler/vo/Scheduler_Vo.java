/**
* 작업 날짜 : 2015. 11. 16.
* 구현 내용 :   
*  
* @author By kosta 
*/
package com.easyware.scheduler.vo;

public class Scheduler_Vo {
	private int sched_num;
	private String mem_code;
	private String sched_someday_date;
	private String sched_somedayend_date;
	private String sched_someday_time;
	private String sched_somedayend_time;
	private String sched_event;
	private byte sched_check;
	private String sched_type;
	private String sched_content;
	public int getSched_num() {
		return sched_num;
	}
	public void setSched_num(int sched_num) {
		this.sched_num = sched_num;
	}
	public String getMem_code() {
		return mem_code;
	}
	public void setMem_code(String mem_code) {
		this.mem_code = mem_code;
	}

	public String getSched_event() {
		return sched_event;
	}
	public void setSched_event(String sched_event) {
		this.sched_event = sched_event;
	}
	public byte getSched_check() {
		return sched_check;
	}
	public void setSched_check(byte sched_check) {
		this.sched_check = sched_check;
	}
	public String getSched_type() {
		return sched_type;
	}
	public void setSched_type(String sched_type) {
		this.sched_type = sched_type;
	}
	public String getSched_content() {
		return sched_content;
	}
	public void setSched_content(String sched_content) {
		this.sched_content = sched_content;
	}
	public String getSched_someday_date() {
		return sched_someday_date;
	}
	public void setSched_someday_date(String sched_someday_date) {
		this.sched_someday_date = sched_someday_date;
	}
	public String getSched_somedayend_date() {
		return sched_somedayend_date;
	}
	public void setSched_somedayend_date(String sched_somedayend_date) {
		this.sched_somedayend_date = sched_somedayend_date;
	}
	public String getSched_someday_time() {
		return sched_someday_time;
	}
	public void setSched_someday_time(String sched_someday_time) {
		this.sched_someday_time = sched_someday_time;
	}
	public String getSched_somedayend_time() {
		return sched_somedayend_time;
	}
	public void setSched_somedayend_time(String sched_somedayend_time) {
		this.sched_somedayend_time = sched_somedayend_time;
	}
	
	
}
