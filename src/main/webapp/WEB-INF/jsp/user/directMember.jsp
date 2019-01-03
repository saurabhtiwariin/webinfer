<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../../layout/taglib.jsp"%>

<link href="/resources/assetsUser/css/table.css" rel="stylesheet" />

<!--SERVICES SECTION-->
<section class="for-full-back color-bg-one">
	<div class="container">
		<div class="row text-center">
			<div class="col-md-8 col-md-offset-2 ">
				<h1>
					<i class="fa fa-rocket faa-pulse animated  "></i>DIRECT MEMBERS
				</h1>

			</div>

		</div>
	</div>
</section>

<!-- SOCIAL STATS SECTION-->
<section>
	<div class="container">
		<div class="row pad-top-botm">



			<div class="form-group" id="dvData">

				<table>
					<tr>
						<th>User ID</th>
						<th>User Name</th>
						<th>Mobile</th>
						<th>Status</th>
						<th>Date of Joining</th>
					</tr>
					<c:if test="${not empty user.downlineUsers}">
						<c:forEach items="${user.downlineUsers}" var="downLineUser">
							<tr>
								<td><c:out value="${downLineUser.id}"></c:out></td>
								<td><c:out value="${downLineUser.name}"></c:out></td>
								<td><c:out value="${downLineUser.mobNo}"></c:out></td>
								<c:if test="${downLineUser.enabled eq true}">
									<td>ACTIVE</td>
								</c:if>
								<c:if test="${downLineUser.enabled eq false}">
									<td>INACTIVE</td>
								</c:if>
								<td><c:out value="${downLineUser.doj}"></c:out></td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
			</div>
						<script type='text/javascript'>
				//<![CDATA[
				$(function() {
					$("#btnExport").click(
							function(e) {
								window.open('data:application/vnd.ms-excel,'
										+ $('#dvData').html());
								e.preventDefault();
							});
				});//]]>
			</script>

			<div class="form-group">
				<button id="btnExport"
					class="btn btn-success btn-lg wow rotateIn animated "
					data-wow-delay="0.8s">Import To Excel</button>
			</div>
			<div class="form-group">
				<p>
					<br> <br> <br>
				</p>
			</div>
			<div class="form-group">
				<p></p>
			</div>






		</div>

	</div>
</section>

