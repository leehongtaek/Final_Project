/**
* 작업 날짜 : 2015. 11. 13.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.easyware.board.vo;

public class Bbs_BoardInfo_Vo {

	private int board_code;
	private String board_kindof;
	private String board_name;
	private String board_comment;
	
	public int getBoard_code() {
		return board_code;
	}
	public void setBoard_code(int board_code) {
		this.board_code = board_code;
	}
	public String getBoard_kindof() {
		return board_kindof;
	}
	public void setBoard_kindof(String board_kindof) {
		this.board_kindof = board_kindof;
	}
	public String getBoard_name() {
		return board_name;
	}
	public void setBoard_name(String board_name) {
		this.board_name = board_name;
	}
	public String getBoard_comment() {
		return board_comment;
	}
	public void setBoard_comment(String board_comment) {
		this.board_comment = board_comment;
	}
}
