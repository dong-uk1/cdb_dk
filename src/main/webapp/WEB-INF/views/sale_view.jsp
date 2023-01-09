<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>청 다 방</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<!--  services와 cluster, drawing 라이브러리 불러오기 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1a5f34071e5fda04f41cf6edf0c5fd1b&libraries=services,clusterer,drawing"></script>
</head>

<style>
.btn {
	background-color: lightgray;
}

.btn:hover {
	background-color: gray;
}
</style>
<body>
	<jsp:include page="header.jsp" />
	<hr>
	<h2>입주자 모집공고</h2>
	<hr>
	<h3>${list[0].by_pbname}</h3>
	<span style="font-weight: bold; font-size: 25px;">총 <span style="color: red;">${list.size()}</span> 개의 단지 정보가 있습니다.
	</span>
	<br>
	${list[0].by_housetype} <br>
	${list[0].by_suplyint} <br>
	${list[0].by_refer} <br>
	<table class="table">
		<thead style="background-color: lightgray;">
			<tr>
				<th>광역시</th>
				<th>시군구</th>
				<th>위치</th>
				<th>단지 명</th>
				<th>공급 호수</th>
				<th>공고 URL</th>
				<th>최소 계약금</th>
				<th>최소 중도금</th>
				<th>최소 잔금</th>
				<th>모집 시작 일자</th>
				<th>당첨자 발표 일자</th>
			</tr>
		</thead>
		<c:forEach var="vo" items="${list}">
			<tbody>
				<tr>
					<td><c:out value="${vo.by_brtc}" /></td>
					<td  class="signgu"><c:out value="${vo.by_signgu}"/></td>
					<!--  지도로 보기 -->
					<td><c:out value="${vo.by_fulladdr}" /><button class='btn' value="${vo.by_fulladdr}">지도로 보기</button></td>
					<td><c:out value="${vo.by_hsmp}" /></td>
					<td><c:out value="${vo.by_sumsuplyco}"/></td>
					<td><a href="${vo.by_url}" target="_blank"><c:out value="해당 모집공고 가기" /></a></td>
					<td><fmt:formatNumber value="${vo.by_entity}" type="number" /></td>
					<td><fmt:formatNumber value="${vo.by_prtpay}" type="number" /></td>
					<td><fmt:formatNumber value="${vo.by_surlus}" type="number" /></td>
					<td><fmt:formatDate value="${vo.by_beginde}" pattern="yyyy-MM-dd"/></td>
					<td><fmt:formatDate value="${vo.by_winannde}" pattern="yyyy-MM-dd"/></td>
				</tr>
			</tbody>
		</c:forEach>
	</table>
	<div id="map" style="width: 800px; height: 400px;"></div>
	<jsp:include page="footer.jsp" />
	<script>
		$(function() {
			$(".btn").click(function() {
				$('#map').empty();
				var val = $(this).attr('value'); //버튼 클릭시 해당 주소를 가지고 옴
				var brtc = $("#brtc").text();
				var signgu = $(".signgu").text();
				console.log(val);
				if(val===null)	 {
					console.log(brtc);
					console.log(signgu);
				}			
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };  

			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 

			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();

			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(val, function(result, status) {

			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {

			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});    
			})
		})	
	</script>
</body>
</html>