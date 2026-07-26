
<%@page import="com.bikerentalapp.DTO.Vehicle"%>
<%@page import="com.bikerentalapp.DTO.Admin"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
Admin admin = (Admin) session.getAttribute("admin");

if (admin == null) {
	response.sendRedirect("../login.jsp");
	return;
}

Vehicle vehicle = (Vehicle) request.getAttribute("vehicle");

if (vehicle == null) {
	response.sendRedirect("../VehicleController?action=adminVehicles");
	return;
}
%>

<!DOCTYPE html>
<html>

<head>

<%@include file="../components/head.jsp"%>

<title>Edit Vehicle</title>

</head>

<body class="bg-slate-950 text-white font-poppins">

	<div class="min-h-screen flex items-center justify-center py-16">

		<div
			class="max-w-5xl w-full bg-slate-900 rounded-3xl overflow-hidden shadow-2xl">

			<!-- Header -->

			<div class="bg-gradient-to-r from-blue-500 to-blue-700 p-8">

				<h1 class="text-4xl font-bold">Edit Vehicle</h1>

				<p class="text-blue-100 mt-2">Update the selected vehicle
					details.</p>

			</div>

			<!-- Form -->

			<div class="p-10">

				<form action="../VehicleController" method="post"
					enctype="multipart/form-data">

					<input type="hidden" name="action" value="updateVehicle"> <input
						type="hidden" name="vehicleId" value="<%=vehicle.getVehicleId()%>">

					<div class="grid md:grid-cols-2 gap-8">

						<!-- Vehicle Type -->

						<div>

							<label class="block mb-2"> Vehicle Type </label> <select
								name="vehicleType"
								class="w-full p-4 rounded-xl bg-slate-800 border border-slate-700">

								<option
									<%=vehicle.getVehicleType().equals("Scooter") ? "selected" : ""%>>

									Scooter</option>

								<option
									<%=vehicle.getVehicleType().equals("Sports") ? "selected" : ""%>>

									Sports</option>

								<option
									<%=vehicle.getVehicleType().equals("Cruiser") ? "selected" : ""%>>

									Cruiser</option>

								<option
									<%=vehicle.getVehicleType().equals("Adventure") ? "selected" : ""%>>

									Adventure</option>

								<option
									<%=vehicle.getVehicleType().equals("Electric") ? "selected" : ""%>>

									Electric</option>

							</select>

						</div>

						<!-- Model -->

						<div>

							<label class="block mb-2"> Model </label> <input type="text"
								name="model" value="<%=vehicle.getModel()%>"
								class="w-full p-4 rounded-xl bg-slate-800 border border-slate-700">

						</div>

						<!-- Registration -->

						<div>

							<label class="block mb-2"> Registration Number </label> <input
								type="text" name="registrationNo"
								value="<%=vehicle.getRegistrationNo()%>"
								class="w-full p-4 rounded-xl bg-slate-800 border border-slate-700">

						</div>

						<!-- Fuel -->

						<div>

							<label class="block mb-2"> Fuel Type </label> <select
								name="fuelType"
								class="w-full p-4 rounded-xl bg-slate-800 border border-slate-700">

								<option
									<%=vehicle.getFuelType().equals("Petrol") ? "selected" : ""%>>

									Petrol</option>

								<option
									<%=vehicle.getFuelType().equals("Diesel") ? "selected" : ""%>>

									Diesel</option>

								<option
									<%=vehicle.getFuelType().equals("Electric") ? "selected" : ""%>>

									Electric</option>

							</select>

						</div>

						<!-- Top Speed -->

						<div>

							<label class="block mb-2"> Top Speed </label> <input
								type="number" name="topSpeed" value="<%=vehicle.getTopSpeed()%>"
								class="w-full p-4 rounded-xl bg-slate-800 border border-slate-700">

						</div>

						<!-- Price -->

						<div>

							<label class="block mb-2"> Price Per Day </label> <input
								type="number" step="0.01" name="pricePerDay"
								value="<%=vehicle.getPricePerDay()%>"
								class="w-full p-4 rounded-xl bg-slate-800 border border-slate-700">

						</div>

						<!-- Deposit -->

						<div>

							<label class="block mb-2"> Deposit Fee </label> <input
								type="number" step="0.01" name="depositFee"
								value="<%=vehicle.getDepositFee()%>"
								class="w-full p-4 rounded-xl bg-slate-800 border border-slate-700">

						</div>

						<!-- Available -->

						<div class="flex items-center gap-4 mt-8">

							<input type="checkbox" name="available" value="true"
								<%=vehicle.getAvailable() ? "checked" : ""%> class="w-5 h-5">

							<label> Available </label>

						</div>

						<!-- Current Image -->

						<div class="md:col-span-2">

							<label class="block mb-2"> Current Image </label> <img
								src="<%=vehicle.getImagePath()%>"
								class="w-64 rounded-xl border border-slate-700">

						</div>

						<!-- Replace Image -->

						<div class="md:col-span-2">

							<label class="block mb-2"> Replace Image (Optional) </label> <input
								type="file" name="vehicleImage" accept="image/*"
								class="w-full p-4 rounded-xl bg-slate-800 border border-slate-700">

						</div>

					</div>

					<div class="flex gap-5 mt-10">

						<button type="submit"
							class="bg-blue-500 hover:bg-blue-600 px-8 py-4 rounded-xl font-semibold">

							Update Vehicle</button>

						<a href="../VehicleController?action=adminVehicles"
							class="border border-slate-600 hover:border-blue-500 px-8 py-4 rounded-xl">

							Cancel </a>

					</div>

				</form>

			</div>

		</div>

	</div>

</body>

</html>