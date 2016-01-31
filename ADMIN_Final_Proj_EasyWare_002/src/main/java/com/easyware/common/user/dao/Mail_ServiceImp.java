/**
* 작업 날짜 : 2015. 11. 19.
* 구현 내용 : 사용자에게 메일을 보내는 서비스를 구현함   
*  
* @author By kira 
*/
package com.easyware.common.user.dao;

import java.io.UnsupportedEncodingException;
import java.util.Date;

import javax.activation.DataSource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class Mail_ServiceImp implements Mail_Service {


	@Autowired
	private JavaMailSender mailSender;
	
	
	
	@Override
	public void sendMail(String from, String to, String subject, String text) 
	{
	
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom(from);
		message.setTo(to);
		message.setSubject(subject);
		message.setText(text);
		message.setSentDate(new Date());
		mailSender.send(message);
	}
	
	
	@Override				   //  보내는 사람, 보낼 사람 , 제목 , 보내는 메시지 	
	public void sendMail(String from, String[] to, String subject, String text) 
	{
		
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom(from);
		message.setCc(to);
		message.setSubject(subject);
		message.setText(text);
		message.setSentDate(new Date());
		mailSender.send(message);
	}
	
	
	
	@Override
	public void sendMail(String from, String to, String subject, String text,String attachmentFilename,DataSource fileDataSource) 
	{
		MimeMessage message = mailSender.createMimeMessage(); 
		
		try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,true,"utf-8");
			messageHelper.setSubject(subject);
			messageHelper.setText(text, true);
			messageHelper.setFrom(from);
			messageHelper.setTo(to);
			messageHelper.setSentDate(new Date());
			messageHelper.addAttachment(
					MimeUtility.encodeText(attachmentFilename,"utf-8", "B") , fileDataSource);
			mailSender.send(message);
		} catch (MessagingException | UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		
	}

	@Override
	public void sendMail(String from, String[] to, String subject, String text,String attachmentFilename ,DataSource fileDataSource) 
	{
		MimeMessage message = mailSender.createMimeMessage(); 
		
		try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,true,"utf-8");
			messageHelper.setSubject(subject);
			messageHelper.setText(text, true);
			messageHelper.setFrom(from);
			messageHelper.setTo(to);
			messageHelper.setSentDate(new Date());
			messageHelper.addAttachment(
					MimeUtility.encodeText(attachmentFilename,"utf-8", "B") , fileDataSource);
			mailSender.send(message);
		} catch (MessagingException | UnsupportedEncodingException e) {
				
			e.printStackTrace();
		}
	
	}
	
	
	
	
	
}
