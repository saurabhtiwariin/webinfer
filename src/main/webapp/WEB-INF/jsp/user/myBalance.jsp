<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../../layout/taglib.jsp"%>

<!--SERVICES SECTION-->
<section class="for-full-back color-bg-one">
	<div class="container">
		<div class="row text-center">
			<div class="col-md-8 col-md-offset-2 ">
				<h1>
					<i class="fa fa-rocket faa-pulse animated  "></i>CURRENT BALANCE
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
						<strong>WE ARE HAPPY TO TELL YOU THAT YOU CURRENT BALANCE
							IS </strong>
					</h4>
				</div>
			</div>
			<div
				class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2">


				<div class="form-group">
					<strong style="color: white; font-size: 20px;">Ewallet
						Balance : </strong> <input name="" type="text"
						value='<c:out value="${user.balance }"/>' id=""
						style="width: 92%;" class="form-control" readonly />
				</div>
			</div>
						<div class="form-group">
				<p>
					<br> <br> <br>
				</p>
			</div>
			<div class="form-group">
				<p><br> <br> <br><br></p>
			</div>
			
		</div>
	</div>
</section>
