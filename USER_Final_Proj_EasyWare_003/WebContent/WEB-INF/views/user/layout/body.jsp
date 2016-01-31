<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" autoFlush="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- JSTL 선언 -->
<!-- JQuery UI -->
<link rel="stylesheet"
	href="<c:url value='/resources/plugin/jquery-ui-1.11.4/jquery-ui.min.css'/> ">
<script
	src="<c:url value='/resources/plugin/jquery-ui-1.11.4/jquery-ui.js' />"></script>

<!-- datetime picker -->
<link rel="stylesheet"
	href="<c:url value='/resources/plugin/datetimepicker/jquery.datetimepicker.css' /> ">
<script
	src="<c:url value='/resources/plugin/datetimepicker/build/jquery.datetimepicker.full.min.js' />"></script>
<script type="text/javascript"
	src="<c:url value='/resources/plugin/sweetalert/dist/sweetalert.min.js'/>"></script>
<link rel="stylesheet"
	href="<c:url value='/resources/plugin/sweetalert/dist/sweetalert.css'/>">

<script type="text/javascript">
	$(function() {
		$('.timepicker').datetimepicker({
			datepicker : false,
			format : 'H:i',
			step : 10
		});

		$('.datepicker').datetimepicker({
			timepicker : false,
			format : 'Y-m-d'

		});
	});
</script>
<!-- 스크립트 , CSS 정리 -->
<link rel="stylesheet"
	href="<c:url value='/resources/layout/css/body.css'/> ">
<link rel="stylesheet"
	href="<c:url value='/resources/layout/css/body_other.css'/> ">
<script src="<c:url value='/resources/layout/js/sns.js' />"></script>
<script src="<c:url value='/resources/layout/js/scheduler.js' />"></script>


<script>
	var wsocket;
	function connect() {
		wsocket = new SockJS("<c:url value='/ws/chat.sockjs'/>");
		/* wsocket.onopen = onOpen; */
		wsocket.onmessage = onMessage;
		/* wsocket.onclose = onClose; */
	}

	function onMessage(evt) {
		var data = evt.data;
		appendMessage(data);
	}
	function appendMessage(msg) {
		var dept_info = $("#sns_info").val();
		var task_info = $("#task_info").val();
		var msg_type = msg.split("/");
		if ((msg_type[0] == 'sns') && (msg_type[2] == dept_info)) {
			refresh();
		}
	}
	function send() {
		var sns_info = $("#sns_info").val();
		update();
		setTimeout(function() {
			wsocket.send('sns/t/' + sns_info)
		}, 300);
		$("#sns_content").val("");
	}
	window.onload = connect();

	$(function() {
		$('#sns_sendBtn').click(function() {
			send();
		});
		$('#sns_content').keydown(function(key) {
			if (key.keyCode == 13) {
				console.log("keydown 확인");
				send();
			}
		});
	});

	$(function() {
		$(".js-sortable").sortable({
			placeholder : "ui-sortable-placeholder"
		});
	});
</script>


<!--긴 문장 잘라주는 css -->
<style>
.sortable__rent td {
	text-overflow: clip;
	overflow: hidden;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: visible;
}

.sortable__grid__list {
	background-color: white;
}


</style>







