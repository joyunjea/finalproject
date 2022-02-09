<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ä��â</title>
<style>
	.text_right {
		text-align: right;
	}
	
	.text_left {
		text-align: left;
	}
	.chattingBox {
		padding : 15px;
		border : 1px solid #AAA;
		margin: 10px 0;
	}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

</head>
<body>
<%-- ${result eq 1?'��Ī���̺�����Ϸ�' : result eq 0? '��Ī���̺��������':'��������'0} --%><!-- ���� Ȯ���ϱ� -->
<div>
<h1>���α��� ����</h1>
<sec:authorize access="isAuthenticated()">
<sec:authentication property="principal.m_idx"/>
<sec:authentication property="principal.name"/>
<sec:authentication property="principal.photo"/>
<sec:authentication property="principal.m_type"/>
	<c:set var="myidx">
		<sec:authentication property="principal.m_idx"/>
	</c:set>
	<c:set var="myname">
		<sec:authentication property="principal.name"/>
	</c:set>
	<c:set var="myphoto">
		<sec:authentication property="principal.photo"/>
	</c:set>
	<c:set var="mytype">
		<sec:authentication property="principal.m_type"/>
	</c:set>
</sec:authorize>
${myidx}${myname}${myphoto}${mytype}


<c:if test="${match.mentor_idx == myidx}">
	<c:set var="reciever" value="${match.mentee_idx}"/>	
</c:if>
<c:if test="${match.mentee_idx == myidx}">
	<c:set var="reciever" value="${match.mentor_idx}"/>	
</c:if>
</div>

	<h1>Chatting Page (ä�ù��ȣ: ${match.match_idx})</h1>
	<br>����Ʈ ��ȣ: ${match.post_idx}
	<br>���� �泪������: ${match.mentor_outyn}
	<br>��Ƽ �泪������: ${match.mentee_outyn}
	<br>��Ī ����: ${match.match_yn}
	<br>��Ī ��¥: ${match.match_date}
	<br>��Ƽ idx: ${match.mentee_idx}
	<br>���� idx: ${match.mentor_idx}
	<br>���� �α����� ���� : ${myidx}, ${myname}, ${myphoto}, ${mytype}
	<br>������ ��� : ${myidx} �޴»�� : ${reciever}
	<br>
	
		<div>
			<div>
				<input type="text" id="message" />
				<input type="button" id="sendBtn" value="����" />
			</div>
			<br>
			<div class="well" id="chatdata">
				<!-- User Session Info Hidden -->
				<input type="hidden" value='${myidx}' id="sessionuseridx">
			</div>
		</div>
	
</body>

<c:if test=""></c:if>

<script>
	//websocket�� ������ URL�� ����
	var sock = new SockJS("<c:url value="/echo"/>");
	//websocket �������� �޽����� ������ �ڵ����� ����ȴ�.
	sock.onmessage = onMessage;
	//websocket �� ������ ���� ������ �����ϴ� �޼ҵ�
	sock.onclose = onClose;
	
	
	$(document).ready(function(){
		
		
		
		
		
		$("#sendBtn").on('click',function(){
			console.log('send message...');
			sendMessage();
			
			$('#message').val('');
			
			$('#message').focus();
			
			
			
		});
		
	});
	
	function sendMessage() {
		//websocket���� �޽����� ������
		
		var msg = {
			myidx : '${myidx}',
		    myname : '${myname}',
			sender : '${myidx}',
			reciever : '${reciever}',
			matchIdx : '${match.match_idx}',
			postidx : '${match.post_idx}',
			midx : '${match.match_idx}',
			message : $("#message").val()
		};
		console.log(msg);
		sock.send(JSON.stringify(msg));
	}

	//evt �Ķ���ʹ� websocket�� ������ �����ʹ�.
	function onMessage(evt) { //���� �ȿ� function��ü�� ����.
		var data = evt.data; // ���� ���� ������
		
		//alert(data);
		
		msgData = JSON.parse(data); 
		
		var sessionid = null;
		var message = null;
		
		//current session id//
		var currentuser_session = $('#sessionuserid').val();
		console.log('current session id: ' + currentuser_session);
		
		var target = $('#chattingBox-1');
		
		if(target.length==0){
			$('<div id=\"chattingBox-1\" class=\"chattingBox\"></div>').html('<h3>${user.name} : �Խù� �ۼ���-'+msgData.matchIdx+'</h3>').appendTo('body');
			$('#chattingBox-1').append('<hr>')
		}

			

		// ���� ������ ���� �޼����� �����Ͽ� ���
		if (msgData.user == currentuser_session) {
			var printHTML = "<div class='well text_right'>";
			printHTML += "<div class='alert alert-info'>";
			printHTML += "<strong>[" + msgData.sender + "] -> " + msgData.message
					+ "</strong>";
			printHTML += "</div>";
			printHTML += "</div>";

			$('#chattingBox-1').append(printHTML);
		} else {
			var printHTML = "<div class='well text_left'>";
			printHTML += "<div class='alert alert-warning'>";
			printHTML += "<strong>[" + msgData.reciever + "] -> " + msgData.message
					+ "</strong>";
			printHTML += "</div>";
			printHTML += "</div>";

			$('#chattingBox-1').append(printHTML);
		}

		console.log('chatting data: ' + data);

		/* sock.close(); */
	}

	function onClose(evt) {
		$("#data").append("���� ����");
	}
	
	
</script>
</html>