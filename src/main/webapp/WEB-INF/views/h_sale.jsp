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
					<!-- <th scope="col">주택 일련번호</th> -->
					<!-- <th scope="col">공고 상태</th> -->
					<th scope="col">공고명</th>
					<th scope="col">공급 기관</th>
					<th scope="col">주택 유형</th>
					<th scope="col">공고일자</th>
					<th scope="col">당첨자 발표 일자</th>
					<!-- <th scope="col">공고 URL</th> -->
					<th scope="col">광역시명</th>
					<!-- <th scope="col">시군구명</th> -->
					<!-- <th scope="col">전체 주소</th> -->
					<!-- <th scope="col">공급 호수</th>
				<th scope="col">최소 계약금</th>
				<th scope="col">최소 중도금</th>
				<th scope="col">최소 잔금</th> -->
					<!-- <th scope="col">모집 시작 일자</th>
				<th scope="col">모집 종료 일자</th> -->
					<!-- <th scope="col">문의처</th> -->
				</tr>
			</thead>
		</table>
		<c:forEach var="vo" items="${list}">
			<table class="table table-hover">
				<!-- <thead>
				<tr>
					<th scope="col">공고 id</th>
					<th scope="col">주택 일련번호</th>
					<th scope="col">공고 상태</th>
					<th scope="col">공고명</th>
					<th scope="col">공급 기관</th>
					<th scope="col">주택 유형</th>
					<th scope="col">공고일자</th>
					<th scope="col">당첨자 발표 일자</th>
					<th scope="col">공고 URL</th>
					<th scope="col">광역시명</th>
					<th scope="col">시군구명</th>
					<th scope="col">전체 주소</th>
					<th scope="col">공급 호수</th>
					<th scope="col">최소 계약금</th>
					<th scope="col">최소 중도금</th>
					<th scope="col">최소 잔금</th>
					<th scope="col">모집 시작 일자</th>
					<th scope="col">모집 종료 일자</th>
					<th scope="col">문의처</th>
				</tr>
			</thead> -->
				<tbody>
					<tr>
						<%-- <td>${vo.by_pbid}</td>
					<td>${vo.by_housesn}</td> --%>
						<%-- <td>${vo.by_state}</td> --%>
						<td>${vo.by_pbname}</td>
						<td>${vo.by_suplyint}</td>
						<td>${vo.by_housetype}</td>
						<td>${vo.by_recrude}</td>
						<td>${vo.by_winannde}</td>
						<%-- <td>${vo.by_url}</td> --%>
						<td>${vo.by_brtc}</td>
						<%-- <td>${vo.by_signgu}</td>
					<td>${vo.by_fulladdr}</td>
					<td>${vo.by_hsmp}</td>
					<td>${vo.by_sumsuplyco}</td>
					<td>${vo.by_entity}</td>
					<td>${vo.by_prtpay}</td>
					<td>${vo.by_surlus}</td> --%>
						<%-- <td>${vo.by_beginde}</td>
					<td>${vo.by_end}</td> --%>
						<%-- <td>${vo.by_refer}</td> --%>
					</tr>
				</tbody>
			</table>
		</c:forEach>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>