<div class="row col-sm-14 col-md-14 col-lg-14" align="center"
	style="margin-top: 0px;">

	<ul class="sortable__list js-sortable" style="margin-top: 0px;">
		<!-- grid1 -->
		<li class="sortable__list sortable__grid" style="margin-top: 0px;">

			<ul class="sortable__grid__list js-sortable">

				<li class="sortable__task" style="height: 270px;">
					<!-- task start  -->
					<div class="panel panel-primary"
						style="padding: 0px; border-style: none; border-radius: 8px; height: 270px;">
						<div class="panel-heading"
							style="height: 50px; background-color: rgba(33, 150, 243, 0.79);">
							<strong style="font-size: large;">TASK LIST</strong>
						</div>      
						<div class="panel-body">   
							<h6>최근 지시 받은  업무</h6>        
							<div class="table-responsive col-sm-12">
								<table class="table table-hover table-striped table-condensed">
									<thead>
										<tr>        
											<th>#</th>                  
											<th>TASK_TITLE</th>
											<th>지시자</th>
										</tr>
									</thead>
									<tbody>
    
										<c:forEach items="${assign_list}" var="row" end="2">
											<tr>  
												<td>${row.ROWNUM}</td>         
												<td>                                                                         
													<div style="overflow:hidden; text-overflow:ellipsis; width:180px; text-align: left;">
												        <nobr>
												         <a href="<c:url value='/task/assignee_list_detail?task_num=${row.TASK_NUM}' />">
														<span>	${row.TASK_TITLE} </span></a>
												        </nobr>
												     </div>
											    </td>
												<td>${row.MEM_NAME}</td>


											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>

						</div>
					</div> <!-- task end -->
				</li>

				<li class="sortable__report" style="height: 500px;">
					<div class="panel panel-primary"
						style="margin: 0px; padding: 0px; border-style: none; border-radius: 8px; height: 500px;">
						<div class="panel-heading"
							style="height: 50px; background-color: #2A6F72;">
							<strong style="font-size: large;">WorkFlow</strong>
						</div>
						<div class="panel-body">
							<div class="table-responsive col-sm-12">
	
								<div class="list-group" style="text-align: left;">
								<a href="<c:url value='/report/report_appr_list'/>" class="list-group-item"><span class="badge" id="reportBadge2"></span>결재할 문서</a> 
								<a href="<c:url value='/report/report_workflow_list/4'/>" class="list-group-item"><span class="badge">${index_count.STATE4 }</span>모든 문서</a>
								<a href="<c:url value='/report/report_workflow_list/1'/>" class="list-group-item"><span class="badge">${index_count.STATE1 }</span>진행중인 문서</a>
								<a href="<c:url value='/report/report_workflow_list/2'/>" class="list-group-item"><span class="badge">${index_count.STATE2 }</span>최종승인 문서</a>
								<a href="<c:url value='/report/report_workflow_list/3'/>" class="list-group-item"><span class="badge">${index_count.STATE3 }</span>반려 문서</a>
								</div>


								<!-- 여기에 보고서 입력 -->
							</div>
						</div>
					</div>
				</li>
			</ul>

		</li>
		<!--/. grid1 -->

		<!-- grid2 -->
		<li class="sortable__grid">
			<ul class="sortable__grid__list js-sortable">
				<li class="sortable__timecard" style="height: 270px;">
					<!-- timecard start -->

					<div class="panel panel-primary"
						style="margin: 0px; padding: 0px; border-radius: 8px; height: 270px;">
						<div class="panel-heading"
							style="height: 50px; background-color: #77CC94;">
							<strong style="font-size: large;">TIMECARD</strong>
						</div>
						<div class="panel-body">
							<div class="table-responsive col-sm-12">
								<table class="table table-hover table-striped table-condensed">
									<thead>
										<tr class="warning" align="center">
											<th>날짜</th>
											<th>출근</th>
											<th>퇴근</th>
										</tr>
									</thead>
									<c:forEach items="${timecardlist}" var="timecard_data">
										<tr align="left">
											<td>${timecard_data.day}</td>
											<td>${timecard_data.tcwork_start}</td>
											<td>${timecard_data.tcwork_end}</td>

										</tr>
									</c:forEach>
								</table>
							</div>
						</div>
					</div> <!--./timecard end -->
				</li>
				<li class="sortable__schedule">
					<!--schedule start -->
					<div class="sched_main container-fluid">
						<div class="row">
							<div class="sched" align="left">
								<div class="sched_cont_top">
									<h4 align="left">Private Schedule</h4>
									<a class="icon sa" aria-label="Right Align"
										style="background: #2AB9D0; color: white; font-size: 10px"
										href="<c:url value="/scheduler/scheduler_big"/>"
										data-toggle="tooltip" title="일정 자세히 보기"> <span
										style="font-size: 17px;"
										class="glyphicon glyphicon glyphicon-calendar icon"
										aria-hidden="true"></span>
									</a>
								</div>
								<div class="sched_cont" style="overflow-y: hidden;">
									<div class="sched_cont" id="sched_list">
										<table class="table" id="sched_table">

										</table>
									</div>
									<div class="sched_cont" id="input_form" align="center"
										style="background-color: #F1F1F1; margin-left: 0px;">
										<table
											style="width: 100%; padding: 9px; border-collapse: separate; cursor: pointer;">
											<tr align="center">
												<td colspan="2"><h5 style="color: #2AB9D0;">Add
														New Schedule</h5>
												<td>
											</tr>
											<tr>
												<td id="colname">Title:</td>
												<td colspan="2"><input type="text"
													style="height: 20px; width: 97%;" class="form-control"
													id="sched_event" name="sched_event" required="required"></td>
											</tr>
											<tr>
												<td id="colname">Start:</td>
												<td><input type="text" class="datepicker form-control"
													id="sched_someday_date" name="sched_someday_date"
													required="required"></td>
												<td><input type="text" class="timepicker form-control"
													id="sched_someday_time" name="sched_someday_time"></td>
											</tr>
											<tr>
												<td id="colname">End:</td>
												<td><input type="text" class="datepicker form-control"
													id="sched_somedayend_date" name="sched_somedayend_date"
													required="required"></td>

												<td><input type="text" class="timepicker form-control"
													id="sched_somedayend_time" name="sched_somedayend_time">
												</td>

											</tr>
											<tr>
												<td id="colname">Content:</td>
											</tr>
											<tr>
												<td colspan="3"><textarea rows="5" style="width: 100%;"
														class="form-control" id="sched_content"
														name="sched_content"></textarea></td>
											</tr>
											<tfoot align="right">
												<tr>
													<td colspan="3"><a class="ok_sched"
														onclick="scheduler_insert()">Add Schedule<span
															class="glyphicon glyphicon-ok" aria-hidden="true"></span></a>
														<a class="cancel_sched" onclick="tog()">Cancel<span
															class="glyphicon glyphicon-remove" aria-hidden="true"></span></a>
													</td>
													<td align="right"></td>
												</tr>
											</tfoot>
										</table>
									</div>
								</div>
								<div align="right" id="add_form_btn">
									<a class="icon" onclick="tog()" id="open_add_form"
										aria-label="Right Align"
										style="font-size: 10px; text-decoration: none;"
										data-toggle="tooltip" title="일정 추가하기"> ADD <span
										class="glyphicon glyphicon-plus" aria-hidden="true"></span>
									</a>
								</div>


							</div>

						</div>
					</div> <!--schedule end -->
				</li>

				<li class="sortable__board">
					<div style="width: 100%; height: 300px; border-radius: 8px;">

					</div>
				</li>
			</ul>
		</li>
		<!--/. grid2 -->

		<!-- grid3 -->
		<li class="sortable__grid">
			<ul class="sortable__grid__list js-sortable">
				<li class="sortable__rent" style="height: 270px;">
					<!-- sns rent -->
					<div class="panel panel-primary"
						style="margin: 0px; padding: 0px; border-style: none; border-radius: 8px; height: 270px;">
						<div class="panel-heading"
							style="height: 50px; background-color: #E794A2;">
							<strong style="font-size: large;">RECENT NOTICE</strong>
						</div>
						<div class="panel-body">
							<div class="table-responsive col-sm-12">
								<table class="table table-hover table-striped table-condensed" style="text-align: left;">
									<!-- 여기에 공지사항 입력 -->
									<thead>
										<tr>
											<th>TITLE</th>
											<th>DATE</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="b_list" items="${b_list}">
											<tr>
												<td><a
													href="/board/board_L_detail?board_num=${b_list.board_num}&board_code=9">${b_list.board_title}</a></td>
												<td>${b_list.board_regdate}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>

							</div>
						</div>
					</div> <!-- sns rent -->
				</li>
				<!-- sns start -->
				<li class="sortable__sns">
					<div class="sched_main container-fluid">
						<div class="row" align="left">
							<div class="sched">

								<div class="sched_custom">
									<div class="sched_cont_top" align="left">
										<h4 align="left">Group Talk</h4>
										<input id="session_memcode" type="hidden"
											value="${sessionScope.mem_code}"> <a class="icon sa"
											style="background: #2AB9D0; color: white; font-size: 10px">
											<span class="glyphicon glyphicon-comment icon"
											aria-hidden="true"></span>
										</a>
									</div>
									<div class="sched_cont"
										style="height: 375px; overflow-y: auto;">
										<div id="timeline"
											style="overflow-x: hidden; overflow-y: hidden;"></div>
										<div align="center">
											<a href="#" onclick="log()"
												style="color: #8c8c8c; display: block;">See more</a>
										</div>
									</div>

								</div>
								<div style="height: 29px; width: 100%; margin-top: 2px;">
									<input type="hidden" id="sns_info" value="${dept_num}">
									<input class="form-group"
										style="line-height: 25px; width: 85%; border-radius: 4px;"
										type="text" id="sns_content"> <a id="sns_sendBtn">
										Send </a>
								</div>
							</div>
						</div>
					</div> <!-- sns end -->
				</li>



			</ul>
		</li>
		<!--/. grid3 -->
	</ul>
</div>







