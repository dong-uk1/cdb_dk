<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<hr>
<%-- <c:forEach var="vo" items="${list}">
검색한 id: ${vo.job_title} <br> <!-- el: expression language, 속성으로 지정한 것만 프린트! -->
<hr>
</c:forEach>
 --%>

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
					<c:forEach var="vo" items='${list}'>
				<%--안되면 나도 <a>태그로 만들것
				 	<td><a href="detailOne?YP_NAME=${vo.YP_NAME}">${vo.YP_NAME}</a></td> --%>
				
				<%-- 	<tr>
							<td><a href="one?job_wantedAuthNo=${vo.job_wantedAuthNo}">${vo.job_wantedAuthNo}</td></a>  --%>
							
						<tr onclick="location.href='one?job_wantedAuthNo=${vo.job_wantedAuthNo}'">
						
								<td>${vo.job_company}</td>		
								<td>${vo.job_title}
									<br>
									경력: ${vo.job_career} | 최소학력: ${vo.job_minEdubg }
								</td>
								<td>${vo.job_sal }<br> ${vo.job_region }
								</td>
								<td> 
								<!-- 일단 임시로 String로 받아옴  -->
								${vo.job_regDt }<br> ${vo.job_closeDt }
								
<%-- 							<fmt:parseDate value="${vo.job_regDt}" var="dateReg" pattern="yy-MM-dd"/>
								<fmt:formatDate value="${dateReg}" pattern="yy-MM-dd"></fmt:formatDate>
채용시까지  23-03-03 의 전처리 필요
	 								<br> 
									<fmt:parseDate value="${vo.job_closeDt}" var="closeDate" pattern="yy-MM-dd"/>
									<fmt:formatDate value="${closeDate}" pattern="yy-MM-dd"></fmt:formatDate> --%>
								</td>
							</tr>

					</c:forEach>

		</tbody>
	</table>