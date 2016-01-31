/**
* 작업 날짜 : 2015. 12. 3.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.easyware.file.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.easyware.file.dao.File_Dao;
import com.easyware.file.vo.File_Vo;

@Service
public class File_ServiceImp implements File_Service{
	
	@Autowired
	private File_Dao dao;

	@Override
	public Object file_Add(File_Vo vo) {
		dao.insert("file.file_Insert",vo);
		return null;
	}

	@Override
	public Object file_List() {
		List<File_Vo> list = (List<File_Vo>) dao.selectList("file.file_List","");
		return list;
	}

	
}
