<%@page import="java.util.List"%>
<%@page import="cz.jiripinkas.jba.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../../layout/taglib.jsp"%>



<div class="myClass">

	<table width="100%">
		<tr>
			<td align="center">
				<table>
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
			</td>
		</tr>
	</table>
	<table width="100%">
		<tr>
			<td>
				<table width="100%">
					<tr>
						<td colspan="4"><b>Member Left Confirm :</b> <span
							id="ContentPlaceHolder1_lblleftinvrt" style="font-weight: 700">121</span>
							<br /> <b>Bussines Left Confirm :</b> <span
							id="ContentPlaceHolder1_lblleftconf" style="font-weight: 700">1000</span>
							<br /> <b>Bussines Left UnConfirm :</b> <span
							id="ContentPlaceHolder1_lblleftunconf" style="font-weight: 700">4500</span>
							<br /> <b>Member Left Un-Confirm :</b> <span
							id="ContentPlaceHolder1_lbl_LeftUnConfirm"
							style="font-weight: 700">11</span> <br /> <b>Member Left
								Commitment :</b> <span id="ContentPlaceHolder1_lbl_LeftCommitment"
							style="font-weight: 700">5500</span></td>
						<td colspan="4" align="right"><b>Member Right Confirm :</b> <span
							id="ContentPlaceHolder1_lblrightinvt" style="font-weight: 700">0</span>
							<br /> <b>Bussines Right Confirm :</b> <span
							id="ContentPlaceHolder1_lblrightconf" style="font-weight: 700">0</span>
							<br /> <b>Bussines Right UnConfirm :</b> <span
							id="ContentPlaceHolder1_lblrightunconf" style="font-weight: 700">0</span>
							<br /> <b>Member Right Un-Confirm :</b> <span
							id="ContentPlaceHolder1_lbl_RightUnConfirm"
							style="font-weight: 700">0</span> <br /> <b>Member Right
								Commitment:</b> <span id="ContentPlaceHolder1_lbl_RightCommitment"
							style="font-weight: 700">0</span></td>
					</tr>

					<!-- pics start here -->
					<%
						int x = 0;
						int i = Integer.parseInt(request.getAttribute("rows").toString());
						i++;

						User user = (User) request.getAttribute("user");
						List<User> list = user.getDownlineUsers();
						int size = list.size();
					%>

					<!-- row 1 -->

					<tr>
						<td colspan="<%out.print(Math.pow(2, i));%>" align="center">
							<c:choose>
								<c:when test="${user.gender == 'M' }">
									<img id="" src="/resources/gen/MGreen.png"
										style="height: 79px; width: 65px;" />
								</c:when>
								<c:otherwise>
									<img id="" src="/resources/gen/FYellow.png"
										style="height: 79px; width: 65px;" />
								</c:otherwise>
							</c:choose> <br /> <span id=""><c:out value="${user.id }" /></span><br />
							<span id=""><c:out value="${user.name }" /><br /></span><br />
						</td>
					</tr>

					<!-- row 1/ -->
					<!-- row 2 -->

					<%
						int b = i - 1;
						int k = 1;
						for (int a = 0; a < b; a++) {
					%>
					<tr>
						<%
							for (int j = 0; j < k; j++) {
						%>
						<td colspan="<%out.print(Math.pow(2, i));%>" align="center"><img
							src="/resources/gen/bar001.png" style="width: <%= 465/(a+1)%>px" /></td>
						<%
							}
						%>
					</tr>


					<%
						i--;
					%>
					<tr>
						<%
							for (int j = 0; j < 2 * k; j++) {
						%>

						<td colspan="<%out.print(Math.pow(2, i));%>" align="center">
						<%
						if (x < size && list.get(x).getGender()=='M') {
			 			%>
			 			<input
							type="image" name="ctl00$ContentPlaceHolder1$ImageButton1"
							id="ContentPlaceHolder1_ImageButton1"
							src="/resources/gen/MGreen.png"
							style="height: 79px; width: 65px;" />
							
			 			<% 	
			 			}else if (x < size && list.get(x).getGender()=='F'){
			 				%>
			 				<input
							type="image" name="ctl00$ContentPlaceHolder1$ImageButton1"
							id="ContentPlaceHolder1_ImageButton1"
							src="/resources/gen/FYellow.png"
							style="height: 79px; width: 65px;" />
							
			 				<%
						}else{
							%>
							<input
							type="image" name="ctl00$ContentPlaceHolder1$ImageButton1"
							id="ContentPlaceHolder1_ImageButton1"
							src="/resources/gen/Mvacant.png"
							style="height: 79px; width: 65px;" />
							
							<%
						}
						%>
						
							
							<br /> <span
							id="ContentPlaceHolder1_LVL1Leftuid1"> <%
 	if (x >= size) {
 				out.print("Vacant");
 			} else {
 				out.print(list.get(x).getId());
 			}
 %>
						</span><br /> <span id="ContentPlaceHolder1_LVL1Leftappname1"> <%
 	if (x >= size) {
 				out.print("Vacant");
 			} else {
 				out.print(list.get(x).getName());
 			}
 %>
						</span><br /></td>
						<%
							x++;
								}
						%>
					</tr>
					<%
						k++;
						}
					%>
					<%-- 					</c:forEach>
 --%>


					<!-- row 2/ -->
					<%--
				<!-- row 3 -->
	
					<tr>
						<td colspan="<%out.print(Math.pow(2, i));%>" align="center"><img
							src="/resources/gen/bar002.png" style="width: 230px" /></td>
						<td colspan="<%out.print(Math.pow(2, i));%>" style="text-align: center"><img
							src="/resources/gen/bar002.png" style="width: 230px" /></td>
					</tr>


  				<% i--; %>
					<tr>
						<td colspan="2" align="center"><input type="image"
							name="ctl00$ContentPlaceHolder1$ImageButton3"
							id="ContentPlaceHolder1_ImageButton3"
							src="/resources/gen/MGreen.png"
							style="height: 79px; width: 65px;" /><br /> <span
							id="ContentPlaceHolder1_LVL2Leftuid1_1">shyamchalise2</span><br />
							<span id="ContentPlaceHolder1_LVL2Leftappname1_1">SHYAM
								PRASAD CHALISE</span><br /></td>
						<td colspan="2" align="center"><input type="image"
							name="ctl00$ContentPlaceHolder1$ImageButton4"
							id="ContentPlaceHolder1_ImageButton4"
							src="/resources/gen/Mvacant.png"
							style="height: 79px; width: 65px;" /><br /> <span
							id="ContentPlaceHolder1_LVL2Rightuid1_2">Vacant</span><br /> <span
							id="ContentPlaceHolder1_LVL2Rightappname1_2">Vacant</span><br />

						</td>
						<td colspan="2" align="center"><input type="image"
							name="ctl00$ContentPlaceHolder1$ImageButton5"
							id="ContentPlaceHolder1_ImageButton5"
							src="/resources/gen/Mvacant.png"
							style="height: 79px; width: 65px;" /><br /> <span
							id="ContentPlaceHolder1_LVL2Leftuid2_3">Vacant</span><br /> <span
							id="ContentPlaceHolder1_LVL2Leftappname2_3">Vacant</span><br />

						</td>
						<td colspan="2" align="center"><input type="image"
							name="ctl00$ContentPlaceHolder1$ImageButton6"
							id="ContentPlaceHolder1_ImageButton6"
							src="/resources/gen/Mvacant.png"
							style="height: 79px; width: 65px;" /><br /> <span
							id="ContentPlaceHolder1_LVL2Rightuid2_4">Vacant</span><br /> <span
							id="ContentPlaceHolder1_LVL2Rightappname2_4">Vacant</span><br />

						</td>
					</tr>
					<tr>
						<td colspan="2" align="center"><img
							src="/resources/gen/bar003.png" style="width: 120px" /></td>
						<td colspan="2" align="center"><img
							src="/resources/gen/bar003.png" style="width: 120px" /></td>
						<td colspan="2" align="center"><img
							src="/resources/gen/bar003.png" style="width: 120px" /></td>
						<td colspan="2" align="center"><img
							src="/resources/gen/bar003.png" style="width: 120px" /></td>
					</tr>
					<tr>
						<td align="center"><input type="image"
							name="ctl00$ContentPlaceHolder1$ImageButton7"
							id="ContentPlaceHolder1_ImageButton7"
							src="/resources/gen/MYellow.png"
							style="height: 79px; width: 65px;" /><br /> <span
							id="ContentPlaceHolder1_LVL3Leftuid1_1_1">Gurdhian</span><br />
							<span id="ContentPlaceHolder1_LVL3Leftappname1_1_1">Gurdhian
								Singh</span><br /></td>
						<td align="center"><input type="image"
							name="ctl00$ContentPlaceHolder1$ImageButton8"
							id="ContentPlaceHolder1_ImageButton8"
							src="/resources/gen/Mvacant.png"
							style="height: 79px; width: 65px;" /><br /> <span
							id="ContentPlaceHolder1_LVL3Rightuid1_1_2">Vacant</span><br /> <span
							id="ContentPlaceHolder1_LVL3Rightappname1_1_2">Vacant</span><br />

						</td>
						<td align="center"><input type="image"
							name="ctl00$ContentPlaceHolder1$ImageButton9"
							id="ContentPlaceHolder1_ImageButton9"
							src="/resources/gen/Mvacant.png"
							style="height: 79px; width: 65px;" /><br /> <span
							id="ContentPlaceHolder1_LVL3Leftuid1_2_3">Vacant</span><br /> <span
							id="ContentPlaceHolder1_LVL3Leftappname1_2_3">Vacant</span><br />

						</td>
						<td align="center"><input type="image"
							name="ctl00$ContentPlaceHolder1$ImageButton10"
							id="ContentPlaceHolder1_ImageButton10"
							src="/resources/gen/Mvacant.png"
							style="height: 79px; width: 65px;" /><br /> <span
							id="ContentPlaceHolder1_LVL3Rightuid1_2_4">Vacant</span><br /> <span
							id="ContentPlaceHolder1_LVL3Rightappname1_2_4">Vacant</span><br />

						</td>
						<td align="center"><input type="image"
							name="ctl00$ContentPlaceHolder1$ImageButton11"
							id="ContentPlaceHolder1_ImageButton11"
							src="/resources/gen/Mvacant.png"
							style="height: 79px; width: 65px;" /><br /> <span
							id="ContentPlaceHolder1_LVL3Leftuid2_3_5">Vacant</span><br /> <span
							id="ContentPlaceHolder1_LVL3Leftappname2_3_5">Vacant</span><br />

						</td>
						<td align="center"><input type="image"
							name="ctl00$ContentPlaceHolder1$ImageButton12"
							id="ContentPlaceHolder1_ImageButton12"
							src="/resources/gen/Mvacant.png"
							style="height: 79px; width: 65px;" /><br /> <span
							id="ContentPlaceHolder1_LVL3Rightuid2_3_6">Vacant</span><br /> <span
							id="ContentPlaceHolder1_LVL3Rightappname2_3_6">Vacant</span><br />

						</td>
						<td align="center"><input type="image"
							name="ctl00$ContentPlaceHolder1$ImageButton13"
							id="ContentPlaceHolder1_ImageButton13"
							src="/resources/gen/Mvacant.png"
							style="height: 79px; width: 65px;" /><br /> <span
							id="ContentPlaceHolder1_LVL3Leftuid2_4_7">Vacant</span><br /> <span
							id="ContentPlaceHolder1_LVL3Leftappname2_4_7">Vacant</span><br />

						</td>
						<td align="center"><input type="image"
							name="ctl00$ContentPlaceHolder1$ImageButton14"
							id="ContentPlaceHolder1_ImageButton14"
							src="/resources/gen/Mvacant.png"
							style="height: 79px; width: 65px;" /><br /> <span
							id="ContentPlaceHolder1_LVL3Rightuid2_4_8">Vacant</span><br /> <span
							id="ContentPlaceHolder1_LVL3Rightappname2_4_8">Vacant</span><br />

						</td>
					</tr> --%>
				</table>



			</td>
		</tr>
	</table>

	<!-- 
	<table>
		<tr>
			<td>
				<div id="ContentPlaceHolder1_RadToolTipManager1"
					style="display: none; position: absolute;">
					2009.3.1208.35
					<div id="ContentPlaceHolder1_RadToolTipManager1RTMPanel"></div>
					<input id="ContentPlaceHolder1_RadToolTipManager1_ClientState"
						name="ContentPlaceHolder1_RadToolTipManager1_ClientState"
						type="hidden" />
				</div>
				<div id="ContentPlaceHolder1_RadToolTip1"
					style="background-color: White; display: none; position: absolute;">

					<table border="1" bordercolor="Gainsboro" width="100%">
						<tr>
							<td></td>
							<td style="text-align: center">Left Confirm</td>
							<td style="text-align: center">Right Confirm</td>
							<td style="text-align: center">Total</td>
						</tr>
						<tr>
							<td>Member</td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl1RLeft">2</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl1RRight">0</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl1RTotal">2</span></td>
						</tr>
						<tr>
							<td></td>
							<td style="text-align: center">Left Un-Confirm</td>
							<td style="text-align: center">Right Un-Confirm</td>
							<td style="text-align: center">Total</td>
						</tr>
						<tr>
							<td>Member</td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl1LLeft">11</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl1LRight">0</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl1Ltotal">11</span></td>
						</tr>
					</table>
					<input id="ContentPlaceHolder1_RadToolTip1_ClientState"
						name="ContentPlaceHolder1_RadToolTip1_ClientState" type="hidden" />
				</div>

				<div id="ContentPlaceHolder1_RadToolTip2"
					style="background-color: White; display: none; position: absolute;">

					<table border="1" bordercolor="Gainsboro" width="100%">
						<tr>
							<td></td>
							<td style="text-align: center">Left Confirm</td>
							<td style="text-align: center">Right Confirm</td>
							<td style="text-align: center">Total</td>
						</tr>
						<tr>
							<td>Member</td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl2RLeft">2</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl2RRight">0</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl2RTotal">2</span></td>
						</tr>
						<tr>
							<td></td>
							<td style="text-align: center">Left Un-Confirm</td>
							<td style="text-align: center">Right Un-Confirm</td>
							<td style="text-align: center">Total</td>
						</tr>
						<tr>
							<td>Member</td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl2LLeft">10</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl2LRight">0</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl2Total">10</span></td>
						</tr>
					</table>
					<input id="ContentPlaceHolder1_RadToolTip2_ClientState"
						name="ContentPlaceHolder1_RadToolTip2_ClientState" type="hidden" />
				</div>
				<div id="ContentPlaceHolder1_RadToolTip3"
					style="background-color: White; display: none; position: absolute;">

					<table border="1" bordercolor="Gainsboro" width="100%">
						<tr>
							<td></td>
							<td style="text-align: center">Left Confirm</td>
							<td style="text-align: center">Right Confirm</td>
							<td style="text-align: center">Total</td>
						</tr>
						<tr>
							<td>Member</td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl3RLeft">0</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl3RRight">0</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl3RTotal">0</span></td>
						</tr>
						<tr>
							<td></td>
							<td style="text-align: center">Left Un-Confirm</td>
							<td style="text-align: center">Right Un-Confirm</td>
							<td style="text-align: center">Total</td>
						</tr>
						<tr>
							<td>Member</td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl3LLeft">0</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl3Right">0</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl3Total">0</span></td>
						</tr>
					</table>
					<input id="ContentPlaceHolder1_RadToolTip3_ClientState"
						name="ContentPlaceHolder1_RadToolTip3_ClientState" type="hidden" />
				</div>

				<div id="ContentPlaceHolder1_RadToolTip4"
					style="background-color: White; display: none; position: absolute;">

					<table border="1" bordercolor="Gainsboro" width="100%">
						<tr>
							<td></td>
							<td style="text-align: center">Left Confirm</td>
							<td style="text-align: center">Right Confirm</td>
							<td style="text-align: center">Total</td>
						</tr>
						<tr>
							<td>Member</td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl4RLeft">1</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl4RRight">0</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl4RTotal">1</span></td>
						</tr>
						<tr>
							<td></td>
							<td style="text-align: center">Left Un-Confirm</td>
							<td style="text-align: center">Right Un-Confirm</td>
							<td style="text-align: center">Total</td>
						</tr>
						<tr>
							<td>Member</td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl4LLeft">10</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl4LRight">0</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl4LTotal">10</span></td>
						</tr>
					</table>
					<input id="ContentPlaceHolder1_RadToolTip4_ClientState"
						name="ContentPlaceHolder1_RadToolTip4_ClientState" type="hidden" />
				</div>
				<div id="ContentPlaceHolder1_RadToolTip5"
					style="background-color: White; display: none; position: absolute;">

					<table border="1" bordercolor="Gainsboro" width="100%">
						<tr>
							<td></td>
							<td style="text-align: center">Left Confirm</td>
							<td style="text-align: center">Right Confirm</td>
							<td style="text-align: center">Total</td>
						</tr>
						<tr>
							<td>Member</td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl5RLeft">0</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl5RRight">0</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl5RTotal">0</span></td>
						</tr>
						<tr>
							<td></td>
							<td style="text-align: center">Left Un-Confirm</td>
							<td style="text-align: center">Right Un-Confirm</td>
							<td style="text-align: center">Total</td>
						</tr>
						<tr>
							<td>Member</td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl5LLeft">0</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl5LRight">0</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl5LTotal">0</span></td>
						</tr>
					</table>
					<input id="ContentPlaceHolder1_RadToolTip5_ClientState"
						name="ContentPlaceHolder1_RadToolTip5_ClientState" type="hidden" />
				</div>
				<div id="ContentPlaceHolder1_RadToolTip6"
					style="background-color: White; display: none; position: absolute;">

					<table border="1" bordercolor="Gainsboro" width="100%">
						<tr>
							<td></td>
							<td style="text-align: center">Left Confirm</td>
							<td style="text-align: center">Right Confirm</td>
							<td style="text-align: center">Total</td>
						</tr>
						<tr>
							<td>Member</td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl6RLeft">0</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl6RRight">0</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl6RTotal">0</span></td>
						</tr>
						<tr>
							<td></td>
							<td style="text-align: center">Left Un-Confirm</td>
							<td style="text-align: center">Right Un-Confirm</td>
							<td style="text-align: center">Total</td>
						</tr>
						<tr>
							<td>Member</td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl6LLeft">0</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl6LRight">0</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl6LTotal">0</span></td>
						</tr>
					</table>
					<input id="ContentPlaceHolder1_RadToolTip6_ClientState"
						name="ContentPlaceHolder1_RadToolTip6_ClientState" type="hidden" />
				</div>
				<div id="ContentPlaceHolder1_RadToolTip7"
					style="background-color: White; display: none; position: absolute;">

					<table border="1" bordercolor="Gainsboro" width="100%">
						<tr>
							<td></td>
							<td style="text-align: center">Left Confirm</td>
							<td style="text-align: center">Right Confirm</td>
							<td style="text-align: center">Total</td>
						</tr>
						<tr>
							<td>Member</td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl7RLeft">0</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl7RRight">0</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl7RTotal">0</span></td>
						</tr>
						<tr>
							<td></td>
							<td style="text-align: center">Left Un-Confirm</td>
							<td style="text-align: center">Right Un-Confirm</td>
							<td style="text-align: center">Total</td>
						</tr>
						<tr>
							<td>Member</td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl7LLeft">0</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl7LRight">0</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl7LTotal">0</span></td>
						</tr>
					</table>
					<input id="ContentPlaceHolder1_RadToolTip7_ClientState"
						name="ContentPlaceHolder1_RadToolTip7_ClientState" type="hidden" />
				</div>

				<div id="ContentPlaceHolder1_RadToolTip8"
					style="background-color: White; display: none; position: absolute;">

					<table border="1" bordercolor="Gainsboro" width="100%">
						<tr>
							<td></td>
							<td style="text-align: center">Left Confirm</td>
							<td style="text-align: center">Right Confirm</td>
							<td style="text-align: center">Total</td>
						</tr>
						<tr>
							<td>Member</td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl8RLeft">1</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl8RRight">0</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl8RTotal">1</span></td>
						</tr>
						<tr>
							<td></td>
							<td style="text-align: center">Left Un-Confirm</td>
							<td style="text-align: center">Right Un-Confirm</td>
							<td style="text-align: center">Total</td>
						</tr>
						<tr>
							<td>Member</td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl8LLeft">8</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl8LRight">1</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl8LTotal">9</span></td>
						</tr>
					</table>
					<input id="ContentPlaceHolder1_RadToolTip8_ClientState"
						name="ContentPlaceHolder1_RadToolTip8_ClientState" type="hidden" />
				</div>
				<div id="ContentPlaceHolder1_RadToolTip9"
					style="background-color: White; display: none; position: absolute;">

					<table border="1" bordercolor="Gainsboro" width="100%">
						<tr>
							<td></td>
							<td style="text-align: center">Left Confirm</td>
							<td style="text-align: center">Right Confirm</td>
							<td style="text-align: center">Total</td>
						</tr>
						<tr>
							<td>Member</td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl9RLeft">0</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl9RRight">0</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl9RTotal">0</span></td>
						</tr>
						<tr>
							<td></td>
							<td style="text-align: center">Left Un-Confirm</td>
							<td style="text-align: center">Right Un-Confirm</td>
							<td style="text-align: center">Total</td>
						</tr>
						<tr>
							<td>Member</td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl9LLeft">0</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl9LRight">0</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl9LTotal">0</span></td>
						</tr>
					</table>
					<input id="ContentPlaceHolder1_RadToolTip9_ClientState"
						name="ContentPlaceHolder1_RadToolTip9_ClientState" type="hidden" />
				</div>
				<div id="ContentPlaceHolder1_RadToolTip10"
					style="background-color: White; display: none; position: absolute;">

					<table border="1" bordercolor="Gainsboro" width="100%">
						<tr>
							<td></td>
							<td style="text-align: center">Left Confirm</td>
							<td style="text-align: center">Right Confirm</td>
							<td style="text-align: center">Total</td>
						</tr>
						<tr>
							<td>Member</td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl10RLeft">0</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl10RRight">0</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl10RTotal">0</span></td>
						</tr>
						<tr>
							<td></td>
							<td style="text-align: center">Left Un-Confirm</td>
							<td style="text-align: center">Right Un-Confirm</td>
							<td style="text-align: center">Total</td>
						</tr>
						<tr>
							<td>Member</td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl10LLeft">0</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl10LRight">0</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl10LTotal">0</span></td>
						</tr>
					</table>
					<input id="ContentPlaceHolder1_RadToolTip10_ClientState"
						name="ContentPlaceHolder1_RadToolTip10_ClientState" type="hidden" />
				</div>
				<div id="ContentPlaceHolder1_RadToolTip11"
					style="background-color: White; display: none; position: absolute;">

					<table border="1" bordercolor="Gainsboro" width="100%">
						<tr>
							<td></td>
							<td style="text-align: center">Left Confirm</td>
							<td style="text-align: center">Right Confirm</td>
							<td style="text-align: center">Total</td>
						</tr>
						<tr>
							<td>Member</td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl11RLeft">0</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl11RRight">0</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl11RTotal">0</span></td>
						</tr>
						<tr>
							<td></td>
							<td style="text-align: center">Left Un-Confirm</td>
							<td style="text-align: center">Right Un-Confirm</td>
							<td style="text-align: center">Total</td>
						</tr>
						<tr>
							<td>Member</td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl11LLeft">0</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl11LRight">0</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl11LTotal">0</span></td>
						</tr>
					</table>
					<input id="ContentPlaceHolder1_RadToolTip11_ClientState"
						name="ContentPlaceHolder1_RadToolTip11_ClientState" type="hidden" />
				</div>
				<div id="ContentPlaceHolder1_RadToolTip12"
					style="background-color: White; display: none; position: absolute;">

					<table border="1" bordercolor="Gainsboro" width="100%">
						<tr>
							<td></td>
							<td style="text-align: center">Left Confirm</td>
							<td style="text-align: center">Right Confirm</td>
							<td style="text-align: center">Total</td>
						</tr>
						<tr>
							<td>Member</td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl12RLeft">0</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl12RRight">0</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl12RTotal">0</span></td>
						</tr>
						<tr>
							<td></td>
							<td style="text-align: center">Left Un-Confirm</td>
							<td style="text-align: center">Right Un-Confirm</td>
							<td style="text-align: center">Total</td>
						</tr>
						<tr>
							<td>Member</td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl12LLeft">0</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl12LRight">0</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl12LTotal">0</span></td>
						</tr>
					</table>
					<input id="ContentPlaceHolder1_RadToolTip12_ClientState"
						name="ContentPlaceHolder1_RadToolTip12_ClientState" type="hidden" />
				</div>
				<div id="ContentPlaceHolder1_RadToolTip13"
					style="background-color: White; display: none; position: absolute;">

					<table border="1" bordercolor="Gainsboro" width="100%">
						<tr>
							<td></td>
							<td style="text-align: center">Left Confirm</td>
							<td style="text-align: center">Right Confirm</td>
							<td style="text-align: center">Total</td>
						</tr>
						<tr>
							<td>Member</td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl13RLeft">0</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl13RRight">0</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl13RTotal">0</span></td>
						</tr>
						<tr>
							<td></td>
							<td style="text-align: center">Left Un-Confirm</td>
							<td style="text-align: center">Right Un-Confirm</td>
							<td style="text-align: center">Total</td>
						</tr>
						<tr>
							<td>Member</td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl13LLeft">0</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl13LRight">0</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl13LTotal">0</span></td>
						</tr>
					</table>
					<input id="ContentPlaceHolder1_RadToolTip13_ClientState"
						name="ContentPlaceHolder1_RadToolTip13_ClientState" type="hidden" />
				</div>
				<div id="ContentPlaceHolder1_RadToolTip14"
					style="background-color: White; display: none; position: absolute;">

					<table border="1" bordercolor="Gainsboro" width="100%">
						<tr>
							<td></td>
							<td style="text-align: center">Left Confirm</td>
							<td style="text-align: center">Right Confirm</td>
							<td style="text-align: center">Total</td>
						</tr>
						<tr>
							<td>Member</td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl14RLeft">0</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl14RRight">0</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl14RTotal">0</span></td>
						</tr>
						<tr>
							<td></td>
							<td style="text-align: center">Left Un-Confirm</td>
							<td style="text-align: center">Right Un-Confirm</td>
							<td style="text-align: center">Total</td>
						</tr>
						<tr>
							<td>Member</td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl14LLeft">0</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl14LRight">0</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl14LTotal">0</span></td>
						</tr>
					</table>
					<input id="ContentPlaceHolder1_RadToolTip14_ClientState"
						name="ContentPlaceHolder1_RadToolTip14_ClientState" type="hidden" />
				</div>
				<div id="ContentPlaceHolder1_RadToolTip15"
					style="background-color: White; display: none; position: absolute;">

					<table border="1" bordercolor="Gainsboro" width="100%">
						<tr>
							<td></td>
							<td style="text-align: center">Left Confirm</td>
							<td style="text-align: center">Right Confirm</td>
							<td style="text-align: center">Total</td>
						</tr>
						<tr>
							<td>Member</td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl15RLeft">0</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl15RRight">0</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl15RTotal">0</span></td>
						</tr>
						<tr>
							<td></td>
							<td style="text-align: center">Left Un-Confirm</td>
							<td style="text-align: center">Right Un-Confirm</td>
							<td style="text-align: center">Total</td>
						</tr>
						<tr>
							<td>Member</td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl15LLeft">0</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl15LRight">0</span></td>
							<td style="text-align: center"><span
								id="ContentPlaceHolder1_lbl15LTotal">0</span></td>
						</tr>
					</table>
					<input id="ContentPlaceHolder1_RadToolTip15_ClientState"
						name="ContentPlaceHolder1_RadToolTip15_ClientState" type="hidden" />
				</div>
			</td>
		</tr>
	</table>
 -->
