<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<title>글 조회</title>
</head>
<body>
<div class="container">
	<h1>석승 게시판</h1>
<br><br>
<table class="table talbe-hover table-bordered">
<tr>
	<td width = 100 align = center>제목</td>
	<td width = 600 align = left colspan =3>&nbsp;${boardVO.title}</td>
	<!--div를 사용하여 칸을 넘어갈 경우 자동 줄바꿈, 제목 출력-->
</tr>
<tr>
	<td width = 100 align = center>일자</td>
	<td width = 200 align = left>&nbsp;${boardVO.date}</td>
	<td width = 100 align = center>조회 수</td>
	<td width = 200 align = left>&nbsp;${boardVO.cnt}</td>
	<!--날짜 정보 출력-->
</tr>
<tr>
	<td width = 100 align = center>내용</td>
	<td width = 600 align = left colspan =3>&nbsp;${boardVO.content}<br>
</td>
	<!--내용 출력-->
</tr>
<tr>
					<td width = 100 align = center>첨부 파일</td>
					<td width = 600 align = left colspan =3>&nbsp;첨부 파일 없음</td>
				</tr>
</table>
<br>
<table width = 100% align = center>
<tr>
	<td width = 80%></td>
	<td width =5% align = right><input type="button" class = "btn btn-primary" value="댓글"></td>
	<td width =5% align = right><a href='update_index?id=${boardVO.id}'><input type="button" class = "btn btn-primary" value="수정"></a></td>
	<td width =5% align = right><a href='delete?id=${boardVO.id}'><input type="button"  class = "btn btn-primary"value="삭제"></a></td>
	<td width =5% align = right><a href='list'><input type="button"  class = "btn btn-primary" value="목록"></a></td>	

</tr>
</table>
</div>
</body>
</html>