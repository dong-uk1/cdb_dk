<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table class="table">
	<tr>
		<th bgcolor="#dee2e6">정책유형</th>
		<th bgcolor="#dee2e6">정책명</th>
		<th bgcolor="#dee2e6">기관구분</th>
	</tr>
	<c:forEach items="${list}" var="vo">
		<tr>
			<td>${vo.YP_CATEGORY}</td>
			<td><a
				href="detailOne?YP_NAME=${vo.YP_NAME}&YP_VIEW=${vo.YP_VIEW}">${vo.YP_NAME}</a></td>
			<td>${vo.YP_PI}</td>
		</tr>
	</c:forEach>
</table>
