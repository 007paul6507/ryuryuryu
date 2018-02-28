<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<title>석승 게시판</title>
</head>
<body>
<div class="container">
<h1>석승 게시판</h1>
	
    <table class="table table-hover">
            <tr>
                <th width =50>번호</th>
                <th width =200>제목</th>
                <th width =150>날짜</th>
                <th width =100>조회수</th>
                
            </tr>
            <c:forEach items="${boardList}" var="board">
                <tr>
                    <td width =50>${board.id}</td>
                    <td width =200><a href ='viewone?id=${board.id}'>${board.title}</a></td>
                    <td width =150>${board.date}</td>
                    <td width =100>${board.cnt}</td>
                </tr>
            </c:forEach>
    </table>
    <br><br>
    <table align=center width=100%>
        <tr>
        	<td align=right><a href='index'><input type="button" class = "btn btn-primary" value="새 글"></a></td>
        </tr>
    </table>
</div>
</body>
</html>