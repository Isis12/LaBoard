<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>
html{
	height: 100%;
}

body{
	margin: 0;
	/*height: 100%;*/
	background: #f5f6f7;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 14px;
}

a{
	text-decoration: none;
	color: #222;
}

#logo{
	width: 197px;
	height: 40px;
	cursor: pointer;
}

#header{
	padding-top: 155px;
	padding-bottom: 20px;
	text-align: center;
}

#wrapper{
	position: relative;
	height: 100%;
	cursor: pointer;
}

#content{
	position: absolute;
	left: 50%;
	transform: translate(-50%);
	width: 460px;
}

/*입력폼*/
h3{
	margin: 19px 0 8px;
	font-size: 14px;
	font-weight: 600;
}

.box{
	display: block;
	width: 100%;
	height: 51px;
	border: solid 1px #dadada;
	padding: 10px 14px 10px 14px;
	box-sizing: border-box;
	background:  #fff;
	position: relative;
}

.box_1{
	display: -webkit-inline-box;
	width: 50%;
}

.int{
	display: block;
	position: relative;
	width: 100%;
	height: 29px;
	border: none;
	background: #fff;
	font-size: 15px;
	cursor: pointer;
}

input{
	font-family: 'Noto Sans KR', sans-serif;
}
.box.int_id{
	padding-right: 40px;
}

.box.int_pass{
	padding-right: 40px;
}

.box.int_pass_check{
	padding-right: 40px;
}

.step_url{
	/*@naver.com*/
	position: absolute;
	top: 16px;
	right: 13px;
	font-size: 15px;
	color: #8e8e8e;
}

.pswdImg{
	width: 18px;
	height: 20px;
	display: inline-block;
	position: absolute;
	top: 50%;
	right: 16px;
	margin-top: -10px;
	cursor: pointer;
}

#bir_wrap{
	display: table;
	width: 100%;
}

#bir_yy{
	display: table-cell;
	width: 147px;
}

#bir_mm{
	display: table-cell;
	width: 147px;
	vertical-align: middle;
}

#bir_dd{
	display: table-cell;
	width: 147px;
}

#bir_mm, #bir_dd{
	padding-left:  10px;
}

select{
	width: 100%;
	height: 29px;
	font-size: 15px;
	background: #fff url(https://static.nid.naver.com/images/join/pc/sel_arr_2x.gif) 100% 50% no-repeat;
	background-size: 20px 8px;
	-webkit-appearance: none;
	display: inline-block;
	padding-left: 5px;
	text-align: start;
	border: none;
	cursor: pointer;
	font-family: 'Noto Sans KR', sans-serif;
}

.int_addr{
	margin-bottom: 4px;
}

input:focus, select:focus{
	outline: none;
}

/*에러메시지*/
.error_next_box{
	margin-top: 9px;
	font-size: 12px;
	color: red;
	display: none;
}

#alertTxt{
	position: absolute;
	top: 19px;
	right: 38px;
	font-size: red;
	display: none;
}

/*버튼*/
.btn_area{
	margin: 25px 0 30px;
}

#btnJoin{
	width: 100%;
	padding: 21px 0 17px;
	border: 0;
	cursor: pointer;
	color: #fff;
	background-color: #08a600;
	font-size: 20px;
	font-weight: 400;
	font-family: 'Noto Sans KR', sans-serif;
}

.btnJoin {
	width: 49%;
   	padding: 21px 30px 17px;
    border: 0;
    cursor: pointer;
    color: #fff;
    background-color: #08a600;
    font-size: 18px;
    font-weight: 400;
    font-family: 'Noto Sans KR', sans-serif;
}

.addr_btn{
	margin-left: 3px;
	height: 50px;
	width: 22%;
	border: 0;
	cursor: pointer;
	color: #fff;
	background-color: #08a600;
	font-size: 15px;
	font-weight: 400;
	font-family: 'Noto Sans KR', sans-serif;
}

/*footer*/
.join-footer{
	text-align: center;
	font-size: 12.5px;
	color: #bbb;
}

