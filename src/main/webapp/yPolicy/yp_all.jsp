<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="../resources/js/jquery-3.6.1.js"></script>
<script>
	$(function() { // ram에 body를 dom tree로 다 읽어들이면 통신해서 다 불러오기
		// $('#b1').click(function() {
			$.ajax({
				url : "YpList",
				type : "GET",
				success : function(table) {
					$("#result").html(table);
				} // success
			}); // ajax
		//})
		$('#b2').click(function() {
			$.ajax({
				url : "search",
				data: {
					YP_NAME: $('#YP_NAME').val(),
					YP_CATEGORY: '생활·복지',
					YP_REGION: '서울'
				},
				type : "GET",
				success : function(table) {
					$("#result").html(table);
				} // success
			}); // ajax
		})
	})
</script>
</head>
<body>
	<input id='YP_NAME' value="관악 청년 주간행사">
	<button id='b2'>검색</button>
	<br>

	<a href="selectOne?YP_CATEGORY=생활·복지">생활·복지</a> <a href="selectOne?YP_CATEGORY=정책참여">정책참여</a> 
	<a href="selectOne?YP_CATEGORY=주거·금융">주거·금융</a> <a href="selectOne?YP_CATEGORY=창업지원">창업지원</a> 
	<a href="selectOne?YP_CATEGORY=취업지원">취업지원</a> <a href="selectOne?YP_CATEGORY=코로나19">코로나19</a>
	<!-- <button id='b1'>리스트</button> --> <!-- 버튼 누르면 ajax로 리스트 불러오는 기능 -->
	<hr>
	<div id="result"></div>

</body>
</html>
