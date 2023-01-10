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
			// if(YP_NAME.indexOf('#YP_NAME') == -1)
			$.ajax({
				url : "search",
				data: {
					YP_NAME: $('#YP_NAME').val(),
					YP_CATEGORY: $('input[name="YP_CATEGORY"]:checked').val(),
					YP_REGION: $('input[name="YP_REGION"]:checked').val()
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
	<input id='YP_NAME' value="관악 청년 주간행사"><br>
	<!-- 정책유형 -->
	<input type='radio' name='YP_CATEGORY' value='생활·복지'>생활·복지
	<input type='radio' name='YP_CATEGORY' value='정책참여'>정책참여
	<input type='radio' name='YP_CATEGORY' value='주거·금융'>주거·금융
	<input type='radio' name='YP_CATEGORY' value='창업지원'>창업지원
	<input type='radio' name='YP_CATEGORY' value='취업지원'>취업지원
	<input type='radio' name='YP_CATEGORY' value='코로나19'>코로나19
	<hr>
	<!-- 지역 -->
	<input type='radio' name='YP_REGION' value='중앙부처'>중앙부처
	<input type='radio' name='YP_REGION' value='서울'>서울
	<input type='radio' name='YP_REGION' value='부산'>부산
	<input type='radio' name='YP_REGION' value='대구'>대구
	<input type='radio' name='YP_REGION' value='인천'>인천
	<input type='radio' name='YP_REGION' value='광주'>광주
	<input type='radio' name='YP_REGION' value='대전'>대전
	<input type='radio' name='YP_REGION' value='울산'>울산
	<input type='radio' name='YP_REGION' value='경기'>경기
	<input type='radio' name='YP_REGION' value='강원'>강원
	<input type='radio' name='YP_REGION' value='충북'>충북
	<input type='radio' name='YP_REGION' value='충남'>충남
	<input type='radio' name='YP_REGION' value='전북'>전북
	<input type='radio' name='YP_REGION' value='전남'>전남
	<input type='radio' name='YP_REGION' value='경북'>경북
	<input type='radio' name='YP_REGION' value='경남'>경남
	<input type='radio' name='YP_REGION' value='제주'>제주
	<input type='radio' name='YP_REGION' value='세종'>세종
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
