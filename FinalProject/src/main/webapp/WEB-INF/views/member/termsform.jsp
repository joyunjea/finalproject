<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="/WEB-INF/views/defaultpageset.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/termsform.css">
<script>
$(document).ready(function() {

	$('#cancel').on('click', function() {
		history.go(-1);
	})

	$('#gotoregister').on('click', function() {
		var allcheck = true;
		$('.required').each(function(index, item) {

			if ($(item).prop('checked') == false) {
				allcheck = false;
				return false;
			}
		})
		console.log(allcheck);
		if (!allcheck) {

			$('.warning').attr('style', "display: block");
		} else {
			$('#termsform').submit();
		}
		return allcheck;
	})

	/*
	 * $('#allselect').change(function() { if (this.checked) {
	 * $(this).siblings().prop('checked', true); } else {
	 * $(this).siblings().prop('checked', false); } })
	 */

	$('#allselect').change(function() {
		if (this.checked) {
			$(this).siblings().prop('checked', true);
			$('label').children().attr('src','${pageContext.request.contextPath}/resources/files/server/icons/check_on.svg');

		} else {
			$(this).siblings().prop('checked', false);
			$('label').children().attr('src','${pageContext.request.contextPath}/resources/files/server/icons/check_off.svg');
		}

	})

	$('input[type=checkbox]').change(function() {
		$('.warning').attr('style', 'display: none');
	})

	$('.required, .canchoice').change(function() {
		console.log($(this).prop('checked'));
		if ($(this).prop('checked') == false) {
			$('#allselect').prop('checked', false);
			$('label[for=allselect]').children().attr('src','${pageContext.request.contextPath}/resources/files/server/icons/check_off.svg');
			$('label[for='+$(this).attr('id')+']').children().attr('src','${pageContext.request.contextPath}/resources/files/server/icons/check_off.svg');
			
		}else{
			$('label[for='+$(this).attr('id')+']').children().attr('src','${pageContext.request.contextPath}/resources/files/server/icons/check_on.svg');
		}
	})

})
</script>
<title>이용약관</title>
</head>
<body>

