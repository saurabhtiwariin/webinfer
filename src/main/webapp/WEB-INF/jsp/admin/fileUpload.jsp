<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../../layout/taglib.jsp"%>

<link rel="stylesheet" href="/resources/dist/css/table.css" />

<div>
	<table>
		<thead>
			<tr>
				<th>ACTION</th>
				<th>ID</th>
				<th>URL</th>
				<th>COMMIT ID</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${fileUploads}" var="fileUpload">
				<form:form commandName="fileUpload">
					<tr>
						<td><input type="submit" value="Update"
							class="btn btn-danger" /></td>
						<td><form:input path="id" value="${fileUpload.id }" /></td>
						<form:errors path="id" />

						<td><form:input path="url" value="${fileUpload.url}" /></td>
						<form:errors path="url" />

						<td><form:input path="commit.id"
								value="${fileUpload.commit.id}" /></td>
						<form:errors path="commit.id" />

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
			<li class="${page == i ? 'active' : ''}" ><a href="/admin/fileUpload.html?page=<%= i %>"><%=i+1%></a></li>
			<% 
		}
		%>

		<li><a href="">&raquo;</a></li>
	</ul>	


	
</div>
