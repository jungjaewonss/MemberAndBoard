<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8");%>
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

  <script>
	$(document).ready(function(){
		if(!${empty msg}){
			alert("${msg}");
		}
	});
  
  </script>
  
</head>
<body>


  
<div class="container">
<jsp:include page="common/header.jsp"/>
  
  <c:if test="${empty mvo}">
  <h3>비로그인님환영합니다</h3>
  </c:if>
  
  
  
  
   
  
  <div class="panel panel-default">
    <div>  	
    	<img src="${root}resources/img/show.jpg" style="width:100%; height:300px;"/>  
    </div>
    <div class="panel-body">
     <ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" href="#home">Home</a></li>
  <li><a data-toggle="tab" href="#menu1">게시판</a></li>
  <li><a data-toggle="tab" href="#menu2">공지사항</a></li>
</ul>

<div class="tab-content">
  <div id="home" class="tab-pane fade in active">
    <h3>HOME</h3>
    <p>Some content.</p>
  </div>
  <div id="menu1" class="tab-pane fade">
    <h3>게시판</h3>
    <p>Some content in menu 1.</p>
  </div>
  <div id="menu2" class="tab-pane fade">
    <h3>공지사항</h3>
    <p>Some content in menu 2.</p>
  </div>
</div>
    
    </div>
     <div class="panel-footer">스프링1탄 정재원</div>
  </div>
</div>

</div>

</body>
</html>
    