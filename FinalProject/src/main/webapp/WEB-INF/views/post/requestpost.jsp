<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ���� ����Ʈ</title>
</head>
<body>

<!-- �������� �׷쿡�� ������ �Խñ� -->

<tr>
<br>
--�׷츮��Ʈ
<br>
<td>�Խñ� ������ȣ : ${requestPost.post_idx}</td><br>
<td>�Խñ� Ÿ��Ʋ : ${requestPost.post_nm}</td><br>
<td>�Խñ� �������� : ${requestPost.post_regdate}</td><br>
<td>�Խñ� ��û��� : ${requestPost.wanted}</td><br>
<td>�Խñ� ī�װ� : ${requestPost.cat_nm}</td><br>
</tr>
<br>
--�������Ʈ
<br>
<td><c:forEach items="${requestPost.list}" var="member">
						<tr><br>
							<td>��Ī ������ȣ : ${member.match_idx}</td><br>
							<td>�Խñ� ������ȣ : ${member.post_idx}</td><br>
							<td>ȸ�� ������ȣ : ${member.m_idx}</td><br>
							<td>ȸ�� �̸� : ${member.m_nm}</td><br>
							<td>ȸ�� ���� : ${member.m_photo}</td><br>
							<td>��Ī ���� : ${member.matched_yn}</td><br>
							<td>��Ī ���� : ${member.line}</td><br>
							<td><a href="${pageContext.request.contextPath}/post/chat?midx=${member.m_idx}&postidx=${requestPost.post_idx}">�����ϱ�</a>
						</tr>
					</c:forEach>

	<br><br>



</body>
</html>