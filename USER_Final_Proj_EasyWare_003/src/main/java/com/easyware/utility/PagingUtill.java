/**
* 작업 날짜 : 2015. 10. 20.
* 구현 내용 : 페이징 처리를 하기위한 연산을 하여 VIEW와 서버에 값을 전달하는 역할을 함
*  
* @author By Byeong Gi Kim 
*/
package com.easyware.utility;

import java.util.HashMap;
import java.util.Map;

public class PagingUtill {
	private int total_record; // 모든 데이터 레코드 (row 기준)
	private int page_per_record_cnt; // 페이지 당 레코드 수
	private int group_per_page_cnt; // 페이지당 보여줄 번호수 [1],[2],[3]
	private int pageno; // 현재 화면의 페이지 번호
	
	
	

	public PagingUtill(int total_record, int page_per_record_cnt,int group_per_page_cnt, int pageno) {
		this.total_record = total_record;
		this.page_per_record_cnt = page_per_record_cnt;
		this.group_per_page_cnt = group_per_page_cnt;
		this.pageno = pageno;
	}




	public Map<String, Object> page_dataMap(){
		Map<String, Object> paging_datamap= new HashMap<String, Object>(); // 페이징에 필요한 데이터를 담는다.
		 // 현재 페이지의 레코드의 끝 = 현재 페이지 번호 * 한페이지당 보여줄 ROW 갯수
		int record_end_no=pageno*page_per_record_cnt;
		 // 현재 페이지의 레코드의 시작 = 현재 페이지의 레코드의 끝 - (한페이지당 보여줄 ROW 갯수 -1)
		int record_Start_no=record_end_no -(page_per_record_cnt -1); // 현재 페이지의 레코드의 시작 Oracle DB 기준 
		// int record_Start_no=record_end_no -(page_per_record_cnt); // 현재 페이지의 레코드의 시작  Maria DB 기준 
		
		
		// 계산된 레코드 마지막 30 row > 전체 레코드수 25
		// 계산된 레코드가 실제 전체 레코드 수가 높은 경우 보정
		if(record_end_no > total_record) record_end_no = total_record;
		
		paging_datamap.put("record_end_no",record_end_no);
		paging_datamap.put("record_Start_no", record_Start_no);
		
		// 전체 페이지의 갯수 계산 : 출력될수 있는 페이지의 총 갯수 total_page = 3.0 + 1 
		int total_page = total_record / page_per_record_cnt + (total_record % page_per_record_cnt> 0 ? 1 : 0);
		if(pageno > total_page) pageno = total_page; // 현재 페이지의 번호가 전체 페이지 보다 크다면 현재 전체 페이지 갯수로 보정
		
		paging_datamap.put("total_page",total_page);
		
		
		// 현재 페이지 그룹 = 현재페이지/페이지당보여질번호수 + 나머지>0 ? 1 또는 0 을 더함 
		int group_no = pageno / group_per_page_cnt + ( pageno % group_per_page_cnt > 0 ? 1:0);
		// 페이지 그룹 끝 번호 = 현재 페이지 그룹 * 페이지당보여질번호수
		int page_eno = group_no*group_per_page_cnt;
		// 페이지 그룹 처음 번호 = 페이지 그룹 끝 번호 -(페이지당보여질 끝번호-1)
		int page_sno = page_eno-(group_per_page_cnt-1);	
		
		if(page_eno > total_page) page_eno=total_page;	
		
		paging_datamap.put("group_no",group_no);
		paging_datamap.put("page_sno",page_sno);
		paging_datamap.put("page_eno",page_eno);
		// System.out.println("======/현재 페이지 그룹/====="+group_no+"=========");
		// System.out.println("======/페이지 그룹 끝 번호/====="+page_sno+"=========");
		// System.out.println("======/페이지 그룹 처음 번호/====="+page_eno+"=========");
		
		
		// 이전 그룹페이지 번호
		int prev_pageno = page_sno-group_per_page_cnt;
		// 다음 그룹 페이지 번호 
		int next_pageno = page_sno+group_per_page_cnt;
		// 이전 페이지가 1 이면 1로 고정
		if(prev_pageno <1){
			prev_pageno=1;
		}
		// 다음 페이지가 끝 페이지 보다 크면 
		if(next_pageno>total_page){
			// 다음 페이지 번호 = 전체 페이지/페이지당보여질 번호수*
			next_pageno= (total_page/group_per_page_cnt) * group_per_page_cnt + 1;
			
		}
		paging_datamap.put("prev_pageno",prev_pageno);
		paging_datamap.put("next_pageno",next_pageno);
		// System.out.println("======/이전 그룹페이지 번호/====="+prev_pageno+"=========");
		// System.out.println("======/다음 그룹 페이지 번호/====="+next_pageno+"=========");
		
		return paging_datamap;
	}
}
