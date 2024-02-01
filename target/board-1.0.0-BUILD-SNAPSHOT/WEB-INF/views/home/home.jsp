<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>

<style type="text/css">
a {
	text-decoration: none;
	color: black;
}
a:hover {
	color: blue;
}
</style>
</head>
<body>
<h1>Hello world!</h1>

<form action="access" name="logFrm" method="post">
	<table border="1">
		<tr>
			<td colspan="2" align="center">로그인</td>
		</tr>
		<tr>
			<td><input type="text" name="m_id"></td>
			<td rowspan="2"><button>로그인</button>
		</tr>
		<tr>
			<td><input type="password" name="m_pw"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">com.ye.board</td>
		</tr>
		<tr>
			<td colspan="2" align="center"><a href="/board/home/join">회원가입</a>
		</tr>
	</table>
</form>
</body>
</html>
