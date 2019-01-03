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
					<i class="fa fa-rocket faa-pulse animated  "></i>COMMITMENT REPORT
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
						<th>CommitId</th>
						<th>CommitAmt</th>
						<th>CommitDate</th>
						<th>Status</th>
						<th>ConfirmDate</th>
					</tr>
					<c:forEach items="${user.commits}" var="commit">
						<tr>
							<td><c:out value="${commit.id}" /></td>
							<td><c:out value="${commit.amount}" /></td>
							<td><c:out value="${commit.dateCommit}" /></td>
							<td><c:out value="${commit.status.name}" /></td>
							<td><c:out value="${commit.dateConf}" /></td>
						</tr>
					</c:forEach>

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
				<p><br> <br> <br></p>
			</div>

		</div>

	</div>
</section>

