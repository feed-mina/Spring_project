<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 
	EL(Expression Language) 이란?
	session 이나 request 내장 객체에 등록된 데이터를 JSP 파일에서 접근하기 위한 표현식
-->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>글 상세</title>
</head>
<body>
	<center>
		<h1>글 상세</h1>
		<hr>
		<form action="updateBoard.do" method="post">
		<input type="hidden" name="seq" value="${board.seq }"/>
		<table border="1" cellpadding="0" cellspacing="0">
			<tr>
				<td bgcolor="orange" width="70">제목</td>
				<td align="left"><input name="title" type="text" value="${board.title }" /></td>
			</tr>
			<tr>
				<td bgcolor="orange">작성자</td>
				<td align="left">${board.writer }</td>
			</tr>
			<tr>
				<td bgcolor="orange">내용</td>
				<td align="left"><textarea name="content" cols="40" rows="10">${board.content }</textarea></td>
			</tr>
			<tr>
				<td bgcolor="orange">등록일</td>
				<td align="left">${board.regDate }</td>
			</tr>
			<tr>
				<td bgcolor="orange">조회수</td>
				<td align="left">${board.cnt }</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<input type="submit" value="글수정" /></td>
			</tr>
		</table>
		</form>
		<hr>
		<a href="insertBoard.do">글등록</a>&nbsp;&nbsp;&nbsp;
		<a href="deleteBoard.do?seq=${board.seq }">글삭제</a>&nbsp;&nbsp;&nbsp;
		<a href="getBoardList.do">글목록</a>
	</center>
</body>
</html>