
<%@page import="com.bikerantalapp.Implementation.VehiclesDAOImpl"%>
<%@page import="com.bikerentalapp.DAO.VehiclesDAO"%>
<%@page import="com.bikerantalapp.Implementation.UsersDAOImpl"%>
<%@page import="com.bikerentalapp.DAO.UsersDAO"%>
<%@page import="com.bikerentalapp.DAO.PaymentsDAO"%>
<%@page import="com.bikerantalapp.Implementation.PaymentsDAOImpl"%>
<%@page import="com.bikerantalapp.Implementation.BookingsDAOImpl"%>
<%@page import="com.bikerentalapp.DAO.BookingsDAO"%>
<%@page import="com.bikerentalapp.DTO.Booking"%>
<%@page import="com.bikerentalapp.DTO.Payment"%>
<%@page import="com.bikerentalapp.DTO.Admin"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
Admin admin = (Admin) session.getAttribute("admin");

if (admin == null) {
	response.sendRedirect(request.getContextPath() +"/pages/login.jsp");
	return;
}



BookingsDAO bdao = new BookingsDAOImpl();

UsersDAO udao=new UsersDAOImpl(); 

VehiclesDAO vdao=new VehiclesDAOImpl(); 

PaymentsDAO pdao = new PaymentsDAOImpl();
%>

<!DOCTYPE html>
<html>

<head>

<%@include file="../components/head.jsp"%>

<title>Admin Dashboard</title>

</head>

<body class="bg-slate-950 text-white font-poppins">

	<div class="flex min-h-screen">

		<!-- ====================================== -->
		<!-- SIDEBAR -->
		<!-- ====================================== -->

		<div class="w-72 bg-slate-900 shadow-xl">

			<div class="p-8 border-b border-slate-800">

				<h1 class="text-3xl font-bold">

					Bike<span class="text-orange-500">Rental</span>

				</h1>

				<p class="text-slate-400 mt-2">Admin Panel</p>

			</div>

			<nav class="mt-8">

				<a href="${pageContext.request.contextPath}/admin/admindashboard.jsp"
					class="flex items-center gap-4 px-8 py-5 bg-orange-500"> 🏠
					Dashboard </a> <a href="${pageContext.request.contextPath}/admin/adminVehicles.jsp?action=adminVehicles"
					class="flex items-center gap-4 px-8 py-5 hover:bg-slate-800">

					🏍 Manage Vehicles </a>
					 <a
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

		<!-- ====================================== -->
		<!-- CONTENT -->
		<!-- ====================================== -->

		<div class="flex-1">

			<!-- HEADER -->

			<div
				class="bg-slate-900 border-b border-slate-800 px-10 py-6 flex justify-between items-center">

				<div>

					<h2 class="text-4xl font-bold">Dashboard</h2>

					<p class="text-slate-400 mt-2">

						Welcome,
						<%=admin.getName()%>

					</p>

				</div>

				<div>

					<span class="bg-orange-500 px-5 py-3 rounded-xl">

						Administrator </span>

				</div>

			</div>

			<!-- MAIN -->

			<div class="p-10">

				<div class="grid md:grid-cols-2 xl:grid-cols-4 gap-8">

					<!-- Users -->
               
<%

   Long countUsers = udao.findAll()
           .stream()
           .count();
%>


					<div class="bg-slate-900 rounded-3xl p-8 shadow-xl">

						<div class="text-5xl">👥</div>

						<p class="text-slate-400 mt-6">Total Users</p>

						<h2 class="text-5xl font-bold text-orange-500 mt-4"><%=countUsers %></h2>

					</div>

					<!-- Vehicles -->

<%

Long countVehicles = vdao.findAll()
.stream()
.count();
%>


					<div class="bg-slate-900 rounded-3xl p-8 shadow-xl">

						<div class="text-5xl">🏍</div>

						<p class="text-slate-400 mt-6">Vehicles</p>

						<h2 class="text-5xl font-bold text-orange-500 mt-4"><%=countVehicles %></h2>

					</div>

					<!-- Bookings -->
<%


Long countBookings =bdao.findAll()
.stream()
.count();

%>



					<div class="bg-slate-900 rounded-3xl p-8 shadow-xl">

						<div class="text-5xl">📖</div>

						<p class="text-slate-400 mt-6">Bookings</p>

						<h2 class="text-5xl font-bold text-orange-500 mt-4"><%=countBookings %></h2>

					</div>

					<!-- Payments -->
<%


Long countPayments =pdao.findAll()
.stream()
.count();

