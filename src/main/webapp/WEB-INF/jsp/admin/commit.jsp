<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../../layout/taglib.jsp"%>

<link rel="stylesheet" href="/resources/dist/css/table.css" />

<script type="text/javascript">
	$(document).ready(function() {
		$(".triggerRemove").click(function(e) {
			e.preventDefault();
			$("#modalRemove .removeBtn").attr("href", $(this).attr("href"));
			$("#modalRemove").modal();
		});

	});
</script>

<style>
input {
	width: 85px;
}
</style>
<div>
	<table>
		<thead>
			<tr>
				<th colspan="3">ACTIONS</th>
				<th>ID</th>
				<th>AMOUNT</th>
				<th>Original AMOUNT</th>
				<th>STATUS ID</th>
				<th>ACCEPT ID</th>
				<th>USER ID</th>
				<th>Life time</th>
				<th>COMMIT DATE</th>
				<th>Linked DATE</th>
				<th>CONFIRMATION Date</th>
				<th>Check Upload Date</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${commits}" var="commit">

				<%-- action="/admin/accept/update/${accept.id}.html" method="post" --%>

				<form:form commandName="commit">
					<tr>
						<td><input type="submit" value="Update"
							class="btn btn-danger" />
						<td><a
							href='<spring:url value="/admin/deleteCommit.html?commitId=${commit.id}"/>'
							class="btn btn-danger triggerRemove">Delete</a></td>
						<td><a
							href='<spring:url value="/admin/addNewCommit.html?commitId=${commit.id}"/>'
							class="btn btn-info">ADD</a></td>

						<td><form:input path="id" value="${commit.id }" /></td>
						<form:errors path="id" />

						<td><form:input path="amount" value="${commit.amount}" /></td>
						<form:errors path="amount" />

						<td><form:input path="originalAmount" value="${commit.originalAmount}" /></td>
						<form:errors path="originalAmount" />

						<td><form:input path="status.id" value="${commit.status.id}" /></td>
						<form:errors path="status.id" />

						<td><form:input path="accept.id" value="${commit.accept.id}" /></td>
						<form:errors path="accept.id" />

						<td><form:input path="user.id" value="${commit.user.id}" /></td>
						<form:errors path="user.id" />

						<td><form:input path="lifeTimestamp"
								value="${commit.lifeTimestamp }" /></td>
						<form:errors path="lifeTimestamp" />


						<td><form:input path="dateCommit"
								value="${commit.dateCommit}" /></td>
						<form:errors path="dateCommit" />

						<td><form:input path="dateLinked"
								value="${commit.dateLinked}" /></td>
						<form:errors path="dateLinked" />

						<td><form:input path="dateConf" value="${commit.dateConf}" /></td>
						<form:errors path="dateConf" />

						<td><form:input path="dateChequeUploaded"
								value="${commit.dateChequeUploaded}" /></td>
						<form:errors path="dateChequeUploaded" />

					</tr>
				</form:form>

			</c:forEach>
		</tbody>
	</table>

	<ul class="pagination pagination-sm">
		<li><a href="">&laquo;</a></li>

		<%
			int allPages = 0;
			allPages = (Integer) request.getAttribute("allPages");
			for (int i = 0; i < allPages; i++) {
		%>
		<c:set var="i" value="<%=i%>" />
		<li class="${page == i ? 'active' : ''}"><a
			href="/admin/commit.html?page=<%=i%>"><%=i + 1%></a></li>
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
				<h4 class="modal-title" id="myModalLabel">Delete Commitment</h4>
			</div>
			<div class="modal-body">Really delete?</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
				<a href="" class="btn btn-danger removeBtn">Delete</a>
			</div>
		</div>
	</div>
</div>
