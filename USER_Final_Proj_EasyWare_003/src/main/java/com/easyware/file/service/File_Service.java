/**
* 작업 날짜 : 2015. 12. 5.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.easyware.file.service;

import com.easyware.file.vo.File_Vo;

public interface File_Service {
	
	public Object file_Add(File_Vo vo);
	public Object file_List();

}
