<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div#mainDiv{
		min-height: 500px;
	}
	
	table, table th{
		text-align: center !important;
	}
	
	div#addDiv{
		margin-bottom: 2%;
	}
	
	div#pageDiv{
		text-align: center;
	}
	
</style>
<script>

</script>
</head>
<body>
	<jsp:include page="${pageContext.request.contentType}/WEB-INF/views/include/header.jsp"/>
	
	<div id="mainDiv">
		<div class="row" id="addDiv">
			<div class="col-lg-3 col-lg-offset-8 col-md-3 col-md-offset-8">
				<a href="addProject">새 프로젝트 등록</a>
			</div>	
		</div>
		<div class="row">
			<div class="col-lg-7 col-lg-offset-2 col-md-7 col-md-offset-2" id="tableDiv">
				<table class="table table-bordered table-hover">
				    <thead>
				      <tr>
				        <th>프로젝트 이름</th>
				        <th>시작날짜</th>
				        <th>종료날짜</th>
				        <th>상태</th>
				      </tr>
				    </thead>
				    <tbody>
				      <c:forEach var="project" items="${list }">
				      	<tr>
				      		<td><a href="readProject/${project.num }${pageMake.makeSearch(pageMake.cri.page) }">${project.name }</a></td>
				      		<td> 
				      			<fmt:formatDate pattern="yyyy-MM-dd" value="${project.startdate }"/>
				      		</td>
				      		<td>
				      			<fmt:formatDate pattern="yyyy-MM-dd" value="${project.enddate }"/>
				      		</td>
				      		<td>${project.ing }</td>
				      	</tr>
				      </c:forEach>
				    </tbody>
	 			 </table>		
			</div>
		</div>
		<div class="row" id="pageDiv">
			<div class="col-lg-12 col-md-12">
				<ul class="pagination">
					<c:if test="${pageMaker.prev }">
						<li><a href="${pageMaker.makeQuery(pageMaker.startPage - 1) }">&laquo;</a></li>
					</c:if>
					<c:forEach var="idx" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
						<li ${pageMaker.cri.page == idx? 'class=active' : '' }><a href="${pageMaker.makeQuery(idx) }">${idx }</a></li>
					</c:forEach>
					<c:if test="${pageMaker.next }">
						<li><a href="${pageMaker.makeQuery(pageMaker.endPage + 1 ) }">&raquo;</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
	
	<jsp:include page="${pageContext.request.contentType}/WEB-INF/views/include/footer.jsp"/>
</body>
</html>