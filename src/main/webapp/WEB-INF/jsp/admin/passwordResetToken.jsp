<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../../layout/taglib.jsp"%>

<link rel="stylesheet" href="/resources/dist/css/table.css" />
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
				<th>USER ID</th>
				<th>TOKEN</th>
				<th>EXPIRY DATE</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${passwordResetTokens}" var="passwordResetToken">

				<form:form commandName="passwordResetToken">
					<tr>
						<td><input type="submit" value="Update" class="btn btn-danger" /></td>
						<td><form:input path="id" value="${passwordResetToken.id }" /></td>
						<form:errors path="id" />

						<td><form:input path="user.id"
								value="${passwordResetToken.user.id}" /></td>
						<form:errors path="user.id" />

						<td><form:input path="token"
								value="${passwordResetToken.token}" /></td>
						<form:errors path="token" />

						<td><form:input path="expiryDate"
								value="${passwordResetToken.expiryDate}" /></td>
						<form:errors path="expiryDate" />

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
			<li class="${page == i ? 'active' : ''}" ><a href="/admin/passwordResetToken.html?page=<%= i %>"><%=i+1%></a></li>
			<% 
		}
		%>

		<li><a href="">&raquo;</a></li>
	</ul>	

	
</div>
