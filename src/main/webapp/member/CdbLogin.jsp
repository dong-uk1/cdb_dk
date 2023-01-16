<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>청다방 로그인</title>
<link rel="stylesheet" href="../resources/css/cdblogin.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
//jquery start
$(function() {
	// ajax 로그인 체크 기능
	$('#b0').click(function() {
		idValue = $('#id').val()
		pwValue = $('#pw').val()
		$.ajax({
			url : 'loginCheck',
			data : {
				member_id : idValue,
				member_pw : pwValue
			},
			success : function(x) {
				if(x == "로그인 성공"){					
					$('#loginCheck').html(" " + x + " ")
					location.href = "login2"
				}else{
					$('#loginCheck').html(" " + x + " ")
				}
			} //success
		}) //ajax
	}) //b0
}) // function
// jquery end
</script>
</head>
<body>
	<div class="header">
		<a href="www.google.com"><img src="../resources/img/chdabang.png"></a>
		<h2>청다방 로그인 하기</h2>
	</div>
	<div class="find">
			<table>
				<tr>
					<td>ID : <input type="text" name="member_id" id="id"></td>
				</tr>
				<tr>
					<td>PW : <input type="password" name="member_pw" id="pw"></td>
				</tr>
				<tr>
					<td><div id="loginCheck">로그인 하세요</div></td>
				</tr>
				<tr align="center">
					<td><button class="button_CRUD" id="b0">Login</button></td>
				</tr>
			</table>
	</div>
	<div class="ex">
		<a href="MemberJoin.jsp">회원가입</a>&nbsp;
		<a href="MyIdfind.jsp">아이디 찾기</a>&nbsp;
		<a href="MyPwfind.jsp">비밀번호 찾기</a>
	</div>
</body>
</html>