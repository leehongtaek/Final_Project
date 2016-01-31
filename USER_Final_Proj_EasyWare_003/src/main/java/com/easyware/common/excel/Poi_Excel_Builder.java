/**
* 작업 날짜 : 2015. 11. 30.
* 구현 내용 :   
*  
* @author By KOSTA 
*/
package com.easyware.common.excel;

import java.util.List;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import com.easyware.roomrent.vo.Room_Vo;

//AbstractExcelView 라는 클래스를 상속함으로써 이 클래스는 View가 될 수 있다.
public class Poi_Excel_Builder extends AbstractExcelView{

	// buildExcelDocument 메서드를 오버라이딩한다.
	// 전달 받은 model을 통하여, forward시킨 listbook 객체를 가져온다
	
	@Override
	protected void buildExcelDocument(Map<String, Object> model, HSSFWorkbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		List<Room_Vo> listbook = (List<Room_Vo>) model.get("listbook");
		// poi문법
		HSSFSheet sheet = workbook.createSheet("Show Books");
		sheet.setDefaultColumnWidth(30);
		CellStyle style = workbook.createCellStyle();
		Font font = workbook.createFont();
		font.setFontName("Arial");
		style.setFillForegroundColor(HSSFColor.BLUE.index);
		style.setFillPattern(CellStyle.SOLID_FOREGROUND);
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		font.setColor(HSSFColor.WHITE.index);
		// 폰트 지정
		style.setFont(font);
		HSSFRow header = sheet.createRow(0);
		// 엑셀의 셀 타이틀
		String[] str = {"#", "시설 이름", "시설 위치", "수용 인원"};
		for(int i=0; i<str.length; i++){
			header.createCell(i).setCellValue(str[i]);
			header.getCell(i).setCellStyle(style);
		}
		
		int rowCount = 1;
		// 셀의 내용을 채움
		for(Room_Vo abook : listbook) {
			HSSFRow aRow = sheet.createRow(rowCount++);
			aRow.createCell(0).setCellValue(abook.getRoom_num());
			aRow.createCell(1).setCellValue(abook.getRoom_name());
			aRow.createCell(2).setCellValue(abook.getRoom_loc());
			aRow.createCell(3).setCellValue(abook.getRoom_limit());
		}
		// 응답객체로 부터 다운로드 받을 타입과 파일 이름을 설정한다.
		response.setContentType("Application/Msexcel");
		response.setHeader("Content-Disposition", "attachment; filename=room_List.xls;");
			
		}
	}

