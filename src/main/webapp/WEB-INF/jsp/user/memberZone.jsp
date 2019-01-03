<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../../layout/taglib.jsp"%>

<script type="text/javascript"
	src="/resources/assetsUser/js/dropzone.js"></script>
<script type="text/javascript">// Immediately after the js include
  Dropzone.autoDiscover = false;
</script>
<link rel="stylesheet" href="/resources/assetsUser/css/dropzone.css">

<script src="/resources/assetsUser/js/jquery.countdown.min.js"></script>


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
			<a href="/user/commitment.html" class="btn btn-primary btn-lg"
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
				<script type="text/javascript">
				$(document).ready(function(){
				    $('#commitHistory').click(function(){
				            if ($('.history').css('display')==='none') {
				            	$('.history').css({'display':'block'});
				            } else {
				            	$('.history').css({'display':'none'});
				            }
				    });  
				});
				$(document).ready(function(){
				    $('#acceptHistory').click(function(){
				        if ($('.accepthistory').css('display')==='none') {
				            	$('.accepthistory').css({'display':'block'});
				            } else {
				            	$('.accepthistory').css({'display':'none'});
				            }
				       
				    });  
				});
				</script>
					<ul class="plan">
						<li class="plan-head c-b" id="commitHistory" >COMMIT HISTORY<br>
					</ul>
					
					<c:forEach items="${giveHelpDataListCompleted}" var="commit">

						<ul class="plan history" style="display: none;">
							<li class="plan-head c-v">Status:<c:out
									value="${commit.status.name }" /></li>

							<li style="text-align: left; padding-left: 20px;"><strong>Request
									Date :</strong> <c:out value="${commit.dateCommit }" /><br> <strong>Fulfilled
									Date :</strong> <c:out value="${commit.dateConf }" /><br> <strong>Name/ID
									: </strong> <c:out value="${commit.accept.user.name }" />(<c:out
									value="${commit.accept.user.id }" />)<br> <strong>Amount:
							</strong> <c:out value="${commit.amount }" /><br> <strong>Mobile
									No: </strong> <c:out value="${commit.accept.user.mobNo }" /><br> <strong>Sponser
									: </strong> <c:out value="${commit.accept.user.sponser.name }" /> (<c:out
									value="${commit.accept.user.sponser.id }" />)<br> <strong>Bank
									:</strong> <c:out value="${commit.accept.user.bankDetails.bankName }" />,<c:out
									value="${commit.accept.user.bankDetails.accountHolderName }" /><br>
								<strong>A/c No : </strong> <c:out
									value="${commit.accept.user.bankDetails.accountNo }" /> , <strong>IFSC</strong> : <c:out
									value="${commit.accept.user.bankDetails.bankIFSC }" /><br> <strong>Branch
									: </strong> <c:out value="${commit.accept.user.bankDetails.bankBranch }" /><br>
								<input type="hidden" name="commitId" id="commitId"
								value="${commit.id}" /> <input type="hidden"
								name="commitStatusId" id="commitStatusId"
								value="${commit.status.id}" /> <input type="hidden"
								name="currentUserId" id="currentUserId"
								value="${commit.user.id}" /> <input type="hidden"
								name="lifeTimestamp" id="lifeTimestamp"
								value="${commit.lifeTimestamp}" /></li>
							<li class="bottom" style="text-align: left; padding-left: 20px;">
								<c:if test="${commit.status.name eq 'ACCEPTED'}">
									<c:out value="Your slip was accepted. Thank you." />
								</c:if> 							</li>
						</ul>

					</c:forEach>
					
				</div>
				<div class="col-md-3">

					<c:forEach items="${giveHelpDataList}" var="commit">
								<input type="hidden" name="tmp" id="tmp" value="${commit.id}" />
								<input type="hidden" name="commitId${commit.id}" id="commitId${commit.id}" value="${commit.id}" />
								<input type="hidden" name="commitStatusId${commit.id}" id="commitStatusId${commit.id}" value="${commit.status.id}" />
								<input type="hidden" name="currentUserId${commit.id}" id="currentUserId${commit.id}" value="${commit.user.id}" />
								<input type="hidden" name="userId" id="userId" value="${commit.user.id}" />
								<input type="hidden" name="lifeTimestamp${commit.id}" id="lifeTimestamp${commit.id}" value="${commit.lifeTimestamp}" />
						
<script type="text/javascript">
	$(window).bind("load", function() {
		   // code here
		  
		   	var userIdToBeBlocked = $('#userId').val();
			var commitId = $('#commitId${commit.id}').val();
			var life = document.getElementById("lifeTimestamp${commit.id}").value;
			
			if('${commit.status.name}'=="AWAITING_SUBMISSION"){
			 	setTimeout(function() {
					   var nlife = life.replace(/-/g, "/");   
					   nlife+=" 00:00:00";
						   console.log(life,nlife);
							var tmp = '#countdown${commit.id}';
							  $(tmp).countdown(nlife,
										function(event) {
									$(this).html(event.strftime('%d days %H:%M:%S'));
								}).on('finish.countdown', function(event) {
								    	//when the countdown finishes do this
									alert("We are locking your account because you have not submitted the slip within the given time. Contact ADMIN...");
							
								    	$.ajax({
											url : '/user/memberZoneAccountLock.html?currentUserId='+ userIdToBeBlocked,
											type : 'post'
							});
								    		   
								});
							
					}, 2000); 	
			}
		
		});
