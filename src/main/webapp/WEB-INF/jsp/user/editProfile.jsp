<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../../layout/taglib.jsp"%>

<!--ABOUT SECTION-->
<section class="for-full-back color-bg-one" id="about-sec">
	<div class="container">
		<div class="row text-center">
			<div class="col-md-8 col-md-offset-2 ">
				<h1>
					<i class="fa fa-microphone faa-pulse animated  "></i>EDIT PROFILE
				</h1>
			</div>
		</div>
	</div>
</section>
<section id="about-team" >
	<div class="container">
				<c:if test="${success eq true}">
					<div class="alert alert-success">Bank Details Updated !</div>
				</c:if>

		<div class="row text-center g-pad-bottom">
			<div class="col-md-12 ">
				<div class="col-md-5 col-sm-3 col-xs-6 col-md-offset-1">
					<div class="team-member">
						<strong style="color: white; font-size: 20px;">User ID :</strong>
						<input type="text" class="form-control"  value="<c:out value="${user.id}"></c:out>"
							style="width: 92%;"  readonly />
					</div>
				</div>
				<div class="col-md-5 col-sm-3 col-xs-6 col-md-offset-1">
					<div class="team-member">
						<strong style="color: white; font-size: 20px;">User Name
							:</strong> <input type="text" class="form-control" value="<c:out value="${user.name}"></c:out>"
							readonly="readonly" style="width: 92%;" />
					</div>
				</div>
			</div>
			<div class="col-md-12 ">

				<div class="col-md-5 col-sm-3 col-xs-6 col-md-offset-1">
					<div class="team-member">
						<strong style="color: white; font-size: 20px;">Sponser ID
							:</strong> <input type="text" class="form-control"
							value="<c:out value="${user.sponser.id}"></c:out>"
							readonly="readonly" style="width: 92%;" />
					</div>
				</div>
				<div class="col-md-5 col-sm-3 col-xs-6 col-md-offset-1">
					<div class="team-member">
						<strong style="color: white; font-size: 20px;">Sponser
							Name :</strong> <input type="text" class="form-control"
							value="<c:out value="${user.sponser.name}"></c:out>"
							readonly="readonly" style="width: 92%;" />
					</div>
				</div>
			</div>
			<div class="col-md-12 ">
				<div class="col-md-5 col-sm-3 col-xs-6 col-md-offset-1">
					<div class="team-member">
						<strong style="color: white; font-size: 20px;">Date of
							Joining :</strong> <input type="text" class="form-control"
							value="<c:out value="${user.doj}"></c:out>" readonly="readonly"
							style="width: 92%;" />
					</div>
				</div><!-- 
				<div class="col-md-5 col-sm-3 col-xs-6 col-md-offset-1">
					<div class="team-member">
						<strong style="color: white; font-size: 20px;">Upload
							Profile Picture :</strong> <input type="file" value="" style="width: 92%;" />
					</div>
				</div> -->
			</div>
			<div class="col-md-12 ">
				<div class="col-md-5 col-sm-3 col-xs-6 col-md-offset-1">
					<div class="team-member">
						<strong style="color: white; font-size: 20px;">Full Name
							:</strong> <input type="text" class="form-control" value="<c:out value="${user.name}"></c:out>"
							readonly="readonly" style="width: 92%;" />
					</div>
				</div>
				<div class="col-md-5 col-sm-3 col-xs-6 col-md-offset-1">
					<div class="team-member">
						<strong style="color: white; font-size: 20px;">Gender :</strong> <input class="form-control"
							type="text" value="<c:out value="${user.gender}"></c:out>"
							readonly="readonly" style="width: 92%;" />
					</div>
				</div>
			</div>
			<div class="col-md-12 ">
				<div class="col-md-5 col-sm-3 col-xs-6 col-md-offset-1">
					<div class="team-member">
						<strong style="color: white; font-size: 20px;">Address :</strong>
						<input type="text" class="form-control" value="<c:out value="${user.id}"></c:out>"
							readonly="readonly" style="width: 92%;" />
					</div>
				</div>
				<div class="col-md-5 col-sm-3 col-xs-6 col-md-offset-1">
					<div class="team-member">
						<strong style="color: white; font-size: 20px;">City :</strong> <input class="form-control"
							type="text" value="<c:out value="${user.city}"></c:out>"
							readonly="readonly" style="width: 92%;" />
					</div>
				</div>
			</div>
			<div class="col-md-12 ">
				<div class="col-md-5 col-sm-3 col-xs-6 col-md-offset-1">
					<div class="team-member">
						<strong style="color: white; font-size: 20px;">State :</strong> <input class="form-control"
							type="text" value="<c:out value="${user.state}"></c:out>"
							readonly="readonly" style="width: 92%;" />
					</div>
				</div>
				<div class="col-md-5 col-sm-3 col-xs-6 col-md-offset-1">
					<div class="team-member">
						<strong style="color: white; font-size: 20px;">Country :</strong>
						<input type="text" class="form-control" value="<c:out value="${user.country}"></c:out>"
							readonly="readonly" style="width: 92%;" />
					</div>
				</div>
			</div>
			<div class="col-md-12 ">
				<div class="col-md-5 col-sm-3 col-xs-6 col-md-offset-1">
					<div class="team-member">
						<strong style="color: white; font-size: 20px;">Mobile No.
							:</strong> <input type="text" class="form-control"
							value="<c:out value="${user.mobNo}"></c:out>" readonly="readonly"
							style="width: 92%;" />
					</div>
				</div>
				<div class="col-md-5 col-sm-3 col-xs-6 col-md-offset-1">
					<div class="team-member">
						<strong style="color: white; font-size: 20px;">Email :</strong> <input class="form-control"
							type="text" value="<c:out value="${user.email}"></c:out>"
							readonly="readonly" style="width: 92%;" />
					</div>
				</div>
			</div>


			<form:form commandName="bankDetails">

				<div class="col-md-12 ">
					<div class="col-md-5 col-sm-3 col-xs-6 col-md-offset-1">
						<div class="team-member">
							<strong style="color: white; font-size: 20px;">Bank Name
								:</strong>
							<form:input path="bankName" style="width: 92%;" class="form-control"/>
							<form:errors path="bankName" />
						</div>
					</div>
					<div class="col-md-5 col-sm-3 col-xs-6 col-md-offset-1">
						<div class="team-member">
							<strong style="color: white; font-size: 20px;">Bank
								Branch :</strong>
							<form:input path="bankBranch" style="width: 92%;" class="form-control"/>
							<form:errors path="bankBranch" />
						</div>
					</div>
				</div>

				<div class="col-md-12 ">
					<div class="col-md-5 col-sm-3 col-xs-6 col-md-offset-1">
						<div class="team-member">
							<strong style="color: white; font-size: 20px;">Bank A/C
								:</strong>
							<form:input path="accountNo" style="width: 92%;" class="form-control"/>
							<form:errors path="accountNo" />
						</div>
					</div>
					<div class="col-md-5 col-sm-3 col-xs-6 col-md-offset-1">
						<div class="team-member">
							<strong style="color: white; font-size: 20px;">IFSC Code
								:</strong>
							<form:input path="bankIFSC" style="width: 92%;" class="form-control"/>
							<form:errors path="bankIFSC" />
						</div>
					</div>
				</div>

				<div class="col-md-12 ">
					<div class="col-md-5 col-sm-3 col-xs-6 col-md-offset-1">
						<div class="team-member">
							<strong style="color: white; font-size: 20px;">Account
								type :</strong>
							<form:select path="accountType" style="width: 93.5%;" class="form-control">
								<form:option value="saving">Savings</form:option>
								<form:option value="current">Current</form:option>
							</form:select>
							<form:errors path="accountType" />
						</div>
					</div>
					<div class="col-md-5 col-sm-3 col-xs-6 col-md-offset-1">
						<div class="team-member">
							<strong style="color: white; font-size: 20px;">ATM Card
								Number :</strong>
							<form:input path="cardNo" style="width: 92%;" class="form-control"/>
							<form:errors path="cardNo" />
						</div>
					</div>
				</div>

				<div class="col-md-12 ">
					<div class="col-md-5 col-sm-3 col-xs-6 col-md-offset-1">
						<div class="team-member">
							<strong style="color: white; font-size: 20px;">Account
								Holder Name :</strong>
							<form:input path="accountHolderName" style="width: 92%;" class="form-control"/>
							<form:errors path="accountHolderName" />
						</div>
						<div class="team-member"></div>
					</div>
				</div>
				<div class="col-md-12 ">
					<div class="col-md-4 col-sm-3 col-xs-6">
						<div class="team-member"></div>
					</div>
					<div class="col-md-4 col-sm-3 col-xs-6">
						<div class="team-member">
							<button type="submit" id="submit" name="submit"
								class="btn btn-success btn-block btn-lg " data-wow-delay="0.8s">Update Bank Details</button>
						</div>
					</div>
					<div class="col-md-4 col-sm-3 col-xs-6">
						<div class="team-member"></div>
					</div>
				</div>



			</form:form>
		</div>
	</div>
</section>
<!--END ABOUT SECTION-->
