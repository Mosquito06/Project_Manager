<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
<script>
	$(function(){
		$("input[type='reset']").click(function(){
			var target = $(this).attr("data-back");
			location.href = "${pageContext.request.contextPath}/readProject/" + Number(target);;
		})
	})
</script>
</head>
<body>
	<jsp:include page="${pageContext.request.contentType}/WEB-INF/views/include/header.jsp"/>
	
	<div id="mainDiv">
		<div class="row">
			<div class="col-lg-7 col-lg-offset-4 col-md-7 col-md-offset-4" id="contentDiv">
				<form action="${pageContext.request.contextPath }/upProject" method="post">
					<input type="hidden" name="num" value="${project.num }">
					<label>프로젝트 이름</label> <input type="text" name="name" value="${project.name }"><br>
					<label>프로젝트 내용</label> <textarea rows="10" cols="50" name="content">${project.content }</textarea><br>
					
					<label>시작날짜</label> <input type="text" name="start" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${project.startdate }"/>'><br>
					<label>종료날짜</label> <input type="text" name="end" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${project.enddate }"/>'><br>
					<label>상태</label>
					<select name="ing">
						<option ${project.ing == '준비'? 'selected' : '' }>준비</option>
						<option ${project.ing == '진행중'? 'selected' : '' }>진행중</option>
						<option ${project.ing == '종료'? 'selected' : '' }>종료</option>
						<option ${project.ing == '보류'? 'selected' : '' }>보류</option>
					</select><br>
					<input class="btn btn-primary" type="submit" value="수정">
					<input data-back="${project.num }" class="btn btn-danger" type="reset" value="취소">
				</form>
			</div>
		</div>
	</div>
	
	<jsp:include page="${pageContext.request.contentType}/WEB-INF/views/include/footer.jsp"/>
</body>
</html>