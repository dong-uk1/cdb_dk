<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

</script>
</head>
<body>
	<jsp:include page="header.jsp" />
	
	<div>
		<table class="table table-hover table-fixed">
			<thead>
				<tr>
					<!-- <th scope="col">공고 id</th> -->
					<!--<th scope="col">주택 일련번호</th> -->
					<!-- <th scope="col">공고 상태</th> -->
					<th scop="col">주택 유형</th>
					<th scope="col">공고명</th>
					<th scope="col">공급 기관</th>
					<th scope="col">주택 유형</th>
					<th scope="col">공고일자</th>
					<th scope="col">당첨자 발표 일자</th>
					<!-- <th scope="col">공고 URL</th> -->
					<th scope="col">광역시명</th>
					<th scope="col">시군구명</th>
					<th scope="col">전체 주소</th>
					<th scope="col">단지 명</th>
					<th scope="col">공급호수</th>
					<th scope="col">최소임대 보증금</th>
					<th scope="col">최소 계약금</th>
					<th scope="col">최소 중도금</th>
					<th scope="col">최소 잔금</th> 
					<th scope="col">최소 월임대료</th> 
					<th scope="col">모집 시작 일자</th>
				<!--<th scope="col">모집 종료 일자</th> -->
					<!-- <th scope="col">문의처</th> -->
				</tr>
			</thead>
		</table>
		<c:forEach var="vo" items="${list}">
			<table class="table table-hover">
				<tbody>
					<tr>
				<!--  <td>${vo.br_housesn}</td> -->
						<td>${vo.br_housetype}</td>
						<td>${vo.br_pbname}</td>
						<td>${vo.br_suplyint}</td>
						<td>${vo.br_recrude}</td>
						<td>${vo.br_winannde}</td>
						<!--<td>${vo.br_url}</td> -->
						<td>${vo.br_brtc}</td>
						<td>${vo.br_signgu}</td>
						<td>${vo.br_fulladdr}</td>
						<td>${vo.br_hsmp}</td>
						<td>${vo.br_sumsuplyco}</td>
						<td>${vo.br_rentgtn}</td>
						<td>${vo.br_entity}</td>
						<td>${vo.br_prtpay}</td>
						<td>${vo.br_surlus}</td>
						<td>${vo.br_monthrent}</td>
						<td>${vo.br_beginde}</td>
					</tr>
				</tbody>
			</table>
		</c:forEach>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>