<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../../layout/taglib.jsp"%>

<script type="text/javascript"
	src="/resources/assetsUser/js/dropzone.js"></script>
<link rel="stylesheet" href="/resources/assetsUser/css/dropzone.css">

<link rel="stylesheet" href="/resources/assetsUser/css/overwrite.css">

<link rel="stylesheet" href="/resources/assetsUser/css/styleClock.css">
<script type="text/javascript"
	src="/resources/assetsUser/js/jquery.lwtCountdown-1.0.js"></script>
<script type="text/javascript" src="/resources/assetsUser/js/misc.js"></script>


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
<c:if test="${dayleft0 eq true}">
	<div class="alert alert-danger" align="center">Today is the last
		day of the plan, complete all pending works you will not be able to
		log in from tomorrow !!! You will be needed to make another account if
		you like us !!!</div>
</c:if>
<c:if test="${dayleft1 eq true}">
	<div class="alert alert-danger" align="center">Account Expires
		soon. Last 1 days, Hurry !!!</div>
</c:if>
<c:if test="${dayleft2 eq true}">
	<div class="alert alert-danger" align="center">Account Expires
		soon. Last 2 days, Hurry !!!</div>
</c:if>
<c:if test="${dayleft3 eq true}">
	<div class="alert alert-danger" align="center">Account Expires
		soon. Last 3 days, Hurry !!!</div>
</c:if>
<c:if test="${dayleft4 eq true}">
	<div class="alert alert-danger" align="center">Account Expires
		soon. Last 4 days left, Hurry !!!</div>
</c:if>
<c:if test="${dayleft5 eq true}">
	<div class="alert alert-danger" align="center">Account Expires
		soon. Last 5 days left, Hurry !!!</div>
</c:if>

<c:if test="${invalidAmount eq true}">
	<div class="alert alert-danger">Please enter amount in multiple
		of 500. (500,1000,1500,...)</div>
</c:if>
<c:if test="${invalidCommitAmount eq true}">
	<div class="alert alert-danger">Please enter amount in multiple
		of 500. (500,1000,1500,...). Max amount can be 200000</div>
</c:if>
<c:if test="${commitNotAcepptedYet eq true}">
	<div class="alert alert-danger">You can commit or withdraw only
		when your previous commitment is accepted.</div>
</c:if>
<c:if test="${tenDayCheckFailed eq true}">
	<div class="alert alert-danger">You have to make another
		commitment in order to get your account benefits</div>
</c:if>
<c:if test="${lowBal eq true}">
	<div class="alert alert-danger">Don't have enough amount to make
		this transaction!, Please make a Commitment.</div>
</c:if>





<!--HOME SECTION-->
<div class="container" id="home">
	<div class="row text-center">
		<div class="col-md-12">
			<span class="head-main">GIVE AND TAKE</span>
			<h2 class="head-sub-main">
				HELP ~ DAY
				<c:out value="${dayCount}" />
			</h2>
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


<div class="title">
	<div class="container">
		<div class="col-lg-12 head-sub-main">
			<p align="center">
				<span>Upload slip before timer end or your account will be
					locked !!!</span> countdown starts when give help link comes.
			</p>
		</div>
	</div>
</div>

<div class="timer">
	<div class="container">
		<div class="col-md-6 col-md-offset-3">
			<div class="text-center">
				<!-- Countdown dashboard start -->
				<div id="countdown_dashboard">
					<div class="countDown">
						<div class="dash days_dash">
							<span class="dash_title">days</span>
							<div class="digit">0</div>
							<div class="digit">0</div>
						</div>

						<div class="dash hours_dash">
							<span class="dash_title">hours</span>
							<div class="digit">0</div>
							<div class="digit">0</div>
						</div>

						<div class="dash minutes_dash">
							<span class="dash_title">minutes</span>
							<div class="digit">0</div>
							<div class="digit">0</div>
						</div>

						<div class="dash seconds_dash">
							<span class="dash_title">seconds</span>
							<div class="digit">0</div>
							<div class="digit">0</div>
						</div>
					</div>
				</div>
				<!-- Countdown dashboard end -->
			</div>
		</div>
	</div>
