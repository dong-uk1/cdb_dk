<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>h
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이징 된 리스트 불러올 jsp파일</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url : "jobList",
			data : {
				pageNum : 2
			},
			success : function(result) {
				$('#d1').html(result)
			}

		})

	})
</script>

<!-- 스타일  -->
<style type="text/css">
/* 클래스 jArea는 버튼 테두리 제거. */
</style>
</head>

<body>
	<!-- 전체검색  -->
	<div>
	<form action="jobList" method="get">
		<select class="form-select" aria-label="Default select example"
			style="width: 140px; height: 35px; display: inline;">
			<option ${ pageMaker.cri.type eq '' ? 'selected' : '' } disabled>선택</option>
			<option ${ pageMaker.cri.type eq 'job_title' ? 'selected' : '' } value="job_title">공고제목</option>
			<option ${ pageMaker.cri.type eq 'job_company' ? 'selected' : '' } value="job_company">기업명</option>
		</select> 
		<input type="text" name="keyword" value="${ pageMaker.cri.keyword }" style="height: 35px">
		<button type="submit" style="padding-top: 3px">
			<img src="resources/img/searchIcon.png" alt="" width="25px"
				height="23px" style="margin-bottom: 2px">검색
		</button>

		<!-- 지역검색 -->
		<div class="accordion" id="accordionExample">
			<div class="accordion-item" >
				<h2 class="accordion-header" id="headingOne">
					<button class="accordion-button" type="button"
						data-bs-toggle="collapse" data-bs-target="#collapseOne"
						aria-expanded="true" aria-controls="collapseOne">
						상세검색</button>
				</h2>
				<div id="collapseOne" class="accordion-collapse collapse show"
					aria-labelledby="headingOne" data-bs-parent="#accordionExample">
					<div class="accordion-body">
						<strong>지역검색</strong>
						<div class="">
							<button class="jArea">전체</button><br>
							<button class="jArea" id="seoul">서울</button>
							<button class="jArea" id="busan">부산</button><br>
							<button class="jArea" id="gangwon">강원</button>
							<button class="jArea" id="gyeonggi">경기</button><br>
							<button class="jArea" id="gyeongNam">경남</button>
							<button class="jArea" id="gyeongBuk">경북</button><br>
							<button class="jArea" id="gwangju">광주</button>
							<button class="jArea" id="daegu">대구</button><br>
							<button class="jArea" id="daejeon">대전</button>
							<button class="jArea" id="sejong">세종</button><br>
							<button class="jArea" id="ulsan">울산</button>
							<button class="jArea" id="incheon">인천</button><br>
							<button class="jArea" id="jeonNam">전남</button>
							<button class="jArea" id="jeonBbuk">전북</button><br>
							<button class="jArea" id="jeju">제주</button>
							<button class="jArea" id="chungNam">충남</button><br>
							<button class="jArea" id="chungBuk">충북</button>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value=""
								id="flexCheckChecked" checked> <label
								class="form-check-label" for="flexCheckChecked"> 버튼 누르면 나올 체크박스 리스트들 </label>
								지역명들이 들어갈 자리임.
								
						</div>
					</div>
				</div>
			</div>
			
		</div>
		</form>
	</div>
		<!-- 채용정보 목록 -->
	<div id=jobList>

		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">기업명</th>
					<th scope="col">제목</th>
					<th scope="col">근무조건</th>
					<th scope="col">등록일 & 마감일</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test='${ fn:length(list) gt 0}'>
						<c:forEach var="vo" items='${list}'>
							<tr
								onclick="location.href='one?job_wantedAuthNo=${vo.job_wantedAuthNo}'">
								<td>${vo.job_company}</td>
								<td>${vo.job_title}<br> 경력: ${vo.job_career} | 최소학력:
									${vo.job_minEdubg }
								</td>
								<td>${vo.job_sal }<br> ${vo.job_region }
								</td>
								<td>${vo.job_regDt }<br> ${vo.job_closeDt }
								</td>
							</tr>
						</c:forEach>
					</c:when>
				</c:choose>

			</tbody>
		</table>
	</div>

	<!-- 페이지네이션 -->
	<div>
		<nav aria-label="Page navigation example">
			<ul class="pagination">
				<%-- <c:if test="${pageMaker.prev eq true }"> --%>
				<c:if test="${pageMaker.prev}">
					<li class="page-item"><a class="page-link"
						href="recruitList?pageNum=${ pageMaker.startPage - 1 }">&laquo;</a></li>
				</c:if>

				<c:forEach var="i" begin="${ pageMaker.startPage }"
					end="${pageMaker.endPage}">
					<li class="page-item"><a class="page-link"
						href="recruitList?pageNum=${ i }">${ i }</a></li>
				</c:forEach>

				<c:if test="${pageMaker.next}">
					<%-- 			<c:if test="${pageMaker.next eq true }"> --%>
					<li class="page-item"><a class="page-link"
						href="recruitList?pageNum=${ pageMaker.endPage + 1 }">&raquo;</a></li>
				</c:if>
			</ul>
		</nav>
	</div>
</body>