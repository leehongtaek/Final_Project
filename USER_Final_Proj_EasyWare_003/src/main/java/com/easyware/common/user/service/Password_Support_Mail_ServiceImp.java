/**
* 작업 날짜 : 2015. 11. 18.
* 구현 내용 :   
*  
* @author By Byeong Gi Kim 
*/
package com.easyware.common.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easyware.common.user.vo.Member_Vo;

@Service
public class Password_Support_Mail_ServiceImp implements Password_Support_Mail_Service{
	
	@Autowired
	private User_Service service;
	
	@Autowired
	private Mail_Service mail_Service;
	 
	public int sendMail(Member_Vo vo){
		int res = (int) service.user_idChk(vo.getMem_id());
		Member_Vo resVo = null;
		String mem_email = "";
		// 사용자가 존재하면 사용자 정보를 가져온다.
		if(res > 0 ){
			resVo = (Member_Vo) service.user_email_send(vo);
		} 
		System.out.println(vo.getMem_email());
		System.out.println(vo.getMem_email());
		
		if (resVo.getMem_email().equals(vo.getMem_email())){
			mem_email=resVo.getMem_email();
			// File f = new File("D:\\test.txt"); 첨부 파일 보내기 기능 구현 테스트
			// 보내는 사람 , 받는 사람 , 주제 , 내용 
			mail_Service.sendMail("kosta.egroup@gmail.com", vo.getMem_email() , 
			"비밀번호 발송 입니다.", "비밀번호는 : "+resVo.getMem_pwd() /*,f.getName(), new FileDataSource(f)*/);
		} else{
			// 보내는 사람 , 받는 사람 , 주제 , 내용 
			mail_Service.sendMail("kosta.egroup@gmail.com", vo.getMem_email() , 
			"비밀번호 인증실패 입니다.", "인증실패입니다.");
			
		}
		

		return res;
	}
	
	
}
