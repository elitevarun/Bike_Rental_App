
<%@page import="com.bikerantalapp.Implementation.PaymentsDAOImpl"%>
<%@page import="com.bikerentalapp.DAO.PaymentsDAO"%>
<%@page import="com.bikerentalapp.DTO.Payment"%>
<%@page import="com.bikerentalapp.DTO.Admin"%>
<%@page import="java.util.List"%>

<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
Admin admin = (Admin) session.getAttribute("admin");

if (admin == null) {

	response.sendRedirect("../login.jsp");
	return;

}

PaymentsDAO pdao = new PaymentsDAOImpl();

List<Payment> paymentList = pdao.findAll();

if (paymentList == null) {

	paymentList = new java.util.ArrayList<>();

}
%>


<!DOCTYPE html>

<html>

<head>

<%@include file="../components/head.jsp"%>

<title>Manage Payments</title>

</head>


<body class="bg-slate-950 text-white font-poppins">


	<div class="flex min-h-screen">


		<!-- ================= SIDEBAR ================= -->


		<div class="w-72 bg-slate-900">


			<div class="p-8 border-b border-slate-800">


				<h1 class="text-3xl font-bold">

					Bike<span class="text-orange-500">Rental</span>

				</h1>


				<p class="text-slate-400 mt-2">Admin Panel</p>


			</div>



			<nav class="mt-8">


				<a
					href="${pageContext.request.contextPath}/admin/admindashboard.jsp"
					class="flex items-center gap-4 px-8 py-5 bg-orange-500"> 🏠
					Dashboard </a> <a
					href="${pageContext.request.contextPath}/admin/adminVehicles.jsp?action=adminVehicles"
					class="flex items-center gap-4 px-8 py-5 hover:bg-slate-800">

					🏍 Manage Vehicles </a> <a
					href="${pageContext.request.contextPath}/admin/adminBookings.jsp?action=adminBookings"
					class="flex items-center gap-4 px-8 py-5 hover:bg-slate-800">

					📖 Manage Bookings </a> 
					<a
					href="${pageContext.request.contextPath}/admin/adminPayments.jsp?action=adminPayments"
					class="flex items-center gap-4 px-8 py-5 hover:bg-slate-800">

					💳 Manage Payments </a>
					 <a href="${pageContext.request.contextPath}/admin/adminUsers.jsp?action=allUsers"
					class="flex items-center gap-4 px-8 py-5 hover:bg-slate-800">

					👥 Manage Users </a> 
					<a href="${pageContext.request.contextPath}/logout"
					class="flex items-center gap-4 px-8 py-5 hover:bg-red-600"> 🚪
					Logout </a>


			</nav>


		</div>





		<!-- ================= CONTENT ================= -->


		<div class="flex-1">


			<div class="bg-slate-900 border-b border-slate-800 px-10 py-6">


				<h2 class="text-4xl font-bold">Manage Payments</h2>


				<p class="text-slate-400 mt-2">View and update payments.</p>


			</div>





			<div class="p-10">



				<div class="flex justify-between items-center mb-8">


					<input id="searchBox" type="text" placeholder="Search payment..."
						class="w-96 bg-slate-900 border border-slate-700 rounded-xl px-5 py-4 outline-none focus:border-orange-500">



					<select id="statusFilter"
						class="bg-slate-900 border border-slate-700 rounded-xl px-5 py-4">


						<option value="All">All Status</option>


						<option value="Pending">Pending</option>


						<option value="Paid">Paid</option>


						<option value="Failed">Failed</option>


						<option value="Refunded">Refunded</option>


					</select>


				</div>







				<div class="bg-slate-900 rounded-3xl overflow-hidden">


					<table class="w-full">


						<thead class="bg-orange-500">


							<tr>


								<th class="p-5 text-left">Payment ID</th>


								<th class="p-5 text-left">Booking</th>


								<th class="p-5 text-left">Amount</th>


								<th class="p-5 text-left">Mode</th>


								<th class="p-5 text-left">Status</th>


								<th class="p-5 text-center">Update</th>


							</tr>


						</thead>





						<tbody>



							<%
							for (Payment payment : paymentList) {
							%>



							<tr class="border-b border-slate-800">


								<td class="p-5">#<%=payment.getPaymentId()%>

								</td>



								<td class="p-5">#<%=payment.getBookingId()%>

								</td>



								<td class="p-5 text-orange-500">₹<%=payment.getAmount()%>

								</td>



								<td class="p-5"><%=payment.getPaymentMode()%></td>



								<td class="p-5">
									<%
									String color = "";

									switch (payment.getPaymentStatus()) {

										case "Paid" :
											color = "bg-green-500";
											break;

										case "Failed" :
											color = "bg-red-500";
											break;

										case "Refunded" :
											color = "bg-blue-500";
											break;

										default :
											color = "bg-yellow-500";

									}
									%> <span class="<%=color%> px-4 py-2 rounded-full"> <%=payment.getPaymentStatus()%>

								</span>


								</td>





								<td class="p-5">


									<form action="${pageContext.request.contextPath}/PaymentSave?payment_id=<%=payment.getPaymentId() %>" method="post"
										class="flex gap-3">


										<input type="hidden" name="action" value="updateStatus">



										<input type="hidden" name="paymentId"
											value="<%=payment.getPaymentId()%>"> 
											<select
											name="status" class="bg-slate-800 rounded-lg p-2">


											<option
												<%=payment.getPaymentStatus().equals("Pending") ? "selected" : ""%>>
												Pending</option>


											<option
												<%=payment.getPaymentStatus().equals("Paid") ? "selected" : ""%>>
												Paid</option>


											<option
												<%=payment.getPaymentStatus().equals("Failed") ? "selected" : ""%>>
												Failed</option>


											<option
												<%=payment.getPaymentStatus().equals("Refunded") ? "selected" : ""%>>
												Refunded</option>



										</select>





										<button type="submit"
											class="bg-orange-500 hover:bg-orange-600 px-4 rounded-lg">

											Save</button>



									</form>


								</td>



							</tr>


							<%
							}
							%>



						</tbody>



					</table>


				</div>



			</div>


		</div>



	</div>






	<script>


const searchBox=document.getElementById("searchBox");

const statusFilter=document.getElementById("statusFilter");


const rows=document.querySelectorAll("tbody tr");



function filterPayments(){


let search=searchBox.value.toLowerCase();


let status=statusFilter.value.toLowerCase();



rows.forEach(row=>{


let text=row.innerText.toLowerCase();


let paymentStatus=row.children[4].innerText.toLowerCase();



let searchMatch=text.includes(search);



let statusMatch=
status=="all" ||
paymentStatus.includes(status);



if(searchMatch && statusMatch){

row.style.display="";

}
else{

row.style.display="none";

}


});


}




searchBox.addEventListener("keyup",filterPayments);

statusFilter.addEventListener("change",filterPayments);



</script>



</body>

</html>