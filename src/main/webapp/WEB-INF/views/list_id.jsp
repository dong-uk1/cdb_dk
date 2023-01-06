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

</head>
<script type="text/javascript">
	function showclose() {
		if (document.getElementById("detail").style.display == "none") {
			document.getElementById("detail").style.display = "show";
		} else {
			document.getElementById("detail").style.display == "none"
		}
		document.getElementById("detail").style.display = "show";
	}
</script>
<style>
ul {
	list-style-type: none;
	font-weight: bold;
	font-size: 15px;
}

</style>
<body>
	<jsp:include page="header.jsp" />
	<hr>
	<h2>입주자 모집공고</h2>
	<hr>
	<h3>${name_id}</h3>
	<span style="font-weight: bold; font-size: 25px;">총 <span
		style="color: red;">${list.size()}</span> 개의 단지 정보가 있습니다.
	</span> <br> <br>
	<c:forEach var="vo" items="${list}">
		<div>
			<div id="detail">
				<table class="table">
					<thead style="background-color: lightgray;">
						<tr>
							<th scope="col">위치</th>
							<th scope="col">단지 정보</th>
							<th scope="col">공급 기관</th>
							<th scope="col">주택 유형</th>
							<th scope="col">공고 URL</th>
							<th scope="col">총 세대수</th>
							<th scope="col">모집 호수</th>
						</tr>
					</thead>
					<tbody id='tbody'>
						<tr>
							<td>${vo.by_fulladdr}</td>
							<td>${vo.by_hsmp}</td>
							<td>${vo.by_suplyint}</td>
							<td>${vo.by_housetype}</td>
							<td><a href="${vo.by_url}" target="_blank">해당 모집공고 가기</a></td>
							<td></td>
							<td>${vo.by_sumsuplyco}</td>

						</tr>
					</tbody>
				</table>
<%-- 				${vo.by_suplyint} ${vo.by_housetype} ${vo.by_recrude}
				${vo.by_winannde}
				${vo.by_signgu} ${vo.by_fulladdr} ${vo.by_hsmp} ${vo.by_sumsuplyco}
				${vo.by_entity} ${vo.by_prtpay} ${vo.by_surlus} ${vo.by_beginde}
				${vo.by_end } ${vo.by_refer} --%>
			</div>
		</div>
	</c:forEach>
	<jsp:include page="footer.jsp" />
</body>
</html>