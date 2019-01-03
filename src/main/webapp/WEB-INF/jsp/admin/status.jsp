<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../../layout/taglib.jsp"%>

<link rel="stylesheet" href="/resources/dist/css/table.css"/>
 <style>
input {
	width: 348px;
}
</style>
<div>
	<table>
		<thead>
			<tr>
			<th>ACTION</th>
				
				<th>ID</th>
				<th>Name</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${statuses}" var="status">

				<form:form commandName="status">
					<tr>
						<td><input type="submit" value="Update" class="btn btn-danger" /></td>
					
						<td><form:input path="id" value="${status.id }" /></td>
						<form:errors path="id" />

						<td><form:input path="name" value="${status.name}" /></td>
						<form:errors path="name" />

					</tr>
				</form:form>

			</c:forEach>
		</tbody>
	</table>
		<ul class="pagination pagination-sm">
		<li><a href="">&laquo;</a></li>
			
		<%
		int allPages = 0;
		allPages = (Integer)request.getAttribute("allPages"); 
		for(int i = 0;i<allPages;i++){
			%>
			<c:set var="i" value="<%=i%>" />
			<li class="${page == i ? 'active' : ''}" ><a href="/admin/status.html?page=<%= i %>"><%=i+1%></a></li>
			<% 
		}
		%>

		<li><a href="">&raquo;</a></li>
	</ul>	
</div>