</script>
<script type="text/javascript">
$(window).bind("load", function() {
	   // code here
	   setTimeout(function() {

			   var commitId = $('#commitId${commit.id}').val();
				
				var myDropzone = new Dropzone(document.getElementById('dropzone-area${commit.id}'), {
						
					uploadMultiple : false,
					acceptedFiles : '.jpg,.png,.jpeg,.gif',
					parallelUploads : 1,
					url : 'https://api.cloudinary.com/v1_1/mmminr/image/upload'
				});
				
				myDropzone.on('sending', function(file, xhr, formData) {
					
					formData.append('api_key', 666836314757629);
					formData.append('timestamp', Date.now() / 1000 | 0);
					formData.append('upload_preset', 'inr_preset');
				});
				myDropzone.on('success', function(file, response) {

					var params = {
						response : response
					};

					$.ajax({
						url : '/user/memberZone.html?url=' + response.url + "&commitId="
								+ commitId,
						type : 'post'
					});
					console.log('Success! Cloudinary public ID is', response.public_id);
					console.log('Success! Cloudinary url is', response.url);
					console.log('Success! Cloudinary acceptId is', commitId);
				});

	   }, 1000);
});
	
</script>
						<ul class="plan" id="plan">

							<li class="plan-head c-v" data-toggle="popover"
								data-placement="left" data-trigger="hover"
								data-content="WARNING : Please upload check before timer ends. Otherwise your account will be blocked.">

								<div id="countdown${commit.id}" class="btn btn-danger lg"></div>
								
							</li>

							<li style="text-align: left; padding-left: 20px;"
								data-toggle="popover" data-placement="left" data-trigger="hover"
								data-content="You need to send check to this account before timer ends.">

								<strong>Status :<c:out value="${commit.status.name }" /></strong><br>
								<strong>Request Date :</strong><c:out value="${commit.dateLinked }" /><br>
								<strong>Check Upload Date :</strong><c:out value="${commit.dateChequeUploaded }" /><br>
								<strong>Fulfilled Date :</strong><c:out value="${commit.dateConf }" /><br>
								<strong>Name/ID :</strong> <c:out value="${commit.accept.user.name }" />(<c:out value="${commit.accept.user.id }" />)<br>
								<strong>Amount :</strong> <c:out value="${commit.amount }" /><br> 
								<strong>Mobile No :</strong> <c:out value="${commit.accept.user.mobNo }" /><br>
								<strong>Sponser :</strong> <c:out value="${commit.accept.user.sponser.name }" /> (<c:out value="${commit.accept.user.sponser.id }" />)<br>
								<strong>Bank :</strong> <c:out value="${commit.accept.user.bankDetails.bankName }" />,<c:out value="${commit.accept.user.bankDetails.accountHolderName }" /><br>
								<strong>A/c No :</strong> <c:out value="${commit.accept.user.bankDetails.accountNo }" /> , <strong>IFSC</strong> : <c:out value="${commit.accept.user.bankDetails.bankIFSC }" /><br>
								<strong>Branch :</strong> <c:out value="${commit.accept.user.bankDetails.bankBranch }" /><br>
	
							</li>
							
							<li class="bottom" style="text-align: left; padding-left: 20px;">
								<c:if test="${commit.status.name eq 'AWAITING_SUBMISSION'}">
									<div id="dropzone-area${commit.id}" class="dropzone" data-toggle="popover"
										data-placement="left" data-trigger="hover"
										data-content="WARNING : Please upload only 1 slip at a time and you can only upload once."></div>
									<a href="/user/memberZone.html" class="btn btn-block btn-primary" data-toggle="popover"
										data-placement="left" data-trigger="hover"
										data-content="Drag or click above to upload then click here to send...">Click to submit slip</a>
								</c:if> <c:if test="${commit.status.name eq 'SUBMITTED'}">
									<c:out value="You have already uploaded the slip." />
								</c:if> <c:if test="${accept.status.name eq 'ACCEPTED'}">
									<c:out value="Your slip was accepted. Thank you." />
								</c:if>
							</li>
							
						</ul>
					</c:forEach>

				</div>


				<div class="col-md-3">

					<c:forEach items="${helpDataList}" var="commit">
					
<script type="text/javascript">
	$(document).ready(function() {
		<c:if test="${commit.status.name ne 'SAVED'}">
		<c:if test="${commit.status.name ne 'AWAITING_SUBMISSION'}">
		
		$("#imageContainer${commit.id }").hover(function(event) {
			var id = $("#uploadId${commit.id }").val();
			$("#viewSlipDiv${commit.id }").load('/user/memberZone/viewSlip.html', {
				"id" : id
			});
		}, function(event) {
			$("#viewSlipDiv${commit.id }").html("");
		});
		</c:if>
		</c:if>
	});