<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<div id="termsGlobalWrap"class="container">
	
	<div class="banner">이용약관</div>
	
	<div id="regWrap">
		<%-- <div id="logo">
			<a href="${pageContext.request.contextPath}/mainOn.do"> <img
				src="${pageContext.request.contextPath}/Resource/image/general/logo.svg">
			</a>
		</div> --%>

		<form action="${pageContext.request.contextPath}/register"
			method="get" id="termsform">

			<div class="termswrap">
				<label for="allselect"><img
					src="${pageContext.request.contextPath}/resources/files/server/icons/check_off.svg"></label>
				<input type="checkbox" id="allselect"> <span>알려드림
					이용약관, 개인정보 수집 및 이용, 광고성 수신 선택 동의 에 모두 동의합니다.</span><br> <br> <label
					for="termsuse"><img
					src="${pageContext.request.contextPath}/resources/files/server/icons/check_off.svg"></label>
				<input type="checkbox" class="required" id="termsuse"><span>이용약관(필수)</span>

				<div id="termsofuse" class="terms">



					<span class="bold">여러분을 환영합니다.</span><br> <br>
					<p>알려드림 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한
						알려드림 서비스의 이용과 관련하여 알려드림 서비스를 제공하는 알려드림 주식회사(이하
						‘알려드림’)와 이를 이용하는 알려드림 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의
						알려드림 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.</p>
					<br>
					<p>알려드림 서비스를 이용하시거나 알려드림 서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을
						확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다.</p>
					<p>다양한 알려드림 서비스를 즐겨보세요. 알려드림은 www.aljdream.com 을 비롯한 알려드림 도메인의
						웹사이트 및 응용프로그램(어플리케이션, 앱)을 통해 정보 검색, 다른 이용자와의 커뮤니케이션, 콘텐츠 제공, 상품 쇼핑
						등 여러분의 생활에 편리함을 더할 수 있는 다양한 서비스를 제공하고 있습니다. 여러분은 PC, 휴대폰 등 인터넷 이용이
						가능한 각종 단말기를 통해 각양각색의 알려드림 서비스를 자유롭게 이용하실 수 있으며, 개별 서비스들의 구체적인 내용은
						각 서비스 상의 안내, 공지사항, 알려드림 웹고객센터(이하 ‘고객센터’) 도움말 등에서 쉽게 확인하실 수 있습니다.</p>
					<br>

					<p>회원으로 가입하시면 알려드림 서비스를 보다 편리하게 이용할 수 있습니다. 여러분은 본 약관을 읽고 동의하신
						후 회원 가입을 신청하실 수 있으며, 알려드림는 이에 대한 승낙을 통해 회원 가입 절차를 완료하고 여러분께 알려드림
						서비스 이용 계정(이하 ‘계정’)을 부여합니다. 계정이란 회원이 알려드림 서비스에 로그인한 이후 이용하는 각종 서비스
						이용 이력을 회원 별로 관리하기 위해 설정한 회원 식별 단위를 말합니다. 회원은 자신의 계정을 통해 좀더 다양한
						알려드림 서비스를 보다 편리하게 이용할 수 있습니다. 이와 관련한 상세한 내용은 계정 운영정책 및 고객센터 내 알려드림
						회원가입 방법 등에서 확인해 주세요.</p>
					<br>

					<p>여러분이 제공한 콘텐츠를 소중히 다룰 것입니다. 알려드림는 여러분이 게재한 게시물이 알려드림 서비스를 통해
						다른 이용자들에게 전달되어 우리 모두의 삶을 더욱 풍요롭게 해줄 것을 기대합니다. 게시물은 여러분이 타인 또는 자신이
						보게 할 목적으로 알려드림 서비스 상에 게재한 부호, 문자, 음성, 음향, 그림, 사진, 동영상, 링크 등으로 구성된
						각종 콘텐츠 자체 또는 파일을 말합니다.</p>
					<br>
					<p>여러분의 개인정보를 소중히 보호합니다. 알려드림은 서비스의 원활한 제공을 위하여 회원이 동의한 목적과 범위
						내에서만 개인정보를 수집∙이용하며, 개인정보 보호 관련 법령에 따라 안전하게 관리합니다. 알려드림가 이용자 및 회원에
						대해 관련 개인정보를 안전하게 처리하기 위하여 기울이는 노력이나 기타 상세한 사항은 개인정보 처리방침에서 확인하실 수
						있습니다.</p>
					<br>
					<p>알려드림은 여러분이 서비스를 이용하기 위해 일정 기간 동안 로그인 혹은 접속한 기록이 없는 경우, 전자메일,
						서비스 내 알림 또는 기타 적절한 전자적 수단을 통해 사전에 안내해 드린 후 여러분의 정보를 파기하거나 분리 보관할 수
						있으며, 만약 이로 인해 서비스 제공을 위해 필수적인 정보가 부족해질 경우 부득이 관련 서비스 이용계약을 해지할 수
						있습니다.</p>
					<br>
					<p>알려드림 서비스 이용계약이 해지되면, 관련 법령 및 개인정보처리방침에 따라 알려드림가 해당 회원의 정보를
						보유할 수 있는 경우를 제외하고, 해당 회원 계정에 부속된 게시물 일체를 포함한 회원의 모든 데이터는 소멸됨과 동시에
						복구할 수 없게 됩니다. 다만, 이 경우에도 다른 회원이 별도로 담아갔거나 스크랩한 게시물과 공용 게시판에 등록한 댓글
						등의 게시물은 삭제되지 않으므로 반드시 해지 신청 이전에 삭제하신 후 탈퇴하시기 바랍니다.</p>
					<br>
					<p>본 약관은 한국어를 정본으로 합니다. 본 약관 또는 알려드림 서비스와 관련된 여러분과 네이버와의 관계에는
						대한민국의 법령이 적용됩니다. 그리고 본 약관 또는 알려드림 서비스와 관련하여 여러분과 알려드림 사이에 분쟁이 발생할
						경우, 그 분쟁의 처리는 대한민국 '민사소송법'에서 정한 절차를 따릅니다.</p>
					<br>
					<p>
						공지 일자: 2022년 02월 01일<br> 적용 일자: 2022년 03월 03일<br> 알려드림 서비스와 관련하여
						궁금하신 사항이 있으시면 고객센터(대표번호: xxxx – xxxx/ 평일 09:00~18:00)로 문의 주시기
						바랍니다.
					</p>
					<br>


				</div>
				<label for="termspersonalinfo"><img
					src="${pageContext.request.contextPath}/resources/files/server/icons/check_off.svg"></label>
				<input type="checkbox" class="required" id="termspersonalinfo">
				<span>개인정보 수집 및 이용 동의(필수)</span>
				<div id="termsofpersonalinfo" class="terms">
					<p>개인정보보호법에 따라 알려드림에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및
						이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내 드리오니 자세히 읽은
						후 동의하여 주시기 바랍니다.</p>
					<br>
					<p>

						<span class="bold">1. 수집하는 개인정보</span><br> 이용자는 회원가입을 하지 않아도
						일부 알려드림 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 게시판 등과 같이 개인화 혹은 회원제 서비스를
						이용하기 위해 회원가입을 할 경우, 알려드림는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.
					</p>
					<br>
					<p>회원가입 시점에 알려드림가 이용자로부터 수집하는 개인정보는 아래와 같습니다. - 회원 가입 시에 ‘이메일,
						비밀번호, 를 필수항목으로 수집합니다. 그리고 선택항목으로 닉네임을 수집합니다.</p>
					<br>
					<p>서비스 이용 과정에서 이용자로부터 수집하는 개인정보는 아래와 같습니다. - 회원정보 또는 개별 서비스에서
						프로필 정보(프로필 사진)를 설정할 수 있습니다. 회원정보에 별명을 입력하지 않은 경우에는 마스킹 처리된 아이디가
						별명으로 자동 입력됩니다.</p>
					<br>
					<p>서비스 이용 과정에서 IP 주소, 쿠키, 서비스 이용 기록이 생성되어 수집될 수 있습니다.</p>
					<br>
					<p>
						<span class="bold"> 2. 수집한 개인정보의 이용</span><br> 알려드림 및 알려드림 관련
						제반 서비스(모바일 웹/앱 포함)의 회원관리, 서비스 개발・제공 및 향상, 안전한 인터넷 이용환경 구축 등 아래의
						목적으로만 개인정보를 이용합니다.
					</p>
					<br>
					<p>
						- 회원 가입 의사의 확인, 연령 확인 및 법정대리인 동의 진행, 이용자 및 법정대리인의 본인 확인, 이용자 식별,
						회원탈퇴 의사의 확인 등 회원관리를 위하여 개인정보를 이용합니다.<br> - 콘텐츠 등 기존 서비스 제공(광고
						포함)에 더하여, 인구통계학적 분석, 서비스 방문 및 이용기록의 분석, 개인정보 및 관심에 기반한 이용자간 관계의
						형성, 지인 및 관심사 등에 기반한 맞춤형 서비스 제공 등 신규 서비스 요소의 발굴 및 기존 서비스 개선 등을 위하여
						개인정보를 이용합니다.<br> - 법령 및 알려드림 이용약관을 위반하는 회원에 대한 이용 제한 조치, 부정
						이용 행위를 포함하여 서비스의 원활한 운영에 지장을 주는 행위에 대한 방지 및 제재, 계정도용 및 부정거래 방지, 약관
						개정 등의 고지사항 전달, 분쟁조정을 위한 기록 보존, 민원처리 등 이용자 보호 및 서비스 운영을 위하여 개인정보를
						이용합니다.<br> - 유료 서비스 제공에 따르는 본인인증, 구매 및 요금 결제, 상품 및 서비스의 배송을
						위하여 개인정보를 이용합니다.<br> - 이벤트 정보 및 참여기회 제공, 광고성 정보 제공 등 마케팅 및
						프로모션 목적으로 개인정보를 이용합니다.<br> - 서비스 이용기록과 접속 빈도 분석, 서비스 이용에 대한
						통계, 서비스 분석 및 통계에 따른 맞춤 서비스 제공 및 광고 게재 등에 개인정보를 이용합니다.<br> -
						보안, 프라이버시, 안전 측면에서 이용자가 안심하고 이용할 수 있는 서비스 이용환경 구축을 위해 개인정보를 이용합니다.<br>

					</p>
					<br>
					<p>

						<span class="bold"> 3. 개인정보의 보관기간</span><br> 회사는 원칙적으로 이용자의
						개인정보를 회원 탈퇴 시 지체없이 파기하고 있습니다. 단, 이용자에게 개인정보 보관기간에 대해 별도의 동의를 얻은
						경우, 또는 법령에서 일정 기간 정보보관 의무를 부과하는 경우에는 해당 기간 동안 개인정보를 안전하게 보관합니다.
					</p>
					<br>
					<p>이용자에게 개인정보 보관기간에 대해 회원가입 시 또는 서비스 가입 시 동의를 얻은 경우는 아래와 같습니다.
						- 부정 가입 및 이용 방지 부정 이용자의 가입인증 휴대전화번호 또는 DI (만14세 미만의 경우 법정대리인DI) :
						탈퇴일로부터 6개월 보관 탈퇴한 이용자의 휴대전화번호(복호화가 불가능한 일방향 암호화(해시처리)) : 탈퇴일로부터
						6개월 보관</p>
					<br>
					<p>- 통신비밀보호법 로그인 기록: 3개월</p>
					<br>
					<p>


						<span class="bold">4. 개인정보 수집 및 이용 동의를 거부할 권리</span><br> 이용자는
						개인정보의 수집 및 이용 동의를 거부할 권리가 있습니다. 회원가입 시 수집하는 최소한의 개인정보, 즉, 필수 항목에
						대한 수집 및 이용 동의를 거부하실 경우, 회원가입이 어려울 수 있습니다.
					</p>

				</div>

				<label for="termsevent"><img
					src="${pageContext.request.contextPath}/resources/files/server/icons/check_off.svg"></label>
				<input type="checkbox" name="adyn" class="canchoice"
					id="termsevent"> <span>광고성 수신 선택 동의(선택)</span>
				<div id="termsofevent" class="terms">
					<p>광고성 정보 수신에 동의하시면 알려드림의 여러 정보들을 실시간으로 받아보실 수 있습니다.</p>
				</div>
				<div id="userselect" class="d-flex justify-content-around">
					
					
					<input type="button" id="cancel" class="btn btn-grey" value="취소">


					<input type="button" id="gotoregister" class="btn btn-general" value="확인">
						
							

				</div>
				<div class="warning">
					<span class="warning">* 필수항목에 모두 동의하셔야 합니다.</span>
				</div>
				
			</div>
			
		</form>
		
	</div>
	
</div>

</body>
</html>