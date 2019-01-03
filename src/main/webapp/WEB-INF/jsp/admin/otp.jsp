<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../../layout/taglib.jsp"%>

<link rel="stylesheet" href="/resources/dist/css/table.css" />
 <style>
input {
	width: 125px;
}
</style>
<div>
	<table>
		<thead>
			<tr>
				<th>ACTION</th>
				<th>ID</th>
				<th>OTP</th>
				<th>EXPIRY DATE</th>
				<th>VERIFIED</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${otps}" var="otp">

				<form:form commandName="otp">
					<tr>
						<td><input type="submit" value="Update" class="btn btn-danger" /></td>
						<td><form:input path="id" value="${otp.id }" /></td>
						<form:errors path="id" />

						<td><form:input path="otp" value="${otp.otp}" /></td>
						<form:errors path="otp" />

						<td><form:input path="expiryDate" value="${otp.expiryDate}" /></td>
						<form:errors path="expiryDate" />

						<td><form:input path="verified" value="${otp.verified}" /></td>
						<form:errors path="verified" />

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
			<li class="${page == i ? 'active' : ''}" ><a href="/admin/otp.html?page=<%= i %>"><%=i+1%></a></li>
			<% 
		}
		%>

		<li><a href="">&raquo;</a></li>
	</ul>	

	
</div>
