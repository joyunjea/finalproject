<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${viewRequest eq null}">
<script>
alert('해당 게시물이 존재하지 않습니다.');
history.go(-1);
</script>
</c:if>
<c:if test="${viewRequest ne null}">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
#attachedfiles img{
	max-height:64px;
	max-width: 100px;
	width:auto;
	order:1;
}
#imageWrapper{
	position: absolute;
	display: none;
	justify-content: center;
	align-items: center;
	top: 0%;
	width: 100%;
	height: 100%;
	z-index: 100;
}
#bigImage{
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
}
</style>
</head>
<body>

<%@ include file="/WEB-INF/views/defaultpageset.jsp" %>
<%@ include file="/WEB-INF/views/post/pageset/viewpageset.jsp"%>

<!-- Header -->
<%@ include file="/WEB-INF/views/layout/header.jsp" %>

<!-- Container -->
<div class="container" id="PostViewArea">

<sec:authorize access="isAuthenticated()">
	<c:set var="idx">
	   <sec:authentication property="principal.m_idx" />
	</c:set>
	<c:set var="type">
	   <sec:authentication property="principal.m_type" />
	</c:set>
</sec:authorize>

<input type="hidden" id="postidx" value="${viewRequest.post_idx}">
<input type="hidden" id="wanted" value="${viewRequest.wanted}">
<input type="hidden" id="midx" value="${viewRequest.m_idx}">
<input type="hidden" id="myidx" value="${idx}">

<!-- 제목 -->
<div class="input-group mb-3">
  <span class="input-group-text">${viewRequest.cat_nm}</span>
  <span class="form-control">${viewRequest.post_nm}</span>
  
  <c:if test="${viewRequest.m_idx eq idx}">
  	<span class="form-control">문의 ${viewRequest.match_count} 건</span>
  </c:if>
  
</div>

<!-- 프로필 영역 -->
<div class="row">
<c:if test="${viewRequest.wanted eq 'mentee'}">
	<div class="d-flex flex-column my-3 col text-center border rounded">
		<div class="descript my-1 ms-0 me-1 text-start">프로필</div>
		<c:if test="${writerProfile ne null}">
			<table>
				<tr>
					<td rowspan="2"><img
						src="${pageContext.request.contextPath}/resources/files/member/${writerProfile.m_photo}"
						height="50"></td>
					<td>${writerProfile.m_nm}/ ${writerProfile.loc_nm}</td>
				</tr>
				<tr>
					<td colspan="2">${writerProfile.line}</td>
				</tr>
			</table>
		</c:if>

		<c:if test="${writerProfile eq null}">
			글쓴이의 프로필 정보가 없습니다. 프로필 등록이 필요합니다.
		</c:if>
	</div>
</c:if>
</div>

<!-- 본문 -->
<div>
${viewRequest.post_content}
</div>

<!-- 첨부파일 -->
<div id="attachedfiles">
	<c:if test="${viewRequest.fileList ne null}">
	<ul class="list-group">
	<c:forEach var="postFile" items="${viewRequest.fileList}">
		<li class="list-group-item d-flex justify-content-between align-items-center"
			data-file_nm="${postFile.file_nm}" data-exet="${postFile.file_exet}">
			
		<c:if test="${postFile.file_exet ne 'pdf'}">
		
		<img src="${pageContext.request.contextPath}/post/display?fileName=${postFile.file_nm}.${postFile.file_exet}">
		<span>${postFile.file_originnm}.${postFile.file_exet} (${postFile.file_size} kb)</span>
		
		</c:if>
		
		<c:if test="${postFile.file_exet eq 'pdf'}">
		<span><i class="bi bi-filetype-pdf fs-4"></i>
		${postFile.file_originnm}.${postFile.file_exet} (${postFile.file_size} kb)</span>
		</c:if>
		
		</li>
	</c:forEach>
	</ul>
	</c:if>
</div>

<!-- 첨부파일 이미지 크게 보기 -->
<div id="imageWrapper">
	<div id="bigImage"></div>
</div>

<!-- 매칭정보/문의하기 -->
<div class="row">
<c:if test="${viewRequest.m_idx ne idx && viewRequest.wanted eq type}">
<button type="button" id="matchBtn">문의하기</button>
</c:if>

<c:if test="${viewRequest.m_idx eq idx}">
	매칭정보 : match테이블에서 가져온 정보 출력 <br>
	${viewRequest.matchInfos}
	
	<div class="btn-group" role="group" class="col text-center">
		<button type="button" class="btn btn-outline-dark" onclick="location.href='${pageContext.request.contextPath}/post/edit?idx=${viewRequest.post_idx}'">수정</button>
		<button type="button" class="btn btn-outline-dark" onclick="javascript:deletePost(${viewRequest.post_idx})">삭제</button>
	</div>

</c:if>
</div>

</div>


<!-- Footer -->
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>

</body>
</html>

</c:if>