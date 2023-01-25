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
    <div class="panel-heading">로그인화면</div>
    <div class="panel-body">
    <form action="${root}memLogin" method="post">
    	<table class="table table-bordered" style="text-align : center; boarder : 1px solid black">
    		<tr>
    			<td style ="width:110px; vertical-align : middle">아이디</td>
    			<td><input type ="text" id="memId" name="memId" class="form-control" mexlength="20"/></td>
    		</tr>
    		
    		<tr>
    			<td style="width:110px; vertical-align : middle"" >비밀번호</td>
    			<td><input type="password" id="memPassword" name="memPassword" class="form-control" mexlength="20"/></td>
    		</tr>
    	</table>
    	<input type="submit" value="로그인"/>
    </form>
    
    </div>
     <div class="panel-footer">스프링1탄 정재원</div>
  </div>
</div>


</body>
</html>
