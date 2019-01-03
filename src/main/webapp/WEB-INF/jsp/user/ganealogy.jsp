<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="cz.jiripinkas.jba.service.CommitService"%>
<%@page import="cz.jiripinkas.jba.entity.Commit"%>
<%@page import="java.util.List"%>
<%@page import="cz.jiripinkas.jba.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../../layout/taglib.jsp"%>


<!--ABOUT SECTION-->
<section class="for-full-back color-bg-one">
	<div class="container">
		<div class="row text-center">
			<div class="col-md-8 col-md-offset-2 ">
				<h1>
					<i class="fa fa-microphone faa-pulse animated  "></i>TREE VIEW
				</h1>
			</div>
		</div>
	</div>
</section>
<!-- SOCIAL STATS SECTION-->
<section>
	<div class="container">
		<div class="row pad-top-botm">
			<div class="form-group">

				<table width="100%">
					<tr>
						<td align="center">
							<!-- <table>
					<tr>
						<td>Enter user ID</td>
						<td><input name="ctl00$ContentPlaceHolder1$txtuid"
							type="text" id="ContentPlaceHolder1_txtuid" class="input" /></td>
						<td><input type="submit"
							name="ctl00$ContentPlaceHolder1$btnsearch" value="Search"
							id="ContentPlaceHolder1_btnsearch"
							style="background-color: #FFCC66;" /></td>
					</tr>
					<tr>
						<td colspan="3" align="center"><span
							id="ContentPlaceHolder1_lblmsg"></span></td>
					</tr>
				</table>
			 -->
						</td>
					</tr>
				</table>
				<table width="100%" class="for-full-back color-white">
					<tr>
						<td>
							<table width="100%">

								<!-- pics start here -->
								<%
									User user = (User) request.getAttribute("user");
									List<User> list = user.getDownlineUsers();
									int size = list.size();
								%>

								<tr>
									<td colspan="8" align="center"><c:choose>
											<c:when test="${fn:contains(user.gender, 'M')}">
												<img id="" src="/resources/gen/MGreen.png"
													style="height: 79px; width: 65px;" />
											</c:when>
											<c:otherwise>
												<img id="" src="/resources/gen/FYellow.png"
													style="height: 79px; width: 65px;" />
											</c:otherwise>
										</c:choose> <br /> <span id=""><c:out value="${user.id }" /></span> <br />
										<span id=""><c:out value="${user.name }" /></span> <br /></td>
								</tr>

								<tr>
									<td colspan="8" align="center"><img
										src="/resources/gen/bar001.png" style="width: 465px" /></td>

								</tr>

								<tr>
									<td colspan="8">
										<%
											for (int x = 0; x < size; x++) {
												User usr = list.get(x);
												if (usr.getPosition() == 'L') {
										%>
										<div style="float: left;">
											<%
												} else {
											%>

											<div style="float: right;">
												<%
													}
														if (usr.getGender() == 'M') {
												%>
												<input type="image"
													name="ctl00$ContentPlaceHolder1$ImageButton1"
													id="ContentPlaceHolder1_ImageButton1"
													src="/resources/gen/MGreen.png"
													style="height: 79px; width: 65px;" />
												<%
													} else if (x < size && list.get(x).getGender() == 'F') {
												%>
												<input type="image"
													name="ctl00$ContentPlaceHolder1$ImageButton1"
													id="ContentPlaceHolder1_ImageButton1"
													src="/resources/gen/FYellow.png"
													style="height: 79px; width: 65px;" />
												<%
													} else {
												%>
												<input type="image"
													name="ctl00$ContentPlaceHolder1$ImageButton1"
													id="ContentPlaceHolder1_ImageButton1"
													src="/resources/gen/Mvacant.png"
													style="height: 79px; width: 65px;" />
												<%
													}
												%>
												<br /> <span id="ContentPlaceHolder1_LVL1Leftuid1">
													<%
														if (x >= size) {
																out.print("Vacant");
															} else {
																out.print(list.get(x).getId());
															}
													%>
												</span><br /> <span id="ContentPlaceHolder1_LVL1Leftappname1">
													<%
														if (x >= size) {
																out.print("Vacant");
															} else {
																out.println(list.get(x).getName());
															}
													%>
												</span><br />
											</div>
											<%
												}
											%>
										
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>


			</div>
			<div class="form-group">
				<p>
					<br> <br> <br>
				</p>
			</div>
			<div class="form-group">
				<p></p>
			</div>

		</div>

	</div>
</section>

