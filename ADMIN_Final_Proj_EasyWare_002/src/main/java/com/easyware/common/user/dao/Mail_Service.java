/**
* 작업 날짜 : 2015. 11. 19.
* 구현 내용 :   
*  
* @author By kira 
*/
package com.easyware.common.user.dao;

import javax.activation.DataSource;

public interface  Mail_Service {
	public void sendMail(String from, String to, String subject, String text);
	public void sendMail(String from, String[] to , String subject , String text);
	public void sendMail(String from, String to, String subject, String text,String fileName,DataSource fileDataSource);
	public void sendMail(String from, String[] to , String subject , String text,String fileName,DataSource fileDataSource);
}
