<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table>
	<tr>
		<td>정책유형</td>
		<td>정책명</td>
		<td>기관구분</td>
	</tr>
	<c:forEach items="${list}" var="vo">
		<tr>
			<td>${vo.YP_CATEGORY}</td>
			<td>${vo.YP_NAME}</td>
			<td>${vo.YP_PI}</td>
		</tr>
	</c:forEach>
</table>