</div>

<!-- 
<script type="text/javascript">
	//<![CDATA[
	Sys.Application
			.add_init(function() {
				$create(
						Telerik.Web.UI.RadToolTipManager,
						{
							"_cssClass" : "",
							"_manualCloseButtonText" : "Close",
							"_updatePanelUniqueId" : "ctl00$ContentPlaceHolder1$RadToolTipManager1RTMPanel",
							"clientStateFieldID" : "ContentPlaceHolder1_RadToolTipManager1_ClientState",
							"formID" : "form1",
							"height" : "89px",
							"isToolTipFactory" : true,
							"loadOnDemand" : false,
							"skin" : "Office2007",
							"targetControls" : "[]",
							"width" : "636px"
						}, null, null,
						$get("ContentPlaceHolder1_RadToolTipManager1"));
			});
	Sys.Application
			.add_init(function() {
				$create(
						Telerik.Web.UI.RadToolTip,
						{
							"_cssClass" : "",
							"_manualCloseButtonText" : "Close",
							"autoCloseDelay" : 10000,
							"clientStateFieldID" : "ContentPlaceHolder1_RadToolTip1_ClientState",
							"formID" : "form1",
							"showDelay" : 0,
							"skin" : "Vista",
							"targetControlID" : "ContentPlaceHolder1_img123",
							"title" : "Member Details",
							"width" : "329px"
						}, null, null, $get("ContentPlaceHolder1_RadToolTip1"));
			});
	//]]>
</script> -->