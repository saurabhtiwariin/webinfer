<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../../layout/taglib.jsp"%>

<link rel="stylesheet" href="/resources/dist/css/table.css" />
  <style>
input {
	width: 90px;
}
</style>

<script type="text/javascript">
	$(document).ready(function() {
		$(".triggerRemove").click(function(e) {
			e.preventDefault();
			$("#modalRemove .removeBtn").attr("href", $(this).attr("href"));
			$("#modalRemove").modal();
		});

	});
</script>

<div>
	<table>
		<thead>
			<tr>
				<th colspan="3">ACTION</th>
				<th>ID</th>
				<th>AMOUNT</th>
				<th>Original AMOUNT</th>
				<th>STATUS ID</th>
				<th>USER ID</th>
				<th>Request Date</th>
				<th>CONFIRMATION DATE</th>
				<th>Born</th>

			</tr>
		</thead>
		<tbody>
			<c:forEach items="${accepts}" var="accept">

				<form:form commandName="accept">
					<tr>
						<td><input type="submit" value="Update"
							class="btn btn-danger" /></td>
						<td><a
							href='<spring:url value="/admin/deleteAccept/${accept.id}.html"/>'
							class="btn btn-danger triggerRemove">Delete</a></td>
						<td><a
							href='<spring:url value="/admin/addNewAccept/${accept.id}.html"/>'
							class="btn btn-info">ADD</a></td>

						<td><form:input path="id" value="${accept.id }" /></td>
						<form:errors path="id" />

						<td><form:input path="amount" value="${accept.amount}" /></td>
						<form:errors path="amount" />


						<td><form:input path="originalAmount"
								value="${accept.originalAmount}" /></td>
						<form:errors path="originalAmount" />

						<td><form:input path="status.id" value="${accept.status.id}" /></td>
						<form:errors path="status.id" />

						<td><form:input path="user.id" value="${accept.user.id}" /></td>
						<form:errors path="user.id" />

						<td><form:input path="reqDate" value="${accept.reqDate}" /></td>
						<form:errors path="reqDate" />

						<td><form:input path="confDate" value="${accept.confDate}" /></td>
						<form:errors path="confDate" />

						<td><form:input path="born" value="${accept.born}" /></td>
						<form:errors path="born" />

					</tr>
				</form:form>

			</c:forEach>
		</tbody>
	</table>

	<ul class="pagination pagination-sm">
		<li><a href="">&laquo;</a></li>

		<%
			int allPages = (Integer) request.getAttribute("allPages");
			for (int i = 0; i < allPages; i++) {
		%>
		<c:set var="i" value="<%=i%>" />
		<li class="${page == i ? 'active' : ''}"><a
			href="/admin/accept.html?page=<%=i%>"><%=i + 1%></a></li>
		<%
			}
		%>

		<li><a href="">&raquo;</a></li>
	</ul>
</div>
<!-- Modal -->
<div class="modal fade" id="modalRemove" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">Delete Withdrawl</h4>
			</div>
			<div class="modal-body">Really delete?</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
				<a href="" class="btn btn-danger removeBtn">Delete</a>
			</div>
		</div>
	</div>
</div>
