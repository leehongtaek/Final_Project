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

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class Login_Success_Handler implements AuthenticationSuccessHandler {
	
	//로그인후 호출되는 메소드 
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		response.sendRedirect(request.getContextPath()+"/");
	}

}
