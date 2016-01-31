/**
* 작업 날짜 : 2015. 11. 29.
* 구현 내용 :   
*  
* @author By kira 
*/
package com.easyware.common.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class Login_Failure_Handler implements AuthenticationFailureHandler {

	

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		String msg=exception.getMessage();
		// String name=request.getParameter("username");
		String user=request.getRemoteUser();
		String addr=request.getRemoteAddr();
		String Localname=request.getLocalName();
		String protocol=request.getProtocol();
		String name=exception.getAuthentication().getName();
		
		 
		System.err.println("접근 거부된 아이디"+msg);
		System.err.println("접근 거부된 사용자 아이디"+name);
		System.err.println("user"+user);
		System.err.println("addr"+addr);
		System.err.println("Localname"+Localname);
		System.err.println("protocol"+protocol);
		System.err.println("접근 거부된 사용자 아이디"+name);
		response.sendRedirect(request.getContextPath() + "/denied");
		
	}

}
