/**
* 작업 날짜 : 2015. 11. 24.
* 구현 내용 :   
*  
* @author By Byeong Gi Kim 
*/
package com.easyware.task.vo;

public class Assignee_Vo {
	/*
	ASSIGNEE_NUM
	TASK_NUM
	ASSIGNEE_ASSIGNEE 
	ASSIGNEE_COMMENT
	ASSIGNEE_STATE
	*/
	private int assignee_num;
	private int task_num;
	private String assignee_assignee;
	private String assignee_comment;
	private String assignee_state;
	public int getAssignee_num() {
		return assignee_num;
	}
	public void setAssignee_num(int assignee_num) {
		this.assignee_num = assignee_num;
	}
	public int getTask_num() {
		return task_num;
	}
	public void setTask_num(int task_num) {
		this.task_num = task_num;
	}
	public String getAssignee_assignee() {
		return assignee_assignee;
	}
	public void setAssignee_assignee(String assignee_assignee) {
		this.assignee_assignee = assignee_assignee;
	}
	public String getAssignee_comment() {
		return assignee_comment;
	}
	public void setAssignee_comment(String assignee_comment) {
		this.assignee_comment = assignee_comment;
	}
	public String getAssignee_state() {
		return assignee_state;
	}
	public void setAssignee_state(String assignee_state) {
		this.assignee_state = assignee_state;
	}
	
	
	
	
	
}
