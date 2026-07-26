<%@page import="com.bikerantalapp.Implementation.VehiclesDAOImpl"%>
<%@page import="com.bikerentalapp.DAO.VehiclesDAO"%>
<%@page import="com.bikerentalapp.DTO.Vehicle"%>
<%@page import="java.util.List"%>

<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
VehiclesDAO vdao = new VehiclesDAOImpl();
List<Vehicle> vehicleList = vdao.findAll();
%>

<!DOCTYPE html>
<html lang="en">

<head>

<%@ include file="../components/head.jsp"%>

<title>Browse Bikes | Bike Rental</title>

</head>

<body class="bg-slate-950 font-poppins text-white">

	<jsp:include page="../components/navbar.jsp" />

	<!-- ================================================= -->
	<!-- HERO -->
	<!-- ================================================= -->

	<section
		class="pt-32 pb-20 bg-gradient-to-br from-slate-950 via-slate-900 to-slate-950">

		<div class="max-w-7xl mx-auto px-6">

			<div class="text-center">

				<span
					class="bg-orange-500/20 border border-orange-500/40 text-orange-400 px-5 py-2 rounded-full">

					🏍 Premium Collection </span>

				<h1 class="text-6xl font-extrabold mt-8">

					Find Your <span class="text-orange-500"> Perfect Ride </span>

				</h1>

				<p class="text-slate-400 max-w-3xl mx-auto mt-8 text-lg leading-8">

					Choose from our wide range of scooters, sports bikes, cruisers and
					adventure bikes.</p>

			</div>

		</div>

	</section>

	<!-- ================================================= -->
	<!-- SEARCH + FILTER -->
	<!-- ================================================= -->

	<section class="pb-14">

		<div class="max-w-7xl mx-auto px-6">

			<div class="bg-slate-900 rounded-3xl p-6">

				<div class="grid lg:grid-cols-4 gap-5">

					<!-- Search -->

					<div class="lg:col-span-2">

						<input id="searchBox" type="text" placeholder="Search bike..."
							class="w-full bg-slate-800 rounded-xl p-4 outline-none border border-slate-700 focus:border-orange-500">

					</div>

					<!-- Type -->

					<div>

						<select id="typeFilter"
							class="w-full bg-slate-800 rounded-xl p-4 border border-slate-700">

							<option value="All">All Types</option>

							<option>Scooter</option>

							<option>Sports</option>

							<option>Cruiser</option>

							<option>Adventure</option>

							<option>Electric</option>

						</select>

					</div>

					<!-- Availability -->

					<div>

						<select id="availabilityFilter"
							class="w-full bg-slate-800 rounded-xl p-4 border border-slate-700">

							<option value="All">All</option>

							<option>Available</option>

							<option>Unavailable</option>

						</select>

					</div>

				</div>

			</div>

		</div>

	</section>

	<!-- ================================================= -->
	<!-- VEHICLE GRID START -->
	<!-- ================================================= -->

	<section class="pb-24">

		<div class="max-w-7xl mx-auto px-6">

			<div id="vehicleGrid"
				class="grid md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-8">


				<%
				if (vehicleList == null) {
				%>

				<div class="col-span-full">

					<div class="bg-slate-900 rounded-3xl p-16 text-center">

						<h2 class="text-4xl font-bold text-white">No Bikes Available

						</h2>

						<p class="text-slate-400 mt-5">Please check back later.</p>

					</div>

				</div>

				<%
				} else {

				for (Vehicle vehicle : vehicleList) {

					String status = vehicle.getAvailable() ? "Available" : "Unavailable";
					String badgeColor = vehicle.getAvailable() ? "bg-green-500" : "bg-red-500";
				%>

				<!-- CARD -->

				<div
					class="vehicle-card bg-slate-900 rounded-3xl overflow-hidden shadow-xl hover:-translate-y-2 hover:shadow-orange-500/20 transition duration-300"
					data-name="<%=vehicle.getModel()%>"
					data-type="<%=vehicle.getVehicleType()%>" data-status="<%=status%>">

					<!-- IMAGE -->

					<div class="relative overflow-hidden">

						<img src="<%=vehicle.getImagePath()%>"
							class="w-full h-60 object-cover hover:scale-110 transition duration-500">

						<span
							class="<%=badgeColor%> absolute top-4 left-4 px-4 py-1 rounded-full text-sm font-semibold">

							<%=status%>

						</span>

					</div>

					<!-- BODY -->

					<div class="p-6">

						<div class="flex justify-between items-center">

							<h2 class="text-2xl font-bold">

								<%=vehicle.getModel()%>

							</h2>

							<span class="text-yellow-400"> ★4.8 </span>

						</div>

						<p class="text-orange-500 mt-2">

							<%=vehicle.getVehicleType()%>

						</p>

						<!-- FEATURES -->

						<div class="grid grid-cols-2 gap-3 mt-6">

							<div class="bg-slate-800 rounded-xl p-3 text-center">

								⛽ <br> <span class="text-sm"> <%=vehicle.getFuelType()%>

								</span>

							</div>

							<div class="bg-slate-800 rounded-xl p-3 text-center">

								🏁 <br> <span class="text-sm"> <%=vehicle.getTopSpeed()%>
									km/h

								</span>

							</div>

							<div class="bg-slate-800 rounded-xl p-3 text-center">

								💰 <br> <span class="text-sm"> ₹<%=vehicle.getDepositFee()%>

								</span>

							</div>

							<div class="bg-slate-800 rounded-xl p-3 text-center">

								⚙ <br> <span class="text-sm"> Automatic </span>

							</div>

						</div>

						<!-- PRICE -->

						<div class="flex justify-between items-center mt-8">

							<div>

								<p class="text-slate-400">Starting From</p>

								<h3 class="text-3xl font-bold text-orange-500">

									₹<%=vehicle.getPricePerDay()%>

								</h3>

								<span class="text-slate-400"> / day </span>

							</div>

						</div>

						<!-- BUTTONS -->

						<div class="grid grid-cols-2 gap-3 mt-8">

							<!--  <a
								href="${pageContext.request.contextPath}/pages/booking.jsp?id="
								class="text-center border border-orange-500 text-orange-500 py-3 rounded-xl hover:bg-orange-500 hover:text-white transition">

								Details </a>   -->

							<%
							if (vehicle.getAvailable()) {
							%>

							<a
								href="${pageContext.request.contextPath}/pages/booking.jsp?id=<%=vehicle.getVehicleId()%>"
								class="text-center bg-orange-500 py-3 rounded-xl hover:bg-orange-600 transition">

								Rent Now </a>

							<%
							} else {
							%>

							<button disabled
								class="bg-gray-600 py-3 rounded-xl cursor-not-allowed">

								Unavailable</button>

							<%
							}
							%>

						</div>

					</div>

				</div>

				<%
				}

				}
				%>

			</div>

		</div>

	</section>

	<jsp:include page="../components/footer.jsp" />