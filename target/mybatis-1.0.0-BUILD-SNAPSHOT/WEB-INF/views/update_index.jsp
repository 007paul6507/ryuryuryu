<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*, javax.sql.*, java.io.*,java.text.SimpleDateFormat,java.util.Date" %>
<% request.setCharacterEncoding("utf-8"); %>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script>
function button_click(str){	<!--한개의 폼에서 두군데로 액션을 하기위해 만든 메소드-->
	if(str=="mod") recForm.action='update_write';
	else{
		recForm.method='GET';
		recForm.action='listPage';
	}
}
</script>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
    <script type="text/javascript">
        $(function() { <!--미리 보기용 메소드-->
            $("#imgInp").on('change', function(){
                readURL(this);
            });
        });

        function readURL(input) {
            if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                    $('#blah').attr('src', e.target.result);
                }

              reader.readAsDataURL(input.files[0]);
            }
        }
</script>
</head>
<body>
<title>글 수정</title>
<div class="container">
	<h1>석승 게시판</h1>
	<form method="post" name="recForm">
	<input type="hidden" value="${cri.page}" name="page">
	<input type="hidden" value="${cri.perPageNum}" name="perPageNum">
	<table class="table talbe-hover table-bordered">
		<tr>
			<td width = 100 align = center>번호</td>
			<td width = 700 align = left> <input type = "hidden" value = "${boardVO.id}" class="form-control" name="id">${boardVO.id}</td><!--번호는 자동 생성-->
		</tr>
		<tr>
			<td width = 100 align = center>제목</td>
			<td width = 700 align = left><input type = "text" name = "title" class="form-control" value="${boardVO.title}" maxlength = "70" required></td><!--제목 입력 70자 제한-->
		</tr>
		<tr>
			<td width = 100 align = center>내용</td>
			<td width = 700 align = left>
			<textarea body style="resize:none;width:100%; overflow-x:hidden; overflow-y:auto;" class="form-control" name= content cols=85 rows=15 required>${boardVO.content}</textarea></td>
			<!--스크롤바 없애기 및 텍스트 박스 임의 조절 방지, 늘어날시 스크롤바 자동 생성, 글자수 지정-->
		</tr>
		<tr>
			<td width = 100 align = center>첨부 파일</td>
			<td width = 700 align = left>
			<input type='file' class="form-control" name = "file1"/><br> <!--파일 전송 파라메터-->
			<input type='file' class="form-control" name = "file2"/><br> <!--파일 전송 파라메터-->
			<input type='file' class="form-control" name = "file3"/><br> <!--파일 전송 파라메터-->
			</td>
		</tr>
		</table>
		<br>
		<table width = 100% align = center>
		<tr>
			<td width = 90%></td>
			<td width = 5%  align = right><button type="submit" class = "btn btn-primary" onClick='button_click("list")'>목록</button></td>	
			<td width = 5% align = right><button type="submit" class = "btn btn-primary" onClick='button_click("mod")'>수정</button></td>
		</tr>
		</table>
	</form>
</div>
</body>
</html>