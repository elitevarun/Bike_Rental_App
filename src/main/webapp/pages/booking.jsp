
<%@page import="com.bikerantalapp.Implementation.VehiclesDAOImpl"%>
<%@page import="com.bikerentalapp.DAO.VehiclesDAO"%>
<%@page import="com.bikerentalapp.DTO.Vehicle"%>
<%@page import="com.bikerentalapp.DTO.User"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
User user = (User) session.getAttribute("user");

if (user == null) {
	response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
	return;
}


VehiclesDAO vdao = new VehiclesDAOImpl();
Vehicle vehicle = vdao.findById(Integer.parseInt(request.getParameter("id")));
//Vehicle vehicle = (Vehicle) request.getAttribute("vehicle");

if (vehicle == null) {
	response.sendRedirect(request.getContextPath() + "/pages/vehicle.jsp");
	return;
}
%>

<!DOCTYPE html>
<html>

<head>

<%@ include file="../components/head.jsp"%>

<title>Book Vehicle</title>

</head>

<body class="bg-slate-950 font-poppins text-white">

	<jsp:include page="../components/navbar.jsp" />

	<section class="pt-32 pb-20">

		<div class="max-w-7xl mx-auto px-6">

			<div class="grid lg:grid-cols-2 gap-10">

				<!-- ============================================ -->
				<!-- LEFT -->
				<!-- ============================================ -->

				<div class="bg-slate-900 rounded-3xl overflow-hidden shadow-xl">

					<img src="<%=vehicle.getImagePath()%>"
						class="w-full h-96 object-cover">

					<div class="p-8">

						<div class="flex justify-between items-center">

							<h2 class="text-4xl font-bold">

								<%=vehicle.getModel()%>

							</h2>

							<%
							if (vehicle.getAvailable()) {
							%>

							<span class="bg-green-500 text-white px-4 py-2 rounded-full">

								Available </span>

							<%
							} else {
							%>

							<span class="bg-red-500 text-white px-4 py-2 rounded-full">

								Unavailable </span>

							<%
							}
							%>

						</div>

						<p class="text-orange-500 mt-4">

							<%=vehicle.getVehicleType()%>

						</p>

						<div class="grid grid-cols-2 gap-4 mt-8">

							<div class="bg-slate-800 rounded-xl p-4">

								<p class="text-slate-400">Fuel</p>

								<h3 class="mt-2">

									<%=vehicle.getFuelType()%>

								</h3>

							</div>

							<div class="bg-slate-800 rounded-xl p-4">

								<p class="text-slate-400">Top Speed</p>

								<h3 class="mt-2">

									<%=vehicle.getTopSpeed()%>
									km/h

								</h3>

							</div>

							<div class="bg-slate-800 rounded-xl p-4">

								<p class="text-slate-400">Rent / Day</p>

								<h3 class="mt-2 text-orange-500">

									₹<%=vehicle.getPricePerDay()%>

								</h3>

							</div>

							<div class="bg-slate-800 rounded-xl p-4">

								<p class="text-slate-400">Deposit</p>

								<h3 class="mt-2">

									₹<%=vehicle.getDepositFee()%>

								</h3>

							</div>

						</div>

					</div>

				</div>

				<!-- ============================================ -->
				<!-- RIGHT -->
				<!-- ============================================ -->

				<div class="bg-slate-900 rounded-3xl shadow-xl p-10">

					<h2 class="text-4xl font-bold">Booking Details</h2>

					<p class="text-slate-400 mt-3">Choose your rental dates.</p>

					<form action="${pageContext.request.contextPath}/BookingController" method="post" class="mt-10">

						<input type="hidden" name="action" value="book">
					
					 <input type="hidden" name="vehicleId"
							value="<%=vehicle.getVehicleId()%>"> 
							
							<input type="hidden"
							name="userId" value="<%=user.getUserId()%>">

						<div>

							<label> Start Date </label> 
							<input id="startDate" type="date"
								name="startDate" required
								class="w-full mt-2 p-4 rounded-xl bg-slate-800 border border-slate-700">

						</div>

						<div class="mt-6">

							<label> End Date </label> 
							<input id="endDate" type="date"
								name="endDate" required
								class="w-full mt-2 p-4 rounded-xl bg-slate-800 border border-slate-700">

						</div>


						<div class="bg-slate-800 rounded-2xl p-6 mt-8">

							<div class="flex justify-between mb-5">

								<p>Price / Day</p>

								<p>

									₹<%=vehicle.getPricePerDay()%>

								</p>

							</div>

							<div class="flex justify-between mb-5">

								<p>Rental Days</p>

								<p id="days">0</p>

							</div>

							<div class="flex justify-between">

								<p>Total Amount</p>

								<p id="total" class="text-orange-500 text-2xl font-bold">₹0

								</p>

							</div>

							<input type="hidden" id="totalDays" name="totalDays"> 
							<input type="hidden" id="totalAmount" name="totalAmount">

						</div>

						<button type="submit"
							class="w-full mt-10 bg-orange-500 hover:bg-orange-600 py-4 rounded-xl text-lg font-semibold">

							Confirm Booking</button>

					</form>

				</div>

			</div>

		</div>

	</section>
	<script>
		const start = document.getElementById("startDate");

		const end = document.getElementById("endDate");

		const total = document.getElementById("total");

		const days = document.getElementById("days");

		const hiddenDays = document.getElementById("totalDays");

		const hiddenTotal = document.getElementById("totalAmount");

		const price =
	<%=vehicle.getPricePerDay()%>
		;

		function calculate() {

			if (start.value == "" || end.value == "")
				return;

			let s = new Date(start.value);

			let e = new Date(end.value);

			let diff = (e - s) / (1000 * 60 * 60 * 24);

			if (diff <= 0) {

				days.innerHTML = "0";

				total.innerHTML = "₹0";

				hiddenDays.value = "";

				hiddenTotal.value = "";

				return;

			}

			days.innerHTML = diff;

			let amount = diff * price;

			total.innerHTML = "₹" + amount;

			hiddenDays.value = diff;

			hiddenTotal.value = amount;

		}

		start.addEventListener("change", calculate);

		end.addEventListener("change", calculate);
	</script>

</body>

</html>
<jsp:include page="../components/footer.jsp" />