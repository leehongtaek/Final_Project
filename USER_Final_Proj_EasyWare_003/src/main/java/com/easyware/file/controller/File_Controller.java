/**
* 작업 날짜 : 2015. 11. 28.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.easyware.file.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.easyware.common.security.Member_Vo_Security;
import com.easyware.file.service.File_Service;
import com.easyware.file.vo.File_Vo;

@Controller
public class File_Controller {
	
	private static final int BUFFER_SIZE = 4096;
	
	@Autowired
	private File_Service service;
	
	@RequestMapping(value="/roomrent/fileForm")
	public String form(){
		return "/roomrent/File_Form";
	}
	
	@RequestMapping(value="/roomrent/fileUpload", method=RequestMethod.POST)
	public ModelAndView save(File_Vo vo, HttpServletRequest request){
		
		ModelAndView mav = new ModelAndView("redirect:/roomrent/fileList");
		
		HttpSession session = request.getSession();
		String r_path = session.getServletContext().getRealPath("/");
		String file_path = "\\file\\";
		StringBuffer path = new StringBuffer();
		path.append(r_path).append(file_path);
		
		String orifn = vo.getFile().getOriginalFilename();
		long size = vo.getFile().getSize();
		String type = vo.getFile().getContentType();
		
		path.append(orifn);
		File f = new File(path.toString());
		try{
			vo.getFile().transferTo(f);
		}catch(IllegalStateException | IOException e){
			e.printStackTrace();
		}
		vo.setFile_name(orifn);
		vo.setFile_path(path.toString());
		vo.setFile_type(type);
		vo.setFile_size(size);
	
		String mem_code="";
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object pricipal = auth.getPrincipal();
		if (pricipal != null && pricipal instanceof Member_Vo_Security) {
			mem_code = ((Member_Vo_Security)pricipal).getMem_code();
		}
		vo.setMem_code(mem_code);
		
		service.file_Add(vo);
		
		mav.addObject("vo",vo);
		return mav;
	}
	
	@RequestMapping(value="/roomrent/fileList", method=RequestMethod.GET)
	public ModelAndView list(){
		ModelAndView mav = new ModelAndView("/roomrent/File_List");
		System.out.println("LOGL1:::::::::::::::::::");
		List<File_Vo> list = (List<File_Vo>) service.file_List();
		System.out.println("LOGL2:::::::::::::::::::");
		mav.addObject("list", list);
		System.out.println("LOGL3:::::::::::::::::::");
		return mav;
	}
	    
	@RequestMapping(value="/roomrent/fileDown")
	public void down(@RequestParam("file_name") String file_name, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		ServletContext context = request.getServletContext();
		
		String path = session.getServletContext().getRealPath("/file/") + file_name;
		
		File downloadFile = new File(path);
		FileInputStream fi = new FileInputStream(path);
		
		String mimeType = context.getMimeType(path);
		
		if(mimeType == null){
			mimeType = "application/octet-stream";
		}
		// response.setCharacterEncoding("utf-8");
		response.setContentType(mimeType);
		// 다운로드될 파일의 길이 세팅
		response.setContentLength((int) downloadFile.length());
		// 다운로드 type을 설정함
		String headerKey = "Content-Disposition";
		String headerValue = String.format("attachment; file_name=\"%s\"", downloadFile.getName());
		// 위의 다운로드 타입의 정보를 헤더로 설정
		response.setHeader(headerKey, headerValue);
		// 브라우저로부터 스트림을 연결
		OutputStream outStream = response.getOutputStream();
		// 버퍼를 끼워서 빠르게 전달 목적
		byte[] buffer = new byte[BUFFER_SIZE];
		// 이제 브라우저로 보내고, 자원 닫으면 끝
		int bytesRead = -1;
		while((bytesRead = fi.read(buffer)) != -1){
			outStream.write(buffer, 0, bytesRead);
		}
		fi.close();
		outStream.close();
	}
	
	  
	@RequestMapping(value="/profile/fileUpload", method=RequestMethod.POST)
	public ModelAndView save_img(MultipartFile file,
			HttpServletRequest request,
			HttpServletResponse response) throws IOException{
		ServletContext context = request.getServletContext();
		
		String mem_code="";
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object pricipal = auth.getPrincipal();
		if (pricipal != null && pricipal instanceof Member_Vo_Security) {
			mem_code = ((Member_Vo_Security)pricipal).getMem_code();
		}        
		       
		
		// 파일 업로드 성공                                    
		String path = context.getRealPath("/")+"\\file\\"+file.getOriginalFilename();
		System.err.println("::::::::::::::::::::::::::::"+path);
		File f= new File(path);
		    
		// 기존 파일 삭제 
		if(f.exists()){
			f.delete();
			System.err.println("기존 파일 삭제합니다!");
		}        
		    
		file.transferTo(f);
        // 파일 이동 
		FileInputStream fis = new FileInputStream(f);
		                                         
		response.setCharacterEncoding("utf-8");
		PrintWriter out=response.getWriter();              
		String appPath=context.getContextPath()+"\\file\\"+f.getName();                   
		System.err.println("파일 상대 경로 2     "+appPath); 
		out.println(appPath);          
		out.close();
		return null;
	}
	  
	

}
