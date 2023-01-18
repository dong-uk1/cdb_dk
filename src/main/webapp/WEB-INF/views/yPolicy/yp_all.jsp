<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		$('.b').click(function() {
			/* 			$.ajax({
			 url : 'YpList',
			 data : {
			 page : 1
			 },
			 success : function(table) {
			 $('#result').html(table)
			 }
			 }) */
			pageNum = $(this).attr('page')
			$.ajax({
				url : 'YpList',
				data : {
					page : pageNum
				},
				success : function(table) {
					$('#result').html(table)
				}
			})
		})
		$('#b2').on("click", function() {
			$.ajax({
				url : "search",
				data : {
					YP_NAME : $('#YP_NAME').val(),
					YP_CATEGORY : $('input[name="YP_CATEGORY"]:checked').val(),
					YP_REGION : $('input[name="YP_REGION"]:checked').val()
				},
				type : "GET",
				success : function(table) {
					$("#result").html(table);
				} // success
			}); // ajax
		}) // b2
		$('.tab').on("click", function() {
			category = $(this).text()
			// alert(category)
			$.ajax({
				url : "selectOne",
				data : {
					YP_CATEGORY : category
				},
				type : "GET",
				success : function(table) {
					$("#button").empty(); // 페이지 버튼 사라짐
					$("#result").html(table);
				} // success
			}); // ajax
		})
	})
</script>
</head>
<body>
	<input id='YP_NAME'>
	<br>
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

	<button class="tab">생활·복지</button>
	<button class="tab">정책참여</button>
	<button class="tab">주거·금융</button>
	<button class="tab">창업지원</button>
	<button class="tab">취업지원</button>
	<button class="tab">코로나19</button>

	<!-- 원래 a 태그로 불러올랬는데 버튼으로 호출로 바꿈 -->
	<!-- <a id="tap" href="selectOne?YP_CATEGORY=생활·복지">생활·복지</a>
	<a id="tap" href="selectOne?YP_CATEGORY=정책참여">정책참여</a>
	<a id="tap" href="selectOne?YP_CATEGORY=주거·금융">주거·금융</a>
	<a id="tap" href="selectOne?YP_CATEGORY=창업지원">창업지원</a>
	<a id="tap" href="selectOne?YP_CATEGORY=취업지원">취업지원</a>
	<a id="tap" href="selectOne?YP_CATEGORY=코로나19">코로나19</a> -->
	<hr>
	<div id="result">
		<table class="table">
			<tr>
				<th bgcolor="#dee2e6">정책유형</th>
				<th bgcolor="#dee2e6">정책명</th>
				<th bgcolor="#dee2e6">기관구분</th>
			</tr>
			<c:forEach items="${list}" var="vo">
				<tr>
					<td>${vo.YP_CATEGORY}</td>
					<td><a
						href="detailOne?YP_NAME=${vo.YP_NAME}&YP_VIEW=${vo.YP_VIEW}">${vo.YP_NAME}</a></td>
					<td>${vo.YP_PI}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div id="button">
		<%
			int pages = (int) request.getAttribute("pages");
		for (int p = 1; p <= pages; p++) {
		%>
		<button class="b" page='<%=p%>'
			style="background: lime; color: red; font-weight: bold;"><%=p%></button>
		<%
			}
		%>
	</div>

</body>
</html>