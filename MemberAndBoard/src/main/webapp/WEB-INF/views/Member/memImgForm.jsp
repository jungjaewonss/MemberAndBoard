<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <c:set var="root" value="${pageContext.request.contextPath}/"/>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<script>
		if(${!empty msg}){
			var msg = "${msg}";
			alert(msg);
		}
				
</script>
<body>

<div class="container">
  <jsp:include page="../common/header.jsp"/> <!-- ../common 을한이유는현재폴더를빠져나와서 커몬폴더로 들어가야하기때문이다.-->
  <h2>스프멤브시3</h2>
  
  <div class="panel panel-default">
    <div class="panel-heading">프로필등록</div>
    <div class="panel-body">
  
    <form action="${root}memImgUpdate" method="post" enctype="multipart/form-data">
    	
    	<input type ="hidden" name="memId" value="${mvo.memId}">
    	
    	<table class="table table-bordered" style="text-align : center; boarder : 1px solid black">
    		<tr>
    			<td style ="width:110px; vertical-align : middle">아이디</td>
    			<td>${mvo.memId}</td>
    		</tr>
    		
    		<tr>
    			<td style="width:110px; vertical-align : middle"" >사진업로드</td>
    			<td colspan="2">
    			<span class="btn btn-default">
    				이미지를 업로드하세요. <input type ="file" name="memProfile"/>
    			</span>
    			
    			</td>
    		</tr>
    		
    		<tr>
    			<td colspan="2" style="text-align:left;">
    				<input type="submit" class="btn btn-primary byn-sm pull-right"  value="등록"/>
    			</td>
    		
    		</tr>
    	</table>
    	
    </form>
    
    </div>
     <div class="panel-footer">스프링1탄 정재원</div>
  </div>
</div>


</body>
</html>
