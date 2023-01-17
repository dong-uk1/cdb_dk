<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
						<tr onclick="location.href='one?job_wantedAuthNo=${vo.job_wantedAuthNo}'">
							<td>${vo.job_company}</td>
							<td>${vo.job_title}
								<br>
								경력: ${vo.job_career} | 최소학력: ${vo.job_minEdubg }
							</td>
							<td>${vo.job_sal }<br> ${vo.job_region }</td>
							<td> ${vo.job_regDt }<br> ${vo.job_closeDt }</td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>

		</tbody>
	</table>