<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../layout/taglib.jsp"%>

<div id="about">
	<div class="container">
		<div class="row text-center">
			<div
				class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2 sub-head">
				<h2 data-wow-delay="0.3s" class="wow rollIn animated">
					<strong><spring:message code="program.para1.heading" /> </strong>
				</h2>
				<p class="sub-head">
					<spring:message code="program.para1" />
				</p>
			</div>
		</div>

		<div class="row ">
			<div class="row pad-top-botm wow flipInX animated"
				data-wow-delay="0.7s">
				<div class="col-lg-6 col-md-6 col-sm-6 ">

					<h3>
						<strong><spring:message code="program.para2.heading" /></strong>
					</h3>
					<p>
						<spring:message code="program.para2.1" />
					</p>
					<p>
						<spring:message code="program.para2.2" />
					</p>
					<p>
						<spring:message code="program.para2.3" />
					</p>
				</div>

				<div class="col-lg-6 col-md-6 col-sm-6 text-center">
					<!-- <i class="fa fa-lightbulb-o big-icon "></i> -->

					<img alt="how_it_works"
						src="<spring:message code="program.img.url"/>">
				</div>

			</div>

		</div>
		<div class="row ">
			<div class="col-lg-12 col-md-12">
				<div class="media wow rotateIn animated" data-wow-delay="0.2s">
					<div class="pull-left">
						<i class="fa fa-recycle fa-4x  "></i>
					</div>
					<div class="media-body">
						<h3 class="media-heading">
							<spring:message code="program.para3.heading" />
						</h3>
						<p>
							<spring:message code="program.para3" />
						</p>

					</div>
				</div>

			</div>
		</div>
	</div>
	<div class="row text-center">
		<div
			class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2 sub-head">
			<br>
			<br>
			<br>
			<br>
		</div>
	</div>

</div>
</div>
