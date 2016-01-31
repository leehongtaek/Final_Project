<%-- 
    작업 날짜 : 2015. 11. 20.
    구현 내용 :   
  
  @author By kosta 
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- JSTL 선언 -->
<script type="text/javascript"
	src="<c:url value='/resources/webrtc/adapter.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/resources/webrtc/webrtc.js'/>"></script>


<style>
#chatArea {
	width: 300px;
	height: 200px;
	overflow-y: auto;
	border: 1px solid black;
}
</style>
<script type="text/javascript"
	src="<c:url value='/resources/plugin/sockjs-client/dist/sockjs-0.3.4.min.js'/>"></script>
<script type="text/javascript">
$(function() { connect();});
	var pc;
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
		pc2 = new webkitRTCPeerConnection(null, iceCallback);
		console.log("join : Created remote peer connection object pc");

		// 4. peerConnection에 로컬스트림 추가
		pc2.onaddstream = gotRemoteStream; // 원격에서 스트림을 받으면 발생하는 이벤트
		pc2.addStream(localStream);

		// 5. SDP_OFFER와 받은 오퍼로 디스크립션을 설정한다.  
		 pc2.setRemoteDescription(function(sdp) { answer = description; },function(){},function(e){});
		// console.log('join : Remote Description 설정');
		  
		// 6. answer 생성  
		//var offer = pc2.remoteDescription;  
		//var answer = pc2.createAnswer(offer.toSdp(), {has_audio : true, has_video : true});
		//console.log('join : Created answer:\n' + answer.toSdp());
			
		pc2.createAnswer( function(sdp) { answer = description; }   ,
			      function(error) {  trace('Failed to create session description: ' + error.toString());});
		  
		
		
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
		var pc2;
		var sendChannel;
	    var offertest;
		function webRtc_Call() {
	    //btn2.disabled = true;
	    //btn3.disabled = false;

	       console.log('call : Starting call');

	       // 로컬스트림에서 사용하는 비디오와 오디오 종류 출력(연결과는 상관없음)
	       if (localStream.getVideoTracks.length > 0) {
	         console.log('call : Using Video device: ', localStream.videoTracks[0].label);
	       }
	       if (localStream.getAudioTracks.length > 0) {
	         console.log('call : Using Audio device: ', localStream.audioTracks[0].label);
	       }
		
	       // 3. peerConnection 객체 생성
	       var server=null;
	       pc = new webkitRTCPeerConnection(server, iceCallback);
	       console.log('call : peerConnection 객체 생성');
	       var offerOptions = {offerToReceiveAudio: 1,offerToReceiveVideo: 1};
	        
	       pc.createOffer(function(description){offertest = description;},
	    		   function(error){trace('Failed to create session description: ' + error.toString());},
	    		   offerOptions);  
	       
	       
	       
	       pc.setLocalDescription(offertest,
	    		   				  function(){  trace('Set session description success.');},
	    		   				  function(){  trace('Set session description error.'); });
	       
	       webRtc_socket.send(JSON.stringify(offertest.toJSON()));
	       pc2 = new RTCPeerConnection(server);
	       trace('Created remote peer connection object remotePeerConnection');
	       // 4. peerConnection에 localStream 추가
	       //pc.onaddstream = gotRemoteStream; // 원격에서 스트림을 받으면 발생하는 이벤트
			
	       //pc.addStream(localStream);
	       //console.log('call : peerConnection에 로컬스트림 추가');

	       // 5. offer 생성
	       // var offer = pc.createOffer({audio:true, video:true});
	       //console.log('call : Created offer:\n' + offer.toSdp());
	       //var offer = pc.createOffer(getOfferSDP, onfailure, sdpConstraints);
		   
				       
	       //offertest = offer;  	
	       // 6. SDP_OFFER와 offer로 로컬디스크립션 설정
	       // pc.setLocalDescription(pc.SDP_OFFER, offer);
	       // console.log('call : Set Local Description');
 
	       // 7. offer 전송
	       //webRtc_socket.send(JSON.stringify({type: 'offer', sdp: offer.toSdp()}));
	  }
			 
		function getOfferSDP(offerSDP) {
			offertest.setLocalDescription(offerSDP);
		    
		    console.log('offer sdp', offerSDP.sdp);
		    console.log('type',      offerSDP.type);
		};
	
		 // 상대방에서 스트림을 받기시작하면 발생하는 콜백
	 function gotRemoteStream(e){
	 vid2.src = webkitURL.createObjectURL(e.stream);
	        console.log("Received remote stream");
	 }
	
	
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

	function send(stream) {

		webRtc_socket.send(JSON.stringify({
			type : 'answer',
			sdp : answer.toSdp()
		}));
	}
	

</script>
<script type="text/javascript"> 

</script>
<style>
video {
	background: #222;
	margin: 0 0 20px 0;
	width: 100%;
}

@media screen and (max-width: 650px) {
	h1 {
		font-size: 24px;
	}
}

@media screen and (max-width: 550px) {
	button:active {
		background-color: darkRed;
	}
	h1 {
		font-size: 22px;
	}
}

@media screen and (max-width: 450px) {
	h1 {
		font-size: 20px;
	}
}
</style>



<title>PAGE - MENU [NAME]</title>








<div class="container">
	<video id="video_view" autoplay="autoplay"></video>


</div>
