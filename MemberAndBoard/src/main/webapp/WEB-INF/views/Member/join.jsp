<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}/" />
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script
	src="https://maxcdfn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script>




	function idcheck() {
		var id = $("#memId").val();

		$.ajax({
			url : "${root}overlapCheck",
			type : "get",
			data : {
				"id" : id
			},
			success : function(data) {
				if (data > 0) {
					$("#checkMEssage").html(
							"<b style='color:red'>이미 사용중인 아이디 입니다.<b>");
					$("#alertHeading").css("background-color", "red");
				} else {
					$("#checkMEssage").html(
							"<b style='color:green'>사용 가능한 아이디 입니다.</b>");
					$("#alertHeading").css("background-color", "green");
				}

				$("#myModal").modal("show");

			},
			error : function() {
				alert("error");
			}
		});

	}

	function passwordCheck() {
		var password1 = $("#memPassword1").val();
		var password2 = $("#memPassword2").val();
		var passwordcheck = "";
			
		    if(password1 != "" && password2 != ""){
			if (password1 != password2) {
				passwordcheck = "<b style='color:red'>비밀번호를 똑같이입력해주세요</b>";
			}
			else{
				passwordcheck = "<b style='color:green'>비밀번호확인완료</b>";
				$("#memPassword").val(password1);
			}
		    }
			$("#passwordcheck").html(passwordcheck);

	}
</script>

</head>
<body>

	<div class="container">
		<jsp:include page="../common/header.jsp" />
		<h2>스프멤브시3</h2>

		<div class="panel panel-default">
			<div class="panel-heading">회원가입</div>

			<div class="panel-body">
				<!-- form Start ================================================= -->
				<form action="${root}memberJoin" method="post" accept-charset="UTF-8">
					<input type="hidden" name="memPassword" id="memPassword" value=""/>
					<input type="hidden" name="memProfile" id="memProfile" value=""/>
					<table class="table table-bordered"
						style="text-align: center; border: 1px solid #dddddd;">
						<tr>
							<td style="width: 100px; vertical-align: middle;">아이디</td>
							<td><input class="form-control" type="text"
								placeholder="아이디를입력하세요" maxlength="20" id="memId" name="memId" /></td>
							<td style="width: 110px">
								<button type="button" class="btn btn-primary btn-sm"
									onclick="idcheck()">중복체크</button>
							</td>
						</tr>

						<tr>
							<td style="width: 100px; vertical-align: middle;">비밀번호</td>
							<td colspan="2"><input class="form-control" type="password"
								onkeyup="passwordCheck()" placeholder="비밀번호를 입력하세요"
								maxlength="20" id="memPassword1" name="memPassword1" /></td>
						</tr>

						<tr>
							<td style="width: 100px; vertical-align: middle;">비밀번호확인</td>
							<td colspan="2"><input class="form-control"
								onkeyup="passwordCheck()" type="password"
								placeholder="비밀번호를 확인하세요" maxlength="20" id="memPassword2"
								name="memPassword2" /></td>
				
						</tr>
						

						<tr>
							<td style="width: 100px; vertical-align: middle;">사용자이름</td>
							<td colspan="2"><input class="form-control" type="text"
								placeholder="이름을 입력하세요" maxlength="20" id="memName"
								name="memName" /></td>
						</tr>

						<tr>
							<td style="width: 100px; vertical-align: middle;">나이</td>
							<td colspan="2"><input class="form-control" type="text"
								placeholder="나이를입력하세요" maxlength="20" id="memAge" name="memAge" /></td>
						</tr>

						<tr>
							<td style="width: 100px; vertical-align: middle;">성별</td>
							<td colspan="2">
								<div class="form-group"
									style="text-align: center; margin: 0 auto;">
									<div class="btn-group" data-toggle="buttons">
    							<input type="radio" autocomplete="off" value="남자" checked  id="memGender" name="memGender" checked/>남자
    							
    							
    							<input type="radio" autocomplete="off" value="여자" id="memGender" name="memGender"/>여자
    							
    						</div>
    						
    					</div>
    				</td>
    			</tr>
    			
    			
    			<tr>
    				<td style="width : 100px ; vertical-align : middle;">이메일</td>
    				<td colspan="2"><input class="form-control" type="text" placeholder="이메일을입력하세요" maxlength="20" id="memEmail" name="memEmail"/></td>
    			</tr>
    			
    			
    		
    			
    			<tr>
    				<td colspan="3" style="text-align : left;">
    					<input type="submit" value="등록" class="btn btn-primary btn-sm pull-right"/>
    					<span id="passwordcheck"></span>
    				</td>
    			</tr>
    			 			
    		</table>
    	</form>   	
    </div>
    
    
    <!-- 다이얼로그창(모달) -->
    <div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header"  id="alertHeading">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">메세지 확인</h4>
      </div>
      <div class="modal-body">
        <p id="checkMEssage"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
 <!--실패 메세지를 출력 -->    
   
    <div id="myMessage" class="modal fade" role="dialog">
  	<div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header"  id="alertHeading">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">${msgType}</h4>
      </div>
      
      <div class="modal-body">
        <p >${msg}</p>
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
    
    
    
     <div class="panel-footer">스프링1탄 정재원</div>
  </div>
</div>

</body>
</html>
