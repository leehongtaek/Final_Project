<%-- 
    작업 날짜 : 2015. 11. 16.
    구현 내용 :   
  
  @author By kosta 
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!-- JSTL 선언 -->
<!-- Resoures 선언 -->
<!-- =====================bootstrap data============================= -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<title>PAGE - MENU [NAME] </title>
<script>
function goUrl(url) {
	location = url;
}
$(document).ready(function(){
    $('[data-toggle="popover"]').popover();   
});
function scheduler_check(num) {
	$.ajax({
   	 type:"POST",
   	 url:"scheduler_check",
   	data:{sched_num:num},
	success:function(){ 
		$('#'+num).closest('tr').remove();
		$('#calendar').fullCalendar( 'refetchEvents' );
	}
	});
	
}

function scheduler_insert() {
	
	var event = $('#sched_event').val();
	var content =$('#sched_content').val();
	var daystart_date = $('#sched_someday_date').val();
	var daystart_time=$('#sched_someday_time').val();
	var dayend_date = $('#sched_somedayend_date').val();
	var dayend_time=$('#sched_somedayend_time').val();

	
	$.ajax({
   	 type:"POST",
   	 url:"scheduler_insert.json",
   	data:{
   		sched_event:event,
   		sched_content:content,
   		sched_someday_date:daystart_date,
   		sched_somedayend_date:dayend_date,	
   		sched_someday_time:daystart_time,
   		sched_somedayend_time:dayend_time	
   	},
	success:function(){ 
		//goUrl("/scheduler/scheduler_index");
	}
	});
	
}


</script>
<script>
$(function(){
	  var currentLangCode = 'ko';
	  $('#calendar').fullCalendar('destroy');
	  $('#calendar').fullCalendar({
		  aspectRatio:1.15,
		 
          revert: true,
	       timeFormat: 'hh:mm', //시간 포멧
	       header: {
			     left: 'prev,next',
			     center: 'title',
			     right: ''
		      },
	    eventClick : function(calEvent,jsEvent,view){ //데이터 베이스에서도 이벤트 제거
	          /*         이동           */
	    		goUrl("/scheduler/scheduler_big");
	             },
	   defaultView: 'month',
	   editable: false,                                            
	   selectable: true,
	   selectHelper: true,
	   select: function(start, end, event) {
		  	 /*         이동           */
		   goUrl("/scheduler/scheduler_big");
	   },
	   eventLimit: true,
	   events: function(start,end,timezone,callback) {
		   $.ajax({
	        	url:"scheduler_event.json",
	     
	        	dataType: "json",
	        	success: function(list) {
	        		console.log("LOG "+list);
	                var events = [];
	                $.each(list,function(idx,dta) {
	                	console.log(dta.sched_check);
	                	var col = '#2196f3';
	                	if(dta.sched_type=='all'){
	                		col='red'
	                	}
	                	if(dta.sched_check=='0'){
	                		 events.push({
	 	                        title: dta.sched_event,//$(this).attr('title'),
	 	                        start: dta.sched_someday_date+'T'+dta.sched_someday_time, //$(this).attr('start') // will be parsed
	 	                        end:dta.sched_somedayend_date+'T'+dta.sched_somedayend_time,
	 	                        id:dta.sched_num,
	 	                        backgroundColor:col
	                		 });
	                	} 
	                });
	                console.log(events);
	                callback(events);
	            }
	          });
	          
  		}
	  })
	 });
 
</script>

