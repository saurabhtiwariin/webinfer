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

<div align="center">
	<h2>
		<a href="" class="btn btn-danger triggerRemove">&laquo;</a> increase
		or decrease days uses CRON <a href="/admin/cronForward.html"
			class="btn btn-danger triggerRemove">&raquo;</a>
	</h2>
</div>
<br>
<div>
	<table>
		<thead>
			<tr>
				<th colspan="2">ACTION</th>

				<th>ID</th>
				<th>NAME</th>
				<th>ENABLED</th>
				<th>BALANCE</th>
				<th>LIFE<br>In days
				</th>
				<th>SPONSER ID</th>
				<th>POSITION</th>
				<th>EMAIL</th>
				<th>MOBILE NO</th>
				<th>GENDER</th>
				<th>DOJ</th>
				<th>PASSWORD</th>
				<th>OTP</th>
				<th>ADRESS</th>
				<th>CITY</th>
				<th>STATE</th>
				<th>COUNTRY</th>
				<th>SECURITY Q</th>
				<th>SECURITY A</th>
				

			</tr>
		</thead>
		<tbody>
			<c:forEach items="${users}" var="user">

				<form:form commandName="user">
					<tr>
						<td><input type="submit" value="Update"
							class="btn btn-danger" /></td>
<td>
						<c:forEach var="role" items="${user.roles}">
							<c:if test="${role.name eq 'ROLE_ADMIN'}">
								<a
									href='<spring:url value="/admin/removeAdminRole/${user.id}.html"/>'
									class="btn btn-danger triggerRemove">MakeUser</a>
							</c:if>

							<c:if test="${role.name eq 'ROLE_USER'}">
								<a
									href='<spring:url value="/admin/addAdminRole/${user.id}.html"/>'
									class="btn btn-danger triggerRemove">MakeAdmin</a>
							</c:if>

						</c:forEach>
</td>

						<td><form:input path="id" value="${user.id }" /></td>
						<form:errors path="id" />
						<td><form:input path="name" value="${user.name }" /></td>
						<form:errors path="name" />
						<td><form:input path="enabled" value="${user.enabled }" /></td>
						<form:errors path="enabled" />
						<td><form:input path="balance" value="${user.balance }" /></td>
						<form:errors path="balance" />
						<td><form:input path="life" value="${user.life }" /></td>
						<form:errors path="life" />
						<td><form:input path="sponser.id" value="${user.sponser.id }" /></td>
						<form:errors path="sponser.id" />
						<td><form:input path="position" value="${user.position }" /></td>
						<form:errors path="position" />
						<td><form:input path="email" value="${user.email }" /></td>
						<form:errors path="email" />
						<td><form:input path="mobNo" value="${user.mobNo }" /></td>
						<form:errors path="mobNo" />
						<td><form:input path="gender" value="${user.gender }" /></td>
						<form:errors path="gender" />
						<td><form:input path="doj" value="${user.doj }" /></td>
						<form:errors path="doj" />
						<td><form:input path="password" value="${user.password }" /></td>
						<form:errors path="password" />
						<td><form:input path="otp" value="${user.otp }" /></td>
						<form:errors path="otp" />
						<td><form:input path="address" value="${user.address }" /></td>
						<form:errors path="address" />
						<td><form:input path="city" value="${user.city }" /></td>
						<form:errors path="city" />
						<td><form:input path="state" value="${user.state }" /></td>
						<form:errors path="state" />
						<td><form:input path="country" value="${user.country }" /></td>
						<form:errors path="country" />
						<td><form:input path="securityQuestion.id"
								value="${user.securityQuestion.id }" /></td>
						<form:errors path="securityQuestion.id" />
						<td><form:input path="securityAnswer"
								value="${user.securityAnswer }" /></td>
						<form:errors path="securityAnswer" />
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
			href="/admin/user.html?page=<%=i%>"><%=i + 1%></a></li>
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
				<h4 class="modal-title" id="myModalLabel">You are about to
					shift the whole plan by 1 day</h4>
			</div>
			<div class="modal-body">Really proceed?</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
				<a href="" class="btn btn-danger removeBtn">DO</a>
			</div>
		</div>
	</div>
</div>
