
<%@page import="com.bikerentalapp.DTO.User"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
User user = (User)session.getAttribute("user");

if(user == null){
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>

<head>

<%@include file="../components/head.jsp"%>

<title>User Dashboard</title>

</head>

<body class="bg-slate-950 font-poppins text-white">

	<jsp:include page="../components/navbar.jsp" />

	<div class="pt-28 pb-20">

		<div class="max-w-7xl mx-auto px-6">

			<!-- ================================================= -->
			<!-- WELCOME HERO -->
			<!-- ================================================= -->

			<section
				class="rounded-3xl bg-gradient-to-r from-orange-500 to-orange-600 p-10 shadow-2xl">

				<div
					class="flex flex-col lg:flex-row justify-between items-center gap-10">

					<div>

						<p class="uppercase tracking-[4px] text-orange-100">Bike
							Rental Dashboard</p>

						<h1 class="text-5xl font-bold mt-4">

							Welcome,

							<%=user.getFirstName()%>
							👋

						</h1>

						<p class="mt-6 text-orange-100 max-w-xl leading-8">Manage your
							bookings, update your profile and explore our premium collection
							of bikes.</p>

						<a href="../BikeController?action=viewAll"
							class="inline-block mt-8 bg-white text-orange-600 px-8 py-4 rounded-xl font-semibold hover:scale-105 transition">

							Browse Bikes → </a>

					</div>

					<div>

						<img src="../assets/images/dashboard-bike.png" class="w-96">

					</div>

				</div>

			</section>

			<!-- ================================================= -->
			<!-- STATISTICS -->
			<!-- ================================================= -->

			<section class="grid md:grid-cols-2 lg:grid-cols-4 gap-6 mt-12">

				<div class="bg-slate-900 rounded-2xl p-8">

					<p class="text-slate-400">Active Bookings</p>

					<h2 class="text-4xl font-bold text-orange-500 mt-3">2</h2>

				</div>

				<div class="bg-slate-900 rounded-2xl p-8">

					<p class="text-slate-400">Completed Trips</p>

					<h2 class="text-4xl font-bold text-orange-500 mt-3">15</h2>

				</div>

				<div class="bg-slate-900 rounded-2xl p-8">

					<p class="text-slate-400">Favorite Bikes</p>

					<h2 class="text-4xl font-bold text-orange-500 mt-3">4</h2>

				</div>

				<div class="bg-slate-900 rounded-2xl p-8">

					<p class="text-slate-400">Reward Points</p>

					<h2 class="text-4xl font-bold text-orange-500 mt-3">450</h2>

				</div>

			</section>

			<!-- ================================================= -->
			<!-- QUICK ACTIONS -->
			<!-- ================================================= -->

			<section class="mt-14">

				<h2 class="text-3xl font-bold mb-8">Quick Actions</h2>

				<div class="grid md:grid-cols-2 lg:grid-cols-4 gap-8">

					<a href="../BikeController?action=viewAll"
						class="bg-slate-900 rounded-2xl p-8 hover:bg-orange-500 transition">

						<div class="text-5xl">🏍</div>

						<h3 class="text-2xl font-semibold mt-6">Browse Bikes</h3>

						<p class="text-slate-300 mt-3">View all available bikes.</p>

					</a> <a href="../BookingController?action=myBookings"
						class="bg-slate-900 rounded-2xl p-8 hover:bg-orange-500 transition">

						<div class="text-5xl">📖</div>

						<h3 class="text-2xl font-semibold mt-6">My Bookings</h3>

						<p class="text-slate-300 mt-3">Check your bookings.</p>

					</a> <a href="editProfile.jsp"
						class="bg-slate-900 rounded-2xl p-8 hover:bg-orange-500 transition">

						<div class="text-5xl">👤</div>

						<h3 class="text-2xl font-semibold mt-6">Edit Profile</h3>

						<p class="text-slate-300 mt-3">Update your details.</p>

					</a> <a href="${pageContext.request.contextPath}/logout"
						class="bg-slate-900 rounded-2xl p-8 hover:bg-red-500 transition">

						<div class="text-5xl">🚪</div>

						<h3 class="text-2xl font-semibold mt-6">Logout</h3>

						<p class="text-slate-300 mt-3">Securely logout.</p>

					</a>

				</div>

			</section>
			
			<!-- ================================================= -->
<!-- MY PROFILE -->
<!-- ================================================= -->

<section class="mt-16">

    <div class="flex justify-between items-center mb-8">

        <h2 class="text-3xl font-bold">

            My Profile

        </h2>

        <a href="${pageContext.request.contextPath}/pages/updateuser.jsp"
           class="bg-orange-500 hover:bg-orange-600 px-6 py-3 rounded-xl transition">

            Edit Profile

        </a>

    </div>

    <div class="bg-slate-900 rounded-3xl shadow-xl overflow-hidden">

        <!-- Header -->

        <div class="bg-gradient-to-r from-orange-500 to-orange-600 p-8">

            <div class="flex flex-col md:flex-row items-center gap-6">

                <!-- Dummy Profile Image -->

                <img
                    src="../assets/images/profile.png"
                    class="w-28 h-28 rounded-full object-cover border-4 border-white">

                <div>

                    <h2 class="text-3xl font-bold">

                        <%= user.getFirstName() %>
                        <%= user.getLastName() %>

                    </h2>

                    <p class="text-orange-100 mt-2">

                        Registered User

                    </p>

                </div>

            </div>

        </div>

        <!-- Profile Details -->

        <div class="p-10">

            <div class="grid md:grid-cols-2 gap-8">

                <!-- First Name -->

                <div>

                    <label class="text-slate-400 text-sm uppercase tracking-wider">

                        First Name

                    </label>

                    <div
                        class="mt-2 bg-slate-800 rounded-xl p-4 text-lg">

                        <%= user.getFirstName() %>

                    </div>

                </div>

                <!-- Last Name -->

                <div>

                    <label class="text-slate-400 text-sm uppercase tracking-wider">

                        Last Name

                    </label>

                    <div
                        class="mt-2 bg-slate-800 rounded-xl p-4 text-lg">

                        <%= user.getLastName() %>

                    </div>

                </div>

                <!-- Email -->

                <div>

                    <label class="text-slate-400 text-sm uppercase tracking-wider">

                        Email Address

                    </label>

                    <div
                        class="mt-2 bg-slate-800 rounded-xl p-4">

                        <%= user.getEmail() %>

                    </div>

                </div>

                <!-- Phone -->

                <div>

                    <label class="text-slate-400 text-sm uppercase tracking-wider">

                        Phone Number

                    </label>

                    <div
                        class="mt-2 bg-slate-800 rounded-xl p-4">

                        <%= user.getPhone() %>

                    </div>

                </div>

                <!-- Driving License -->

                <div>

                    <label class="text-slate-400 text-sm uppercase tracking-wider">

                        Driving License

                    </label>

                    <div
                        class="mt-2 bg-slate-800 rounded-xl p-4">

                        <%= user.getDrivingLicenseNo() %>

                    </div>

                </div>

                <!-- User ID -->

                <div>

                    <label class="text-slate-400 text-sm uppercase tracking-wider">

                        User ID

                    </label>

                    <div
                        class="mt-2 bg-slate-800 rounded-xl p-4">

                        #<%= user.getUserId() %>

                    </div>

                </div>

            </div>

            <!-- Address -->

            <div class="mt-8">

                <label
                    class="text-slate-400 text-sm uppercase tracking-wider">

                    Address

                </label>

                <div
                    class="mt-2 bg-slate-800 rounded-xl p-5 leading-8">

                    <%= user.getAddress() %>

                </div>

            </div>

        </div>

    </div>

</section>


<!-- ================================================= -->
<!-- CURRENT BOOKING -->
<!-- ================================================= -->

<section class="mt-16">

    <div class="flex justify-between items-center mb-8">

        <h2 class="text-3xl font-bold">

            Current Booking

        </h2>

        <a href="../BookingController?action=myBookings"
           class="text-orange-500 hover:underline">

            View All Bookings →

        </a>

    </div>

    <div class="bg-slate-900 rounded-3xl overflow-hidden shadow-xl">

        <div class="grid lg:grid-cols-3">

            <!-- Bike Image -->

            <div>

                <img src="../assets/images/bike1.jpg"
                     class="w-full h-full object-cover">

            </div>

            <!-- Booking Details -->

            <div class="lg:col-span-2 p-10">

                <div class="flex justify-between items-center">

                    <div>

                        <span
                            class="bg-green-500/20 text-green-400 px-4 py-2 rounded-full text-sm">

                            Active Booking

                        </span>

                        <h2 class="text-4xl font-bold mt-5">

                            KTM Duke 390

                        </h2>

                    </div>

                    <h2 class="text-4xl font-bold text-orange-500">

                        ₹2,997

                    </h2>

                </div>

                <!-- Booking Info -->

                <div class="grid md:grid-cols-2 gap-6 mt-10">

                    <div class="bg-slate-800 rounded-2xl p-5">

                        <p class="text-slate-400">

                            Booking ID

                        </p>

                        <h3 class="text-xl mt-2">

                            BK10245

                        </h3>

                    </div>

                    <div class="bg-slate-800 rounded-2xl p-5">

                        <p class="text-slate-400">

                            Rental Duration

                        </p>

                        <h3 class="text-xl mt-2">

                            3 Days

                        </h3>

                    </div>

                    <div class="bg-slate-800 rounded-2xl p-5">

                        <p class="text-slate-400">

                            Pickup Date

                        </p>

                        <h3 class="text-xl mt-2">

                            25 July 2026

                        </h3>

                    </div>

                    <div class="bg-slate-800 rounded-2xl p-5">

                        <p class="text-slate-400">

                            Return Date

                        </p>

                        <h3 class="text-xl mt-2">

                            28 July 2026

                        </h3>

                    </div>

                    <div class="bg-slate-800 rounded-2xl p-5">

                        <p class="text-slate-400">

                            Pickup Location

                        </p>

                        <h3 class="text-xl mt-2">

                            Bangalore

                        </h3>

                    </div>

                    <div class="bg-slate-800 rounded-2xl p-5">

                        <p class="text-slate-400">

                            Payment Status

                        </p>

                        <h3 class="text-green-400 text-xl mt-2">

                            Paid

                        </h3>

                    </div>

                </div>

                <!-- Buttons -->

                <div class="flex flex-wrap gap-5 mt-10">

                    <a href="#"
                       class="bg-orange-500 hover:bg-orange-600 transition px-7 py-3 rounded-xl">

                        View Details

                    </a>

                    <a href="#"
                       class="border border-red-500 text-red-500 hover:bg-red-500 hover:text-white transition px-7 py-3 rounded-xl">

                        Cancel Booking

                    </a>

                </div>

            </div>

        </div>

    </div>

</section>
			
			
			
			
			