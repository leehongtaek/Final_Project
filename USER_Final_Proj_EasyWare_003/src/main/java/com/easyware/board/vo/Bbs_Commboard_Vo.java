/**
* 작업 날짜 : 2015. 11. 13.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.easyware.board.vo;

public class Bbs_Commboard_Vo {
	private int comm_num;
	private int board_num;
	private String comm_content;
	private String comm_reip;
	private String comm_regdate;
	private String mem_name;
	private String mem_code;
	private int comm_count;
	

	public String getComm_reip() {
		return comm_reip;
	}

	public void setComm_reip(String comm_reip) {
		this.comm_reip = comm_reip;
	}

	 

	public int getComm_count() {
		return comm_count;
	}

	public void setComm_count(int comm_count) {
		this.comm_count = comm_count;
	}

	public String getMem_code() {
		return mem_code;
	}

	public void setMem_code(String mem_code) {
		this.mem_code = mem_code;
	}

	public String getComm_regdate() {
		return comm_regdate;
	}

	public void setComm_regdate(String comm_regdate) {
		this.comm_regdate = comm_regdate;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public int getComm_num() {
		return comm_num;
	}

	public void setComm_num(int comm_num) {
		this.comm_num = comm_num;
	}

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public String getComm_content() {
		return comm_content;
	}

	public void setComm_content(String comm_content) {
		this.comm_content = comm_content;
	}

}