.join-footer div a:hover{
	text-decoration: underline;
	color: #2db400;
}
.join-footer div a:after {
	content: '|';
	font-size: 10px;
	margin-right: 5px;
	margin-left: 7px;
	padding-bottom: 5px;
	/*살짝 내려가 있기 때문에 위로 올려주기 위해 transform 사용하기*/
	display: inline-block;
	transform: translateY(-1px);
}

.join-footer div a:last-child:after {
	display: none;
}


</style>
</head>
<body>
<form action="join" name="joinFrm_new" method="post" onsubmit="return check()">
	
	<!-- header : 로고 -->
	<div id="header">
		<!-- <a href="#" target="_blank" title="회원가입 페이지 보러가기"><img src="" id="logo"></a>-->
	</div>
	
	<!-- wrapper -->
	<div id="wrapper">
		<div id="content">
			
			<!-- ID -->
			<div>
				<h3 class="join_title"><label for="userId">아이디</label></h3>
				<span class="box int_id">
					<input type="text" id="userId" name="m_id" class="int" maxlength="20">
					<span class="step_url">@naver.com</span>
				</span>
				<!-- <span class="error_next_box" id="dupleID"></span>-->
				<span id="dupleID"></span>
			</div>
			
			<!-- PW1 -->
			<div>
				<h3 class="join_title"><label for="pswd">비밀번호</label></h3>
				<span class="box int_pass">
					<input type="password" id="pswd" name="m_pw" class="int" maxlength="20">
					<span id="alertTxt">사용불가</span>
					<!--<img src="/LaBoard/img/m_icon_pass.png" id="pswd1_img1" class="pwdImg">-->
				</span>
				<span id="duplePW"></span>
				<!-- <span class="error_next_box"></span>-->			
			</div>
			
			<!-- PW2 -->
			<!-- <div>
				<h3 class="join_title"><label for="pswd2">비밀번호 재확인</label></h3>
				<span class="box int_pass_check">
					<input type="password" id="pswd2" class="int" maxlength="20">
					<img src="img/m_icon_check_disable.png" id="pswd2_img1" class="pswdImg">
				</span>
				<span class="error_next_box"></span>
			</div> -->
			
			<!-- NAME -->
			<div>
				<h3 class="join_title"><label for="userName">이름</label></h3>
				<span class="box int_name">
					<input type="text" id="userName" name="m_name" class="int" maxlength="20">
				</span>
				<span id="dupleName"></span>
				<!-- <span class="error_next_box"></span>-->
			</div>
			
			<!-- BIRTH -->
			<div>
				<h3 class="join_title"><label for="yy">생년월일</label></h3>
				<div id="bir_wrap">
					<!-- BIRTH_YY -->
					<div id="bir_yy">
						<span class="box">
							<input type="text" id="yy" class="int" maxlength="4" placeholder="년(4자)">
						</span>
					</div>
					
					<!-- BIRTH_MM -->
					<div id="bir_mm">
						<span class="box">
							<select id="mm" class="sel">
								<option>월</option>
								<option value="01">1월</option>
								<option value="02">2월</option>
								<option value="03">3월</option>
								<option value="04">4월</option>
								<option value="05">5월</option>
								<option value="06">6월</option>
								<option value="07">7월</option>
								<option value="08">8월</option>
								<option value="09">9월</option>
								<option value="10">10월</option>
								<option value="11">11월</option>
								<option value="12">12월</option>
							</select>
						</span>
					</div>
					
					<!-- BIRTH_DD -->
					<div id="bir_dd">
						<span class="box"><input type="text" id="dd" class="int" maxlength="2" placeholder="일"></span>
					</div>
				</div>
				<span class="error_next_box"></span>
			</div>
			
			<!-- ADDR -->
			<div>
            	<h3 class="join_title"><label for="addr1">주소</label></h3>

            	<div id="addr1">
                	<span class="box box_1 int_addr">
                    	<input type="text" class="int" name="m_addr_num" id="sample4_postcode" readonly placeholder="우편주소" onclick="sample4_execDaumPostcode()">
                  	</span>
                        
                	<!-- <span class="addr_area">
                    	<button type="button" class="addr_btn" onclick="sample4_execDaumPostcode()">주소찾기</button>
                   	</span>-->
           		</div>

               	<div id="addr1">
                	<span class="box int_addr">
                    	<input type="text" class="int" name="m_addr" readonly id="sample4_roadAddress" placeholder="주소">
                    	<span id="guide" style="color:#999;display:none"></span>
               		</span>
               	</div>

           		<div id="addr1">
               		<span class="box int_addr">
                   		<input type="text" class="int" name="m_addr_det" id="sample4_detailAddress" placeholder="상세주소">
                  	</span>
             	</div>
             </div>
			
			<!-- GENDER -->
			<!-- <div>
				<h3 class="join_title"><label for="gender">성별</label></h3>
				<span class="box gender_code">
					<select id="gender" class="sel">
						<option>성별</option>
						<option value="M">남자</option>
						<option value="F">여자</option>
					</select>
					<span class="error_next_box">필수 정보입니다.</span>
				</span>
			</div> -->
			
			<!-- EMAIL -->
			<!-- <div>
				<h3 class="join_title"><label for="email">본인확인 이메일<small>(선택)</small></label></h3>
				<span class="box int_email">
					<input type="text" id="email" class="int" maxlength="100" placeholder="선택입력">
				</span>
				<span class="error_next_box">이메일 주소를 다시 확인해주세요</span>
			</div> -->
			
			<!-- MOBILE -->
			<div>
				<h3 class="join_title"><label for="phoneNo">휴대전화</label></h3>
				<span class="box int_mobile">
					<input type="tel" id="mobile" class="int" name="m_phone" maxlength="16" placeholder="전화번호 입력">
				</span>
				<span id="duplePhone"></span>
				<!-- <span class="error_next_box"></span>-->
			</div>
			
			<!-- JOIN BTN -->
			<div class="btn_area">
				<button type="button" id="reg_submit" class="btnJoin"><span>가입하기</span></button>
				<button type="button" class="btnJoin" onClick="location.href='/board/'"><span>홈으로</span></button>
			</div>
			
			<!-- JOIN FOOTER -->
			<div class="join-footer">
				<div>
					<a href="#">이용약관</a>
					<a href="#">개인정보처리방침</a>
					<a href="#">책임의 한계와 법적고지</a>
					<a href="#">회원정보 고객센터</a>
				</div>
				<span><a href="#">LALABOARD Corp.</a></span>
			</div>
			
		</div> <!-- //content -->
	</div> <!-- //wrapper -->
