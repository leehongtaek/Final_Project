/**
* 작업 날짜 : 2015. 11. 29.
* 구현 내용 :   
*  
* @author By kira 
*/
package com.easyware.common.loging.aop;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;

import com.easyware.common.loging.service.Loging_User_Connect_Service;
import com.easyware.common.security.Member_Vo_Security;

@Aspect
public class Log_login {
	              
	@Autowired
	private Loging_User_Connect_Service service;
	// AOP 로 로그아웃 핸들러의 메소드가 호출되기전에 POINTCUT 지정
	@Before("execution(* com.easyware.common.security.Login_Success_Handler.onAuthenticationSuccess(..))")
	public void Logging_Login(JoinPoint joinPoint){
		// 메소드가 호출되기전에 매개변수를 얻어옴
		Object[] args=joinPoint.getArgs();
		Object pricipal = null;
		String mem_ip = "";
		// 해당 메소드 매개변수로 형변환
		for(Object arg:args){
			if ( arg instanceof Authentication) pricipal=((Authentication) arg).getPrincipal();
			if ( arg instanceof HttpServletRequest) mem_ip=((HttpServletRequest) arg).getRemoteAddr();
		}       
		
		// pricipal 을 통해서 사용자의 정보를 가져옴
		if(pricipal !=null && pricipal instanceof Member_Vo_Security){
			Member_Vo_Security vo=(Member_Vo_Security)pricipal;
			vo.setMem_ip(mem_ip);
			service.Loging_User_Connect_Login(vo);
			
		}
		
		
	}
	
	@Before("execution(* com.easyware.common.security.Logout_Success_Handler.onLogoutSuccess(..))")
	public void Logging_Logout(JoinPoint joinPoint){
		Object[] args=joinPoint.getArgs();
		Object pricipal = null;
		String mem_ip = "";
		for(Object arg:args){
			if ( arg instanceof Authentication) pricipal=((Authentication) arg).getPrincipal();
			if ( arg instanceof HttpServletRequest) mem_ip=((HttpServletRequest) arg).getRemoteAddr();
			
		}
		
		if(pricipal !=null && pricipal instanceof Member_Vo_Security){
			Member_Vo_Security vo=(Member_Vo_Security)pricipal;
			vo.setMem_ip(mem_ip);
			service.Loging_User_Connect_Logout(vo);
			// System.err.println("LOGOUT 성공 LOGOUT 기록 확인");
		}
		
	}
	
	@Before("execution(* com.easyware.common.security.Login_Failure_Handler.onAuthenticationFailure(..))")
	public void Logging_Login_fail(JoinPoint joinPoint){
		Object[] args=joinPoint.getArgs();
		HttpServletRequest req=null;
		AuthenticationException exception=null; 
		String mem_ip = "";
		for(Object arg:args){
			if ( arg instanceof HttpServletRequest) req=((HttpServletRequest) arg);
			if ( arg instanceof AuthenticationException) exception=((AuthenticationException) arg);
			
		}
		
		
			String mem_name=exception.getAuthentication().getName();
			Member_Vo_Security vo= new Member_Vo_Security();
			// System.err.println("LOGOUT 성공 mem_name"+mem_name);
			// System.err.println("LOGOUT 성공 LOGOUT 기록 확인");
			vo.setMem_id(mem_name);
			vo.setMem_ip(req.getRemoteAddr());
			service.Loging_User_Connect_Login_fail(vo);
			// System.err.println("LOGOUT 성공 LOGOUT 기록 확인");
		
		
	}
	
	
	
	
}
