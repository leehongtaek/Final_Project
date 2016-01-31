<%-- 
    작업 날짜 : 2015. 11. 20.
    구현 내용 :   
  
  @author By kosta 
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!-- JSTL 선언 -->
<style>
#chatArea {
	width: 300px; height: 200px; overflow-y: auto; border: 1px solid black;
}
</style>                      
<script type="text/javascript" src="<c:url value='/resources/plugin/sockjs-client/dist/sockjs-0.3.4.min.js'/>" ></script>
<script type="text/javascript"> // 소켓 서버 연결 
$(function() { connect();});
var callee_pc;
var localStream;

var webRtc_socket;
function connect() {
	webRtc_socket = new SockJS("<c:url value='/ws/webrtc.sockjs'/>");
	webRtc_socket.onopen = onOpen;
	webRtc_socket.onmessage = onMessage;
	webRtc_socket.onclose = onClose;
}
function disconnect() { webRtc_socket.close();}
function onOpen(evt) {console.log("Web Rtc 소켓 서버에 연결되었습니다.");}
function onClose(evt) { console.log("연결을 끊었습니다.");}

function onMessage(evt) {
	var data = JSON.parse(evt.data);

    if (data.type == 'offer') {
      console.log('received offer: ' + data.sdp);

    var sdp= data.sdp;

	// 3. peerConnection 객체 생성  
	callee_pc = new webkitRTCPeerConnection(null, iceCallback);
	console.log("join : Created remote peer connection object pc");

	// 4. peerConnection에 로컬스트림 추가
	callee_pc.onaddstream = gotRemoteStream; // 원격에서 스트림을 받으면 발생하는 이벤트
	callee_pc.addStream(localStream);

	
	// 5. SDP_OFFER와 받은 오퍼로 디스크립션을 설정한다.  
	var remotoDes;
	callee_pc.setRemoteDescription(function(sdp) { remotoDes = sdp; },function(){},function(e){});
	// console.log('join : Remote Description 설정');
	console.log("remotoDes ::::"+remotoDes);  
	
	// 6. answer 생성  
	//var offer = pc2.remoteDescription;  
	//var answer = pc2.createAnswer(offer.toSdp(), {has_audio : true, has_video : true});
	//console.log('join : Created answer:\n' + answer.toSdp());
		
	//callee_pc.createAnswer( function(sdp) { answer = sdp; }   ,
	//	      function(error) {  trace('Failed to create session description: ' + error.toString());});
	  
	
	
	// 7. SDP_ANSWER와 answer로 로컬 디스크립션 설정
	//pc2.setLocalDescription(pc.SDP_ANSWER, answer);
	// console.log('join : Local Description 설정');

	// 8 answer 전송
	// webRtc_socket.send(JSON.stringify({type : 'answer',sdp : answer.toSdp()}));

	// 9. startIce();
	//pc.startIce();
	// console.log('join : start ice');
} else if (data.type == 'answer') {
	console.log('call : received answer: ' + data.sdp);

	// 8. SDP_ANSWER와 받은 answer로 원격 디스크립션 설정
	pc.setRemoteDescription(pc.SDP_ANSWER, new SessionDescription(data.sdp));
	console.log('call : Set Remote Description');

	// 9. startIce();
	pc.startIce();
	console.log('call : Started ICE');
	
} else if (data.type == 'candidate') {
	console.log('received candidate: ', data);

	var newCandidate = new IceCandidate(data.label, data.candidate);
	pc.processIceMessage(newCandidate);
	
} else {
	console.log('message is received. something is wrong');
	console.log(msg);
	console.log(msg.data);
}

}


</script>

<script type="text/javascript">
// 브라우저별 미디어 스트림을 얻어오는 구현체



function userMedia() {
	
navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.oGetUserMedia || navigator.msGetUserMedia;

var caller_Pc;
var caller_Pc_Stream;

// Constraint! 설정 세팅
var constraints = {audio: false,video: true};

// 사용자의 컴퓨터로부터 스트림을 얻어오는 과정
function successCallback(stream) {
	window.stream = stream; // stream available to console
	if (window.URL) {    
		// video.src = window.URL.createObjectURL(stream);
		caller_Pc_Stream = stream; // caller_Pc_Stream에 저장
	} else {
		// video.src= stream;  		
	}
}
// 실패시 콜백 함수 
function errorCallback(error) { console.log('navigator.getUserMedia error: ', error);}

navigator.getUserMedia(constraints, successCallback, errorCallback);



/////////////////////////////////
function iceCallback(candidate, bMore) {
		if (candidate) {
			console.log("Local ICE candidate: " + candidate.toSdp());
			pc.processIceMessage(candidate);

			// candidate를 상대편으로 보낸다.
			ws.send(JSON.stringify({
				type : 'candidate',
				label : candidate.label,
				candidate : candidate.toSdp()
			}));
			console.log('candidate is sent');
		}
}

var servers= null;
var offer;
   
function webRtc_Caller(){
	userMedia();
	caller_Pc = new webkitRTCPeerConnection(servers,iceCallback);
	console.log('call : peerConnection 객체 생성');
	
	// 스트림 얻어오기 
	caller_Pc.addStream(caller_Pc_Stream);  
	if (caller_Pc_Stream.getVideoTracks().length >0){
		console.log('call : Using Video device: ', localStream.getVideoTracks()[0].label);
	}
	if (caller_Pc_Stream.getAudioTracks().length >0){
		console.log('call : Using Video device: ', localStream.getAudioTracks()[0].label);
	}
	
  
    
    var offerOptions = {offerToReceiveAudio: 1,offerToReceiveVideo: 1};
    // offer 생성
    caller_Pc.createOffer(function(description){offer = description;},
 		   function(error){trace('Failed to create session description: ' + error.toString());},
 		   offerOptions);  
    
    trace('offer.sdp  ::::: ' +offer.sdp);
    
    // caller Pc 의 offer로 세팅
    caller_Pc.setLocalDescription(offer,
				  function(){  trace('Set session description success.');},
				  function(){  trace('Set session description error.'); });
    
    trace('session description success.  ::::: ' +offer.sdp);
    
    webRtc_socket.send(JSON.stringify(offer.toJSON()));
	  
}

  
 
</script>


<title>PAGE - MENU [NAME] </title>

<div class="container">
이름:<input type="text" id="nickname" value="${mem_code}/${dept_num}/${mem_name}" readonly="readonly">
	<input type="button" id="enterBtn" value="입장">
	<input type="button" id="exitBtn" value="나가기">
    
    <h1>대화 영역</h1>
    <div id="chatArea"><textArea id="chatMessageArea" ></textArea></div>
    <br/>
    <input type="text" id="message">
    <input type="button" id="sendBtn" value="전송">
</div>
