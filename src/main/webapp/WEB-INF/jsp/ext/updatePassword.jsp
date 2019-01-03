<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
    uri="http://www.springframework.org/security/tags"%>
<%@ page session="false"%>
<html>
<head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
 
 <meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title><spring:message code="message.updatePassword"></spring:message></title>
</head>
<body>
<div class="container">
        <div class="row">
            <h1> <spring:message code="message.resetYourPassword"></spring:message> </h1>
            <div >
                <br>
                
                    <label class="col-sm-2"><spring:message code="label.user.password"></spring:message></label>
                    <span class="col-sm-5"><input class="form-control" id="pass" name="password" type="password" value="" /></span>
                    <span class="col-sm-5"></span>
<br><br>
                    <label class="col-sm-2"><spring:message code="label.user.confirmPass"></spring:message></label>
                    <span class="col-sm-5"><input class="form-control" id="passConfirm" type="password" value="" /></span>
                    <span id="error" class="alert alert-danger" style="display:none"><spring:message code="PasswordMatches.user"></spring:message></span>
                <br><br>
                <button class="btn btn-primary" type="submit" onclick="savePass()">
                    <spring:message code="message.updatePassword"></spring:message>
                </button>
            </div>
            
        </div>
    </div>
 
 <script type="text/javascript">
function savePass(){
    var pass = $("#pass").val();
    var valid = pass == $("#passConfirm").val();
    if(!valid) {
      $("#error").show();
      return;
    }
    $.post("<c:url value="/savePassword.html"></c:url>",{password: pass} ,function(data){
            window.location.href = "<c:url value="/logout"></c:url>";
    })
    .fail(function(data) {
        window.location.href = "<c:url value="/index.html"></c:url>" + "?message=" + data.responseJSON.message;
    });
}
</script>    
</body>

</html>

<%--
    <div class="container">
        <div class="row">
            <h1> <spring:message code="message.resetYourPassword"></spring:message> </h1>
            <div >
                <br>
                
                    <label class="col-sm-2"><spring:message code="label.user.password"></spring:message></label>
                    <span class="col-sm-5"><input class="form-control" id="pass" name="password" type="password" value="" /></span>
                    <span class="col-sm-5"></span>
<br><br>
                    <label class="col-sm-2"><spring:message code="label.user.confirmPass"></spring:message></label>
                    <span class="col-sm-5"><input class="form-control" id="passConfirm" type="password" value="" /></span>
                    <span id="error" class="alert alert-danger" style="display:none"><spring:message code="PasswordMatches.user"></spring:message></span>
                   
                <br><br>
                <button class="btn btn-primary" type="submit" onclick="savePass()">
                    <spring:message code="message.updatePassword"></spring:message>
                </button>
            </div>
            
        </div>
    </div>
    
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript">
function savePass(){
    var pass = $("#pass").val();
    var valid = pass == $("#passConfirm").val();
    if(!valid) {
      $("#error").show();
      return;
    }
    $.post("<c:url value="/user/savePassword.html"></c:url>",{password: pass,user: <c:out value="${user}"/>} ,function(data){
            window.location.href = "<c:url value="/index.html"></c:url>" + "?message="+data.message;
    })
    .fail(function(data) {
        window.location.href = "<c:url value="/index.html"></c:url>" + "?message=" + data.responseJSON.message;
    });
}
</script>    
 --%>