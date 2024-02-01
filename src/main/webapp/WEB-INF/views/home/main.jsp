<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="resources/js/jquery.serializeObject.js"></script>	
<script>
function logout(){
	$('#logoutFrm').submit();
}

</script>
<style>
html, body {
	height: 100%;
	margin: 0
}

</style>
</head>
<body>
	<h3>게시판 리스트</h3>
	<c:if test="${!empty id}">
		<div align="left">
			<!-- <a href="logout"> 로그아웃</a> -->
			<form id="logoutFrm" action="logout" method="post">
				<a href="javascript:logout()">로그아웃</a>
			</form>
		</div>
	</c:if>
	<table id="one_table">
		<tr height="30">
			<td width="80" bgcolor="pink" align="center">ID</td>
			<td>${mb.m_id}</td>
		</tr>
		<tr height="30">
			<td width="80" bgcolor="pink" align="center">NAME</td>
			<td>${mb.m_name}</td>
		</tr>
		<tr height="30">
			<td width="80" bgcolor="pink" align="center">GNAME</td>
			<td>${mb.g_name}</td>
		</tr>
		<tr height="30">
			<td width="80" bgcolor="pink" align="center">POINT</td>
			<td>${mb.m_point}</td>
		</tr>
	</table>
	<br>
	<table>
		<tr bgcolor="skyblue" height="30">
			<th width="100">번호</th>
			<th width="100">제목</th>
			<th width="100">작성자</th>
			<th width="100">작성일</th>
			<th width="100">조회수</th>
		</tr>
		<c:forEach var="board" items="${bList}">
			<tr height="25">
				<td align="center">${board.b_num}</td>
				<!-- href="#" 페이지 맨위로 이동뒤 이벤트 발생
				     href="#;" 페이지 현재위치에서 이벤트 발생 -->
				<td align="center"><a href="#"
					onclick="articleView(${board.b_num})"> ${board.b_title}</a></td>
				<td align="center">${board.b_id}</td>
				<td align="center">${board.b_date}</td>
				<td align="center">${board.b_views}</td>
			</tr>
		</c:forEach>
	</table>
	<!-- 글쓰기 -->
	<form action="writefrm">
		<button>글쓰기</button>
	</form>
	
	<!-- 페이징 -->
	<div align="center"> ${paging}</div>
	
	<!-- 모달(Modal) 박스 -->
	<div id="articleView_layer">
		<div id="bg_layer"></div>
		<div id="contents_layer"></div>
	</div>
</body>

</html>








