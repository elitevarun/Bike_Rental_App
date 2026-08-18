<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<%@ include file="../components/head.jsp"%>

<title>Create Account | Bike Rental</title>

</head>

<body class="bg-slate-950 font-poppins">

    <jsp:include page="../components/navbar.jsp" />

    <section class="min-h-screen flex items-center justify-center px-6 py-24">

        <div class="max-w-7xl w-full">

            <div
                class="grid lg:grid-cols-2 bg-slate-900 rounded-3xl overflow-hidden shadow-2xl">

                <!-- ================= LEFT SIDE ================= -->

                <div class="hidden lg:block relative">

                    <img src="https://i.ibb.co/k2qBjBHg/registerimage.png"
                        alt="Bike Rental"
                        class="absolute inset-0 w-full h-full object-cover">

                    <div
                        class="absolute inset-0 bg-gradient-to-t from-black/80 via-black/30 to-transparent">
                    </div>

                    <div
                        class="absolute inset-0 flex flex-col justify-start items-start p-14 z-10">

                        <h2 class="text-5xl font-bold text-white leading-tight">
                            Join The Ride
                        </h2>

                        <p class="mt-5 text-orange-100 text-lg leading-8 max-w-md">
                            Create your account and unlock access to premium bikes,
                            exclusive offers, and seamless bookings.
                        </p>

                    </div>

                </div>

                <!-- ================= RIGHT SIDE ================= -->

                <div class="p-10 lg:p-14">

                    <h2 class="text-4xl font-bold text-white">
                        Create Account
                    </h2>

                    <p class="text-slate-400 mt-3">
                        Fill in the details below to register.
                    </p>

                    <form action="../RegisterServlet" method="post" class="mt-10">

                        <div class="grid md:grid-cols-2 gap-6">

                            <!-- First Name -->
                            <div>
                                <label class="text-slate-300">First Name</label>
                                <input type="text"
                                    name="firstName"
                                    required
                                    placeholder="John"
                                    class="w-full mt-2 p-4 rounded-xl bg-slate-800 border border-slate-700 focus:border-orange-500 outline-none text-white">
                            </div>

                            <!-- Last Name -->
                            <div>
                                <label class="text-slate-300">Last Name</label>
                                <input type="text"
                                    name="lastName"
                                    required
                                    placeholder="Doe"
                                    class="w-full mt-2 p-4 rounded-xl bg-slate-800 border border-slate-700 focus:border-orange-500 outline-none text-white">
                            </div>

                            <!-- Email -->
                            <div>
                                <label class="text-slate-300">Email Address</label>
                                <input type="email"
                                    name="email"
                                    required
                                    placeholder="john@example.com"
                                    class="w-full mt-2 p-4 rounded-xl bg-slate-800 border border-slate-700 focus:border-orange-500 outline-none text-white">
                            </div>

                            <!-- Phone -->
                            <div>
                                <label class="text-slate-300">Phone Number</label>
                                <input type="tel"
                                    name="phone"
                                    maxlength="10"
                                    required
                                    placeholder="9876543210"
                                    class="w-full mt-2 p-4 rounded-xl bg-slate-800 border border-slate-700 focus:border-orange-500 outline-none text-white">
                            </div>

                            <!-- Driving License -->
                            <div>
                                <label class="text-slate-300">Driving License No.</label>
                                <input type="text"
                                    name="drivingLicenseNo"
                                    required
                                    placeholder="DL Number"
                                    class="w-full mt-2 p-4 rounded-xl bg-slate-800 border border-slate-700 focus:border-orange-500 outline-none text-white">
                            </div>

                            <!-- Address -->
                            <div>
                                <label class="text-slate-300">Address</label>
                                <textarea rows="1"
                                    name="address"
                                    required
                                    placeholder="Enter your address..."
                                    class="w-full mt-2 p-4 rounded-xl bg-slate-800 border border-slate-700 focus:border-orange-500 outline-none text-white resize-none"></textarea>
                            </div>

                            <!-- Password -->
                            <div>
                                <label class="text-slate-300">Password</label>
                                <input type="password"
                                    name="password"
                                    required
                                    placeholder="Create a strong password"
                                    class="w-full mt-2 p-4 rounded-xl bg-slate-800 border border-slate-700 focus:border-orange-500 outline-none text-white">
                            </div>

                            <!-- Confirm Password -->
                            <div>
                                <label class="text-slate-300">Confirm Password</label>
                                <input type="password"
                                    name="confirmPassword"
                                    required
                                    placeholder="Confirm your password"
                                    class="w-full mt-2 p-4 rounded-xl bg-slate-800 border border-slate-700 focus:border-orange-500 outline-none text-white">
                            </div>

                        </div>

                        <!-- Terms -->

                        <div class="mt-6 flex gap-3">

                            <input type="checkbox" required class="mt-1">

                            <p class="text-sm text-slate-400">
                                I agree to the Terms & Conditions and Privacy Policy.
                            </p>

                        </div>

                        <!-- Button -->

                        <button type="submit"
                            class="mt-8 w-full bg-orange-500 hover:bg-orange-600 transition py-4 rounded-xl text-lg font-semibold text-white">

                            Create Account

                        </button>

                    </form>

                    <div class="mt-8 text-center">

                        <p class="text-slate-400">

                            Already have an account?

                            <a href="login.jsp"
                                class="text-orange-500 font-semibold hover:underline">

                                Login

                            </a>

                        </p>

                    </div>

                </div>

            </div>

        </div>

    </section>

    <jsp:include page="../components/footer.jsp" />

</body>

</html>