</script>

						<ul class="plan" id="imageContainer${commit.id }" data-toggle="popover"
										data-placement="right" data-trigger="hover"
										data-content="============================= Please wait till your help slip reaches you. It will be very soon not to worry.">
							<li class="plan-head c-v">Status : <c:out
									value="${commit.status.name}" />
							</li>
							<li style="text-align: left; padding-left: 20px;"><strong>Cheque
									Date:</strong> <c:out value="${commit.dateChequeUploaded}" /><br>
								<strong>Fulfilled Date :</strong><c:out value="${commit.dateConf}" /><br>
								<strong>Name/ID :</strong> <c:out value="${commit.user.name }" />(<c:out value="${commit.user.id }" />)<br>
								<strong>Amount :</strong> <c:out value="${commit.amount }" /><br>
								<strong>Mobile No:</strong> <c:out value="${commit.user.mobNo }" /><br>
								<strong>Sponser :</strong> <c:out value="${commit.user.sponser.name }" />(<c:out value="${commit.user.sponser.id }" />)<br>
								<strong>To View Attach Slip Click Button :</strong><input type="text" id="fileName" value='<c:out value="${commit.fileUpload.id}"/>' readonly="readonly" style="width: 20%;" />
								
								<input type="hidden" id="uploadId${commit.id }" value='<c:out value="${commit.fileUpload.id}"/>' /><br>
							
							</li>
							
							<li><div id="viewSlipDiv${commit.id }"></div></li>
							
							<c:if test="${commit.status.name eq 'SUBMITTED'}">
								<li class="bottom"><a
									href='<spring:url value="/user/acceptPayment.html?commitId=${commit.id}"/>'
									class="btn btn-info btn-lg"> Click here if payment recieved
								</a> <br></li>
							</c:if>
							
						</ul>
						
					</c:forEach>
				</div>
				<div class="col-md-3">
					<ul class="plan">
						<li class="plan-head c-a" id="acceptHistory">WITHDRAWL HISTORY<br>
					</ul>
										<c:forEach items="${helpDataListCompleted}" var="commit">
					
<script type="text/javascript">
	$(document).ready(function() {
		<c:if test="${commit.status.name ne 'SAVED'}">
		<c:if test="${commit.status.name ne 'AWAITING_SUBMISSION'}">
		
		$("#imageContainer${commit.id }").hover(function(event) {
			var id = $("#uploadId${commit.id }").val();
			$("#viewSlipDiv${commit.id }").load('/user/memberZone/viewSlip.html', {
				"id" : id
			});
		}, function(event) {
			$("#viewSlipDiv${commit.id }").html("");
		});
		</c:if>
		</c:if>
		
	});
</script>
						<ul class="plan accepthistory" style="display: none;" id="imageContainer${commit.id }" data-toggle="popover"
										data-placement="right" data-trigger="hover"
										data-content="============================= Please wait till your help slip reaches you. It will be very soon not to worry.">
							<li class="plan-head c-v">Status : <c:out
									value="${commit.status.name}" />
							</li>
							<li style="text-align: left; padding-left: 20px;"><strong>Cheque
									Date:</strong> <c:out value="${commit.dateChequeUploaded}" /><br>
								<strong>Fulfilled Date :</strong><c:out value="${commit.dateConf}" /><br>
								<strong>Name/ID :</strong> <c:out value="${commit.user.name }" />(<c:out value="${commit.user.id }" />)<br>
								<strong>Amount :</strong> <c:out value="${commit.amount }" /><br>
								<strong>Mobile No:</strong> <c:out value="${commit.user.mobNo }" /><br>
								<strong>Sponser :</strong> <c:out value="${commit.user.sponser.name }" />(<c:out value="${commit.user.sponser.id }" />)<br>
								<strong>To View Attach Slip Click Button :</strong><input type="text" id="fileName" value='<c:out value="${commit.fileUpload.id}"/>' readonly="readonly" style="width: 20%;" />
								
								<input type="hidden" id="uploadId${commit.id }" value='<c:out value="${commit.fileUpload.id}"/>' /><br>
							
							</li>
							
							<li><div id="viewSlipDiv${commit.id }"></div></li>
							
							<c:if test="${commit.status.name eq 'SUBMITTED'}">
								<li class="bottom"><a
									href='<spring:url value="/user/acceptPayment.html?commitId=${commit.id}"/>'
									class="btn btn-info btn-lg"> Click here if payment recieved
								</a> <br></li>
							</c:if>
							
						</ul>
						
					</c:forEach>
				</div>
			</div>
		</div>


	</div>
</section>
<!-- END PRICE SECTION-->

<script type="text/javascript">
	$(document).ready(function() {
		$('[data-toggle="popover"]').popover();
	});
</script>

