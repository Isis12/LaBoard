<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	width: 100%;
}

table, td, th {
	border: 1px solid;
	border-collapse: collapse;
	padding: 5px;
}

input[type='text'] {
	width: 98%;
}

textarea {
	width: 98%;
	resize: none;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>	
<form id="boardData">
	<div>
		<h3>WRITE MODIFY .${board.b_num}</h3>
	</div>
	<table border="1">
		<tr>
			<td>제목</td>
			<td>
				<input type="hidden" name="b_num" id="num" value="${board.b_num}">
				<input type="text" name="b_title" id="sbject" value="${board.b_title}">
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea rows="20" name="b_contents" id="contents">${board.b_contents}</textarea></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><input type="text" name="b_id" id="writer" value="${board.b_id}"></td>
		</tr>
		<tr>
			<td>파일첨부</td>
			<td><input type="file" name="files" id="files" multiple>
				<input type="hidden" id="fileCheck" name="fileCheck" value="0"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="reset" id="reset" value="다시쓰기">
				<button type="button" id="btn_submit" class="btn_01">수정</button>
				<input type="button" onclick="location.href='./boardlist'" value="목록">
			</td>
		</tr>	
	</table>
</form>
</body>
<script>
$('#reset').on('click',function(){
	console.log("empty");
	$('#fileCheck').val(0);
});
$('#files').on('change', function(){
	console.dir(this);
	console.dir(this.value);
	if($(this).val()==''){
		console.log("empty");
		$('#fileCheck').val(0); //첨부 안됨
	}else{
		console.log("not empty");
		$('#fileCheck').val(1); //첨부됨
	}
	console.log($('#fileCheck').val()); //1
});


$("#btn_submit").click(function(){
	var obj = $("#boardData").serialize();
	$.ajax({
		url: '/board/rest/board/writeModify',
		type: 'post',
		data: obj,
		dataType: 'json',
		suucess: function(data){
			console.log(data);
			if(data == 1){
				alert("게시물이 등록되었습니다.");
				location.href="./writeFrm";
			}else{
				alert("게시물 등록이 실패하였습니다.");
			}
		},
		error: function(err){
			console.log(err);
		}
	})
})
</script>
</html>



















