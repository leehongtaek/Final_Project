/**
* 작업 날짜 : 2015. 11. 17.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.easyware.report.vo;

public class DocForm_Vo {

	private int doc_num;		// 문서번호
	private String doc_name;	// 문서이름
	private String doc_form;	// 문서양식
	
	public int getDoc_num() {
		return doc_num;
	}
	public void setDoc_num(int doc_num) {
		this.doc_num = doc_num;
	}
	public String getDoc_name() {
		return doc_name;
	}
	public void setDoc_name(String doc_name) {
		this.doc_name = doc_name;
	}
	public String getDoc_form() {
		return doc_form;
	}
	public void setDoc_form(String doc_form) {
		this.doc_form = doc_form;
	}
}
