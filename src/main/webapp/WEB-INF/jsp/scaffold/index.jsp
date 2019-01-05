<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/layout/taglib.jsp"%>



<section id="intro">
	<div class="jumbotron masthead">

		<div class="container">
			<div class="row">
				<div class="span12">

					<div id="slider" class="nivoSlider">
						<img src="/resources/scaffold/assets/img/slides/nivo/banner.jpg"
							data-thumb="/resources/scaffold/assets/img/slides/nivo/banner.jpg"
							alt=""/> <img
							src="/resources/scaffold/assets/img/slides/nivo/img2.jpeg"
							data-thumb="/resources/scaffold/assets/img/slides/nivo/img2.jpeg"
							alt=""/> <img
							src="/resources/scaffold/assets/img/slides/nivo/img3.jpeg"
							data-thumb="/resources/scaffold/assets/img/slides/nivo/img3.jpeg"
							alt="" data-transition="slideInLeft" /> <img
							src="/resources/scaffold/assets/img/slides/nivo/img4.jpeg"
							data-thumb="/resources/scaffold/assets/img/slides/nivo/img4.jpeg"
							alt="" title="#htmlcaption1" />
					</div>
					<div id="htmlcaption1" class="nivo-html-caption">
						<h2><spring:message code='index.app.title' /> - <spring:message code='index.app.goal' /></h2>
						<p><spring:message code='index.app.vision.description' /></p>
					</div>
					<!-- <div id="htmlcaption2" class="nivo-html-caption">
						<h2>Lot of features</h2>
						<p>Tale saepe eu ius. Illum lorem mediocrem ad nec, aliquam
							consetetur quo no. In bonorum repudiare pri, ut vis verterem
							expetendis definitionem. Voluptua gloriatur eam eu.</p>
					</div> -->

				</div>
			</div>
		</div>
	</div>
</section>


<div class="container">
	<div class="row">
		<div class="span12">
			<div class="tagline">
				<div class="row">
					<div class="span6">
						<div class="tagline_text">
							<h2>
								<spring:message code='index.app.title' /> - <spring:message code='index.app.goal' /> 
								<!-- <span class="text-success">Deliver</span>
								 -->
							</h2>
							<div class="tag_list">
								<ul>
									<li><span><i class="icon-fire"></i><spring:message code='index.app.subgoal.1' />
											</span></li>
									<li><span><i class="icon-gift"></i><spring:message code='index.app.subgoal.2' /></span></li>
									<li><span><i class="icon-plane"></i><spring:message code='index.app.subgoal.3' />
									</span></li>
								</ul>
							</div>
						</div>
					</div>

					<div class="span6">
						<div class="btn-toolbar cta">
							<!-- <a class="btn btn-large btn-danger" href="#"><i
								class="m-icon-big-swapright m-icon-white"></i> Our pricing</a> <a
								class="btn btn-large btn-success" href="#"><i
								class="m-icon-big-swapdown m-icon-white"></i> Download now</a> -->
						</div>
					</div>


				</div>
			</div>
		</div>

	</div>
</div>

<!-- end tagline -->

<section id="maincontent">
	<div class="container">

		<div class="row">
			<div class="span3">
				<h3 class="heading-success">
					<span class="btn btn-large btn-success"><i
						class="m-icon-big-swapright m-icon-white"></i></span>&nbsp;&nbsp;Our Vision
				</h3>
				<p><spring:message code='index.app.vision.description' /></p>
			</div>
			
			
			<div class="span3">
				<div class="well well-success box">
					<img src="/resources/scaffold/assets/img/icons/box-1-white.png"
						alt="" />
					<h3><spring:message code='index.app.vision.1.title' /></h3>
					<p><spring:message code='index.app.vision.1.description' /></p>
					<a href="#">Read more</a>
				</div>
			</div>
			
			<div class="span3">
				<div class="well well-primary box">
					<img src="/resources/scaffold/assets/img/icons/box-3-white.png"
						alt="" />
					<h3><spring:message code='index.app.vision.2.title' /></h3>
					<p><spring:message code='index.app.vision.2.description' /></p>
					<a href="#">Read more</a>
				</div>
			</div>
			
			<div class="span3">
				<div class="well well-warning box">
					<img src="/resources/scaffold/assets/img/icons/box-2-white.png"
						alt="" />
					<h3><spring:message code='index.app.vision.3.title' /></h3>
					<p><spring:message code='index.app.vision.3.description' /></p>
					<a href="#">Read more</a>
				</div>
			</div>
			
		</div>

		<!-- divider -->
		<div class="row">
			<div class="span12">
				<div class="divider"></div>
			</div>
		</div>
		<!-- end divider -->

		<div class="row">
			<div class="span6">
				<h3 class="heading-success">
					<span class="btn btn-large btn-success"><i
						class="m-icon-big-swapright m-icon-white"></i></span>&nbsp;&nbsp;Who we are
				</h3>

				<div id="myCarousel" class="carousel slide testimonials">
					<div class="carousel-inner">
						<div class="item active">
							<div class="testimonial">
								<img
									src="/resources/scaffold/assets/img/dummies/1.jpg"
									alt="" />
								<blockquote>
									<p><spring:message code='index.app.works.description' /></p>
								</blockquote>
								<div class="info">
									<span class="author"><strong><a href="<spring:message
								code='index.app.url.linkedin' />">
