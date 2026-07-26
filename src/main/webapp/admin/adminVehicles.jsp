<%@page import="com.bikerentalapp.DTO.Vehicle"%>
<%@page import="com.bikerantalapp.Implementation.VehiclesDAOImpl"%>
<%@page import="com.bikerentalapp.DAO.VehiclesDAO"%>
<%@page import="com.bikerentalapp.DTO.Admin"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%

Admin admin = (Admin) session.getAttribute("admin");
if (admin == null) {
	response.sendRedirect("login.jsp");
	return;
}

//List<Vehicle> vehicleList = (List<Vehicle>) request.getAttribute("vehicleList");
VehiclesDAO vdao=new VehiclesDAOImpl();
List<Vehicle> vehicleList=vdao.findAll();


if (vehicleList == null) {
	vehicleList = new java.util.ArrayList<>();
}
%>

<!DOCTYPE html>

<html>

<head>

<%@include file="../components/head.jsp"%>

<title>Manage Vehicles</title>

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
					href="../PaymentController?action=adminPayments"
					class="flex items-center gap-4 px-8 py-5 hover:bg-slate-800">

					💳 Manage Payments </a> 
					<a href="../UserController?action=allUsers"
					class="flex items-center gap-4 px-8 py-5 hover:bg-slate-800">

					👥 Manage Users </a>
					 <a href="../ServiceController?action=list"
					class="flex items-center gap-4 px-8 py-5 hover:bg-slate-800">

					🛠 Services </a> 
					<a href="${pageContext.request.contextPath}/logout"
					class="flex items-center gap-4 px-8 py-5 hover:bg-red-600"> 🚪
					Logout </a>

			</nav>

		</div>

		<!-- ================= CONTENT ================= -->

		<div class="flex-1">

			<div class="bg-slate-900 px-10 py-6 border-b border-slate-800">

				<h2 class="text-4xl font-bold">Manage Vehicles</h2>

				<p class="text-slate-400 mt-2">Add, edit and manage rental
					bikes.</p>

			</div>

			<div class="p-10">

				<div class="flex justify-between items-center mb-8">

					<input id="searchBox" type="text" placeholder="Search Vehicle..."
						class="w-96 bg-slate-900 border border-slate-700 rounded-xl px-5 py-4 outline-none focus:border-orange-500">

					<a href="addVehicle.jsp"
						class="bg-orange-500 hover:bg-orange-600 px-8 py-4 rounded-xl">

						+ Add Vehicle </a>

				</div>


				<div class="bg-slate-900 rounded-3xl overflow-hidden">

					<table class="w-full">

						<thead class="bg-orange-500">

							<tr>

								<th class="p-5">Image</th>

								<th class="p-5">Model</th>

								<th class="p-5">Type</th>

								<th class="p-5">Fuel</th>

								<th class="p-5">Price</th>

								<th class="p-5">Availability</th>

								<th class="p-5">Actions</th>

							</tr>

						</thead>

						<tbody>


							<%
							for (Vehicle vehicle : vehicleList) {
							%>

							<tr class="border-b border-slate-800 vehicle-row">

								<td class="p-4"><img src="<%=vehicle.getImagePath()%>"
									class="w-28 h-20 rounded-lg object-cover"></td>

								<td class="p-4 font-semibold"><%=vehicle.getModel()%></td>

								<td class="p-4"><%=vehicle.getVehicleType()%></td>

								<td class="p-4"><%=vehicle.getFuelType()%></td>

								<td class="p-4 text-orange-500">₹<%=vehicle.getPricePerDay()%>/day

								</td>

								<td class="p-4">
									<%
									if (vehicle.getAvailable()) {
									%> <span class="bg-green-500 px-4 py-2 rounded-full">
										Available </span> <%
 } else {
 %> <span class="bg-red-500 px-4 py-2 rounded-full"> Unavailable
								</span> <%
 }
 %>

								</td>

								<td class="p-4">

									<div class="flex gap-3">

										<a
											href="${pageContext.request.contextPath}/admin/admindashboard.jsp?action=edit&id=<%=vehicle.getVehicleId()%>"
											class="bg-blue-500 hover:bg-blue-600 px-4 py-2 rounded-lg">

											Edit </a> <a
											href="../VehicleController?action=delete&id=<%=vehicle.getVehicleId()%>"
											onclick="return confirm('Delete Vehicle?')"
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

const search=document.getElementById("searchBox");

const rows=document.querySelectorAll(".vehicle-row");

search.addEventListener("keyup",function(){

let value=this.value.toLowerCase();

rows.forEach(row=>{

if(row.innerText.toLowerCase().includes(value)){

row.style.display="";

}else{

row.style.display="none";

}

});

});

</script>

</body>

</html>

