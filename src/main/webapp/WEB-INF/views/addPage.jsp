<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	label{
		width: 100px;
		float: left;
	}

	input{
		margin-bottom: 2% !important;
	}
	
	textarea {
		margin-bottom: 2% !important;
	}
	
	select{
		margin-bottom: 2% !important;
	}
	
	input[type='submit'], input[type='reset']{
		width: 100px;
		
	} 
</style>
</head>
<body>
	<jsp:include page="${pageContext.request.contentType}/WEB-INF/views/include/header.jsp"/>
	
	<div id="mainDiv">
		<div class="row">
			<div class="col-lg-7 col-lg-offset-4 col-md-7 col-md-offset-4" id="contentDiv">
				<form action="addProject" method="post">
					<label>프로젝트 이름</label> <input type="text" name="name"><br>
					<label>프로젝트 내용</label> <textarea rows="10" cols="50" name="content"></textarea><br>
					<label>시작날짜</label> <input type="text" name="start" placeholder="ex)2018-03-20"><br>
					<label>종료날짜</label> <input type="text" name="end" placeholder="ex)2018-03-21"><br>
					<label>상태</label>
					<select name="ing">
						<option>준비</option>
						<option>진행중</option>
						<option>종료</option>
						<option>보류</option>
					</select><br>
					<input class="btn btn-primary" type="submit" value="저장">
					<input class="btn btn-danger" type="reset" value="취소">
				</form>
			</div>
		</div>
	</div>
	
	<jsp:include page="${pageContext.request.contentType}/WEB-INF/views/include/footer.jsp"/>
</body>
</html>