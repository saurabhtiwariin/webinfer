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
				<th>ACCOUNT HOLDER NAME</th>
				<th>ACCOUNT NO</th>
				<th>ACCOUNT TYPE</th>
				<th>BRANCH</th>
				<th>IFSC</th>
				<th>BANKNAME</th>
				<th>CARD NO</th>
				<th>USER ID</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${bankDetailsList}" var="bankDetails">
				<form:form commandName="bankDetails">
					<tr>
						<td><input type="submit" value="Update" class="btn btn-danger" /></td>

						<td><form:input path="id" value="${bankDetails.id }" /></td>
						<form:errors path="id" />

						<td><form:input path="accountNo"
								value="${bankDetails.accountNo }" /></td>
						<form:errors path="accountNo" />

						<td><form:input path="bankName"
								value="${bankDetails.bankName }" /></td>
						<form:errors path="bankName" />

						<td><form:input path="accountType"
								value="${bankDetails.accountType }" /></td>
						<form:errors path="accountType" />

						<td><form:input path="accountHolderName"
								value="${bankDetails.accountHolderName }" /></td>
						<form:errors path="accountHolderName" />

						<td><form:input path="bankBranch"
								value="${bankDetails.bankBranch }" /></td>
						<form:errors path="bankBranch" />

						<td><form:input path="bankIFSC"
								value="${bankDetails.bankIFSC }" /></td>
						<form:errors path="bankIFSC" />

						<td><form:input path="cardNo" value="${bankDetails.cardNo }" /></td>
						<form:errors path="cardNo" />

						<td><form:input path="user.id" value="${bankDetails.user.id}" /></td>
						<form:errors path="user.id" />

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
			<li class="${page == i ? 'active' : ''}" ><a href="/admin/bankDetails.html?page=<%= i %>"><%=i+1%></a></li>
			<% 
		}
		%>

		<li><a href="">&raquo;</a></li>
	</ul>	

</div>
