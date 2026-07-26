<%@page import="com.bikerantalapp.Implementation.BookingsDAOImpl"%>
<%@page import="com.bikerentalapp.DAO.BookingsDAO"%>
<%@page import="com.bikerentalapp.DTO.Booking"%>
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

BookingsDAO bdao = new BookingsDAOImpl();

List<Booking> allBookingList = bdao.getBooking();

if (allBookingList == null) {
	allBookingList = new java.util.ArrayList<>();
}
%>

<!DOCTYPE html>

<html>

<head>

<%@include file="../components/head.jsp"%>

<title>Manage Bookings</title>

</head>

<body class="bg-slate-950 text-white font-poppins">

<div class="flex min-h-screen">

	<!-- ====================== SIDEBAR ====================== -->

	<div class="w-72 bg-slate-900">

		<div class="p-8 border-b border-slate-800">

			<h1 class="text-3xl font-bold">
				Bike<span class="text-orange-500">Rental</span>
			</h1>

			<p class="text-slate-400 mt-2">Admin Panel</p>

		</div>


		<nav class="mt-8">

			<a href="${pageContext.request.contextPath}/admin/admindashboard.jsp"
				class="flex items-center gap-4 px-8 py-5 bg-orange-500">
				🏠 Dashboard
			</a>


			<a href="${pageContext.request.contextPath}/admin/adminVehicles.jsp?action=adminVehicles"
				class="flex items-center gap-4 px-8 py-5 hover:bg-slate-800">
				🏍 Manage Vehicles
			</a>


			<a href="${pageContext.request.contextPath}/admin/adminBookings.jsp?action=adminBookings"
				class="flex items-center gap-4 px-8 py-5 hover:bg-slate-800">
				📖 Manage Bookings
			</a>


			<a href="${pageContext.request.contextPath}/admin/adminPayments.jsp?action=adminPayments"
				class="flex items-center gap-4 px-8 py-5 hover:bg-slate-800">
				💳 Manage Payments
			</a>


			<a href="../UserController?action=allUsers"
				class="flex items-center gap-4 px-8 py-5 hover:bg-slate-800">
				👥 Manage Users
			</a>


			


			<a href="${pageContext.request.contextPath}/logout"
				class="flex items-center gap-4 px-8 py-5 hover:bg-red-600">
				🚪 Logout
			</a>

		</nav>

	</div>


	<!-- ====================== CONTENT ====================== -->

	<div class="flex-1">


		<div class="bg-slate-900 border-b border-slate-800 px-10 py-6">

			<h2 class="text-4xl font-bold">Manage Bookings</h2>

			<p class="text-slate-400 mt-2">
				View and update customer bookings.
			</p>

		</div>


		<div class="p-10">


			<div class="flex justify-between items-center mb-8">

				<input id="searchBox"
					type="text"
					placeholder="Search booking..."
					class="w-96 bg-slate-900 border border-slate-700 rounded-xl px-5 py-4 outline-none focus:border-orange-500">


				<select id="statusFilter"
					class="bg-slate-900 border border-slate-700 rounded-xl px-5 py-4">

					<option value="All">All Status</option>
					<option value="Pending">Pending</option>
					<option value="Confirmed">Confirmed</option>
					<option value="Completed">Completed</option>
					<option value="Cancelled">Cancelled</option>

				</select>

			</div>



			<div class="bg-slate-900 rounded-3xl overflow-hidden">

				<table class="w-full">


					<thead class="bg-orange-500">

						<tr>

							<th class="p-5 text-left">Booking ID</th>
							<th class="p-5 text-left">Customer</th>
							<th class="p-5 text-left">Bike</th>
							<th class="p-5 text-left">Start Date</th>
							<th class="p-5 text-left">End Date</th>
							<th class="p-5 text-left">Days</th>
							<th class="p-5 text-left">Amount</th>
							<th class="p-5 text-left">Status</th>
							<th class="p-5 text-center">Action</th>

						</tr>

					</thead>



					<tbody>


					<%
					for (Booking booking : allBookingList) {
					%>


						<tr class="border-b border-slate-800">


							<td class="p-5">
								#<%=booking.getBookingId()%>
							</td>


							<td class="p-5">
								<%=booking.getFirstName()%> <%=booking.getLastName()%>
							</td>


							<td class="p-5">
								<%=booking.getModel()%>
							</td>


							<td class="p-5">
								<%=booking.getStartDate()%>
							</td>


							<td class="p-5">
								<%=booking.getEndDate()%>
							</td>


							<td class="p-5">
								<%=booking.getTotalDays()%>
							</td>


							<td class="p-5 text-orange-500">
								₹<%=booking.getTotalAmount()%>
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
							%>


							<span class="<%=bookingColor%> px-4 py-2 rounded-full">

								<%=booking.getBookingStatus()%>

							</span>


							</td>



							<td class="p-5">

								<form action="../BookingController"
									method="post"
									class="flex gap-3">


									<input type="hidden"
										name="action"
										value="updateStatus">


									<input type="hidden"
										name="bookingId"
										value="<%=booking.getBookingId()%>">


									<select name="status"
										class="bg-slate-800 rounded-lg p-2">


										<option <%=booking.getBookingStatus().equals("Pending") ? "selected" : ""%>>
											Pending
										</option>


										<option <%=booking.getBookingStatus().equals("Confirmed") ? "selected" : ""%>>
											Confirmed
										</option>


										<option <%=booking.getBookingStatus().equals("Completed") ? "selected" : ""%>>
											Completed
										</option>


										<option <%=booking.getBookingStatus().equals("Cancelled") ? "selected" : ""%>>
											Cancelled
										</option>


									</select>



									<button class="bg-orange-500 hover:bg-orange-600 px-4 rounded-lg">
										Save
									</button>


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

const searchBox = document.getElementById("searchBox");
const statusFilter = document.getElementById("statusFilter");

const tableRows = document.querySelectorAll("tbody tr");


function filterBookings() {

    let searchValue = searchBox.value.toLowerCase();

    let statusValue = statusFilter.value.toLowerCase();


    tableRows.forEach(row => {

        let rowText = row.innerText.toLowerCase();

        let bookingStatus = row.children[7].innerText.toLowerCase();


        let matchesSearch = rowText.includes(searchValue);


        let matchesStatus =
            statusValue === "all" ||
            bookingStatus.includes(statusValue);



        if (matchesSearch && matchesStatus) {

            row.style.display = "";

        } else {

            row.style.display = "none";

        }


    });


}



searchBox.addEventListener("keyup", filterBookings);


statusFilter.addEventListener("change", filterBookings);


</script>

</body>

</html>