<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
	div#mainDiv{
		min-height: 500px;
	}
	
	table, table th{
		text-align: center !important;
	}
	
	div#btnDiv{
		text-align: center !important;
	}
</style>
<script>
	$(function(){
		$("button:eq(0)").click(function(){
			var target = $(this).attr("data-up");
			location.href= "${pageContext.request.contextPath}/upProject/" + Number(target);
		})
		
		
		$("button:eq(1)").click(function(){
			var check =  confirm("삭제하시겠습니까?");

			if(check){
				var target = $(this).attr("data-del");
				location.href= "${pageContext.request.contextPath}/delProject/" + Number(target);
			}
			
		})
		
		$("button:eq(2)").click(function(){
			location.href= "${pageContext.request.contextPath}/" ;
		})
	})
</script>
</head>
<body>
	<jsp:include page="${pageContext.request.contentType}/WEB-INF/views/include/header.jsp"/>
	
	<div id="mainDiv">
		<div class="row">
			<div class="col-lg-7 col-lg-offset-3 col-md-7 col-md-offset-3" id="contentDiv">
				<table class="table table-bordered">
				    <tbody>
				      <tr>
			      		<th>프로젝트 이름</th>
			      		<td>${project.name }</td>
			      	  <tr>
			      	  <tr>
			      		<th>프로젝트 내용</th>
			      		<td>${project.content }</td>
			      	  <tr>
			      	  <tr>
			      		<th>시작 날짜</th>
			      		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${project.startdate }"/></td>
			      	  <tr>
			      	  <tr>
			      		<th>종료 날짜</th>
			      		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${project.enddate }"/></td>
			      	  <tr>
			      	  <tr>
			      		<th>프로젝트 이름</th>
			      		<td>${project.ing }</td>
			      	  <tr>
				    </tbody>
	 			 </table>			
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12 col-md-12" id="btnDiv">
				<button data-up="${project.num }"class="btn btn-primary">수정</button>
				<button data-del="${project.num }" class="btn btn-danger">삭제</button>
				<button class="btn btn-warning">돌아가기</button>
			</div>
		</div>
	</div>
	
	<jsp:include page="${pageContext.request.contentType}/WEB-INF/views/include/footer.jsp"/>
</body>
</html>