</form>

</body>
<script>
//주소 API
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
            //document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            /*if(roadAddr !== ''){
                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("sample4_extraAddress").value = '';
            }*/

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }  	
    }).open();
}

//유효성검사
$(document).ready(function(){
	var idReg = /^[a-z0-9]{4,12}$/;
	var pwReg = /^[A-Za-z0-9]{6,18}$/;
	var NameReg = /^[가-힣]{2,5}$/;
	var phoneReg = /(^02.{0}^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/g;
  	
  	//아이디
	$("#userId").blur(function(){
		var userId = $("#userId").val();
		
		console.log(userId);
		
		$.ajax({
			type: 'get',
			url: '/board/home/dupleID',
			data: {m_id:userId},
			dataType: 'text',
			success: function(data){
				console.log("1=중복, 0 = 중복x"+ data);
				
				if(data == 1) {
					//1: 아이디중복
					$("#dupleID").text("사용중인 아이디입니다");
					$("#dupleID").css("color", "red");
					$("#reg_submit").attr("disabled", true);
				}else {
					if(idReg.test(userId)) {
						//0: 아이디길이 / 문자열 검사
						$("#dupleID").text("");
						$("#dupleID").attr("disabled", false);
					}else if(userId == ""){
						$("#dupleID").text("아이디를 입력해주세요.");
						$("#dupleID").css("color", "red");
						$("#reg_submit").attr("disabled", true);
					}else {
						$("#dupleID").text("아이디는 소문자와 숫자 4~12자리만 가능합니다.");
						$("#dupleID").css("color", "red");
						$("#reg_submit").attr("disabled", true);
					}
				}
			}, error: function(err){
				console.log("실패");
			}
		});
	});
  	
  	
  	//비밀번호
  	$("#pswd").blur(function(){
  		if(pwReg.test($("#pswd").val())){
  			$("#duplePW").text('');
  		}else {
  			$("#duplePW").text("6-12자 소문자, 숫자를 섞어서 입력하시오.");
  			$("#duplePW").css("color", "red");
  		}
  	});
  	
  	//이름
    $("#userName").blur(function(){
  		if(NameReg.test($("#userName").val())){
  			$("#dupleName").text('');
  		}else {
  			$("#dupleName").text("이름을 확인하세요.(한글 2~5자이내)");
  			$("#dupleName").css("color", "red");
  		}
  	});
	
  	
  	//전화번호
  	$("#mobile").blur(function(){
  		var mobile = $("#mobile").val();
  		
  		console.log(mobile);
  		
  		$.ajax({
  			type: 'get',
  			url: '/board/home/duplePhone',
  			data: {m_phone:mobile},
  			dataType: 'text',
  			success: function(data){
  				console.log("1 = 중복, 0 = 중복x" + data);
  				
  				if(data == 1) {
					//1: 핸드폰번호중복
					$("#duplePhone").text("이미 사용중인 핸드폰번호입니다.");
					$("#duplePhone").css("color", "red");
					$("#reg_submit").attr("disabled", true);
				}else {
					if(phoneReg.test(mobile)) {
						//0: 핸드폰번호 / 문자열 검사
						$("#duplePhone").text("");
						$("#duplePhone").attr("disabled", false);
					}else if(mobile == ""){
						$("#duplePhone").text("핸드폰번호를 입력해주세요.");
						$("#duplePhone").css("color", "red");
						$("#reg_submit").attr("disabled", true);
					}else {
						$("#duplePhone").text("핸드폰번호 형식이 맞지 않습니다.");
						$("#duplePhone").css("color", "red");
						$("#reg_submit").attr("disabled", true);
					}
				}
  			}, error: function(err){
  				console.log("실패");
  			}
  		});
  	})
  		
	

})



// 공백처리
$("#reg_submit").click(function(){
	var id = document.getElementById("userId");
	var pw = document.getElementById("pswd");
	var name = document.getElementById("userName");
	var yy = document.getElementById("yy");
	var mm = document.getElementById("mm");
	var dd = document.getElementById("dd");
	var addr1 = document.getElementById("sample4_postcode");
	var addr2 = document.getElementById("sample4_roadAddress");
	var addr3 = document.getElementById("sample4_detailAddress");
	var phone = document.getElementById("mobile");

	if( id.value == "" || id.value == null ){
		alert("아이디를 입력해주세요.");
		id.focus();
		return false;
	}else if( pw.value == "" || pw.value == null ){
		alert("비밀번호를 입력해주세요");
		pw.focus();
		return false;
	}else if( name.value == "" || name.value == null ){
		alert("이름을 입력해주세요");
		name.focus();
		return false;
	}else if( yy.value == "" || yy.value == null ){
		alert("생년월일을 선택해주세요");
		yy.focus();
		return false;
	}else if( mm.value == "" || mm.value == null ){
		alert("생년월일을 선택해주세요");
		mm.focus();
		return false;
	}else if( dd.value == "" || dd.value == null ){
		alert("생년월일을 선택해주세요");
		dd.focus();
		return false;
	}else if( addr1.value == "" || addr1.value == null ){
		alert("주소를 입력해주세요");
		addr1.focus();
		return false;
	}else if( addr2.value == "" || addr2.value == null ){
		alert("주소를 입력해주세요");
		addr2.focus();
		return false;
	}else if( addr3.value == "" || addr3.value == null ){
		alert("주소를 입력해주세요");
		addr3.focus();
		return false;
	}else if( phone.value == "" || phone.value == null ){
		alert("전화번호를 입력해주세요");
		phone.focus();
		return false;
	}
	
});





</script>
</html>