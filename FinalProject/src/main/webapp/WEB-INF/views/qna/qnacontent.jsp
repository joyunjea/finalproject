<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="/WEB-INF/views/defaultpageset.jsp" %>
<style>
	.article{
	padding: 20px 40px 0;
    border: 1px solid;
    border-radius: 6px;
	}
</style>
<title>1대1 문의내용</title>
</head>
<body>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>
	<h1 class="mx-5 banner">문의내용</h1>
	<div class="container article">
			
			<h3>제목: ${content.qna_title}</h3>	
			<h6>작성자: ${content.m_nm} 이메일: ${content.m_email}</h6>
			<h6>작성일: ${content.qna_regdate}</h6>
			<h4>문의내용: ${content.qna_content}</h4>
			
	</div>
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
</body>
</html>