<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script src="https://kit.fontawesome.com/4e0c810bcc.js" crossorigin="anonymous"></script>
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
	<h3 class='title'>${list[0].br_pbname}</h3>
	<span style="font-weight: bold; font-size: 25px;">총 <span
		style="color: red;">${list.size()}</span> 개의 단지 정보가 있습니다.
	</span>
	<br> ${list[0].br_housetype}
	<br> ${list[0].br_suplyint}
	<br> ${list[0].br_refrnc}
	<br> ${list[0].br_suplytype}
	<br>

	<span class="brtc">${list[0].br_brtc}</span>
	<table class="table" id="tt">
		<thead style="background-color: lightgray;">
			<tr>
				<th>시군구</th>
				<th>위치</th>
				<th>단지 명</th>
				<th>공급호수</th>
				<th>공고 URL</th>
				<th>최소임대 보증금</th>
				<th>최소 계약금</th>
				<th>최소 중도금</th>
				<th>최소 잔금</th>
				<th>최소 월임대료</th>
				<th>모집 시작 일자</th>
				<th>당첨자 발표 일자</th>
				<th>관심공고</th>
			</tr>
		</thead>
		<c:forEach items="${list}" var="vo">
			<tbody>
				<tr>
					<td id="signgu"><c:out value="${vo.br_signgu}" /></td>
					<!-- 지도로 보기 -->
					<td><c:out value="${vo.br_fulladdr}" />
					<button class='btn' value="${vo.br_fulladdr}">지도로 보기</button></td>
					<td><c:out value="${vo.br_hsmp}" /></td>
					<td><c:out value="${vo.br_sumsuplyco}" /></td>
					<td><a href="${vo.br_url}" target="_blank"><c:out value="해당 모집공고 가기" /></a></td>
					<td><fmt:formatNumber value="${vo.br_rentgtn}" type="number" /></td>
					<td><fmt:formatNumber value="${vo.br_entity}" type="number" /></td>
					<td><fmt:formatNumber value="${vo.br_prtpay}" type="number" /></td>
					<td><fmt:formatNumber value="${vo.br_surlus}" type="number" /></td>
					<td><fmt:formatNumber value="${vo.br_monthrent}" type="number" /></td>
					<td><fmt:formatDate value="${vo.br_beginde}"
							pattern="yyyy-MM-dd" /></td>
					<td><fmt:formatDate value="${vo.br_winannde}"
							pattern="yyyy-MM-dd" /></td>
					<td><button class="scr">스크랩</button></td>
				</tr>
			</tbody>
		</c:forEach>
	</table>
	
	
	<div id="map" style="width: 800px; height: 400px;"></div>
	<jsp:include page="footer.jsp" />

	<script>
		$(".btn").click(function(){

			$('#map').empty();

			// var tdArr = new Array(); // 배열 선언
			var btn = $(this);
			
			// btn.parent(): btn의 부모는 <td>
			// btn.parent().parent(): <td>의 부모는 <tr>
			var tr = btn.parent().parent();
			var td = tr.children();
			
			//tr.text()는 클릭된 Row 즉 tr에 있는 모든 값을 가져온다.
			//console.log("클릭한 Row의 모든 데이터: " + tr.text());
			
			
			// 반복문을 이용해서 배열에 값을 담아 사용할 수도 있음.
			/* td.each(function(i){
				tdArr.push(td.eq(i).text());
			}); */

			//console.log("배열에 담긴 값: " + tdArr)	;
			
			//td.eq(index)를 통해 값을 가져올 수 있음.
			
			// map이 들어갈 div를 비우고
			
			// 클릭한 버튼의 해당 주소를 가지고 옴
			var addr = $(this).attr('value');
			
			// 광역시
			var brtc = "${list[0].br_brtc}";
			// 시군구
			var signgu = td.eq(0).text();
			
			// 위치 정보가 공백일 경우 광역시 + 시군구로 위치 매핑
			if (addr === '') {
				//addr = brtc + signgu;
				addr = brtc + signgu;
			}
			
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
			};

			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption);

			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();

			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(addr, function(result, status) {

				// 정상적으로 검색이 완료됐으면 
				if (status === kakao.maps.services.Status.OK) {

					var coords = new kakao.maps.LatLng(result[0].y,
							result[0].x);

					// 결과값으로 받은 위치를 마커로 표시합니다
					var marker = new kakao.maps.Marker({
						map : map,
						position : coords
					});
					// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
					map.setCenter(coords);
				}
			});
		
			
		}) //click function
		
		var req = {
				"scrap_title": "${list[0].br_pbname}",
				"scrap_link" : 'rent_view?br_pbid=${list[0].br_pbid}&br_brtc=${list[0].br_brtc}',
				"scrap_type" : "rent",
				"scrap_member": "gildong"
			};
		
		// 스크랩 관련 ajax
		$(function(){
			$('.scr').click(
				function(){
					//var title = $('.title').text();
					
					$.ajax({
						url: "rent_scrap",
						type: "POST",
						dataType: "json",
						contentType : 'application/json',
						data: JSON.stringify(req),
						success: function(data) {
							console.log(data);
							
							if(data == 0) {
								alert("스크랩 완료");
								location.reload();
							} else {
								alert("스크랩 취소");
								location.reload();
							}
						} //success
						
					}) //ajax
				} //function
			) // click
		}) // root function
		
	</script>
</body>
</html>

