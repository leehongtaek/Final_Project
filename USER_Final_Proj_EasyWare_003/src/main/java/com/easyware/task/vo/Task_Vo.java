/**
* 작업 날짜 : 2015. 11. 24.
* 구현 내용 :   
*  
* @author By Byeong Gi Kim 
*/
package com.easyware.task.vo;

public class Task_Vo {
	/*
	TASK_NUM
	TASK_TITLE
	TASK_DESCRIPTION
	TASK_START
	TASK_END
	TASK_STATE
	TASK_ORGANIZER
	TASK_DATE
	*/
	private int task_num;
	private String task_title;
	private String task_description;
	private String task_start;
	private String task_end;
	private String task_state;
	private String task_organizer;
	private String task_date;
	
	public int getTask_num() {
		return task_num;
	}
	public void setTask_num(int task_num) {
		this.task_num = task_num;
	}
	public String getTask_title() {
		return task_title;
	}
	public void setTask_title(String task_title) {
		this.task_title = task_title;
	}
	public String getTask_description() {
		return task_description;
	}
	public void setTask_description(String task_description) {
		this.task_description = task_description;
	}
	public String getTask_start() {
		return task_start;
	}
	public void setTask_start(String task_start) {
		this.task_start = task_start;
	}
	public String getTask_end() {
		return task_end;
	}
	public void setTask_end(String task_end) {
		this.task_end = task_end;
	}
	public String getTask_state() {
		return task_state;
	}
	public void setTask_state(String task_state) {
		this.task_state = task_state;
	}
	public String getTask_organizer() {
		return task_organizer;
	}
	public void setTask_organizer(String task_organizer) {
		this.task_organizer = task_organizer;
	}
	public String getTask_date() {
		return task_date;
	}
	public void setTask_date(String task_date) {
		this.task_date = task_date;
	}
	
	
	
}
