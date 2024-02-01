<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
table {
	border: 0;
	border-spacing: 0;
	border-collapse: collapse;
}
#buttom_btn{
	margin: 5px 50px;
}
</style>
</head>
<body>
<h3>BOARD CONTENTS & REPLY CONTENTS</h3>
<table>
	<tr height="50">
		<td width="100" align="center">NUM</td>
		<td colspan="5"><span id="num">${board.b_num}</span></td>
	</tr>
	
	<tr height="50">
		<td width="100" align="center">DATE</td>
		<td>${board.b_date}</td>
		<td width="100" align="center">VIEW</td>
		<td>${board.b_views}</td>
	</tr>
	
	<tr height="50">
		<td align="center">WRITER</td>
		<td width="150">${board.b_id}</td>
	</tr>
	
	<tr height="50">
		<td align="center">TITLE</td>	
		<td colspan="5">${board.b_title}</td>
	</tr>
	
	<tr height="50">
		<td align="center">CONTENTS</td>
		<td colspan="5">${board.b_contents}</td>
	</tr>
	
	<tr>
		<th>첨부파일</th>
		<td colspan="5">
			<c:set var="file" value="${board.bfList}"/>
			<c:if test="${empty file}">첨부된 파일이 없습니다.</c:if>
			<c:if test="${!empty file}">
				<c:forEach var="file" items="${board.bfList}">
					<img src="upload/${file.bf_sysname}" width="50" />
					<a href="./download?sysFileName=${file.bf_sysname}&oriFileName=${file.bf_origname}">${file.bf_origname}</a>
				</c:forEach>
			</c:if>
		</td>
	</tr>
</table><br>

<div id="buttom_btn">
	<c:choose>
		<c:when test="${id == board.b_id}">
			<button type="button" id="modify" onclick="location.href='./boardModify?B_NUM=${board.b_num}'">수정</button>&nbsp;
			<button type="button" id="delete">삭제</button>
		</c:when>
		<c:when test="${id eq 'admin'}">
			<button type="button" id="modify" onclick="location.href='./boardModify?B_NUM=${board.b_num}'">수정</button>&nbsp;
			<button type="button" id="delete">삭제</button>
		</c:when>
	</c:choose>
	<button type="button" Onclick="location.href='./boardlist'">목록</button>&nbsp;
</div>

</body>
<script type="text/javascript">
$("#delete").click(function() {
	var num = Number($("#num").html());
	
	$.ajax({
		type: 'post',
		url: '/board/rest/board/deleteBoard',
		data: {num:num},
		dataType: 'json',
		success: function(data){
			if(data==1) {
				alert("해당 게시물 삭제되었습니다.");
				location.href="./boardlist";
			}else {
				alert("해당게시물이 삭제되지 않았습니다. 관리자에게 문의해주시기 바랍니다.");
			}
		},
		error: function(err){
			console.log(err);
		}
	});
});




</script>
</html>