/**
* 작업 날짜 : 2015. 11. 19.
* 구현 내용 :   
*  
* @author By kira 
*/
package com.easyware.common.user.service;

import com.easyware.common.user.vo.Member_Vo;

public interface Password_Support_Mail_Service {
	public int sendMail(Member_Vo vo);
}
