<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/layout/taglib.jsp"%>
<fmt:setBundle basename="messages" />
<%@ page session="true"%>
<fmt:message key="message.password" var="noPass" />
<fmt:message key="message.username" var="noUser" />
<c:if test="${param.error != null}">
	<c:choose>
		<c:when
			test="${SPRING_SECURITY_LAST_EXCEPTION.message == 'User is disabled'}">
			<div class="alert alert-danger">
				<spring:message code="auth.message.disabled"></spring:message>
			</div>
		</c:when>
		<c:when
			test="${SPRING_SECURITY_LAST_EXCEPTION.message == 'User account has expired'}">
			<div class="alert alert-danger">
				<spring:message code="auth.message.expired"></spring:message>
			</div>
		</c:when>
		<c:when test="${SPRING_SECURITY_LAST_EXCEPTION.message == 'blocked'}">
			<div class="alert alert-danger">
				<spring:message code="auth.message.blocked"></spring:message>
			</div>
		</c:when>
		<c:otherwise>
			<div class="alert alert-danger">
				<!-- <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/> -->
				<spring:message code="message.badCredentials"></spring:message>
			</div>
		</c:otherwise>
	</c:choose>
</c:if>

<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta name="description" content="" />
<meta name="author" content="" />

<title>New User Registration</title>

<!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->

<!--  Bootstrap Style -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">

<!--  Font-Awesome Style -->
<link rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">

<!--  Animation Style -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.0/animate.min.css">


<!--  Pretty Photo Style -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/prettyPhoto/3.1.6/js/jquery.prettyPhoto.min.js" />

<!--  Google Font Style -->
<link
	href='http://fonts.googleapis.com/css?family=Open Sans:400,300,700'
	rel='stylesheet' type='text/css'>

<!--  Custom Style -->
<link href="/resources/assets/css/style.css" rel="stylesheet" />

<style type="text/css">
</style>
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<div class="navbar navbar-default navbar-fixed-top move-me ">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>

				<a class="navbar-brand" href='<spring:url value="/index.html"/>'>
					<img src="/resources/assets/img/logo.png"
					class="navbar-brand-logo "
					alt="<spring:message
								code='index.app.title' />" />
				</a>

			</div>
			<div class="navbar-collapse collapse move-me">
				<ul class="nav navbar-nav navbar-right">

					<li><a href='<spring:url value="/index.html"/>'>Home</a></li>
					<li><a href='<spring:url value="/program.html"/>'>PROGRAM</a></li>
					<li><a href='<spring:url value="/faq.html"/>'>FAQ</a></li>
					<li><a href='<spring:url value="/ss.html"/>'>SUCCESS
							STORIES </a></li>
					<li><a href='<spring:url value="/about.html"/>'>ABOUT </a></li>
					<li><a href='<spring:url value="/contactUs.html"/>'>CONTACT</a></li>

					<security:authorize access="! isAuthenticated()">
						<li><a href='<spring:url value="/forgetPassword.html"/>'><spring:message
									code="message.resetPassword" /></a></li>
					</security:authorize>
					<security:authorize access="isAuthenticated()">
						<li><a href="<spring:url value='/user/memberZone.html' />">DIVE
								IN</a></li>
						<security:authorize access="hasRole('ROLE_ADMIN')">
							<li><a href="<spring:url value="/admin/dashboard.html" />">ADMIN</a></li>
						</security:authorize>
						<li><a href="<spring:url value="/logout" />"
							class="btn btn-danger btn-block btn-xs">LOGOUT</a></li>
					</security:authorize>

				</ul>
			</div>

		</div>
	</div>
	<!--./ NAV BAR END -->
	<div id="contact">
		<div class="container">
			<div class="row text-center">
				<div
					class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2">
					<h2 data-wow-delay="0.3s" class="wow rollIn animated">
						<strong>Please fill in the following fields...</strong>
					</h2>
					<p class="sub-head">Please fill in the registration form.</p>
				</div>
			</div>
			<div class="row pad-top-botm">
				<div
					class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2">
					<%-- <%
