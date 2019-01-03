<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../../layout/taglib.jsp"%>

<!--SERVICES SECTION-->
<section class="for-full-back color-bg-one" id="services-sec">
	<div class="container">
		<div class="row text-center">
			<div class="col-md-8 col-md-offset-2 ">
				<h1>
					<i class="fa fa-rocket faa-pulse animated  "></i>CHANGE PASSWORD
				</h1>

			</div>

		</div>
	</div>
</section>

<!-- SOCIAL STATS SECTION-->
<section>
	<div class="container">
		<div class="row pad-top-botm">
			<div class="row text-center">
				<div class="col-md-8 col-md-offset-2 ">
					<h4>
						<strong>Please enter following fields. </strong>
					</h4>
				</div>
			</div>
			<div
				class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2">
				<form action="/user/editPassword.html" method="post"
					class=".resetPasswordForm">
					<c:if test="${success eq true}">
						<div class="alert alert-success">Update successfull!</div>
					</c:if>	

					<div class="form-group">

						<input type="text" id="password" name="password"
							class="form-control wow rotateIn animated" data-wow-delay="0.5s"
							required="required" placeholder="New Password" />
					</div>
					<div class="form-group">

						<input type="text" name="password_again" id="password_again"
							class="form-control wow rotateIn animated" data-wow-delay="0.5s"
							required="required" placeholder="Confirm Password" />
					</div>
					<div class="form-group">
						<button type="submit" id="submit" name="submit"
							class="btn btn-success btn-lg wow rotateIn animated "
							data-wow-delay="0.8s">CHANGE PASSWORD</button>
					</div>
					<div class="form-group">
						<p>
							<br> <br> <br>
						</p>
					</div>
					<div class="form-group">
						<p></p>
					</div>


				</form>
			</div>

		</div>

	</div>
</section>

<script type="text/javascript"
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>



<script type="text/javascript">
	$(document).ready(
			function() {

				$(".resetPasswordForm").validate(
						{
							rules : {
								password : {
									required : true,
									minlength : 5
								},
								password_again : {
									required : true,
									minlength : 5,
									equalTo : "#password"
								}
							},
							highlight : function(element) {
								$(element).closest('.form-group').removeClass(
										'has-success').addClass('has-error');
							},
							unhighlight : function(element) {
								$(element).closest('.form-group').removeClass(
										'has-error').addClass('has-success');
							},
							messages : {
								password : {
									minlength : "Minimum length of password is 5."
								},
								password_again : {
									minlength : "Minimum length of password is 5.",
									equalTo : "Password mismatch.. retry"
								}
							}
						});
			});
</script>
