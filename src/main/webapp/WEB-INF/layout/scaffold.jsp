<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<%@ page session="true"%>
		<%@page import="java.util.TimeZone"%>
			<%@page import="java.util.Calendar"%>


				<%@ include file="taglib.jsp"%>


					<fmt:message key="message.username" var="noUser"/>
					<fmt:message key="message.password" var="noPass"/>

					<c:if test="${param.error != null}">
						<c:choose>
							<c:when
			test="${SPRING_SECURITY_LAST_EXCEPTION.message == 'User is disabled'}">
								<div class="alert alert-danger">
									<spring:message code="auth.message.disabled"/>
								</div>
							</c:when>
							<c:when
			test="${SPRING_SECURITY_LAST_EXCEPTION.message == 'User account has expired'}">
								<div class="alert alert-danger">
									<spring:message code="auth.message.expired"/>
								</div>
							</c:when>
							<c:when test="${SPRING_SECURITY_LAST_EXCEPTION.message == 'blocked'}">
								<div class="alert alert-danger">
									<spring:message code="auth.message.blocked"/>
								</div>
							</c:when>
							<c:otherwise>
								<div class="alert alert-danger">
									<!-- <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/> -->
									<spring:message code="message.badCredentials"/>
								</div>
							</c:otherwise>
						</c:choose>
					</c:if>

					<html lang="en">

						<head>
							<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

							<meta name="viewport" content="width=device-width, initial-scale=1.0">
								<meta name="description" content="">
									<meta name="author" content="">
										<title>
											<tiles:getAsString name="title" />
										</title>

										<!-- styles -->
										<link href="/resources/scaffold/assets/css/bootstrap.css"
	rel="stylesheet">
											<link href="/resources/scaffold/assets/css/bootstrap-responsive.css"
	rel="stylesheet">
												<link href="/resources/scaffold/assets/css/docs.css" rel="stylesheet">
													<link href="/resources/scaffold/assets/css/prettyPhoto.css"
	rel="stylesheet">
														<link
	href="/resources/scaffold/assets/js/google-code-prettify/prettify.css"
	rel="stylesheet">
															<link href="/resources/scaffold/assets/css/nivo-slider.css"
	rel="stylesheet">
																<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,300|Open+Sans:400,300,300italic,400italic"
	rel="stylesheet">
																	<link href="/resources/scaffold/assets/css/style.css" rel="stylesheet">
																		<link href="/resources/scaffold/assets/color/success.css"
	rel="stylesheet">

																			<!-- fav and touch icons -->
																			<link rel="shortcut icon"
	href="/resources/scaffold/assets/ico/favicon.jpeg">
																				<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="/resources/scaffold/assets/ico/apple-touch-icon-144-precomposed.jpeg">
																					<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="/resources/scaffold/assets/ico/apple-touch-icon-114-precomposed.jpeg">
																						<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="/resources/scaffold/assets/ico/apple-touch-icon-72-precomposed.jpeg">
																							<link rel="apple-touch-icon-precomposed"
	href="/resources/scaffold/assets/ico/apple-touch-icon-57-precomposed.jpeg">


																							</head>


																							<body>

																								<header>
																									<!-- Navbar
    ================================================== -->
																									<div class="navbar navbar-fixed-top">
																										<div class="navbar-inner">
																											<div class="container">
																												<!-- logo -->
																												<a class="brand logo" href='<spring:url value="/index.html"/>'>
																													<img src="/resources/scaffold/assets/img/logo.jpeg" alt="" />
																												</a>
																												<!-- end logo -->

																												<!-- top menu -->
																												<div>
																													<nav>
																														<ul class="nav topnav">
																															<li class="dropdown success active">
																																<a
									href='<spring:url value="/index.html"/>'>
																																	<i
										class="icon-home icon-white">
																																	</i> Home</a>
																																<ul class="dropdown-menu">
																																	<!--                     <li><a href="index_alt1.html">Index alt 1</a></li>
                    <li><a href="index_alt2.html">Index alt 2</a></li> -->
																																</ul>
																															</li>
																															<li class="dropdown primary">
																																<a
									href='<spring:url value="#services"/>'>
																																	<i
										class="icon-star icon-white">
																																	</i> Services</a>
																																<ul class="dropdown-menu">
																																	<!-- <li><a href="overview.html">Overview</a></li>
                    <li><a href="scaffolding.html">Scaffolding</a></li>
                    <li><a href="base-css.html">Base CSS</a></li>
                    <li><a href="components.html">Components</a></li>
                    <li><a href="javascript.html">Javascripts</a></li>
                    <li class="dropdown"><a href="#">3rd level</a>
                      <ul class="dropdown-menu sub-menu">
                        <li><a href="#">Example menu</a></li>
                        <li><a href="#">Example menu</a></li>
                        <li><a href="#">Example menu</a></li>
                      </ul>
                    </li> -->
																																</ul>
																															</li>
																															<li class="dropdown danger">
																																<a
									href="#works">
																																	<i
										class="icon-leaf icon-white">
																																	</i> Works</a>
																																<ul class="dropdown-menu">
																																	<!-- <li><a href="about.html">About us</a></li>
                    <li><a href="services.html">Our services</a></li>
                    <li><a href="pricingtable.html">Pricing table</a></li>
                    <li><a href="faq.html">F.A.Q</a></li>
                    <li><a href="fullwidth.html">Fullwidth</a></li>
                    <li><a href="404.html">404</a></li> -->
																																</ul>
																															</li>
																															<li class="dropdown warning">
																																<a
									href='<spring:message
								code='index.app.url.linkedin' />' target="_blank">
																																	<i
										class="icon-camera icon-white">
																																	</i> LinkedIn</a>
																																 
																															</li>
																															<li class="dropdown warning">
																																<a
									href='<spring:message
								code='index.app.url.github' />' target="_blank">
																																	<i
										class="icon-camera icon-white">
																																	</i> Github</a>
																																 
																															</li>
																															<li class="dropdown info">
																																<a
									href="#">
																																	<i
										class="icon-bullhorn icon-white">
																																	</i> FAQ</a>
																																<ul class="dropdown-menu">
																																	<!--   <li><a href="blog_left_sidebar.html">Blog left sidebar</a></li>
                    <li><a href="blog_right_sidebar.html">Blog right sidebar</a></li>
                    <li><a href="post_left_sidebar.html">Post left sidebar</a></li>
                    <li><a href="post_right_sidebar.html">Post right sidebar</a></li>
                   -->
																																</ul>
																															</li>
																															<li class="inverse">
																																<a
									href="#contactUs">
																																	<i
										class="icon-envelope icon-white">
																																	</i> Contact</a>
																															</li>
																														</ul>
																													</nav>
																												</div>
																												<!-- end menu -->
																											</div>
																										</div>
																									</div>
																								</header>


																								<tiles:insertAttribute name="body" />



																								<!-- Footer
 ================================================== -->
																								<footer class="footer" id="contactUs">
																									<div class="container">
																										<div class="row">
																											<div class="span4">
																												<div class="widget">
																													<h4>About us</h4>
																													<address>
																														<strong>
																															<spring:message
									code='index.app.companyname' />
																														</strong>
																														<br>
																															<spring:message
									code='index.app.contactus.addressline1' />
																															<br> 
																																<spring:message
									code='index.app.contactus.addressline2' />
																																<br> 
																																	<abbr title="Phone">P:</abbr>
																																	<spring:message
									code='index.app.contactus.phone' />
																																	<br> 
																																		<abbr title="Phone">WhatsApp:</abbr>
																																		<spring:message
									code='index.app.contactus.whatsapp' />
																																	</address>

																																	<address>
																																		<strong>Contact us</strong>
																																		<br> 
																																			<a href='mailto:<spring:message
									code="index.app.contactus.email1" />'>
																																				<spring:message
									code='index.app.contactus.email1' />
																																			</a>
																																			<br> 
																																				<a href='mailto:<spring:message
									code="index.app.contactus.email2" />'>
																																					<spring:message
									code='index.app.contactus.email2' />
																																				</a>
																																			</address>
																																		</div>
																																	</div>
																																	<div class="span4">
																																		<div class="widget">
																																			<h4>Browse pages</h4>
																																			<ul class="nav nav-list regular">
																																				<li class="nav-header">More from us</li>
																																				<!-- <li><a href="#">Work for us</a></li>
							<li><a href="#">Creative process</a></li>
							<li><a href="#">Case study</a></li> -->
																																				<li class="nav-header">Quick links</li>
																																				<!-- 	<li><a href="#">Scaffold awwards</a></li>
							<li><a href="#">Meet the team</a></li>
						 -->
																																			</ul>
																																		</div>
																																	</div>
																																	<div class="span4">
																																		<div class="widget">
																																			<h4>Get email updates</h4>
																																			<form class="form-horizontal" action="#" method="post">
																																				<fieldset>
																																					<p>Sign up for email updates and and never miss a new launch.</p>

																																					<div class="input-prepend input-append">
																																						<input class="span2" id="appendedPrependedInput" type="text"
										placeholder="Email">
																																							<button class="btn btn-inverse" type="submit">Subscribe!</button>
																																						</div>
																																					</fieldset>
																																				</form>
																																				<ul class="social_small">
																																					<li class="facebook first">
																																						<a href="<spring:message
								code='index.app.url.facebook' />" target="_blank" title="Facebook">Facebook</a>
																																					</li>
																																					<li class="linkedin">
																																						<a href="<spring:message
								code='index.app.url.linkedin' />" target="_blank" title="LinkedIn">LinkedIn</a>
																																					</li>

																																					<!-- <li class="twitt"><a href="#" title="Twitter">Twitter</a></li>
							<li class="googleplus"><a href="#" title="google plus">Google
									plus</a></li>
							<li class="flickr"><a href="#" title="flickr">Flickr</a></li>
							<li class="dribbble"><a href="#" title="Dribbble">Dribbble</a></li> -->
																																				</ul>
																																			</div>
																																		</div>
																																	</div>
																																</div>

																																<div class="verybottom">
																																	<div class="container">
																																		<div class="row">
																																			<div class="span6">
																																				<p>&copy; <spring:message
								code='index.app.title' /> - All right reserved</p>
																																			</div>
																																			<div class="span6">
																																				<div class="pull-right">
																																					<div class="credits">
																																						<!--
                  All the links in the footer should remain intact.
                  You can delete the links only if you purchased the pro version.
                  Licensing information: https://bootstrapmade.com/license/
                  Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=Scaffold
                -->
								Designed by <a href="https://bootstrapmade.com/"> team <spring:message
								code='index.app.title' />
																																						</a>
																																					</div>
																																				</div>
																																			</div>
																																		</div>
																																	</div>

																																</div>
																															</footer>

																															<script src="/resources/scaffold/assets/js/jquery-1.8.2.min.js"/>
																															<script src="/resources/scaffold/assets/js/jquery.easing.1.3.js"/>
																															<script
		src="/resources/scaffold/assets/js/google-code-prettify/prettify.js">
																															</script>
																															<script src="/resources/scaffold/assets/js/modernizr.js"/>
																															<script src="/resources/scaffold/assets/js/bootstrap.js"/>
																															<script src="/resources/scaffold/assets/js/jquery.elastislide.js"/>
																															<script src="/resources/scaffold/assets/js/jquery.flexslider.js"/>
																															<script src="/resources/scaffold/assets/js/jquery.prettyPhoto.js"/>
																															<script src="/resources/scaffold/assets/js/application.js"/>
																															<script src="/resources/scaffold/assets/js/nivo/jquery.nivo.slider.js"/>
																															<script src="/resources/scaffold/assets/js/nivo/setting.js"/>
																															<script
		src="/resources/scaffold/assets/js/hover/jquery-hover-effect.js">
																															</script>
																															<script src="/resources/scaffold/assets/js/hover/setting.js"/>

																															<!-- Template Custom JavaScript File -->
																															<script src="/resources/scaffold/assets/js/custom.js"/>

																														</body>

																													</html>
																													