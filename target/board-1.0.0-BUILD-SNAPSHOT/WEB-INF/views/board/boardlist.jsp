<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
h3 {
	margin-top: 62px;
	margin-left: 22px;
	font-size: 31px;
}
#logoutFrm{
	margin-top: 9px;
	margin-left: 20px;
}
table {
	width: 38%;
}
#one_table {
	margin-left: 18px;
}
.btn_left {
	postion: relative;
	float: right;
	text-align: left;
	margin-right: 62%;
	margin-top: 38px;
}
#searchBar {
	float: right;
	margin: 5px 8px;
	margin-right: 62%;	
	
}
.page_nation {
	display: inline-block;
	margin-left: 18%;
	margin-top: 23px;
}
.choice, #s_btn {
	height: 25px;
}
#board_keyword {
	height: 19px;
}

#s_btn {
	padding-bottom: 20px;
}

.a_hover {
	text-decoration: none;
	color: black;
	font-weight: 500;
	
}
.a_hover:hover {
	color: blue;
}

</style>
</head>
<body>
	<h3>BOARD LIST [게시판 목록]</h3>
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
	<c:if test="${!empty id}">
		<div align="left">
			<!-- <a href="logout"> 로그아웃</a> -->
			<form id="logoutFrm" action="logout" method="post">
				<button type="button" onclick="location.href='javascript:logout()'">로그아웃</button>
			</form>
		</div>
	</c:if>
	<!-- 검색바 -->
	<div id="searchBar">
		<select id="search_choice" class="choice">
			<option value="b_title">제목
			<option value="b_id">작성자
		</select>
		<input type="text" id="board_keyword" name="keyword" placeholder="">
		<button type="button" id="s_btn">검색</button>
	</div>
	<table>
		<tr bgcolor="skyblue" height="30">
			<th width="100">번호</th>
			<th width="100">제목</th>
			<th width="100">작성자</th>
			<th width="100">작성일</th>
			<th width="100">조회수</th>
		</tr>
		<tbody class="tbody">
			<c:forEach var="board" items="${bList}">
				<tr height="25">
					<td align="center">${board.b_num}</td>
					<td align="center"><a class="a_hover" href="./boardContents?B_NUM=${board.b_num}">${board.b_title}</a></td>
					<td align="center">${board.b_id}</td>
					<td align="center">${board.b_date}</td>
					<td align="center">${board.b_views}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class=btn_left>
		<button type="button" onclick="location.href='./writeFrm'" class="write_btn">글쓰기</button>
	</div><br>
	<!-- 페이징 -->
	<div class="page_nation"> ${paging}</div>
	
</body>
<script type="text/javascript">
$("#s_btn").click(function(){
	 var pageNum=1;
		var choice= $("#search_choice").val();
		var keyword = $("#board_keyword").val();
	
	console.log("KEYWORD: " + keyword);
	console.log("CHOICE: " + choice);
	
	if( keyword == "" ) {
		alert("검색어를 입력해주세요.");
	} else {
		$.ajax({
			url: '/board/rest/board/boardSearch',
			type: 'post',
			data: "choice="+choice+"&keyword="+keyword,
			datType: 'json',
			success: function(data){
				$(".tbody").html("");
				console.log(data);
				 var str="";
				 if(data.bList!=""){
					 for(var i=0; i<data.bList.length; i++){
						 var type= data.bList[i].b_type;
						 str+="<tr height='25'><td align='center'>"+data.bList[i].b_num+"</td>";
						str+="<td align='center'><a href='./boardContents?B_NUM="+data.bList[i].b_num+"' class='a_hover'>"+data.bList[i].b_title+"</a></td>";
						str+="<td align='center'>"+data.bList[i].b_id+"</td>";
						str+="<td align='center'>"+data.bList[i].b_date+"</td>";
						str+="<td align='center'>"+data.bList[i].b_views+"</td></tr>";
						}
					 pageNum=data.bList.length;
					 console.log(pageNum);
						$(".tbody").html(str);
						var totalData = pageNum;
						var pageCount=0;
					    var dataPerPage = 10;
					    if(pageNum<=10){
					       pageCount = 1;
					    }else{
					       pageCount = 1;
					    }
					        paging(totalData, dataPerPage, pageCount, 1);
					    function paging(totalData, dataPerPage, pageCount, currentPage){
					        console.log("currentPage : " + currentPage);
					        var totalPage = Math.ceil(totalData/dataPerPage);
					        var pageGroup = Math.ceil(currentPage/pageCount);
					        console.log("pageGroup : " + pageGroup);
					        var last = pageGroup * pageCount;
					        if(last > totalPage)
					            last = totalPage;
					        var first = last - (pageCount-1);
					        var next = last+1;
					        var prev = first-1;
					        console.log("last : " + last);
					        console.log("first : " + first);
					        console.log("next : " + next);
					        console.log("prev : " + prev);
					        var $pingingView = $(".page_nation");
					        var html = "";
					        if(prev >= 1)
					            html += "<a class='arrow perev' href=# id='prev'></a> ";
					        for(var i=first; i <= last; i++){
					            html += "<a href='#' id=" + i + "> " + i + " </a> ";
					        }
					        if(last <= totalPage)
					            html += "<a class='arrow next01' href=# id='next'></a>";
					        $(".page_nation").html(html);
							$(".page_nation a").click(function(){
					            var $item = $(this);
					            var $id = $item.attr("id");
					            var selectedPage = $item.text();
					            if($id == "next")    selectedPage = next;
					            if($id == "prev")    selectedPage = prev;
					            paging(totalData, dataPerPage, pageCount, selectedPage);
					        });
					}
					
				} else {
					alert("데이터가 없습니다.");
					console.log(data);
				}
			},
			error: function(err){
				console.log(err);
			}
		});
	}
});
</script>
</html>








