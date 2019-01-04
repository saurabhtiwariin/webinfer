<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../layout/taglib.jsp"%>

<div id="contact">
	<div class="container">
		<div class="row text-center">
			<div
				class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2">
				<h2 data-wow-delay="0.3s" class="wow rollIn animated">
					<strong>CONTACT US </strong>
				</h2>


				<p class="sub-head  wow rotateIn animated" data-wow-delay="0.4s"></p>
			</div>
		</div>

		<div class="row pad-top-botm">
			<div
				class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2">

				<form:form commandName="complaint"
					onsubmit='alert("Thanks for contacting us. We will get back to your query soon...")'>
					
					
					<div class="form-group">
						<form:input path="user.id" class="form-control wow rotateIn animated"
							data-wow-delay="0.5s" required="required" placeholder="Your User ID"/>
						<form:errors path="user.id" />
					</div>
					<div class="form-group">
						<form:input path="email" class="form-control wow rotateIn animated"
							data-wow-delay="0.5s" required="required" placeholder="Email"/>
						<form:errors path="email" />
					</div>
					<div class="form-group">
						<form:input path="contactNo" class="form-control wow rotateIn animated"
							data-wow-delay="0.5s" required="required" placeholder="Contact No"/>
						<form:errors path="contactNo" />
					</div>
					<div class="form-group">
						<form:input path="subject" class="form-control wow rotateIn animated"
							data-wow-delay="0.5s" required="required" placeholder="Subject of Contact"/>
						<form:errors path="subject" />
					</div>
					
					<div class="form-group">
						<form:textarea path="message" class="form-control wow rotateIn animated"
							data-wow-delay="0.5s" required="required" placeholder="Your message comes here."/>
						<form:errors path="message" />
					</div>
					<div class="form-group">
						<button type="submit"
							class="btn btn-success btn-block btn-lg wow rotateIn animated "
							data-wow-delay="0.8s">SUBMIT REQUEST</button>
					</div>
				</form:form>
			</div>

		</div>

	</div>
</div>
<!--./ CONTACT SECTION END -->