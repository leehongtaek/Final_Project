$(function() {
	var video = document.querySelector('video');
	// USER MEDIA STAEAM PERMSSION ON OFF 
	navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.oGetUserMedia || navigator.msGetUserMedia;
	// Constraint !
	var constraints = {audio: false,video: true};
	
	function successCallback(stream) {
		window.stream = stream; // stream available to console
		if (window.URL) {    
			video.src = window.URL.createObjectURL(stream);
			localStream = stream; // localStream에 저장
		} else {
			video.src= stream;  		
		}
	}

	function errorCallback(error) { console.log('navigator.getUserMedia error: ', error);}
	navigator.getUserMedia(constraints, successCallback, errorCallback);
});


<script type="text/javascript" >

// var pc2;
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
    
   pc.createOffer( function(description){offertest = description;},
		   		   function(error){trace('Failed to create session description: ' + error.toString());},
		   		   offerOptions);    
   webRtc_socket.send(JSON.stringify(offertest.toJSON() ) );         
   pc.setLocalDescription( offertest,
		   				   function(){  trace('Set session description success.');},
		   				   function(){  trace('Set session description error.'); });
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