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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script>
	$(function() {
		$('#btn').click(function() {
			$.ajax({
				url : 'all',
				type : "GET",
				data: {},
				success : function(data) {
					$('#tbody').empty()
					
					$.each(data,function(index,value) {
						function CF_leftPad(value) {
							if (Number(value) >= 10) {
								return value;
							}
							return "0"+ value;
						} // function 
						function CF_toStringByFormatting(source) {
							var date = new Date(source);
							const year = date.getFullYear();
							const month = CF_leftPad(date.getMonth() + 1);
							const day = CF_leftPad(date.getDate());
								return [year,month,day].join('-');
						} //function
						var insertTr = "";
						insertTr += "<tr>";
						insertTr += "<td><a href='h_sale?by_brtc=경상남도'>"+ value.by_pbname + "</a></td>";
						insertTr += "<td>" + value.by_suplyint + "</td>";
						insertTr += "<td>" + value.by_housetype + "</td>";
						insertTr += "<td>" + CF_toStringByFormatting(value.by_recrude) + "</td>";
						insertTr += "<td>" + CF_toStringByFormatting(value.by_winannde) + "</td>";
						insertTr += "<td>" + value.by_brtc + "</td>";
						insertTr += "</tr>";
						$("#tbody").append(insertTr);
						
					}) //each
				} // success
			}) // ajax
		}) //click

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
/* 
tr:hover {
	background: teal;
} */ 

.gg:hover {
	color:black;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	<button id='btn'>전국 검색</button>
	<br>
	<div style='text-align:center;'>
	<img id="map" src="resources/img/map2.png" width=500 height=750 usemap='#brt_map'>
	</div>	
	<map name="brt_map">
		<area shape="rect" coords="139,144,184,164" alt='Seoul' href="h_sale?by_brtc=서울특별시">	
		<area shape="rect" coords="115,151,140,173" alt='Incheon' href="h_sale?by_brtc=인천광역시">	
		<area shape="rect" coords="265,108,345,152" alt='Gangwondo' href="h_sale?by_brtc=강원도">
		<area shape="rect" coords="162,175,228,206" alt='Gyeonggido' href="h_sale?by_brtc=경기도">	
		<area shape="rect" coords="221,217,287,248" alt='Chung-cheongBdo' href="h_sale?by_brtc=충청북도">	
		<area shape="rect" coords="106,269,172,300" alt='Chung-cheongNdo' href="h_sale?by_brtc=충청남도">	
		<area shape="rect" coords="175,292,239,315" alt='Sejong' href="h_sale?by_brtc=세종특별자치시">	
		<area shape="rect" coords="181,339,234,355" alt='Daejeon' href="h_sale?by_brtc=대전광역시">	
		<area shape="rect" coords="143,381,213,418" alt='JeollaBdo' href="h_sale?by_brtc=전라북도">	
		<area shape="rect" coords="128,493,198,530" alt='JeollaNdo' href="h_sale?by_brtc=전라남도">	
		<area shape="rect" coords="119,462,181,485" alt='Gwangju' href="h_sale?by_brtc=광주광역시">	
		<area shape="rect" coords="258,431,331,460" alt='GyeongsangNdo' href="h_sale?by_brtc=경상남도">	
		<area shape="rect" coords="306,286,394,326" alt='GyeongsangBdo' href="h_sale?by_brtc=경상북도">	
		<area shape="rect" coords="295,370,361,398" alt='Daegu' href="h_sale?by_brtc=대구광역시">	
		<area shape="rect" coords="376,407,436,432" alt='Ulsan' href="h_sale?by_brtc=울산광역시">	
		<area shape="rect" coords="356,456,410,476" alt='Busan' href="h_sale?by_brtc=부산광역시">	
	</map>
	<br>
	<div>
		<table class="table table-hover table-fixed">
			<thead>
				<tr>
					<th scope="col">공고명</th>
					<th scope="col">공급 기관</th>
					<th scope="col">주택 유형</th>
					<th scope="col">공고일자</th>
					<th scope="col">당첨자 발표 일자</th>
					<th scope="col">광역시명</th>
				</tr>
			</thead>
			<tbody id='tbody'>
				<tr>

				</tr>
			</tbody>
		</table>
	</div>
	<div id='result'></div>
	<jsp:include page="footer.jsp" />
</body>
</html>