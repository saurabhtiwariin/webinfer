<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../../layout/taglib.jsp"%>

<link rel="stylesheet" href="/resources/dist/css/table.css"/>
 
<div>
	<table>
		<thead>
			<tr>
				<th>ACTION</th>
				<th>ID</th>
				<th>USER ID</th>
				<th>SUBJECT</th>
				<th>MESSAGE</th>
				<th>CONTACT NO</th>
				<th>Email</th>
				<th>STATUS ID</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${complaints}" var="complaint">

				<form:form commandName="complaint">
					<tr>
						<td><input type="submit" value="Update" class="btn btn-danger" /></td>
				
						<td><form:input path="id" value="${complaint.id }" /></td>
						<form:errors path="id" />

						<td><form:input path="user.id" value="${complaint.user.id}" /></td>
						<form:errors path="user.id" />
						
						<td><form:input path="subject" value="${complaint.subject }" /></td>
						<form:errors path="subject" />
						
						<td><form:input path="message" value="${complaint.message }" /></td>
						<form:errors path="message" />
						
						<td><form:input path="contactNo" value="${complaint.contactNo }" /></td>
						<form:errors path="contactNo" />

						<td><form:input path="email" value="${complaint.email}" /></td>
						<form:errors path="email" />

						<td><form:input path="status.id" value="${complaint.status.id}" /></td>
						<form:errors path="status.id" />


					</tr>
				</form:form>

			</c:forEach>
		</tbody>
	</table>

<ul class="pagination pagination-sm">
		<li><a href="">&laquo;</a></li>
			
		<%
		int allPages = (Integer)request.getAttribute("allPages"); 
		for(int i = 0;i<allPages;i++){
			%>
			<c:set var="i" value="<%=i%>" />
			<li class="${page == i ? 'active' : ''}" ><a href="/admin/complaint.html?page=<%= i %>"><%=i+1%></a></li>
			<% 
		}
		%>

		<li><a href="">&raquo;</a></li>
	</ul>	

</div>
