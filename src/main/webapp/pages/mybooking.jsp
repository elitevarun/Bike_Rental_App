<%@page import="com.bikerantalapp.Implementation.BookingsDAOImpl"%>
<%@page import="com.bikerentalapp.DAO.BookingsDAO"%>
<%@page import="com.bikerentalapp.DTO.Booking"%>

<%@page import="com.bikerentalapp.DTO.User"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
User user = (User) session.getAttribute("user");

if (user == null) {
	response.sendRedirect(request.getContextPath() +"/pages/login.jsp");
	return;
}
BookingsDAO bdao=new BookingsDAOImpl();
List<Booking> bookingList = bdao.getBookingByUser(user.getUserId());

if (bookingList == null) {
	response.sendRedirect(request.getContextPath() +"/pages/vehicle.jsp");
	return;
}
%>

<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<%@include file="../components/head.jsp"%>

<title>My Bookings</title>

</head>

<body class="bg-slate-950 text-white font-poppins">

	<jsp:include page="../components/navbar.jsp" />

	<section class="pt-32 pb-20">

		<div class="max-w-7xl mx-auto px-6">

			<!-- ===================================== -->

			<div class="flex justify-between items-center mb-12">

				<div>

					<h1 class="text-5xl font-bold">My Bookings</h1>

					<p class="text-slate-400 mt-3">Manage all your bookings.</p>

				</div>

				<a href="${pageContext.request.contextPath}/pages/vehicle.jsp?action=viewAll"
					class="bg-orange-500 hover:bg-orange-600 px-7 py-4 rounded-xl">

					Book New Bike </a>

			</div>

			<%
			String msg = request.getParameter("msg");

			if ("paymentSuccess".equals(msg)) {
			%>

			<div class="bg-green-600 rounded-xl p-5 mb-10">Payment
				Successful! Your booking has been confirmed.</div>

			<%
			}
			%>



			<div class="bg-slate-900 rounded-3xl overflow-hidden shadow-xl">

				<table class="w-full">

					<thead class="bg-orange-500">

						<tr>

							<th class="p-5 text-left">Booking ID</th>

							<th class="p-5 text-left">Vehicle</th>

							<th class="p-5 text-left">Start</th>

							<th class="p-5 text-left">End</th>

							<th class="p-5 text-left">Days</th>

							<th class="p-5 text-left">Amount</th>

							<th class="p-5 text-left">Status</th>

							<th class="p-5 text-center">Action</th>

						</tr>

					</thead>

					<tbody>


						<%
						if (bookingList.isEmpty()) {
						%>

						<tr>

							<td colspan="8">

								<div class="text-center py-20">

									<h2 class="text-4xl font-bold">No Bookings Found</h2>

									<p class="text-slate-400 mt-5">Book your first bike today.

									</p>

								</div>

							</td>

						</tr>

						<%
						} else {

						for (Booking booking : bookingList) {

							String color = "";

							switch (booking.getBookingStatus()) {

							case "Pending":

								color = "bg-yellow-500";

								break;

							case "Confirmed":

								color = "bg-green-500";

								break;

							case "Cancelled":

								color = "bg-red-500";

								break;

							default:

								color = "bg-blue-500";

							}
						%>
						<tr
							class="border-b border-slate-800 hover:bg-slate-800 transition">

							<!-- Booking ID -->

							<td class="p-5 font-semibold">#<%=booking.getBookingId()%>

							</td>

							<!-- Vehicle -->

							<td class="p-5">

								<div>

									<h3 class="font-semibold">

										<%=booking.getModel()%>

									</h3>

									<p class="text-sm text-slate-400">

										Vehicle ID :
										<%=booking.getVehicleId()%>

									</p>

								</div>

							</td>

							<!-- Start -->

							<td class="p-5"><%=booking.getStartDate()%></td>

							<!-- End -->

							<td class="p-5"><%=booking.getEndDate()%></td>

							<!-- Days -->

							<td class="p-5"><%=booking.getTotalDays()%></td>

							<!-- Amount -->

							<td class="p-5 font-bold text-orange-500">₹<%=booking.getTotalAmount()%>

							</td>

							<!-- Status -->

							<td class="p-5"><span
								class="<%=color%> px-4 py-2 rounded-full text-sm"> <%=booking.getBookingStatus()%>

							</span></td>

							<!-- Actions -->

							<td class="p-5">

								<div class="flex justify-center gap-3">

									<!-- View -->

									<a
										href="../BookingController?action=view&id=<%=booking.getBookingId()%>"
										class="bg-blue-500 hover:bg-blue-600 px-4 py-2 rounded-lg">

										View </a>

									<%
									if (booking.getBookingStatus().equals("Pending") || booking.getBookingStatus().equals("Confirmed")) {
									%>

									<a
										href="../BookingController?action=cancel&id=<%=booking.getBookingId()%>"
										onclick="return confirm('Cancel this booking?')"
										class="bg-red-500 hover:bg-red-600 px-4 py-2 rounded-lg">

										Cancel </a>

									<%
									}
									%>

								</div>

							</td>

						</tr>

						<%
						}

						}
						%>
					</tbody>

				</table>

			</div>
		</div>

	</section>

	<jsp:include page="../components/footer.jsp" />

</body>

</html>