</div>



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
								<input type="hidden" name="acceptId" id="acceptId"
								value="${accept.id}" /> <input type="hidden"
								name="commitStatusId" id="commitStatusId"
								value="${accept.commit.status.id}" /> <input type="hidden"
								name="currentUserId" id="currentUserId"
								value="${accept.commit.user.id}" /> <input type="hidden"
								name="lifeTimestamp" id="lifeTimestamp"
								value="${accept.lifeTimestamp}" /></li>
							<li class="bottom" style="text-align: left; padding-left: 20px;">
								<c:if test="${accept.status.id eq 1}">
									<p class="alert alert-danger">
										Warnings:<br>1 - Please upload only 1 slip at 1 time. <br>2
										- You can only upload once. So be careful..<br>3 - Upload
										before timer ends or your account will be locked.
									</p>
									<div id="dropzone-area" class="dropzone"></div>
								</c:if> <c:if test="${accept.status.id eq 2}">
									<c:out value="You have already uploaded the slip." />
								</c:if> <c:if test="${accept.status.id eq 3}">
									<c:out value="Your slip was accepted. Thank you." />
								</c:if> <script type="text/javascript">
									var acceptId = $('#acceptId').val();
									var myDropzone = new Dropzone(
											document
													.getElementById('dropzone-area'),
											{
												uploadMultiple : false,
												acceptedFiles : '.jpg,.png,.jpeg,.gif',
												parallelUploads : 1,
												url : 'https://api.cloudinary.com/v1_1/mmminr/image/upload'
											});
									myDropzone.on('sending', function(file,
											xhr, formData) {
										formData.append('api_key',
												666836314757629);
										formData.append('timestamp',
												Date.now() / 1000 | 0);
										formData.append('upload_preset',
												'inr_preset');
									});
									myDropzone
											.on(
													'success',
													function(file, response) {

														var params = {
															response : response
														};

														$
																.ajax({
																	url : '/user/memberZone.html?url='
																			+ response.url
																			+ "&acceptId="
																			+ acceptId,
																	type : 'post'
																});
														console
																.log(
																		'Success! Cloudinary public ID is',
																		response.public_id);
														console
																.log(
																		'Success! Cloudinary url is',
																		response.url);
														console
																.log(
																		'Success! Cloudinary acceptId is',
																		acceptId);
													});
								</script> 
								
								<script type="text/javascript">
									(function($) {

										var commitStatusId = $(
												'#commitStatusId').val();
										if (commitStatusId == 1) {

											var currentUserId = $(
													'#currentUserId').val();
											var lifeTimestamp = $(
													'#lifeTimestamp').val();
											var currentTimestamp = $.now();
											var diff = lifeTimestamp
													- currentTimestamp;

											var hrs = 0;
											var min = 0;
											var sec = 0;

											if (lifeTimestamp < currentTimestamp) {
												hrs = 0;
												min = 0;
												sec = 0;

											}
											if (lifeTimestamp == currentTimestamp) {
												$
														.ajax({
															url : '/user/memberZoneAccountLock.html?currentUserId='
																	+ currentUserId,
															type : 'post'
														});
											} else {

												if (diff > (1 * 60 * 60 * 1000)) {
													hrs = diff
															/ (1 * 60 * 60 * 1000);
													console.log("hrs=" + hrs);
													diff = ((hrs - Math
															.floor(hrs)) * 60 * 60 * 1000);
													console.log("diff=" + diff);
												}
												if (diff > (1 * 60 * 1000)) {
													min = diff
															/ (1 * 60 * 1000);
													console.log("min=" + min);
													diff = (min - Math
															.floor(min)) * 60 * 1000;
													console.log("diff=" + diff);
												}
												if (diff > (1 * 1000)) {
													sec = diff / (1 * 1000);
													console.log("sec=" + sec);
												}

												/* 		console.log(hrs,Math.floor(hrs),min,sec);
												 */
												$('#countdown_dashboard')
														.countDown({

															targetOffset : {
																'day' : 0,
																'month' : 0,
																'year' : 0,
																'hour' : hrs,
																'min' : min,
																'sec' : sec

															},

														});
											}
										}
									})(jQuery);
								</script>
							</li>
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
								id="fileName" value='<c:out value="${accept.fileUpload.id}"/>'
								readonly="readonly" style="width: 20%;" /> <input type="hidden"
								id="uploadId" value='<c:out value="${accept.fileUpload.id}"/>' /><br>
							</li>
							<li><div id="viewSlipDiv"></div></li>
							<c:if test="${accept.status.id eq 2}">
								<li class="bottom"><a
									href='<spring:url value="/user/acceptPayment.html?acceptId=${accept.id}"/>'
									class="btn btn-info btn-lg"> Click here if payment recieved
								</a> <br></li>
							</c:if>
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

<!-- <script type="text/javascript" src="/resources/assetsUser/js/functions.js"></script>
 -->
