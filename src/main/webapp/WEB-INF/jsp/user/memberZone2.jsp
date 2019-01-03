<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../../layout/taglib.jsp"%>

<script type="text/javascript">
	$(document).ready(function() {

		$("#imageContainer").hover(function(event) {
			var id = $("#uploadId").val();
			$("#viewSlipDiv").load('/user/memberZone/viewSlip.html', {
				"id" : id
			});
		}, function(event) {
			$("#viewSlipDiv").html("");
		});
	});
</script>


<c:if test="${success eq true}">
	<div class="alert alert-success">Saved successfully!</div>
</c:if>
<c:if test="${invalidAmount eq true}">
	<div class="alert alert-success">Please enter amount in multiple
		of 500. (500,1000,1500,...)</div>
</c:if>
<c:if test="${invalidCommitAmount eq true}">
	<div class="alert alert-success">Please enter amount in multiple
		of 500. (500,1000,1500,...)</div>
</c:if>
<c:if test="${tenDayCheckFailed eq true}">
	<div class="alert alert-success">You have to make another
		commitment in order to get your account benefits</div>
</c:if>
<c:if test="${lowBal eq true}">
	<div class="alert alert-success">Don't have enough amount to make
		this transaction!, Please make a Commitment.</div>
</c:if>



<!--HOME SECTION-->
<div class="container" id="home">
	<div class="row text-center">
		<div class="col-md-12">
			<span class="head-main">GIVE AND TAKE</span>
			<h2 class="head-sub-main">HELP</h2>
			<h3 class="head-last">WELCOME TO MMMINR.COM</h3>
			<a href="/user/commitment.html" class="btn btn-primary btn-lg "
				style="margin-right: 10%; padding: 10px 16px; font-size: 32px; line-height: 2.33;">GIVE
				HELP</a> &nbsp;&nbsp;&nbsp;&nbsp; <a href="/user/withdrawl.html"
				class="btn btn-success btn-lg"
				style="margin-left: 10%; padding: 10px 16px; font-size: 32px; line-height: 2.33;">TAKE
				HELP</a>
		</div>
	</div>
</div>
<!--END HOME SECTION-->


<!--PRICE SECTION-->
<section id="price-sec">
	<div class="container">
		<div class="row text-left">
			<div class="col-md-12 ">
				<div class="col-md-3">
					<ul class="plan">
						<li class="plan-head c-b">RECENT COMMITS<br>
					</ul>
				</div>
				<div class="col-md-3">

					<c:forEach items="${giveHelpDataList}" var="accept">

						<ul class="plan">
							<li class="plan-head c-v">Status:<c:out
									value="${accept.status.name }" /></li>

							<li style="text-align: left; padding-left: 20px;"><strong>Request
									Date :</strong> <c:out value="${accept.reqDate }" /><br> <strong>Fulfilled
									Date :</strong> <c:out value="${accept.confDate }" /><br> <strong>Name/ID
									: </strong> <c:out value="${accept.user.name }" />(<c:out
									value="${accept.user.id }" />)<br> <strong>Amount:
							</strong> <c:out value="${accept.amount }" /><br> <strong>Mobile
									No: </strong> <c:out value="${accept.user.mobNo }" /><br> <strong>Sponser
									: </strong> <c:out value="${accept.user.sponser.name }" /> (<c:out
									value="${accept.user.sponser.id }" />)<br> <strong>Bank
									:</strong> <c:out value="${accept.user.bankDetails.bankName }" />,<c:out
									value="${accept.user.bankDetails.accountHolderName }" /><br>
								<strong>A/c No : </strong> <c:out
									value="${accept.user.bankDetails.accountNo }" /> , IFSC : <c:out
									value="${accept.user.bankDetails.bankIFSC }" /><br> <strong>Branch
									: </strong> <c:out value="${accept.user.bankDetails.bankBranch }" /><br>
							</li>
							<li class="bottom" style="text-align: left; padding-left: 20px;"><form:form
									commandName="fileUpload" method="post"
									enctype="multipart/form-data">
									<c:if test="${successUpload eq true}">
										<div class="alert alert-success">Upload successfull!</div>
									</c:if>
								Upload bank slip : <input type="file" name="file" id="file"
										size="50" />

									<input type="hidden" name="acceptId" id="acceptId"
										value="${accept.id}">
									<br>
									<input type="submit" value="Upload" />
								</form:form></li>
						</ul>

					</c:forEach>

				</div>


				<div class="col-md-3">

					<c:forEach items="${helpDataList}" var="accept">

						<ul class="plan" id="imageContainer">
							<li class="plan-head c-v">Status : <c:out
									value="${accept.status.name}" />
							</li>
							<li style="text-align: left; padding-left: 20px;"><strong>Cheque
									Date:</strong> <c:out value="${accept.commit.dateChequeUploaded}" /><br>
								<strong>Fulfilled Date :</strong> <c:out
									value="${accept.confDate}" /><br> <strong>Name/ID
									:</strong> <c:out value="${accept.commit.user.name }" />(<c:out
									value="${accept.commit.user.id }" />)<br> <strong>Amount
									:</strong> <c:out value="${accept.commit.amount }" /><br> <strong>Mobile
									No:</strong> <c:out value="${accept.commit.user.mobNo }" /><br> <strong>Sponser
									:</strong> <c:out value="${accept.commit.user.sponser.name }" />(<c:out
									value="${accept.commit.user.sponser.id }" />)<br> <strong>To
									View Attach Slip Click Button :</strong> <input type="text"
								id="fileName"
								value='<c:out value="${accept.fileUpload.fileName}"/>'
								readonly="readonly" style="width: 20%;" /> <input type="hidden"
								id="uploadId" value='<c:out value="${accept.fileUpload.id}"/>' /><br>
							</li>
							<li><div id="viewSlipDiv"></div></li>
							<li class="bottom"><a
								href='<spring:url value="/user/acceptPayment.html?acceptId=${accept.id}"/>'
								class="btn btn-info btn-lg"> Click here if payment recieved
							</a> <br></li>
						</ul>
					</c:forEach>
				</div>
				<div class="col-md-3">
					<ul class="plan">
						<li class="plan-head c-a">RECENT WITHDRAWLS<br>
					</ul>
				</div>

			</div>
		</div>


	</div>
</section>
<!-- END PRICE SECTION-->