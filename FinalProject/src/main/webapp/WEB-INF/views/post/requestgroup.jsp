<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�������� �׷����� �������� ��</title>
</head>
<body>




<!-- ���� ���� �׷����� ������ -->


<!-- �ӽ� �׽�Ʈ  -->
<c:forEach items="${requestGroup}" var="rgroup">
<tr>
<br>
--�׷츮��Ʈ
<br>
<td>�Խñ� ������ȣ : ${rgroup.post_idx }</td><br>
<td>�Խñ� Ÿ��Ʋ : ${rgroup.post_nm }</td><br>
<td>�Խñ� �������� : ${rgroup.post_regdate }</td><br>
<td>�Խñ� ��û��� : ${rgroup.wanted }</td><br>
<td>�Խñ� ī�װ� : ${rgroup.cat_nm }</td><br>
</tr>
<br>
--�������Ʈ
<br>
<td><c:forEach items="${rgroup.list}" var="member">
						<tr><br>
							<td>��Ī ������ȣ : ${member.match_idx}</td><br>
							<td>�Խñ� ������ȣ : ${member.post_idx}</td><br>
							<td>ȸ�� ������ȣ : ${member.m_idx}</td><br>
							<td>ȸ�� �̸� : ${member.m_nm}</td><br>
							<td>ȸ�� ���� : ${member.m_photo}</td><br>
							<td>��Ī ���� : ${member.matched_yn}</td><br>
						</tr>
					</c:forEach>

	</c:forEach><br><br>
</body>
</html>