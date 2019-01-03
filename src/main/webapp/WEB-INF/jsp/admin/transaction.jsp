<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../../layout/taglib.jsp"%>

<link rel="stylesheet" href="/resources/dist/css/table.css" />
 <style>
input {
	width: 122px;
}
</style>
<div>
	<table>
		<thead>
			<tr>
				<th>ACTION</th>

				<th>ID</th>
				<th>USER ID</th>
				<th>AMOUNT</th>			
				<th>BALANCE<br>(before transaction)
				</th>
				<th>BALANCE<br>(after transaction)
				</th>
				<th>Date</th>
				<th>REMARK</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${transactions}" var="transaction">

				<form:form commandName="transaction">
					<tr>
						<td><input type="submit" value="Update" class="btn btn-danger" /></td>

						<td><form:input path="id" value="${transaction.id }" /></td>
						<form:errors path="id" />

						<td><form:input path="user.id" value="${transaction.user.id}" /></td>
						<form:errors path="user.id" />

						<td><form:input path="amount" value="${transaction.amount}" /></td>
						<form:errors path="amount" />

						<td><form:input path="balBeforeTran"
								value="${transaction.balBeforeTran}" /></td>
						<form:errors path="balBeforeTran" />

						<td><form:input path="balAfterTran"
								value="${transaction.balAfterTran}" /></td>
						<form:errors path="balAfterTran" />

						<td><form:input path="dateTransaction"
								value="${transaction.dateTransaction}" /></td>
						<form:errors path="dateTransaction" />

						<td><form:input path="remark" value="${transaction.remark}" /></td>
						<form:errors path="remark" />


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
			<li class="${page == i ? 'active' : ''}" ><a href="/admin/transaction.html?page=<%= i %>"><%=i+1%></a></li>
			<% 
		}
		%>

		<li><a href="">&raquo;</a></li>
	</ul>	
</div>
