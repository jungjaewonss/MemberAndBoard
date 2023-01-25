<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>     
<!DOCTYPE html>
<html lang="en">
<head>
  <title>SpringMvc2</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript">
	$(document).ready(function(){
  		loadList();
  	});
  
	function loadList(){
		//서버와통신 : 게시판 리스트가져오기
		$.ajax({
			url : "board/all",
			type : "get",
			dataType : "json", //json형식으로 데이터를받겠다
			success: makeView, // callback 함수
			error : function(){alert("error");}
		});
	}
	
	function makeView(data){
		var listHtml = "<table class='table table-bordered'>";
		listHtml+="<tr>";
		listHtml+="<td>번호</td>";
		listHtml+="<td>제목</td>";
		listHtml+="<td>작성자</td>";
		listHtml+="<td>작성일</td>";
		listHtml+="<td>조회수</td>";
		listHtml+="</tr>";
		
		$.each(data, function(index,obj){
			listHtml+="<tr>";
			listHtml+="<td>"+obj.idx+"</td>";
			listHtml+="<td id='t"+obj.idx+"'>"+"<a href='javascript:goContent("+obj.idx+")'>"+obj.title+"</a>"+"</td>";
			listHtml+="<td>"+obj.writer+"</td>";
			listHtml+="<td>"+obj.indate+"</td>";
			listHtml+="<td>"+obj.count+"</td>";
			listHtml+="</tr>";
			
			listHtml+="<tr style='display:none' id='c"+obj.idx+"'>";
			listHtml+="<td>내용</td>";
			listHtml+="<td colspan='4'>";
			listHtml+="<textarea rows='7' class='form-control' id='content"+obj.idx+"' readonly></textarea>";
			listHtml+="</br>"
			
			if(obj.memId == "${mvo.memId}"){
			listHtml+="<span id='ub"+obj.idx+"'><button class='btn btn-primary btn-sm' onclick='goUpdateForm("+obj.idx+")'>수정화면</button></span>&nbsp"
			listHtml+="<button class='btn btn-info btn-sm' onclick='deleteBoard("+obj.idx+")'>삭제하기</button>"
			}
			else{
				listHtml+="<span id='ub"+obj.idx+"'><button disabled class='btn btn-primary btn-sm' onclick='goUpdateForm("+obj.idx+")'>수정화면</button></span>&nbsp"
				listHtml+="<button disabled class='btn btn-info btn-sm' onclick='deleteBoard("+obj.idx+")'>삭제하기</button>"
			}
			listHtml+="</td>"			
			listHtml+="</tr>";
			
			
			
			
			
		});
		if(${!empty mvo}){
		listHtml+="<tr>"
		listHtml+="<td colspan='5'>"		
		listHtml+="<button class='btn btn-primary btn-sm' onclick='writeBoard()'>글쓰기</button>"		
		listHtml+="<td>"
		listHtml+="<tr>"
		listHtml+="</table>"
		}
		$("#view").html(listHtml);
	}
	
	function goUpdateForm(idx){
		
		$("#content"+idx).attr("readonly",false);
		
		var value = $("#t"+idx).text();
		
		var newInput = "<input type='text' id='nt"+idx+"' class='form-control' value="+value+">"
		$("#t"+idx).html(newInput);
					
		var newButton = "<button class='btn btn-primary btn-sm' onclick='updateBoard("+idx+")'>수정하기</button>";
		
		
		$("#ub" + idx).html(newButton);
		
	}
	
	function updateBoard(idx){
		var title = $("#nt"+idx).val();
		var content = 	$("#content"+idx).val();
		var idx = idx;
		
		
		
		$.ajax({
			url : "board/update",
			type : "put",
			contentType:'application/json;charset=utf-8',
			data : JSON.stringify({"title": title , "content" : content , "idx" : idx}),
			success : loadList,
			error : function(){alert('error');}
		});
	}
	
	
	function deleteBoard(idx){
		$.ajax({
			url : "board/"+idx,
			type : "delete",
			success : function(){
				alert("삭제완료");
				loadList();
			},
			error : function(){alert('error');}
		});
	}
	
	function goContent(idx){
		var name = "c"+idx;
		
		
		
		if($("#"+name).css("display") == "none"){
			$("#"+name).css("display" ,"table-row");
			
			$.ajax({
				url : "board/"+idx,
				type : "get",
				dataType : "json",
				success : function(data){
					$("#content"+idx).text(data.content);
				},
				error : function(){alert('errorsssa');}
			});
		}
		else{
			$("#"+name).css("display" ,"none");
			$("#content"+idx).attr("readonly" , true);
			
			
			$.ajax({
				url : "board/count/"+idx,
				type : "put",
				success : loadList,
				error : function(){alert("error");}
			});
		}
		
		
	}
	
	function writeBoard(){
		$("#view").css("display", "none"); //display none
		$("#writeBoard").css("display" , "block"); //display block
	}
	
	function backList(){
		$("#view").css("display" , "block");
		$("#writeBoard").css("display" ,"none");
	}
	
	function goInsert(){
		
		/* var title =  $("#title").val();
		var content= $("#content").val();
		var writer = $("#writer").val(); */
		
		var fData = $("#frm").serialize(); 
		
		$.ajax({
			url : "board/new",
			type : "post",
			data : fData,
			success : function(){
				$("#view").css("display" , "block");
				$("#writeBoard").css("display", "none");
				loadList();
			},
			error : function(){
				alert("error");f
			}
		});
		
		$("#fclear").trigger("click");
		
	}
  	</script>
</head>
<body>
 

<div class="container">
 <jsp:include page="../common/header.jsp"/>
  <h2>재원이 게시판</h2>
  <div class="panel panel-default">
    <div class="panel-heading">Board</div>
    <div class="panel-body" id="view">
    
    </div>
    
    <div class="panel-body" style="display:none" id="writeBoard">
     	
     	<form id="frm">
	    	<table class="table">
	    		<input type="hidden" name="memId" id="memId" value="${mvo.memId}">
	    		<tr>
	    			<td>제목</td>
	    			<td><input type="text" id="title" name="title" class="form-control" "/><</td>
	    		</tr>
	    		
	    		<tr>
	    			<td>내용</td>
	    			<td><textarea row="7" id="content" class="form-control" name="content"></textarea></td>
	    	
	    			<td>작성자</td>
	    			<td><input type="text" id="writer" name="writer" class="form-control" value="${mvo.memName}" readonly/></td>
	    		</tr>
	    		
	    		<tr>
	    			<td colspan="2" align="center" >
	    				<button type="button" class="btn btn-success btn-sm" onclick="goInsert()">등록</button>
	    				<button type="reset" class="btn btn-success btn-sm" id="fclear">취소</button>
	    				<button type="button" class="btn btn-success btn-sm" onclick="backList()">목록보기</button>
	    			</td>
	    		</tr>
	    	</table>
    	</form>
    </div>
    <div class="panel-footer">인프런_스프1탄_정재원</div>
  </div>
</div>

</body>
</html>
    