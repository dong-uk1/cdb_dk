<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<!--<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=gog5rbcsmw"></script> -->

<script>
	// 전체 전국 지도 검색
	
	let totalData; //총 데이터 수
	let dataPerPage = 10; //한 페이지에 나타낼 글 수
	let pageCount = 10; //페이징에 나타낼 페이지 수
	let globalCurrentPage=1; //현재 페이지
	
	$(document).ready(function(){
		dataPerPage = 10; //한 페이지에 나타낼 글 수
		$.ajax({
			method:'GET',
			url: 'rent_all',
			dataType: 'json',
			success: function(d) {
				totalData = d.length;
				globalData = d;
				displayData(1, dataPerPage, d);
			
				paging(totalData, dataPerPage, pageCount, 1);
			} ///success
			
		}) //ajax
		
	}) //document.ready
	
	$(function(){
		$("#btn").click(function(){
			dataPerPage = 10;
			$.ajax({
				method:'GET',
				url: 'rent_all',
				dataType: 'json',
				success: function(d) {
					totalData = d.length;
					globalData = d;
					displayData(1, dataPerPage, d);
				
					paging(totalData, dataPerPage, pageCount, 1);
				} ///success
				
			}) //ajax
		})
	})
	
	function paging(totalData, dataPerPage, pageCount, currentPage){
	
		totalPage = Math.ceil(totalData/dataPerPage);
		
		if(totalPage<pageCount) {
			pageCount=totalPage;
		}
		
		let pageGroup = Math.ceil(currentPage / pageCount);

		let last = pageGroup * pageCount; // 화면에 보여질 마지막 페이지 번호
		
		if(last > totalPage) {
			last = totalPage;
		}
		
		let first = last - (pageCount -1);
		let next = last + 1;
		let prev = first - 1;
		
		let pageHtml = "";
		
		if(prev > 0 ){
			pageHtml += "<li><a href='#;' id='prev'> 이전</a></li>";
		}
		
		// 페이징 번호 표시
		for(var i = first; i <= last; i++) {
			if(currentPage == i) {
				pageHtml+=
					"<li class='on'><a href='#;' id='" + i + "'>" + i + "</a></li>";
			} 
			else {
			    pageHtml += "<li><a href='#;' id='" + i + "'>" + i + "</a></li>";
			}
		}
		
		if(last < totalPage) {
			pageHtml += "<li><a href='#;' id='next'> 다음 </a></li>";
		}
		
		$('#paging').html(pageHtml);
		
		let displayCount="";
		displayCount = "현재 1 - "  + totalPage + "페이지 /" + totalData + "건";
		$("#displayCount").text(displayCount);
		
		// 페이징 번호 클릭 이벤트
		$('#paging li a').click(function(){
			let $id = $(this).attr("id");
			selectedPage = $(this).text();
			
			if ($id == "next") selectedPage = next;
			if ($id == "prev") selectedPage = prev;
			
			
			// 전역변수에 선택한 페이지 번호를 담는다
			globalCurrentPage = selectedPage;
			
			paging(totalData, dataPerPage, pageCount, selectedPage);
			
			displayData(selectedPage, dataPerPage, globalData);
		})
		
		
	} //paging function
	
	// 현재 페이지와(currentPage)와 페이지당 글 개수(dataPerPage) 반영
	function displayData(currentPage, dataPerPage, data) {
		let charHtml = "";
		currentPage = Number(currentPage);
		dataPerPage = Number(dataPerPage);
		
		for( var i = (currentPage-1) * dataPerPage; i < (currentPage - 1) * dataPerPage + dataPerPage; i++) {
			  
	        charHtml +=
	            "<tr><td>" +
	            data[i].br_suplytype +
	            "</td><td>" +
	            data[i].br_housetype+
	            "</td><td>" +
	            data[i].br_brtc +
	            "</td><td>" +
				"<a href=rent_view?br_pbid=" + data[i].br_pbid + "&br_brtc=" + data[i].br_brtc + ">"+ data[i].br_pbname + "</a>"+
				"</td><td>" + moment(data[i].br_recrude).format("YYYY-MM-DD") +
				"</td><td>"	+ moment(data[i].br_winannde).format("YYYY-MM-DD") +
				"</td><td>"	 +
				data[i].br_suplyint + 
	            "</td></tr>";
			
		}
		$('#tbody').empty();
		$('#tbody').append(charHtml);
	}

	

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
			$("#tbody").empty();
			$('#paging').empty();
			$('#displayCount').empty();
			$.ajax({
				url : 'rent_city?br_brtc=' + obj[id],
				type : "GET",
				data: {},
				success : function(data) {
					/*$('#tbody').empty()
					totalData = data.length;
					globalData = data;
					displayData(1, dataPerPage, data); */
				
					/* paging(totalData, dataPerPage, pageCount, 1); */
					
					$.each(data,function(index,value) {
						var insertTr = "";
						insertTr += "<tr>";
						insertTr += "<td>" + value.br_suplytype + "</td>";
						insertTr += "<td>" + value.br_housetype + "</td>";
						insertTr += "<td>" + value.br_brtc + "</td>";
						insertTr += "<td><a href=rent_view?br_pbid=" + value.br_pbid + "&br_brtc=" + value.br_brtc + ">"+ value.br_pbname + "</a></td>";
						insertTr += "<td>"  + moment(value.br_recrude).format("YYYY-MM-DD") + "</td>";
						insertTr += "<td>" + moment(value.br_winannde).format("YYYY-MM-DD") + "</td>";
						insertTr += "<td>" + value.br_suplyint + "</td>";
						insertTr += "</tr>"; 
						$("#tbody").append(insertTr);
					})  //each
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

ul {
    text-align: center;
    display: inline-block;
    
    border-right: 0;
    list-style: none;
}
ul li {
    text-align: center;
    float: left;
}

ul li a {
    display: block;
    font-size: 14px;
    padding: 9px 12px;
    box-sizing: border-box;
}

ul li.on {
    /*  background: #eda712; */
    background: #A9A9A9;
}

ul li.on a {
    color: #fff;
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
					<th scope="col">공급유형</th>
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
	<div id="displayCount"></div>
	<ul id="paging"></ul>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>