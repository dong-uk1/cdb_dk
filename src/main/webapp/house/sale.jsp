<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<!-- <link rel="stylesheet" type="text/css" href="resources/css/house.css"> -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<script>
	
	$(document).ready(function(){
		$.ajax({
			method: 'GET',
			url: 'sale_all',
			dataType: 'json',
			success: function(data) {
				$('#tbody').empty()
				
				$.each(data, function(index, value) {
					var insertTr= "";
					const brtc = value.by_brtc;
					insertTr += "<tr>";
					insertTr += "<td>" + value.by_housetype + "</td>";
					insertTr += "<td>" + value.by_brtc + "</td>";
					insertTr += "<td><a href=sale_view?by_pbid=" + value.by_pbid + "&by_brtc=" + value.by_brtc + ">"+ value.by_pbname + "</a></td>";
					insertTr += "<td>" + moment(value.by_recrude).format("YYYY-MM-DD") + "</td>";
					insertTr += "<td>" + moment(value.by_winannde).format("YYYY-MM-DD") + "</td>";
					insertTr += "<td>" + value.by_suplyint + "</td>";
					insertTr += "</tr>";
					$("#tbody").append(insertTr);
					
				})
				
			} //success
		}) //ajax
	}) //document.ready
	

	$(function() {
		$('#btn').click(function() {
			$.ajax({
				url : 'sale_all',
				type : "GET",
				data: {},
				success : function(data) {
					$('#tbody').empty()
					
					$.each(data,function(index,value) {
						var insertTr = "";
						const brtc = value.by_brtc;
						insertTr += "<tr>";
						insertTr += "<td>" + value.by_housetype + "</td>";
						insertTr += "<td>" + value.by_brtc + "</td>";
						insertTr += "<td><a href=sale_view?by_pbid=" + value.by_pbid + "&by_brtc=" + value.by_brtc + ">"+ value.by_pbname + "</a></td>";
						insertTr += "<td>" + moment(value.by_recrude).format("YYYY-MM-DD") + "</td>";
						insertTr += "<td>" + moment(value.by_winannde).format("YYYY-MM-DD") + "</td>";
						insertTr += "<td>" + value.by_suplyint + "</td>";
						insertTr += "</tr>";
						$("#tbody").append(insertTr);
					}) //each
				} // success
			}) // ajax
		}) //click

	}) // function
	

	// 광역시도별 검색 (지도 클릭시 구현)
	$(function() {
		const obj = {
				1: '서울특별시',
				2: '인천광역시',
				3: '강원도',
				4: '경기도',
				5: '충청북도',
				6: '충청남도',
				7: '세종특별자치시',
				8: '대전광역시',
				9: '전라북도',
				10: '전라남도',
				11: '광주광역시',
				12: '경상남도',
				13: '경상북도',
				14: '대구광역시',
				15: '울산광역시',
				16: '부산광역시'
		}
		
		$("area").click(function() {
			var id = $(this).attr('id');
			$("#tbody").empty()	
			$.ajax({
				url : 'sale_city?by_brtc=' + obj[id],
				type : "GET",
				data: {},
				success : function(data) {
					$('#tbody').empty()
					
					$.each(data,function(index,value) {
						var insertTr = "";
						const brtc = value.by_brtc;
						insertTr += "<tr>";
						insertTr += "<td>" + value.by_housetype + "</td>";
						insertTr += "<td>" + value.by_brtc + "</td>";
						insertTr += "<td><a href=sale_view?by_pbid=" + value.by_pbid + "&by_brtc=" + value.by_brtc + ">"+ value.by_pbname + "</a></td>";
						insertTr += "<td>" + moment(value.by_recrude).format("YYYY-MM-DD") + "</td>";
						insertTr += "<td>" + moment(value.by_winannde).format("YYYY-MM-DD") + "</td>";
						insertTr += "<td>" + value.by_suplyint + "</td>";
						insertTr += "</tr>";
						$("#tbody").append(insertTr);
					}) //each
				} // success
			}) // ajax
		}) //area tag click
	}) // function

</script>
<style>
a {
	text-decoration: none;
	color: black;
}
a:hover {
	font-weight: bold;	
}

area:hover {
	cursor: pointer;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class='total'>
	<button id='btn'>전국 검색</button>
	<br>
	
	<div class='map-img'>
	<img src="../resources/img/map2.png" width=500 height=750 usemap='#brt_map'>
	</div>	
	
	<map name="brt_map">
	<!--  coords= x1, y1, x2, y2 -->
		<area id="1" shape="rect" coords="139,144,184,164" alt='Seoul'>
		<area id="2" shape="rect" coords="115,151,140,173" alt='Incheon'>	
		<area id="3" shape="rect" coords="265,108,345,152" alt='Gangwondo'>
		<area id="4" shape="rect" coords="162,175,228,206" alt='Gyeonggido'>
		<area id="5" shape="rect" coords="221,217,287,248" alt='Chung-cheongBdo'>	
		<area id="6" shape="rect" coords="106,269,172,300" alt='Chung-cheongNdo'>	
		<area id="7" shape="rect" coords="175,292,239,315" alt='Sejong'>	
		<area id="8" shape="rect" coords="181,339,234,355" alt='Daejeon'>	
		<area id="9" shape="rect" coords="143,381,213,418" alt='JeollaBdo'>	
		<area id="10" shape="rect" coords="128,493,198,530" alt='JeollaNdo'>	
		<area id="11" shape="rect" coords="119,462,181,485" alt='Gwangju'>	
		<area id="12" shape="rect" coords="258,431,331,460" alt='GyeongsangNdo'>	
		<area id="13" shape="rect" coords="306,286,394,326" alt='GyeongsangBdo'>	
		<area id="14" shape="rect" coords="295,370,361,398" alt='Daegu'>	
		<area id="15" shape="rect" coords="376,407,436,432" alt='Ulsan'>	
		<area id="16" shape="rect" coords="356,456,410,476" alt='Busan'>	
	</map>
	<br>
	<div class="tb">
		<table class="table table-hover table-fixed">
			<thead style="background-color: lightgray;">
				<tr>
					<th scope="col">주택유형</th>
					<th scope="col">광역시명</th>
					<th scope="col">공고명</th>
					<th scope="col">공고일자</th>
					<th scope="col">당첨자 발표 일자</th>
					<th scope="col">공급 기관</th>
				</tr>
			</thead>
			<tbody id='tbody'>

			</tbody>
		</table>
	</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>