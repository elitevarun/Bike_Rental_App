
<%@page import="com.bikerantalapp.Implementation.UsersDAOImpl"%>
<%@page import="com.bikerentalapp.DAO.UsersDAO"%>
<%@page import="com.bikerentalapp.DTO.User"%>
<%@page import="java.util.List"%>

<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
UsersDAO udao = new UsersDAOImpl();

List<User> userList = udao.findAll();

if (userList == null) {
	userList = new java.util.ArrayList<>();
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

					📖 Manage Bookings </a> <a
					href="${pageContext.request.contextPath}/admin/adminPayments.jsp?action=adminPayments"
					class="flex items-center gap-4 px-8 py-5 hover:bg-slate-800">

					💳 Manage Payments </a> <a href="${pageContext.request.contextPath}/admin/adminUsers.jsp?action=allUsers"
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


				<h2 class="text-4xl font-bold">Manage Users</h2>

				<p class="text-slate-400 mt-2">View, search and manage
					registered users.</p>


			</div>





			<div class="p-10">



				<div class="flex justify-between items-center mb-8">


					<div class="flex justify-between items-center mb-8">

						<input id="searchBox" type="text" placeholder="Search user..."
							class="w-96 bg-slate-900 border border-slate-700 rounded-xl px-5 py-4 outline-none focus:border-orange-500">

					</div>


				</div>







				<div class="bg-slate-900 rounded-3xl overflow-hidden">

					<table class="w-full">

						<thead class="bg-orange-500">

							<tr>

								<th class="p-5 text-left">User ID</th>

								<th class="p-5 text-left">First Name</th>

								<th class="p-5 text-left">Last Name</th>

								<th class="p-5 text-left">Email</th>

								<th class="p-5 text-left">Phone</th>

								<th class="p-5 text-left">Address</th>

								<th class="p-5 text-left">Driving License</th>

								<th class="p-5 text-center">Actions</th>

							</tr>

						</thead>

						<tbody>

							<%
							for (User user : userList) {
							%>

							<tr
								class="border-b border-slate-800 hover:bg-slate-800 transition">

								<td class="p-5">#<%=user.getUserId()%>
								</td>

								<td class="p-5"><%=user.getFirstName()%></td>

								<td class="p-5"><%=user.getLastName()%></td>

								<td class="p-5"><%=user.getEmail()%></td>

								<td class="p-5"><%=user.getPhone()%></td>

								<td class="p-5"><%=user.getAddress()%></td>

								<td class="p-5"><%=user.getDrivingLicenseNo()%></td>

								<td class="p-5 text-center">

									<div class="flex justify-center gap-3">

										<a
											href="../UserController?action=edit&userId=<%=user.getUserId()%>"
											class="bg-blue-500 hover:bg-blue-600 px-4 py-2 rounded-lg">

											Edit </a> <a
											href="../UserController?action=delete&userId=<%=user.getUserId()%>"
											onclick="return confirm('Delete this user?')"
											class="bg-red-500 hover:bg-red-600 px-4 py-2 rounded-lg">

											Delete </a>

									</div>

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

	const rows = document.querySelectorAll("tbody tr");

	searchBox.addEventListener("keyup", function () {

	    let search = this.value.toLowerCase();

	    rows.forEach(row => {

	        let text = row.innerText.toLowerCase();

	        row.style.display = text.includes(search) ? "" : "none";

	    });

	});


</script>



</body>

</html>