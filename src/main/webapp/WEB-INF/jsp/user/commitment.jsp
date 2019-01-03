<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../../layout/taglib.jsp"%>


<!--SERVICES SECTION-->
<section class="for-full-back color-bg-one">
	<div class="container">
		<div class="row text-center">
			<div class="col-md-8 col-md-offset-2 ">
				<h1>
					<i class="fa fa-rocket faa-pulse animated  "></i>MAKE COMMITMENT
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
						<strong>Please enter your commitment amount. </strong>
					</h4>
				</div>
			</div>
			<div
				class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2">
				<form:form commandName="commit">
					<c:if test="${success eq true}">
						<div class="alert alert-success">Commitment saved
							successfully!</div>
					</c:if>

					<div class="form-group">

						<form:input path="amount"
							class="form-control wow rotateIn animated" data-wow-delay="0.5s"
							required="required" placeholder="COMMITMENT AMOUNT" />
						<form:errors path="amount" />
					</div>
					<div class="form-group">
						<button type="submit" id="submit" name="submit"
							class="btn btn-success btn-lg wow rotateIn animated "
							data-wow-delay="0.8s">MAKE COMMITMENT</button>
					</div>
					<div class="form-group">
						<p><br><br><br></p>
					</div>
					<div class="form-group">
						<p></p>
					</div>
					

				</form:form>

			</div>

		</div>

	</div>
</section>
