<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page session="true"%>
<%@page import="java.util.TimeZone"%>
<%@page import="java.util.Calendar"%>


<%@ include file="taglib.jsp"%>
 

<fmt:message key="message.username" var="noUser" ></fmt:message> 
<fmt:message key="message.password" var="noPass" ></fmt:message>
 
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
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">

<title><tiles:getAsString name="title" /></title>
 
  <!-- Bootstrap Core CSS -->
  <link href="/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css">

  <!-- Fonts -->
  <link href="/resources/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <link href="/resources/css/nivo-lightbox.css" rel="stylesheet" />
  <link href="/resources/css/nivo-lightbox-theme/default/default.css" rel="stylesheet" type="text/css" />
  <link href="/resources/css/animate.css" rel="stylesheet" />
  <!-- Squad theme CSS -->
  <link href="/resources/css/style.css" rel="stylesheet">
  <link href="/resources/color/default.css" rel="stylesheet">
 
</head>
<body data-spy="scroll">

<div class="container">
    <ul id="gn-menu" class="gn-menu-main">
      <li class="gn-trigger">
        <a class="gn-icon gn-icon-menu"><span>Menu</span></a>
        <nav class="gn-menu-wrapper">
          <div class="gn-scroller">
            <ul class="gn-menu">
              <li class="gn-search-item">
                <input placeholder="Search" type="search" class="gn-search">
                <a class="gn-icon gn-icon-search"><span>Search</span></a>
              </li>
              <li>
                <a  href='#about' class="gn-icon gn-icon-download">About</a>
              </li>
              <li><a href="#service" class="gn-icon gn-icon-cog">Service</a></li>
              <li><a href="#works" class="gn-icon gn-icon-help">Works</a></li>
              <li>
                <a href="#contact" class="gn-icon gn-icon-archive">Contact</a>
              </li>
		  <security:authorize access="hasRole('ROLE_ADMIN')">  
              <li><a href="#service" class="gn-icon gn-icon-cog">Service</a></li>
 		</security:authorize>  
            </ul>
          </div>
          <!-- /gn-scroller -->
        </nav>
      </li>
      <li><a href='<spring:url value="/index.html"/>'><spring:message
								code='index.app.title' /></a></li>
      <li class="hidden-xs">
        <ul class="company-social">
          <li class="social-facebook"><a href="<spring:message
								code='index.app.url.facebook' />" target="_blank"><i class="fa fa-facebook"></i></a></li>
          <li class="social-linkedin"><a href="<spring:message
								code='index.app.url.linkedin' />" target="_blank"><i class="fa fa-linkedin"></i></a></li>
								
          <li class="social-github"><a href="<spring:message
								code='index.app.url.github' />" target="_blank"><i class="fa fa-github"></i></a></li>
     <!--      <li class="social-dribble"><a href="#" target="_blank"><i class="fa fa-dribbble"></i></a></li>
          <li class="social-google"><a href="#" target="_blank"><i class="fa fa-google-plus"></i></a></li>
      -->   </ul>
      </li>
    </ul>
  </div>
   
	<tiles:insertAttribute name="body" />
 

 
 
  <footer>
    <div class="container">
      <div class="row">
        <div class="col-md-12 col-lg-12">
          <p>&copy; www.WebInfer.com</p>
          <div class="credits">
          
            Designed by <a href="https://bootstrapmade.com/">team webinfer</a>
          </div>
        </div>
      </div>
    </div>
  </footer>

  <!-- Core JavaScript Files -->
  <script src="/resources/js/jquery.min.js"></script>
  <script src="/resources/js/bootstrap.min.js"></script>
  <script src="/resources/js/jquery.easing.min.js"></script>
  <script src="/resources/js/classie.js"></script>
  <script src="/resources/js/gnmenu.js"></script>
  <script src="/resources/js/jquery.scrollTo.js"></script>
  <script src="/resources/js/nivo-lightbox.min.js"></script>
  <script src="/resources/js/stellar.js"></script>
  <!-- Custom Theme JavaScript -->
  <script src="/resources/js/custom.js"></script>
  <script src="/resources/contactform/contactform.js"></script>

</body>

</html>