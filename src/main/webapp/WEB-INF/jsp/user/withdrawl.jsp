<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../../layout/taglib.jsp"%>

<!--SERVICES SECTION-->
<section class="for-full-back color-bg-one" id="services-sec">
	<div class="container">
		<div class="row text-center">
			<div class="col-md-8 col-md-offset-2 ">
				<h1>
					<i class="fa fa-rocket faa-pulse animated  "></i>DO WITHDRAWAL
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
						<strong>Please enter your withdrawal amount. </strong>
					</h4>
				</div>
			</div>
			<div
				class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2">

				<form:form commandName="accept">
					<c:if test="${success eq true}">
						<div class="alert alert-success">Accept saved successfully!</div>
					</c:if>

					<div class="form-group">
						<strong style="color:white; font-size: 20px;">Ewallet Balance : </strong>
						<input name="" type="text"
							value='<c:out value="${user.balance }"/>' readonly="readonly"
							id="" style="width: 92%;" class="form-control"/>
					</div>

					<div class="form-group">
						<strong style="color:white; font-size: 20px;">Withdraw Amount :</strong>
						<form:input path="amount" style="width: 92%;" class="form-control"/>
						<form:errors path="amount" />
					</div>
					<div class="form-group">
					<strong style="color:white; font-size: 20px;">Account Holder Name :</strong>
						<input name="" type="text"
							value='<c:out value="${user.bankDetails.accountHolderName}"/>'
							readonly="readonly" id="" style="width: 92%;" class="form-control"/>
					</div>
					<div class="form-group">
					<strong style="color:white; font-size: 20px;">Bank Name :</strong>
						<input name="" type="text"
							value='<c:out value="${user.bankDetails.bankName}"/>'
							readonly="readonly" id="" style="width: 92%;" class="form-control"/>
					</div>
					<div class="form-group">
					<strong style="color:white; font-size: 20px;">Bank Branch :</strong>
						<input name="" type="text"
							value='<c:out value="${user.bankDetails.bankBranch}"/>'
							readonly="readonly" id="" style="width: 92%;" class="form-control" />
					</div>
					<div class="form-group">
					<strong style="color:white; font-size: 20px;">Bank A/C :</strong>
						<input name="" type="text"
							value='<c:out value="${user.bankDetails.accountNo}"/>'
							readonly="readonly" id="" style="width: 92%;" class="form-control"/>
					</div>
					<div class="form-group">
					<strong style="color:white; font-size: 20px;">IFSC Code :</strong>
						<input name="" type="text"
							value='<c:out value="${user.bankDetails.bankIFSC}"/>'
							readonly="readonly" id="" style="width: 92%;" class="form-control"/>
					</div>
					<div class="form-group">
					<strong style="color:white; font-size: 20px;">Account type :</strong>
						<input name="" type="text"
							value='<c:out value="${user.bankDetails.accountType}"/>'
							readonly="readonly" id="" style="width: 92%;" class="form-control"/>
					</div>
				

					<div class="form-group">
					
						<button type="submit" id="submit" name="submit"
							class="btn btn-success btn-lg wow rotateIn animated "
							data-wow-delay="0.8s">DO WITHDRAWL</button>
					</div>
				
					<div class="form-group">
						<p>
							<br> <br> <br>
						</p>
					</div>
					<div class="form-group">
						<p></p>
					</div>


				</form:form>

			</div>

		</div>

	</div>
</section>
