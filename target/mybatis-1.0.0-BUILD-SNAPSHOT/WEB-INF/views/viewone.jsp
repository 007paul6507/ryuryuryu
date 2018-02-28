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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script>
function button_click(str){
	if(str=="mod")haha.action='update_index';
	else if(str=="del")haha.action='delete';
	else{
		haha.method='GET';
		haha.action='listPage';
	}
}
</script>

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
<form name="haha" method="post">
<table width = 100% align = center>
<input type="hidden" value="${boardVO.id}" name="id">
<input type="hidden" value="${cri.page}" name="page">
<input type="hidden" value="${cri.perPageNum}" name="perPageNum">
<tr>
	<td width = 80%></td>
	<td width =5% align = right><button type="button" class = "btn btn-primary">댓글</button></td>
	<td width =5% align = right><button type="submit" class = "btn btn-primary" onClick='button_click("mod")'>수정</button></td>
	<td width =5% align = right><button type="submit" class = "btn btn-primary" onClick='button_click("del")'>삭제</button></td>
	<td width =5% align = right><button type="submit" class = "btn btn-primary" onClick='button_click("list")'>목록</button></td>	
</tr>
</table>
</form>


	<div class="row">
		<div class="col-md-12">

			<div class="box box-success">
				<div class="box-header">
					<h2 class="box-title">댓글작성</h2>
				</div>
				<div class="box-body">
					<label for="exampleInputEmail1">작성자</label> <input
						class="form-control" type="text" placeholder="USER ID"
						id="newReplyWriter"> <label for="exampleInputEmail1">댓글 내용
						Text</label> <input class="form-control" type="text"
						placeholder="REPLY TEXT" id="newReplyText">

				</div>
				<br>
				<!-- /.box-body -->
				<div class="box-footer">
					<button type="button" class="btn btn-primary" id="replyAddBtn">댓글 작성</button>
				</div>
			</div>

			<br>
			
			<!-- The time line -->
			<ul class="timeline">
				<!-- timeline time label -->
				<button type="button" class="btn btn-primary btn-xs" id="repliesDiv">
						댓글 보기</button>
			</ul>

			<div class='text-center'>
				<ul id="pagination" class="pagination pagination-sm no-margin ">

				</ul>
			</div>

		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->


          
<!-- Modal -->
<div id="modifyModal" class="modal modal-primary fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"></h4>
      </div>
      <div class="modal-body" data-rno>
        <p><input type="text" id="replytext" class="form-control"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-info" id="replyModBtn">Modify</button>
        <button type="button" class="btn btn-danger" id="replyDelBtn">DELETE</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>      
	
<script id="template" type="text/x-handlebars-template">
{{#each .}}
<li class="replyLi" data-rno={{rno}}>
<i class="fa fa-comments bg-blue"></i>
 <div class="timeline-item" >
  <span class="time">
    <i class="fa fa-clock-o"></i>{{prettifyDate regdate}}
  </span>
  <h1 class="timeline-header">{{rno}} -{{replyer}}</h1>
  <div class="timeline-body">{{replytext}} </div>
    <div class="timeline-footer">
     <a class="btn btn-primary btn-xs" 
	    data-toggle="modal" data-target="#modifyModal">댓글 수정</a>
    </div>
  </div>			
</li>
{{/each}}
</script>

<script>
	Handlebars.registerHelper("prettifyDate", function(timeValue) {
		var dateObj = new Date(timeValue);
		var year = dateObj.getFullYear();
		var month = dateObj.getMonth() + 1;
		var date = dateObj.getDate();
		return year + "/" + month + "/" + date;
	});

	var printData = function(replyArr, target, templateObject) {

		var template = Handlebars.compile(templateObject.html());

		var html = template(replyArr);
		$(".replyLi").remove();
		target.after(html);

	}

	var id = ${boardVO.id};
	
	var replyPage = 1;

	function getPage(pageInfo) {

		$.getJSON(pageInfo, function(data) {
			printData(data.list, $("#repliesDiv"), $('#template'));
			printPaging(data.pageMaker, $(".pagination"));

			$("#modifyModal").modal('hide');

		});
	}

	var printPaging = function(pageMaker, target) {

		var str = "";

		if (pageMaker.prev) {
			str += "<li><a href='" + (pageMaker.startPage - 1)
					+ "'> << </a></li>";
		}

		for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
			var strClass = pageMaker.cri.page == i ? 'class=active' : '';
			str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
		}

		if (pageMaker.next) {
			str += "<li><a href='" + (pageMaker.endPage + 1)
					+ "'> >> </a></li>";
		}

		target.html(str);
	};

	$("#repliesDiv").on("click", function() {

		if ($(".timeline li").size() > 1) {
			return;
		}
		getPage("/mybatis/replies/" + id + "/1");

	});
	

	$(".pagination").on("click", "li a", function(event){
		
		event.preventDefault();
		
		replyPage = $(this).attr("href");
		
		getPage("/mybatis/replies/"+id+"/"+replyPage);
		
	});
	

	$("#replyAddBtn").on("click",function(){
		 
		 var replyerObj = $("#newReplyWriter");
		 var replytextObj = $("#newReplyText");
		 var replyer = replyerObj.val();
		 var replytext = replytextObj.val();
		
		  
		  $.ajax({
				type:'post',
				contentType : "application/json; charset=utf-8",
				url:'/mybatis/replies/',
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "POST" },
				dataType:'text',
				data: JSON.stringify({id:id, replyer:replyer, replytext:replytext}),
				success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("등록 되었습니다.");
						replyPage = 1;
						getPage("/mybatis/replies/"+id+"/"+replyPage );
						replyerObj.val("");
						replytextObj.val("");
					}
			}});
	});


	$(".timeline").on("click", ".replyLi", function(event){
		
		var reply = $(this);
		
		$("#replytext").val(reply.find('.timeline-body').text());
		$(".modal-title").html(reply.attr("data-rno"));
		
	});
	
	

	$("#replyModBtn").on("click",function(){
		  
		  var rno = $(".modal-title").html();
		  var replytext = $("#replytext").val();
		  
		  $.ajax({
				type:'put',
				url:'/replies/'+rno,
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "PUT" },
				data:JSON.stringify({replytext:replytext}), 
				dataType:'text', 
				success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("수정 되었습니다.");
						getPage("/mybatis/replies/"+id+"/"+replyPage );
					}
			}});
	});

	$("#replyDelBtn").on("click",function(){
		  
		  var rno = $(".modal-title").html();
		  var replytext = $("#replytext").val();
		  
		  $.ajax({
				type:'delete',
				url:'/replies/'+rno,
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "DELETE" },
				dataType:'text', 
				success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("삭제 되었습니다.");
						getPage("/mybatis/replies/"+id+"/"+replyPage );
					}
			}});
	});
	
</script>
</body>
</html>