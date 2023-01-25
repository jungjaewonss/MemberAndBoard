<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}/"/>

<<style>
	#profileBoarder{
		border-radius: 25px;
	}
</style>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
   
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="${root}">연습사이트</a>
    </div>
    
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="${root}">Home</a></li>
        
        <li><a href="boardMain.do">게시판</a></li>
        <li><a href="#">Page 2</a></li>
       
      </ul>
     <c:if test="${empty mvo}">
      <ul class="nav navbar-nav navbar-right">
            <li><a href="${root}memLoginForm"><span class="glyphicon glyphicon-log-in"></span>로그인</a></li>
            <li><a href="${root}memJoin"><span class="glyphicon glyphicon-user">회원가입</a></li>
          </ul>
        
      </ul>
     </c:if> 
      
      
      <c:if test="${!empty mvo}">
      <ul class="nav navbar-nav navbar-right">         	       	        
            <li><a href="${root}memUpdateForm"><span class="glyphicon glyphicon-wrench">회원정보수정</a></li>
            <li><a href="${root}memImgForm"><span class="glyphicon glyphicon-picture">프로필사진등록</a></li>
            <li><a href="${root}memLogout"><span class="glyphicon glyphicon-log-out">로그아웃</a></li>      
     
     		<c:if test="${!empty mvo}">
   
   	<c:if test="${mvo.memProfile eq ''}">
   		<li><img src="${root}resources/img/pepol.jpg" style='width:50px; height:50px;' id="profileBoarder"/><span  style="color:white";> &nbsp ${mvo.memName}님 </span></li>
   	</c:if>
   	
   	<c:if test="${mvo.memProfile ne ''}">
   		<li><img src="${root}resources/upload/${mvo.memProfile}" style='width:50px; height:50px;' id="profileBoarder"/><span style="color:white";>&nbsp ${mvo.memName} 님<span></span></li>  
   	</c:if>
  </c:if>
     
      </ul>
     </c:if> 
    </div>
  </div>
</nav>