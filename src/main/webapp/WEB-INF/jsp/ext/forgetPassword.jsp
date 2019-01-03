<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../layout/taglib.jsp"%>
<%@ page session="false"%>


<div class="row">
	<label class="col-sm-1"></label> <span class="col-sm-5"></span>
</div>



<a class="btn btn-default" href="<c:url value="index.html" />"><spring:message
		code="label.form.loginLink"></spring:message></a>


<div id="contact">
	<div class="container">
		<div class="row text-center">
			<div
				class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2">
				
				<h1 data-wow-delay="0.3s" class="wow rollIn animated">
					<strong><spring:message code="message.resetPassword"></spring:message>
					</strong>
				</h1>
			</div>
		</div>
		<div class="row pad-top-botm">
			<div
				class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2">
				<form onsubmit='alert("A password reset email has been send your mailbox. If you did not recieve any mail that means you are not registered with us.")'>
				<div class="form-group"><br></div>
					<div class="form-group"><br></div>
					<div class="form-group">
						<input id="email" name="email" type="email"
							class="form-control wow rotateIn animated" data-wow-delay="0.5s"
							required="required"
							placeholder='<spring:message code="label.user.email"></spring:message>'>
					</div>
					<div class="form-group"><br></div>
					<div class="form-group">
						<button type="submit"
							class="btn btn-success btn-block btn-lg wow rotateIn animated "
							data-wow-delay="0.8s" onclick="resetPass()">
							<spring:message code="message.resetPassword"></spring:message>
						</button>
					</div>
					
					<div class="form-group">
						<a href="/index.html" class="btn btn-success btn-block btn-lg">SIGN
							IN</a>
	<br>
					</div>

				</form>
			</div>

		</div>

	</div>
</div>



<script type="text/javascript">
	function resetPass() {
		var email = $("#email").val();
		$.post("<c:url value="/resetPassword.html"></c:url>", {
					email : email
				}, function(data) {
					window.location.href = "<c:url value="/logout"></c:url>";
				})
				.fail(
						function(data) {
							if (data.responseJSON.error.indexOf("MailError") > -1) {
								window.location.href = "<c:url value="/emailError.html"></c:url>";
							} else {
								window.location.href = "<c:url value="/index.html"></c:url>"
										+ "?message="
										+ data.responseJSON.message;
							}
						});
	}

	$(document).ajaxStart(function() {
		$("title").html("LOADING ...");
	});
</script>
