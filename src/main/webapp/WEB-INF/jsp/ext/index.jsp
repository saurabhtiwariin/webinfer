<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/layout/taglib.jsp"%>

<!-- Section: intro -->
<section id="intro" class="intro">
	<div class="slogan">
		<h1>
			<spring:message code='index.app.welcomemessage' />
		</h1>
		<h2 style="color: white;">
			<spring:message code='index.app.goal' />
		</h2>
		<a href="#works" class="btn btn-skin scroll"> <spring:message
				code='index.app.works' /></a>
	</div>
</section>
<!-- /Section: intro -->


<!-- Section: about -->
<section id="about" class="home-section text-center bg-gray">
	<div class="heading-about marginbot-50">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">

					<div class="section-heading">
						<h2><spring:message code='index.app.about.title' /></h2>
						<p><spring:message code='index.app.about.description' /></p>
					</div>

				</div>
			</div>
		</div>
	</div>
	<div class="container">

		<div class="row">
			<div class="col-xs-6 col-sm-3 col-md-3">

				<div class="team boxed-grey">
					<div class="inner">
						<h5><spring:message code='index.app.person.1.name' /></h5>
						<p class="subtitle"><spring:message code='index.app.person.1.role' /></p>
						<div class="avatar">
							<img src="/resources/img/team/1.jpg" alt="" class="img-responsive" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- /Section: about -->


<!-- Section: services -->
<section id="service" class="home-section text-center">

	<div class="heading-about marginbot-50">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">

					<div class="section-heading">
						<h2><spring:message
				code='index.app.services.title' /></h2>
						<p><spring:message
				code='index.app.services.description' /></p>
					</div>

				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-sm-3 col-md-3">

				<div class="service-box">
					<div class="service-icon">
						<i class="fa fa-code fa-3x"></i>
					</div>
					<div class="service-desc">
						<h5><spring:message
				code='index.app.services.1.title' /></h5>
						<p><spring:message
				code='index.app.services.1.description' /></p>
					</div>
				</div>

			</div>
			<div class="col-sm-3 col-md-3">

				<div class="service-box">
					<div class="service-icon">
						<i class="fa fa-suitcase fa-3x"></i>
					</div>
					<div class="service-desc">
						<h5><spring:message
				code='index.app.services.2.title' /></h5>
						<p><spring:message
				code='index.app.services.2.description' /></p>
					</div>
				</div>

			</div>
			<div class="col-sm-3 col-md-3">

				<div class="service-box">
					<div class="service-icon">
						<i class="fa fa-cog fa-3x"></i>
					</div>
					<div class="service-desc">
						<h5><spring:message
				code='index.app.services.3.title' /></h5>
						<p><spring:message
				code='index.app.services.3.description' /></p>
					</div>
				</div>

			</div>

		</div>
	</div>
</section>
<!-- /Section: services -->


<!-- Section: works -->
<section id="works" class="home-section text-center bg-gray">
	<div class="heading-works marginbot-50">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">

					<div class="section-heading">
						<h2>
							<spring:message code='index.app.works' />
						</h2>
						<p>
							<spring:message code='index.app.works.description' />
						</p>
					</div>

				</div>
			</div>
		</div>
	</div>
	<div class="container">

		<div class="row">
			<div class="col-sm-12 col-md-12 col-lg-12">

				<div class="row gallery-item">
					<div class="col-md-3">
						<a href="/resources/img/works/1.jpg" title="<spring:message
				code='index.app.works.1.title' /> - <spring:message
				code='index.app.works.1.link' />"
							data-lightbox-gallery="gallery1"
							data-lightbox-hidpi="/resources/img/works/1@2x.jpg"> <img
							src="/resources/img/works/1.jpg" class="img-responsive" alt="<spring:message
				code='index.app.works.1.title' />">
						</a>
					</div>
				</div>

			</div>
		</div>
	</div>
</section>
<!-- /Section: works -->

<!-- Section: contact -->
<section id="contact" class="home-section text-center">
	<div class="heading-contact marginbot-50">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">

					<div class="section-heading">
						<h2><spring:message
				code='index.app.contactus.title' /></h2>
						<p><spring:message
				code='index.app.contactus.description' /></p>
					</div>

				</div>
			</div>
		</div>
	</div>
	<div class="container">

		<div class="row">
			<div class="col-lg-8 col-md-offset-2">
				<div class="boxed-grey">
					<div id="sendmessage"><spring:message
				code='index.app.contactus.confirmation' /> </div>
					<div id="errormessage"></div>
					<form action="" method="post" role="form" class="contactForm">
						<div class="form-group">
							<input type="text" name="name" class="form-control" id="name"
								placeholder="Your Name" data-rule="minlen:4"
								data-msg="Please enter at least 4 chars" />
							<div class="validation"></div>
						</div>
						<div class="form-group">
							<input type="email" class="form-control" name="email" id="email"
								placeholder="Your Email" data-rule="email"
								data-msg="Please enter a valid email" />
							<div class="validation"></div>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" name="subject"
								id="subject" placeholder="Subject" data-rule="minlen:4"
								data-msg="Please enter at least 8 chars of subject" />
							<div class="validation"></div>
						</div>
						<div class="form-group">
							<textarea class="form-control" name="message" rows="5"
								data-rule="required" data-msg="Please write something for us"
								placeholder="Message"></textarea>
							<div class="validation"></div>
						</div>

						<div class="text-center">
							<button type="submit" class="btn btn-skin">Send Message</button>
						</div>
					</form>
				</div>

				<div class="widget-contact row">
					<div class="col-lg-6">
						<address>
							<strong><spring:message
				code='index.app.companyname' /></strong><br> 
				<spring:message
				code='index.app.contactus.addressline1' />
		
							<br><spring:message
				code='index.app.contactus.addressline2' /><br> <abbr
								title="Phone">P:</abbr> <spring:message
				code='index.app.contactus.phone' /><br> <abbr
								title="Phone">WhatsApp:</abbr> <spring:message
				code='index.app.contactus.whatsapp' />
						</address>
					</div>

					<div class="col-lg-6">
						<address>
							<strong>Email</strong><br> <a href="mailto:#"><spring:message
				code='index.app.contactus.email1' /></a><br />
							<a href="mailto:#"><spring:message
				code='index.app.contactus.email2' /></a>
						</address>

					</div>
				</div>
			</div>

		</div>

	</div>
</section>
<!-- /Section: contact -->