request.setAttribute("for", request.getAttribute("for").toString());		
%>
 --%>
					<form:form commandName="user"
						cssClass="form-horizontal registrationForm">

						<c:if test="${success eq true}">
							<div class="alert alert-success">Registration successful.</div>
							<br/>
							<div class="alert alert-danger">Please check your email to enable your account in the same browser without closing it.</div>
						</c:if>

						<div class="form-group" id="sponserDiv">
							<label for="sponser" class="col-sm-2 control-label">Sponser
								Id:</label>
							<div class="col-sm-10">
								<form:input path="sponser.id" placeholder="Enter Sponser ID"
									id="sponser" cssClass="form-control" />
								<form:errors path="sponser" />
							</div>
						</div>

						<div class="form-group" id="sponserNameDiv">
							<label for="sponserName" class="col-sm-2 control-label"></label>
							<div class="col-sm-10" id="sponserName"></div>
						</div>

						<div class="form-group">
							<label for="position" class="col-sm-2 control-label">Position:</label>
							<div class="col-sm-10" id="pos" style="color: black;">

								<form:select path="position">
									<form:option value="L">Left</form:option>
									<form:option value="R">Right</form:option>
								</form:select>

								<form:errors path="position" />
							</div>
						</div>

						<div class="form-group">
							<label for="name" class="col-sm-2 control-label">Username:</label>
							<div class="col-sm-10">
								<form:input path="name"
									placeholder="Enter Username. It will be used for login purpose."
									cssClass="form-control" />
								<form:errors path="name" />
							</div>
						</div>



						<div class="form-group">
							<label for="gender" class="col-sm-2 control-label">Gender:</label>
							<div class="col-sm-10" style="color: black;">
								<form:select path="gender">
									<form:option value="M">Male</form:option>
									<form:option value="F">Female</form:option>
								</form:select>
								<form:errors path="gender" />
							</div>
						</div>

						<div class="form-group">
							<label for="panNo" class="col-sm-2 control-label" id="panLabel">PAN
								Number:</label>
							<div class="col-sm-10">
								<form:input path="panNo"
									placeholder="Enter valid Pan Card Number"
									cssClass="form-control" />
								<form:errors path="panNo" />
							</div>
						</div>

						<div class="form-group">
							<label for="mobNo" class="col-sm-2 control-label">Mobile
								Number:</label>
							<div class="col-sm-10">
								<form:input path="mobNo"
									placeholder="Please enter mobile number."
									cssClass="form-control" />
								<form:errors path="mobNo" />
							</div>
						</div>

						<%-- 	<div class="form-group">
		<label for="otp" class="col-sm-2 control-label">Verification
			Code:</label>
		<div class="col-sm-10">
			<form:input path="otp" placeholder="Please enter otp send to you mobile number." cssClass="form-control" />
			<form:errors path="otp" />
		</div>
	</div>
 --%>
						<div class="form-group">
							<label for="email" class="col-sm-2 control-label" id="emaillabel">Email:</label>
							<div class="col-sm-10">
								<form:input path="email" placeholder="Enter email ID."
									cssClass="form-control" />
								<form:errors path="email" />
							</div>
						</div>

						<div class="form-group">
							<label for="address" class="col-sm-2 control-label">Address:</label>
							<div class="col-sm-10">
								<form:input path="address" placeholder="Enter your home address"
									cssClass="form-control" />
								<form:errors path="address" />
							</div>
						</div>


						<div class="form-group">
							<label for="country" class="col-sm-2 control-label">Country:</label>
							<div class="col-sm-10">
								<select name="country" id="country" class="form-control">
									<option value="">------------Select
										Country------------</option>
									<option value="India">India</option>
								</select>
								<form:errors path="country" />
							</div>
						</div>

						<div class="form-group">
							<label for="state" class="col-sm-2 control-label">State:</label>
							<div class="col-sm-10">
								<select name="state" id="state" class="form-control">
									<option value="">------------Select State------------</option>
									<option value="Andaman and Nicobar Islands">Andaman
										and Nicobar Islands</option>
									<option value="Andhra Pradesh">Andhra Pradesh</option>
									<option value="Arunachal Pradesh">Arunachal Pradesh</option>
									<option value="Assam">Assam</option>
									<option value="Bihar">Bihar</option>
									<option value="Chandigarh">Chandigarh</option>
									<option value="Chhattisgarh">Chhattisgarh</option>
									<option value="Dadra and Nagar Haveli">Dadra and Nagar
										Haveli</option>
									<option value="Daman and Diu">Daman and Diu</option>
									<option value="Delhi">Delhi</option>
									<option value="Goa">Goa</option>
									<option value="Gujarat">Gujarat</option>
									<option value="Haryana">Haryana</option>
									<option value="Himachal Pradesh">Himachal Pradesh</option>
									<option value="Jammu and Kashmir">Jammu and Kashmir</option>
									<option value="Jharkhand">Jharkhand</option>
									<option value="Karnataka">Karnataka</option>
									<option value="Kerala">Kerala</option>
									<option value="Lakshadweep">Lakshadweep</option>
									<option value="Madhya Pradesh">Madhya Pradesh</option>
									<option value="Maharashtra">Maharashtra</option>
									<option value="Manipur">Manipur</option>
									<option value="Meghalaya">Meghalaya</option>
									<option value="Mizoram">Mizoram</option>
									<option value="Nagaland">Nagaland</option>
									<option value="Orissa">Orissa</option>
									<option value="Pondicherry">Pondicherry</option>
									<option value="Punjab">Punjab</option>
									<option value="Rajasthan">Rajasthan</option>
									<option value="Sikkim">Sikkim</option>
									<option value="Tamil Nadu">Tamil Nadu</option>
									<option value="Tripura">Tripura</option>
									<option value="Uttaranchal">Uttaranchal</option>
									<option value="Uttar Pradesh">Uttar Pradesh</option>
									<option value="West Bengal">West Bengal</option>
								</select>
								<form:errors path="state" />
							</div>
						</div>

						<div class="form-group">
							<label for="city" class="col-sm-2 control-label">City:</label>
							<div class="col-sm-10">
								<form:input path="city" placeholder="Enter city where you live."
									cssClass="form-control" />
								<form:errors path="city" />
							</div>
						</div>



						<div class="form-group securityQuestion">
							<label for="securityQuestion" class="col-sm-2 control-label">Security
								Question:</label>
							<div class="col-sm-10" id="secQues" style="color: black;">
								<form:errors path="securityQuestion" />
							</div>
						</div>

						<div class="form-group">
							<label for="securityAnswer" class="col-sm-2 control-label">Security
								Answer:</label>
							<div class="col-sm-10">
								<form:input path="securityAnswer"
									placeholder="Enter security answer." cssClass="form-control" />
								<form:errors path="securityAnswer" />
							</div>
						</div>
						<div class="form-group">
							<label for="password" class="col-sm-2 control-label">Password:</label>
							<div class="col-sm-10">
								<form:password path="password" placeholder="Enter your password"
									cssClass="form-control" />
								<form:errors path="password" />
							</div>
						</div>
						<div class="form-group">
							<label for="password" class="col-sm-2 control-label">Confirm
								Password:</label>
							<div class="col-sm-10">
								<input type="password" name="password_again"
									placeholder="Re-Enter the same password again."
									id="password_again" class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-2">
								<input type="submit" value="Save" class="btn btn-lg btn-primary" />
							</div>
						</div>
					</form:form>



				</div>

			</div>

		</div>
	</div>
	<!--./ CONTACT SECTION END -->

	<div id="footser-end">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12">&copy; 2014 yourdomian.com</div>
			</div>

		</div>
	</div>
	<!--./ FOOTER SECTION END -->
	<!--  Jquery Core Script -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

	<script type="text/javascript"
		src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/jquery.validate.min.js"></script>
	<script type="text/javascript"
		src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/additional-methods.min.js"></script>


	<script src="/resources/register/validation.js"></script>

	<!-- Latest compiled and minified JavaScript -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
		integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
		crossorigin="anonymous"></script>

	<!--  WOW Script -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.min.js"></script>
	<!--  Scrolling Script -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
	<!--  PrettyPhoto Script -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/prettyPhoto/3.1.6/js/jquery.prettyPhoto.min.js"></script>
	<!--  Custom Scripts -->
	<script src="/resources/assets/js/custom.js"></script>

</body>
</html>

