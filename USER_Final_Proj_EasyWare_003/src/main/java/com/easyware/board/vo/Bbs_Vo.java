/**
* 작업 날짜 : 2015. 11. 13.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.easyware.board.vo;

public class Bbs_Vo {

	private int board_num;
	private int board_code;
	private String board_title;
	private String board_content;
	private int board_likenum;
	private int board_hit;
	private String board_regdate;
	private String mem_code;
	private String mem_name;

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public int getBoard_code() {
		return board_code;
	}

	public void setBoard_code(int board_code) {
		this.board_code = board_code;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public int getBoard_hit() {
		return board_hit;
	}

	public void setBoard_hit(int board_hit) {
		this.board_hit = board_hit;
	}

	public String getBoard_regdate() {
		return board_regdate;
	}

	public void setBoard_regdate(String board_regdate) {
		this.board_regdate = board_regdate;
	}

	public String getMem_code() {
		return mem_code;
	}

	public void setMem_code(String mem_code) {
		this.mem_code = mem_code;
	}

	public int getBoard_likenum() {
		return board_likenum;
	}

	public void setBoard_likenum(int board_likenum) {
		this.board_likenum = board_likenum;
	}

}
