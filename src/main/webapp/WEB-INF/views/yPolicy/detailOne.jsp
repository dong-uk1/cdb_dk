<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table>
	<c:forEach items="${list}" var="vo">
		<tr>
			<td>정책아이디</td>
			<td>${vo.YP_ID}</td>
			<td><button>스크랩</button></td>
		</tr>
		<tr>
			<td>정책명</td>
			<td>${vo.YP_NAME}</td>
		</tr>
		<tr>
			<td>조회수</td>
			<td>${vo.YP_VIEW}</td>
		</tr>
		<tr>
			<td>기관구분</td>
			<td>${vo.YP_PI}</td>
		</tr>
		<tr>
			<td>지역</td>
			<td>${vo.YP_REGION}</td>
		</tr>
		<tr>
			<td>정책유형</td>
			<td>${vo.YP_CATEGORY}</td>
		</tr>
		<tr>
			<td>정책소개</td>
			<td>${vo.YP_CONTENT}</td>
		</tr>
		<tr>
			<td>지원규모</td>
			<td>${vo.YP_SSIZE}</td>
		</tr>
		<tr>
			<td rowspan="6">참여요건</td>
		</tr>
		<tr>
			<td>${vo.YP_RQMAGE}</td>
		</tr>
		<tr>
			<td>${vo.YP_RQMJOB}</td>
		</tr>
		<tr>
			<td>${vo.YP_RQMEDU}</td>
		</tr>
		<tr>
			<td>${vo.YP_RQMMAJR}</td>
		</tr>
		<tr>
			<td>${vo.YP_RQMFIELD}</td>
		</tr>
		<tr>
			<td>신청기관</td>
			<td>${vo.YP_AI}</td>
		</tr>
		<tr>
			<td>신청기간</td>
			<td>${vo.YP_PERIOD}</td>
		</tr>
		<tr>
			<td>신청절차</td>
			<td>${vo.YP_PROCEDURE}</td>
		</tr>
		<tr>
			<td>심사발표</td>
			<td>${vo.YP_ANM}</td>
		</tr>
		<tr>
			<td>사이트 링크</td>
			<td>${vo.YP_URL}</td>
		</tr>
	</c:forEach>
</table>