%>


					<div class="bg-slate-900 rounded-3xl p-8 shadow-xl">

						<div class="text-5xl">💳</div>

						<p class="text-slate-400 mt-6">Payments</p>

						<h2 class="text-5xl font-bold text-orange-500 mt-4"><%=countPayments %></h2>

					</div>

				</div>


				<div class="mt-12">

					<h2 class="text-3xl font-bold mb-8">Quick Actions</h2>

					<div class="grid md:grid-cols-2 xl:grid-cols-4 gap-8">

						<a href="${pageContext.request.contextPath}/admin/adminVehicles.jsp?action=adminVehicles"
							class="bg-slate-900 rounded-3xl p-8 hover:bg-orange-500 transition">

							<div class="text-5xl">🏍</div>

							<h3 class="text-2xl font-semibold mt-6">Manage Bikes</h3>

						</a>
						 <a href="${pageContext.request.contextPath}/admin/adminBookings.jsp?action=adminBookings"
							class="bg-slate-900 rounded-3xl p-8 hover:bg-orange-500 transition">

							<div class="text-5xl">📖</div>

							<h3 class="text-2xl font-semibold mt-6">Bookings</h3>

						</a> 
						<a href="${pageContext.request.contextPath}/admin/adminPayments.jsp?action=adminPayments"
							class="bg-slate-900 rounded-3xl p-8 hover:bg-orange-500 transition">

							<div class="text-5xl">💳</div>

							<h3 class="text-2xl font-semibold mt-6">Payments</h3>

						</a> 
						<a href="${pageContext.request.contextPath}/admin/adminUsers.jsp?action=allUsers"
							class="bg-slate-900 rounded-3xl p-8 hover:bg-orange-500 transition">

							<div class="text-5xl">👥</div>

							<h3 class="text-2xl font-semibold mt-6">Users</h3>

						</a>

					</div>

				</div>



				<%@page import="java.util.List"%>


				<%
				

				List<Booking> allBookingList = bdao.getBooking();

				if (allBookingList == null) {
					response.sendRedirect(request.getContextPath() +"/admin/adminVehicle.jsp");
				}
				%>

				<!-- ======================================= -->
				<!-- BOOKINGS -->
				<!-- ======================================= -->

				<div class="mt-14">

					<div class="flex justify-between items-center mb-6">

						<h2 class="text-3xl font-bold">Recent Bookings</h2>

						<a href="${pageContext.request.contextPath}/admin/adminBookings.jsp?action=adminBookings"
							class="text-orange-500 hover:underline"> View All </a>

					</div>

					<div class="bg-slate-900 rounded-3xl overflow-hidden">

						<table class="w-full">

							<thead class="bg-orange-500">

								<tr>

									<th class="p-5 text-left">Booking ID</th>

									<th class="p-5 text-left">Customer</th>

									<th class="p-5 text-left">Bike</th>

									<th class="p-5 text-left">Amount</th>

									<th class="p-5 text-left">Status</th>

									<th class="p-5 text-center">Update</th>

								</tr>

							</thead>

							<tbody>

								<%
								for (Booking booking : allBookingList) {
								%>

								<tr class="border-b border-slate-800">

									<td class="p-5">#<%=booking.getBookingId()%>

									</td>

									<td class="p-5"><%=booking.getFirstName()%> <%=booking.getLastName()%>

									</td>

									<td class="p-5"><%=booking.getModel()%></td>

									<td class="p-5 text-orange-500">₹<%=booking.getTotalAmount()%>

									</td>

									<td class="p-5">
										<%
										String bookingColor = "";

										switch (booking.getBookingStatus()) {

										case "Pending":

											bookingColor = "bg-yellow-500";

											break;

										case "Confirmed":

											bookingColor = "bg-green-500";

											break;

										case "Cancelled":

											bookingColor = "bg-red-500";

											break;

										default:

											bookingColor = "bg-blue-500";

										}
										%> <span class="<%=bookingColor%> px-4 py-2 rounded-full">
											<%=booking.getBookingStatus()%>

									</span>

									</td>

									<td class="p-5">

										<form action="../BookingController" method="post"
											class="flex gap-3">

											<input type="hidden" name="action" value="updateStatus">

											<input type="hidden" name="bookingId"
												value="<%=booking.getBookingId()%>"> <select
												name="status" class="bg-slate-800 rounded-lg p-2">

												<option
													<%=booking.getBookingStatus().equals("Pending") ? "selected" : ""%>>

													Pending</option>

												<option
													<%=booking.getBookingStatus().equals("Confirmed") ? "selected" : ""%>>

													Confirmed</option>

												<option
													<%=booking.getBookingStatus().equals("Completed") ? "selected" : ""%>>

													Completed</option>

												<option
													<%=booking.getBookingStatus().equals("Cancelled") ? "selected" : ""%>>

													Cancelled</option>

											</select>

											<button
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





				<%
		
				List<Payment> paymentList = pdao.findAll();

				if (paymentList == null) {

				}
				%>

				<!-- ======================================= -->
				<!-- PAYMENTS -->
				<!-- ======================================= -->

				<div class="mt-14">

					<div class="flex justify-between items-center mb-6">

						<h2 class="text-3xl font-bold">Recent Payments</h2>

						<a href="${pageContext.request.contextPath}/admin/adminPayments.jsp?action=adminPayments"
							class="text-orange-500 hover:underline"> View All </a>

					</div>

					<div class="bg-slate-900 rounded-3xl overflow-hidden">

						<table class="w-full">

							<thead class="bg-orange-500">

								<tr>

									<th class="p-5">Payment ID</th>

									<th class="p-5">Booking</th>

									<th class="p-5">Amount</th>

									<th class="p-5">Mode</th>

									<th class="p-5">Status</th>

									<th class="p-5">Update</th>

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

									<td class="p-5"><%=payment.getPaymentStatus()%></td>

									<td class="p-5">

										<form action="../PaymentController" method="post"
											class="flex gap-3">

											<input type="hidden" name="action" value="updateStatus">

											<input type="hidden" name="paymentId"
												value="<%=payment.getPaymentId()%>"> <select
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

											<button
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
</body>

</html>