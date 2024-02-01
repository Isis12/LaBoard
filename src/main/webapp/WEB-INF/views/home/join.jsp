<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="memJoin" name="joinfrm" method="post" onsubmit="return check()">
	<table border="1">
		<tr>
			<td class="subject" colspan="3" align="center">회원가입</td>
		</tr>
		<tr>
			<td width="100">아이디</td>
			<td>
				<input type="text" id="id" name="m_id">
				<input type="button" id="checkId" value="중복검사">
				<div id="result"></div>
			</td>
		</tr>
		<tr>
			<td width="100">패스워드</td>
			<td><input type="password" id="pw" name="m_pw">
		</tr>
		<tr>
			<td width="100">이름</td>
			<td><input type="text" id="name" name="m_name">
		</tr>
		<tr>
			<td width="100">생일</td>
			<td><input type="text" id="birth" name="m_birth"></td>
		</tr>
		<tr>
			<td width="100">주소</td>
			<td><input type="text" id="addr" name="m_addr"></td>
		</tr>
		<tr>
			<td width="100">핸드폰번호</td>
			<td><input type="text" id="phone" name="m_phone"></td>
		</tr>
		<tr>
			<td class="subject" colspan="3" align="center">
				<input type="submit" value="회원가입">
				<button type="button" onClick="location.href='/board/'">홈으로</button>
			</td>
		</tr>
	</table>
</form>
<script>
function check(){
	//유효성 검사
	return true;
}
</script>
</body>
</html>