<spring:message code='index.app.person.1.name' />
</a>,</strong></span> <span class="company">
<spring:message code='index.app.person.1.role' />
</span>
								</div>
							</div>
						</div>
						<!-- <div class="item">
							<div class="testimonial">
								<img
									src="/resources/scaffold/assets/img/dummies/testimonial-author-2.png"
									alt="" />
								<blockquote>
									<p>Equidem instructior duo ad, mucius eripuit eloquentiam
										cu mea, suas tota urbanitas id his. Nec ea veritus nostrum.</p>
								</blockquote>
								<div class="info">
									<span class="author"><strong><a href="#">Mark
												Lunch</a>,</strong></span> <span class="company">Mad Business - Marketing
										Officer</span>
								</div>
							</div>
						</div> -->
					</div>
					<a class="left carousel-control" href="#myCarousel"
						data-slide="prev">&lsaquo;</a> <a class="right carousel-control"
						href="#myCarousel" data-slide="next">&rsaquo;</a>
				</div>


			</div>

			<div class="span6" id="services">
				<h3 class="heading-success">
					<span class="btn btn-large btn-success"><i
						class="m-icon-big-swapright m-icon-white"></i></span>&nbsp;&nbsp; 
						<spring:message code='index.app.services.title' />
				</h3>
				<div class="accordion" id="accordion2">
					<div class="accordion-group">
						<div class="accordion-heading">
							<a class="accordion-toggle" data-toggle="collapse"
								data-parent="#accordion2" href="#collapseOne"> 
								<spring:message code='index.app.services.1.title' /></a>
						</div>
						<div id="collapseOne" class="accordion-body collapse in">
							<div class="accordion-inner">
								<img
									src="/resources/scaffold/assets/img/icons/guidewire.jpeg"
									class="alignleft" alt="" />
								<h5><spring:message code='index.app.services.1.title' /></h5>
								<p><spring:message code='index.app.services.1.description' /></p>
								<a href="#">Learn more</a>
							</div>
						</div>
					</div>
					<div class="accordion-group">
						<div class="accordion-heading">
							<a class="accordion-toggle" data-toggle="collapse"
								data-parent="#accordion2" href="#collapseTwo"> 
								<spring:message code='index.app.services.2.title' /> </a>
						</div>
						<div id="collapseTwo" class="accordion-body collapse">
							<div class="accordion-inner">
								<img src="/resources/scaffold/assets/img/icons/gamedev.png"
									class="alignleft" alt="" />
								<h5><spring:message code='index.app.services.2.title' /></h5>
								<p><spring:message code='index.app.services.2.description' /></p>
								<a href="#">Learn more</a>
							</div>
						</div>
					</div>
					<div class="accordion-group">
						<div class="accordion-heading">
							<a class="accordion-toggle" data-toggle="collapse"
								data-parent="#accordion2" href="#collapseThree"> 
								<spring:message code='index.app.services.3.title' /> </a>
						</div>
						<div id="collapseThree" class="accordion-body collapse">
							<div class="accordion-inner">
								<img
									src="/resources/scaffold/assets/img/icons/websitedev.png"
									class="alignleft" alt="" />
								<h5><spring:message code='index.app.services.3.title' /></h5>
								<p><spring:message code='index.app.services.3.description' /></p>
								<a href="#">Learn more</a>
							</div>
						</div>
					</div> 
				</div>
			</div>
		</div>



	</div>
</section>


<section id="bottom">
	<div class="container">

		<!-- divider -->
		<div class="row">
			<div class="span12">
				<div class="divider"></div>
			</div>
		</div>
		<!-- end divider -->


		<div class="row" id="works">
			<div class="span12">
				<h3>
					<a class="btn btn-large btn-success" href="#"><i
						class="m-icon-big-swapdown m-icon-white"></i></a> Recent works
				</h3>

				<div id="latest-work" class="carousel btleft">
					<div class="carousel-wrapper">

						<ul class="portfolio-home da-thumbs">
							<li>
								<div class="thumbnail">
									<div class="image-wrapp">
										<img src="/resources/scaffold/assets/img/dummies/work1.jpg"
											alt="Portfolio name" title="" />
										<article class="da-animate da-slideFromRight"
											style="display: block;">
											<a class="link_post" href="portfolio-detail.html"><img
												src="/resources/scaffold/assets/img/icons/link_post_icon.png"
												alt="<spring:message
								code='index.app.works.1.link' />" /></a> <span><a class="zoom"
												data-pretty="prettyPhoto"
												href="/resources/scaffold/assets/img/dummies/big1.jpg"><img
													src="/resources/scaffold/assets/img/icons/zoom_icon.png"
													alt="<spring:message
								code='index.app.works.1.link' />"
													title="<spring:message
								code='index.app.works.1.title' />" /></a></span>
										</article>
									</div>
									<div class="caption">
										<h5><spring:message
								code='index.app.works.1.title' /></h5>
									</div>

								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>