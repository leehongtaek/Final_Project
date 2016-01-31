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
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

public class Logout_Success_Handler implements LogoutSuccessHandler{

	@Override
	public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {
		// Logout 성공시에 로깅 기록 체크   
				Object pricipal = null;
				if(pricipal !=null && pricipal instanceof Member_Vo_Security){
					pricipal=authentication.getPrincipal();
					System.err.println("memcode"+((Member_Vo_Security)pricipal).getMem_code());
					System.err.println("mem_name"+((Member_Vo_Security)pricipal).getMem_name());
				}
				
				
				response.sendRedirect(request.getContextPath()+"/index");
		
	}

}
