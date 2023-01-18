<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table>
	<thead>
		<tr align="center">
			<td>일자리</td>
		</tr>
	</thead>
	<c:forEach items="${list}" var="scrap_job">
	<tr>
		<td><a href="${scrap_job.scrap_link}">${scrap_job.scrap_title}</a></td>
	</tr>
	</c:forEach>
</table>