<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>청다방 마이페이지</title>
<script type="text/javascript">
//jquery start
	$(function(){
		$(document).ready(function() {
			$.ajax({function(){
				url : "Scrap_Job"
				success : function(x) {
					$('Job').html(x)
				},
				error : function() {
					console("오류")
				}
				} //function
			}) //ajax
		})//$function
//jquery end

</script>
</head>
<body>
마이페이지 버튼 누르면 여기로 옴 여기가 마이페이지 메인화면 <br>
<a href="logout">로그아웃</a><br>
<a href="MyInfoEdit.jsp"><button>내 정보 수정하기</button></a><br>
커뮤니티 작성 글 댓글 모아보기<br>
<!-- 최신 10개 정도 출력 후 more 버튼 누르면 더 많이 보여주는 다른 창으로 이동 -->
내가 쓴 글<br>
내가 쓴 댓글<br>
<br>
스크랩 모아보기<br>
청년정책<br>
<div id="YPolicy"></div>

임대주택<br>
<div id="Home"></div>

일자리<br>
<div id="Job"></div>

커뮤니티<br>
<div id="Com"></div>




캘린더
</body>
</html>