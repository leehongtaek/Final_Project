/**
* 작업 날짜 : 2015. 10. 21.
* 구현 내용 : TIME CARD 에서 사용할  Value Object 를 구현함
*  
* @author By Byeong Gi Kim 
*/
package com.easyware.timecard.vo;

import java.util.HashMap;

/* TIMECARD TABLE 구조
CREATE TABLE "KOSTA"."TIMECARD" 
(	"TC_NUM" NUMBER, 
	"TCWORK_START" DATE, 
	"TCWORK_END" DATE, 
	"TCGOOUT_START" DATE, 
	"TCGOOUT_END" DATE, 
	"TC_STATE" CHAR(1 BYTE), 
	"TCETC" VARCHAR2(200 BYTE), 
	"MEM_CODE" VARCHAR2(50 BYTE), 
	 CONSTRAINT "TIMECARD_NUM_PK" PRIMARY KEY ("TC_NUM")
	 
); 
*/
public class TimeCard_Vo {
	private int tc_num;				// 1. 타임 카드 번호
	private String tcwork_start;	// 2. 출근 시간
	private String tcwork_end;		// 3. 퇴근 시간
	private String tcgoout_start;	// 4. 외출 시간
	private String tcgoout_end;		// 5. 외출 시간
	private String tc_state;		// 6. 출근 상태
	private String tcetc;			// 7. 비고
	private String mem_code;		// 8. 멤버 번호 
	private String day;				// 9. 사용자가 선택한 값을 전달할 Properties
	
	
	
	public HashMap<String, Object> getMap() {
		HashMap<String, Object> map = new HashMap<>();
		map.put("tc_num", this.tc_num);
		map.put("tcwork_start", this.tcwork_start);
		map.put("tcwork_end", this.tcwork_end);
		map.put("tcgoout_start", this.tcgoout_start);
		map.put("tcgoout_end", this.tcgoout_end);
		map.put("tc_state", this.tc_state);
		map.put("tcetc", this.tcetc);
		map.put("mem_code", this.mem_code);
		map.put("day", this.day);
		return map;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public int getTc_num() {
		return tc_num;
	}
	public void setTc_num(int tc_num) {
		this.tc_num = tc_num;
	}
	public String getTcwork_start() {
		return tcwork_start;
	}
	public void setTcwork_start(String tcwork_start) {
		this.tcwork_start = tcwork_start;
	}
	public String getTcwork_end() {
		return tcwork_end;
	}
	public void setTcwork_end(String tcwork_end) {
		this.tcwork_end = tcwork_end;
	}
	public String getTcgoout_start() {
		return tcgoout_start;
	}
	public void setTcgoout_start(String tcgoout_start) {
		this.tcgoout_start = tcgoout_start;
	}
	public String getTcgoout_end() {
		return tcgoout_end;
	}
	public void setTcgoout_end(String tcgoout_end) {
		this.tcgoout_end = tcgoout_end;
	}
	public String getTc_state() {
		return tc_state;
	}
	public void setTc_state(String tc_state) {
		this.tc_state = tc_state;
	}
	public String getTcetc() {
		return tcetc;
	}
	public void setTcetc(String tcetc) {
		this.tcetc = tcetc;
	}
	public String getMem_code() {
		return mem_code;
	}
	public void setMem_code(String mem_code) {
		this.mem_code = mem_code;
	}
	
	
	
}