<style>
	/* #tds{width: 900px;} */
	#calendar{width: 600px;height: 600px;}
	
	#private_sched{height: 800px;width: 500px; }
	#comp_sched{width: 550px;}
	.fc-button {color:#2196f3;}
	 .fc-state-default.fc-corner-right{border-top-right-radius: 0px;border-bottom-right-radius: 0px;}
	.fc-state-default.fc-corner-left{border-top-left-radius: 0px;border-bottom-left-radius: 0px;}
	.fc-center h2{color:#2196f3;}
	h2{color:#2196f3;}
	
	.fc-event {border-radius: 0px;}
	
</style>




<div class="container" >
	<div class="col-md-9" >
		<table class="table table-bordered">
			<tr>
				<td id="tds">
					<table id="table table-bordered">
						<tr>
							<td>	
								<div  id="private_sched">
									<table class="table">
										<thead>
											<tr align="center">
												<td colspan="2"><h2>개인 일정</h2></td>
											</tr>
											<tr align="center" >
												<td >일정 이름</td>
												<td >날짜</td>
												<td >완료</td>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${list}" var="list">
												<c:if test="${list.sched_check=='0'}" >
													<tr align="center">
														<td class="col-md-3"> <a > ${list.sched_event}</a> </td>
														<td> 
															<a role="button" tabindex="0" 
																class="btn bs-docs-popover"
																data-toggle="popover" 
																data-trigger="hover focus"
																title="${list.sched_event}" 
																data-content="${list.sched_content}">
																 ${list.sched_someday_date} ~ ${list.sched_somedayend_date }
															 </a>
														 </td>
														 <td>
														 	
														 	
														 		<input class="btn" type="button" style="color:#2196f3;" value="완료하기" id="${list.sched_num}" onclick="scheduler_check(${list.sched_num})">
														 	
														 <%-- 	<c:if test="${list.sched_check=='1'}" >
														 		<input class="btn" type="button" value="완료됨" style="color:red">
														 	</c:if> --%>
														 </td>
													</tr>
												</c:if>
											</c:forEach>
										</tbody>
										<tfoot>
											<tr>
												<td colspan="3" align="right">
													<div>
														<input type="button" 
															value="Add" data-toggle="modal" 
															data-target="#myModal" class="btn btn-primary"/>
													</div>
												</td>
											</tr>
										</tfoot>
									</table>
								</div>
							</td>
						</tr>
					</table>
				</td>
				<td>
					<div>
						<table id="table">
							<tr>	
								<td>
									<div id="calendar"></div>
								</td>
							</tr>
							<tr>
								<td id="tds">
									<div id="comp_sched">
									<div id="time_square" class="logff">
<h2 class="blind"><a href="http://www.naver.com/#time_h" id="time_h" name="time_h">타임스퀘어</a></h2>

<div class="tsq">
<h3 class="tsq_h">투데이</h3>
<div class="tsq_status" queryid="C1449535264651928125">
<a href="http://calendar.naver.com/" class="date" onclick="clickcr(this,&#39;squ.date&#39;,&#39;&#39;,&#39;&#39;,event);" title="캘린더이동"><em>12.08.</em>(화)</a>
<span class="bar">|</span>
<a href="http://www.naver.com/#" id="ts_region" class="qdown">
<span class="blind">현재 위치</span>
<strong>국내<span class="dep2"> &gt; </span>전주</strong>
<span class="blind">지역설정 레이어 열기</span>
</a>
</div>
<div id="ws_tsq" class="tsq_slide">
<h4 class="blind">생활</h4>
<div class="tsq_life_wrap">
<div class="tsq_weather">
<a data-name="서울" onclick="clickcr(this,&#39;squ.sweather&#39;,&#39;&#39;,&#39;&#39;,event)" href="http://weather.naver.com/rgn/townWetr.nhn?naverRgnCd=09140104" class="tw_a" title="날씨페이지로 이동" style="display: none;">
<span class="to">
<span class="tw_box">
<strong class="tw_tit">현재</strong>
<span class="deg"><em>0.7</em>℃</span>
<span class="tsq_wtb tsq_wtb1" title="맑음">맑음</span>
</span>
</span>
<span class="ym">
<span class="tw_box">
<strong class="tw_tit">내일오전</strong>
<span class="deg"><em>0.0</em>℃</span>
<span class="tsq_wtb tsq_wtb21" title="구름많음">구름많음</span>
</span>
</span>
<span class="ya">
<span class="tw_box">
<strong class="tw_tit">내일오후</strong>
<span class="deg"><em>10.0</em>℃</span>
<span class="tsq_wtb tsq_wtb21" title="구름많음">구름많음</span>
</span>
</span>
</a>
<a data-name="춘천" style="display: none;" onclick="clickcr(this,&#39;squ.sweather&#39;,&#39;&#39;,&#39;&#39;,event)" href="http://weather.naver.com/rgn/townWetr.nhn?naverRgnCd=01110675" class="tw_a" title="날씨페이지로 이동">
<span class="to">
<span class="tw_box">
<strong class="tw_tit">현재</strong>
<span class="deg"><em>-2.7</em>℃</span>
<span class="tsq_wtb tsq_wtb1" title="맑음">맑음</span>
</span>
</span>
<span class="ym">
<span class="tw_box">
<strong class="tw_tit">내일오전</strong>
<span class="deg"><em>-1.0</em>℃</span>
<span class="tsq_wtb tsq_wtb21" title="구름많음">구름많음</span>
</span>
</span>
<span class="ya">
<span class="tw_box">
<strong class="tw_tit">내일오후</strong>
<span class="deg"><em>9.0</em>℃</span>
<span class="tsq_wtb tsq_wtb21" title="구름많음">구름많음</span>
</span>
</span>
</a>
<a data-name="강릉" style="display: none;" onclick="clickcr(this,&#39;squ.sweather&#39;,&#39;&#39;,&#39;&#39;,event)" href="http://weather.naver.com/rgn/townWetr.nhn?naverRgnCd=01150615" class="tw_a" title="날씨페이지로 이동">
<span class="to">
<span class="tw_box">
<strong class="tw_tit">현재</strong>
<span class="deg"><em>6.6</em>℃</span>
<span class="tsq_wtb tsq_wtb21" title="구름많음">구름많음</span>
</span>
</span>
<span class="ym">
<span class="tw_box">
<strong class="tw_tit">내일오전</strong>
<span class="deg"><em>6.0</em>℃</span>
<span class="tsq_wtb tsq_wtb2" title="구름조금">구름조금</span>
</span>
</span>
<span class="ya">
<span class="tw_box">
<strong class="tw_tit">내일오후</strong>
<span class="deg"><em>14.0</em>℃</span>
<span class="tsq_wtb tsq_wtb21" title="구름많음">구름많음</span>
</span>
</span>
</a>
<a data-name="청주" style="display: none;" onclick="clickcr(this,&#39;squ.sweather&#39;,&#39;&#39;,&#39;&#39;,event)" href="http://weather.naver.com/rgn/townWetr.nhn?naverRgnCd=16111120" class="tw_a" title="날씨페이지로 이동">
<span class="to">
<span class="tw_box">
<strong class="tw_tit">현재</strong>
<span class="deg"><em>0.7</em>℃</span>
<span class="tsq_wtb tsq_wtb1" title="맑음">맑음</span>
</span>
</span>
<span class="ym">
<span class="tw_box">
<strong class="tw_tit">내일오전</strong>
<span class="deg"><em>-1.0</em>℃</span>
<span class="tsq_wtb tsq_wtb2" title="구름조금">구름조금</span>
</span>
</span>
<span class="ya">
<span class="tw_box">
<strong class="tw_tit">내일오후</strong>
<span class="deg"><em>11.0</em>℃</span>
<span class="tsq_wtb tsq_wtb21" title="구름많음">구름많음</span>
</span>
</span>
</a>
<a data-name="대전" style="display: none;" onclick="clickcr(this,&#39;squ.sweather&#39;,&#39;&#39;,&#39;&#39;,event)" href="http://weather.naver.com/rgn/townWetr.nhn?naverRgnCd=07110101" class="tw_a" title="날씨페이지로 이동">
<span class="to">
<span class="tw_box">
<strong class="tw_tit">현재</strong>
<span class="deg"><em>0.6</em>℃</span>
<span class="tsq_wtb tsq_wtb1" title="맑음">맑음</span>
</span>
</span>
<span class="ym">
<span class="tw_box">
<strong class="tw_tit">내일오전</strong>
<span class="deg"><em>0.0</em>℃</span>
<span class="tsq_wtb tsq_wtb2" title="구름조금">구름조금</span>
</span>
</span>
<span class="ya">
<span class="tw_box">
<strong class="tw_tit">내일오후</strong>
<span class="deg"><em>12.0</em>℃</span>
<span class="tsq_wtb tsq_wtb21" title="구름많음">구름많음</span>
</span>
</span>
</a>
<a data-name="대구" style="display: none;" onclick="clickcr(this,&#39;squ.sweather&#39;,&#39;&#39;,&#39;&#39;,event)" href="http://weather.naver.com/rgn/townWetr.nhn?naverRgnCd=06110101" class="tw_a" title="날씨페이지로 이동">
<span class="to">
<span class="tw_box">
<strong class="tw_tit">현재</strong>
<span class="deg"><em>6.9</em>℃</span>
<span class="tsq_wtb tsq_wtb1" title="맑음">맑음</span>
</span>
</span>
<span class="ym">
<span class="tw_box">
<strong class="tw_tit">내일오전</strong>
<span class="deg"><em>1.0</em>℃</span>
<span class="tsq_wtb tsq_wtb2" title="구름조금">구름조금</span>
</span>
</span>
<span class="ya">
<span class="tw_box">
<strong class="tw_tit">내일오후</strong>
<span class="deg"><em>13.0</em>℃</span>
<span class="tsq_wtb tsq_wtb21" title="구름많음">구름많음</span>
</span>
</span>
</a>
<a data-name="부산" style="display: none;" onclick="clickcr(this,&#39;squ.sweather&#39;,&#39;&#39;,&#39;&#39;,event)" href="http://weather.naver.com/rgn/townWetr.nhn?naverRgnCd=08110580" class="tw_a" title="날씨페이지로 이동">
<span class="to">
<span class="tw_box">
<strong class="tw_tit">현재</strong>
<span class="deg"><em>8.4</em>℃</span>
<span class="tsq_wtb tsq_wtb1" title="맑음">맑음</span>
</span>
</span>
<span class="ym">
<span class="tw_box">
<strong class="tw_tit">내일오전</strong>
<span class="deg"><em>9.0</em>℃</span>
<span class="tsq_wtb tsq_wtb2" title="구름조금">구름조금</span>
</span>
</span>
<span class="ya">
<span class="tw_box">
<strong class="tw_tit">내일오후</strong>
<span class="deg"><em>16.0</em>℃</span>
<span class="tsq_wtb tsq_wtb21" title="구름많음">구름많음</span>
</span>
</span>
</a>
<a data-name="전주" style="display: block;" onclick="clickcr(this,&#39;squ.sweather&#39;,&#39;&#39;,&#39;&#39;,event)" href="http://weather.naver.com/rgn/townWetr.nhn?naverRgnCd=13113135" class="tw_a" title="날씨페이지로 이동">
<span class="to">
<span class="tw_box">
<strong class="tw_tit">현재</strong>
<span class="deg"><em>1.5</em>℃</span>
<span class="tsq_wtb tsq_wtb1" title="맑음">맑음</span>
</span>
</span>
<span class="ym">
<span class="tw_box">
<strong class="tw_tit">내일오전</strong>
<span class="deg"><em>2.0</em>℃</span>
<span class="tsq_wtb tsq_wtb2" title="구름조금">구름조금</span>
</span>
</span>
<span class="ya">
<span class="tw_box">
<strong class="tw_tit">내일오후</strong>
<span class="deg"><em>14.0</em>℃</span>
<span class="tsq_wtb tsq_wtb21" title="구름많음">구름많음</span>
</span>
</span>
</a>
<a data-name="광주" style="display:none" onclick="clickcr(this,&#39;squ.sweather&#39;,&#39;&#39;,&#39;&#39;,event)" href="http://weather.naver.com/rgn/townWetr.nhn?naverRgnCd=05110101" class="tw_a" title="날씨페이지로 이동">
<span class="to">
<span class="tw_box">
<strong class="tw_tit">현재</strong>
<span class="deg"><em>1.9</em>℃</span>
<span class="tsq_wtb tsq_wtb1" title="맑음">맑음</span>
</span>
</span>
<span class="ym">
<span class="tw_box">
<strong class="tw_tit">내일오전</strong>
<span class="deg"><em>3.0</em>℃</span>
<span class="tsq_wtb tsq_wtb21" title="구름많음">구름많음</span>
</span>
</span>
<span class="ya">
<span class="tw_box">
<strong class="tw_tit">내일오후</strong>
<span class="deg"><em>15.0</em>℃</span>
<span class="tsq_wtb tsq_wtb3" title="흐림">흐림</span>
</span>
</span>
</a>
<a data-name="제주" style="display:none" onclick="clickcr(this,&#39;squ.sweather&#39;,&#39;&#39;,&#39;&#39;,event)" href="http://weather.naver.com/rgn/townWetr.nhn?naverRgnCd=14130116" class="tw_a" title="날씨페이지로 이동">
<span class="to">
<span class="tw_box">
<strong class="tw_tit">현재</strong>
<span class="deg"><em>10.5</em>℃</span>
<span class="tsq_wtb tsq_wtb21" title="구름많음">구름많음</span>
</span>
</span>
<span class="ym">
<span class="tw_box">
<strong class="tw_tit">내일오전</strong>
<span class="deg"><em>11.0</em>℃</span>
<span class="tsq_wtb tsq_wtb21" title="구름많음">구름많음</span>
</span>
</span>
<span class="ya">
<span class="tw_box">
<strong class="tw_tit">내일오후</strong>
<span class="deg"><em>17.0</em>℃</span>
<span class="tsq_wtb tsq_wtb4" title="흐리고 한때 비">흐리고 한때 비</span>
</span>
</span>
</a>
<a data-name="백령" style="display:none" onclick="clickcr(this,&#39;squ.sweather&#39;,&#39;&#39;,&#39;&#39;,event)" href="http://weather.naver.com/rgn/townWetr.nhn?naverRgnCd=11720330" class="tw_a" title="날씨페이지로 이동">
<span class="to">
<span class="tw_box">
<strong class="tw_tit">현재</strong>
<span class="deg"><em>2.6</em>℃</span>
<span class="tsq_wtb tsq_wtb2" title="구름조금">구름조금</span>
</span>
</span>
<span class="ym">
<span class="tw_box">
<strong class="tw_tit">내일오전</strong>
<span class="deg"><em>4.0</em>℃</span>
<span class="tsq_wtb tsq_wtb21" title="구름많음">구름많음</span>
</span>
</span>
<span class="ya">
<span class="tw_box">
<strong class="tw_tit">내일오후</strong>
<span class="deg"><em>8.0</em>℃</span>
<span class="tsq_wtb tsq_wtb21" title="구름많음">구름많음</span>
</span>
</span>
</a>
<a data-name="울릉/독도" style="display:none" onclick="clickcr(this,&#39;squ.sweather&#39;,&#39;&#39;,&#39;&#39;,event)" href="http://weather.naver.com/rgn/townWetr.nhn?naverRgnCd=04940320" class="tw_a" title="날씨페이지로 이동">
<span class="to">
<span class="tw_box">
<strong class="tw_tit">현재</strong>
<span class="deg"><em>7.1</em>℃</span>
<span class="tsq_wtb tsq_wtb3" title="흐림">흐림</span>
</span>
</span>
<span class="ym">
<span class="tw_box">
<strong class="tw_tit">내일오전</strong>
<span class="deg"><em>7.0</em>℃</span>
<span class="tsq_wtb tsq_wtb21" title="구름많음">구름많음</span>
</span>
</span>
<span class="ya">
<span class="tw_box">
<strong class="tw_tit">내일오후</strong>
<span class="deg"><em>11.0</em>℃</span>
<span class="tsq_wtb tsq_wtb21" title="구름많음">구름많음</span>
</span>
</span>
</a>
</div>
<ul class="tsq_list">
<li>
<a href="http://weather.naver.com/" onclick="clickcr(this, &#39;squ.theme&#39;,&#39;78005501_0000000DDE47&#39;, &#39;&#39;, event)" class="tit">날씨</a>
<a href="http://search.naver.com/search.naver?where=nexearch&query=%EC%98%A4%EB%8A%98%EB%82%A0%EC%94%A8&sm=top_tsi" onclick="clickcr(this, &#39;squ.text&#39;,&#39;78005501_0000000DDE46&#39;, &#39;&#39;, event)" title="낮 동안 맑고 포근">낮 동안 맑고 포근</a>
<span class="bar">|</span>
<a href="http://weather.naver.com/period/weeklyFcast.nhn" onclick="clickcr(this, &#39;squ.text&#39;,&#39;78005501_0000000DDE48&#39;, &#39;&#39;, event)" title="주간 예보">주간 예보</a>
</li>
<li>
<a href="http://search.naver.com/search.naver?sm=top_tsi&where=nexearch&query=%B6%EC%BA%B0%BF%EE%BC%BC" onclick="clickcr(this, &#39;squ.theme&#39;,&#39;78005501_0000000DDE4A&#39;, &#39;&#39;, event)" class="tit">운세</a>
<a href="http://search.naver.com/search.naver?sm=top_tsi&where=nexearch&query=%B6%EC%BA%B0%BF%EE%BC%BC" onclick="clickcr(this, &#39;squ.text&#39;,&#39;78005501_0000000DDE49&#39;, &#39;&#39;, event)" title="띠별 운세">띠별 운세</a>
<span class="bar">|</span>
<a href="http://search.naver.com/search.naver?sm=top_tsi&where=nexearch&query=%EB%B3%84%EC%9E%90%EB%A6%AC+%EC%9A%B4%EC%84%B8" onclick="clickcr(this, &#39;squ.text&#39;,&#39;78005501_0000000DDE4B&#39;, &#39;&#39;, event)" title="별자리">별자리</a>
<span class="bar">|</span>
<a href="http://search.naver.com/search.naver?sm=top_tsi&where=nexearch&query=%EC%83%9D%EB%85%84%EC%9B%94%EC%9D%BC+%EC%9A%B4%EC%84%B8" onclick="clickcr(this, &#39;squ.text&#39;,&#39;78005501_0000000DDE4C&#39;, &#39;&#39;, event)" title="생년월일 운세">생년월일 운세</a>
</li></ul>
</div>
</div>
<div class="cpg timesquare_pg">
<span><strong>2</strong>/3</span>
<a href="http://www.naver.com/#" class="pre" title="이전">이전</a><a href="http://www.naver.com/#" class="next" title="다음">다음</a>
</div>
<div class="tsq_wg">
<a href="http://www.naver.com/#" class="tsq_wg_open" onclick="clickcr(this,&#39;tsw.open&#39;,&#39;&#39;,&#39;&#39;,event);TimeSquare.Wiget.open();return false;">생활위젯 레이어 열기</a>
<div class="ly_tsq_wg" style="display:none"></div>
</div>
</div>
</div>
									
									</div>
								</td>
							</tr>
						</table>
					</div>
				</td>
			</tr>	
		</table>
	</div>
	<!-- ====================================Modal======================================== -->
	<div class="modal fade" id="myModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">일정 추가</h4>
	      </div>
	      	<form action='<c:url value="/scheduler/scheduler_insert"/>' >
		      <div class="modal-body">
		      
		        <table id="table">
			
					<tbody>
						<tr>
							<td id="colname">제목:</td>
							<td><input type="text" class="form-control" id="sched_event" name="sched_event" required="required"></td>
						</tr>
						<tr>
							<td id="colname">시작 날짜:</td>
							<td>
								<input type="date" id="sched_someday_date" name="sched_someday_date" required="required">
								<input type="time" id="sched_someday_time" name="sched_someday_time">
							</td>
							
						</tr>
						<tr>
							<td id="colname">종료 날짜:</td>
							<td>
								<input type="date" id="sched_somedayend_date" name="sched_somedayend_date" required="required">
								<input type="time" id="sched_somedayend_time" name="sched_somedayend_time">
							</td>
							
						</tr>
						<tr>
							<td id="colname">내용:</td>
						</tr>
						<tr>
							<td colspan="3"><textarea rows="7" cols="60" id="sched_content" name="sched_content"></textarea> </td>
						</tr>
						
					</tbody>
					<tfoot>
						<!-- <tr>
							<td><input class="btn btn-default" type="button" value="추가"></td>
						</tr> -->
					</tfoot>
				</table>
			 
		      </div>
		      <div class="modal-footer">
		      	<button type="button" class="btn btn-primary" onclick="scheduler_insert()">일정 추가</button>
		        <button type="button" class="btn btn-default" data-dismiss="modal">입력 취소</button>
		        
		      </div>
		  </form>  
	    </div>
	  </div>
	</div>
</div>
