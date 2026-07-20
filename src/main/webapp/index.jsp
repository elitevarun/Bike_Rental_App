<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <%@ include file="components/head.jsp"%>

    <title>Bike Rental</title>

</head>

<body class="bg-slate-950 font-poppins text-white overflow-x-hidden">

    <!-- Navbar -->
    <%@ include file="components/navbar.jsp"%>

    <!-- ================= HERO SECTION ================= -->

    <section
        class="relative min-h-screen flex items-center bg-gradient-to-br from-slate-950 via-slate-900 to-slate-950 overflow-hidden">

        <!-- Background Blur -->
        <div
            class="absolute w-[500px] h-[500px] bg-orange-500/20 rounded-full blur-[140px] -top-32 -left-32">
        </div>

        <div
            class="absolute w-[450px] h-[450px] bg-blue-500/10 rounded-full blur-[120px] bottom-0 right-0">
        </div>

        <div
            class="max-w-7xl mx-auto px-6 pt-32 pb-20 grid lg:grid-cols-2 gap-16 items-center relative z-10">

            <!-- LEFT CONTENT -->

            <div>

                <span
                    class="inline-block px-5 py-2 rounded-full bg-orange-500/20 text-orange-400 border border-orange-500/30 mb-8">

                    🏍 Premium Bike Rentals

                </span>

                <h1
                    class="text-5xl md:text-7xl font-extrabold leading-tight">

                    Ride

                    <span class="text-orange-500">

                        Without

                    </span>

                    Limits.

                </h1>

                <p
                    class="mt-8 text-slate-300 text-lg leading-8 max-w-xl">

                    Experience premium motorcycles at affordable prices.
                    Whether it's a weekend getaway, city ride or mountain
                    adventure, we've got the perfect bike waiting for you.

                </p>

                <!-- Buttons -->

                <div class="flex flex-wrap gap-5 mt-10">

                    <a href="pages/bikes.jsp"
                        class="bg-orange-500 hover:bg-orange-600 transition px-8 py-4 rounded-xl font-semibold shadow-xl">

                        Explore Bikes →

                    </a>

                    <a href="#why-us"
                        class="border border-slate-600 hover:border-orange-500 hover:text-orange-500 transition px-8 py-4 rounded-xl">

                        Learn More

                    </a>

                </div>

                <!-- Stats -->

                <div
                    class="grid grid-cols-3 gap-8 mt-16">

                    <div>

                        <h2
                            class="text-4xl font-bold text-orange-500">

                            500+

                        </h2>

                        <p class="text-slate-400 mt-2">

                            Premium Bikes

                        </p>

                    </div>

                    <div>

                        <h2
                            class="text-4xl font-bold text-orange-500">

                            10K+

                        </h2>

                        <p class="text-slate-400 mt-2">

                            Happy Riders

                        </p>

                    </div>

                    <div>

                        <h2
                            class="text-4xl font-bold text-orange-500">

                            50+

                        </h2>

                        <p class="text-slate-400 mt-2">

                            Locations

                        </p>

                    </div>

                </div>

            </div>

            <!-- RIGHT CONTENT -->

            <div class="relative flex justify-center">

                <!-- Orange Circle -->

                <div
                    class="absolute w-[520px] h-[520px] rounded-full bg-orange-500/20 blur-3xl">
                </div>

                <!-- Bike Image -->

                <img
                    src="assets/images/hero-bike.png"
                    alt="Bike"
                    class="relative z-10 w-full max-w-2xl hover:scale-105 transition duration-700">

            </div>

        </div>

    </section>

    <!-- END HERO -->

    <!-- Next Section Starts Here -->
    <!-- ================= FEATURED BIKES ================= -->

<section class="py-24 bg-slate-900">

    <div class="max-w-7xl mx-auto px-6">

        <!-- Heading -->

        <div class="text-center mb-16">

            <span class="text-orange-500 font-semibold uppercase tracking-widest">
                Our Collection
            </span>

            <h2 class="text-5xl font-bold mt-4">
                Featured Bikes
            </h2>

            <p class="text-slate-400 mt-5 max-w-2xl mx-auto">
                Choose from our premium collection of bikes designed for
                comfort, performance and unforgettable journeys.
            </p>

        </div>

        <!-- Bike Cards -->

        <div class="grid md:grid-cols-2 lg:grid-cols-4 gap-8">

            <!-- Bike Card -->

            <div
                class="bg-slate-800 rounded-3xl overflow-hidden shadow-xl hover:-translate-y-3 transition duration-500 group">

                <div class="relative overflow-hidden">

                    <img
                        src="assets/images/bike1.jpg"
                        class="w-full h-56 object-cover group-hover:scale-110 transition duration-500">

                    <span
                        class="absolute top-4 left-4 bg-orange-500 text-white text-sm px-4 py-1 rounded-full">
                        Available
                    </span>

                </div>

                <div class="p-6">

                    <div class="flex justify-between items-center">

                        <h3 class="text-2xl font-bold">
                            KTM Duke 390
                        </h3>

                        <span class="text-yellow-400">
                            ⭐ 4.8
                        </span>

                    </div>

                    <p class="text-slate-400 mt-3">
                        Powerful street bike perfect for city rides.
                    </p>

                    <div class="grid grid-cols-2 gap-3 mt-6 text-sm">

                        <div class="bg-slate-700 rounded-xl p-3 text-center">
                            Petrol
                        </div>

                        <div class="bg-slate-700 rounded-xl p-3 text-center">
                            Manual
                        </div>

                    </div>

                    <div
                        class="flex justify-between items-center mt-8">

                        <div>

                            <p class="text-slate-400 text-sm">
                                Starting From
                            </p>

                            <h4 class="text-3xl font-bold text-orange-500">
                                ₹999
                            </h4>

                            <span class="text-slate-400">
                                /day
                            </span>

                        </div>

                        <a href="#"
                            class="bg-orange-500 hover:bg-orange-600 px-5 py-3 rounded-xl font-semibold">

                            Rent Now

                        </a>

                    </div>

                </div>

            </div>

            <!-- Card 2 -->

            <div
                class="bg-slate-800 rounded-3xl overflow-hidden shadow-xl hover:-translate-y-3 transition duration-500 group">

                <div class="relative overflow-hidden">

                    <img
                        src="assets/images/bike2.jpg"
                        class="w-full h-56 object-cover group-hover:scale-110 transition">

                    <span
                        class="absolute top-4 left-4 bg-green-600 px-4 py-1 rounded-full text-sm">
                        New
                    </span>

                </div>

                <div class="p-6">

                    <div class="flex justify-between">

                        <h3 class="text-2xl font-bold">
                            Royal Enfield
                        </h3>

                        <span class="text-yellow-400">
                            ⭐4.9
                        </span>

                    </div>

                    <p class="text-slate-400 mt-3">
                        Ride long highways with unmatched comfort.
                    </p>

                    <div class="grid grid-cols-2 gap-3 mt-6">

                        <div class="bg-slate-700 p-3 rounded-xl text-center">
                            Petrol
                        </div>

                        <div class="bg-slate-700 p-3 rounded-xl text-center">
                            Manual
                        </div>

                    </div>

                    <div
                        class="flex justify-between items-center mt-8">

                        <div>

                            <p class="text-slate-400 text-sm">
                                Starting From
                            </p>

                            <h4 class="text-3xl font-bold text-orange-500">
                                ₹1199
                            </h4>

                            <span class="text-slate-400">
                                /day
                            </span>

                        </div>

                        <a href="#"
                            class="bg-orange-500 hover:bg-orange-600 px-5 py-3 rounded-xl font-semibold">

                            Rent Now

                        </a>

                    </div>

                </div>

            </div>

            <!-- Card 3 -->

            <div
                class="bg-slate-800 rounded-3xl overflow-hidden shadow-xl hover:-translate-y-3 transition duration-500 group">

                <div class="relative overflow-hidden">

                    <img
                        src="assets/images/bike3.jpg"
                        class="w-full h-56 object-cover group-hover:scale-110 transition">

                </div>

                <div class="p-6">

                    <div class="flex justify-between">

                        <h3 class="text-2xl font-bold">
                            Yamaha R15
                        </h3>

                        <span class="text-yellow-400">
                            ⭐4.7
                        </span>

                    </div>

                    <p class="text-slate-400 mt-3">
                        Lightweight sports bike with excellent mileage.
                    </p>

                    <div class="grid grid-cols-2 gap-3 mt-6">

                        <div class="bg-slate-700 p-3 rounded-xl text-center">
                            Petrol
                        </div>

                        <div class="bg-slate-700 p-3 rounded-xl text-center">
                            Manual
                        </div>

                    </div>

                    <div class="flex justify-between items-center mt-8">

                        <div>

                            <p class="text-slate-400 text-sm">
                                Starting From
                            </p>

                            <h4 class="text-3xl font-bold text-orange-500">
                                ₹899
                            </h4>

                            <span class="text-slate-400">
                                /day
                            </span>

                        </div>

                        <a href="#"
                            class="bg-orange-500 hover:bg-orange-600 px-5 py-3 rounded-xl font-semibold">

                            Rent Now

                        </a>

                    </div>

                </div>

            </div>

            <!-- Card 4 -->

            <div
                class="bg-slate-800 rounded-3xl overflow-hidden shadow-xl hover:-translate-y-3 transition duration-500 group">

                <div class="relative overflow-hidden">

                    <img
                        src="assets/images/bike4.jpg"
                        class="w-full h-56 object-cover group-hover:scale-110 transition">

                </div>

                <div class="p-6">

                    <div class="flex justify-between">

                        <h3 class="text-2xl font-bold">
                            TVS Apache RTR
                        </h3>

                        <span class="text-yellow-400">
                            ⭐4.6
                        </span>

                    </div>

                    <p class="text-slate-400 mt-3">
                        Stylish performance bike for daily adventures.
                    </p>

                    <div class="grid grid-cols-2 gap-3 mt-6">

                        <div class="bg-slate-700 p-3 rounded-xl text-center">
                            Petrol
                        </div>

                        <div class="bg-slate-700 p-3 rounded-xl text-center">
                            Manual
                        </div>

                    </div>

                    <div class="flex justify-between items-center mt-8">

                        <div>

                            <p class="text-slate-400 text-sm">
                                Starting From
                            </p>

                            <h4 class="text-3xl font-bold text-orange-500">
                                ₹799
                            </h4>

                            <span class="text-slate-400">
                                /day
                            </span>

                        </div>

                        <a href="#"
                            class="bg-orange-500 hover:bg-orange-600 px-5 py-3 rounded-xl font-semibold">

                            Rent Now

                        </a>

                    </div>

                </div>

            </div>

        </div>

        <!-- View All -->

        <div class="text-center mt-16">

            <a href="pages/bikes.jsp"
                class="inline-block border border-orange-500 text-orange-500 hover:bg-orange-500 hover:text-white px-8 py-4 rounded-xl transition font-semibold">

                View All Bikes →

            </a>

        </div>

    </div>

</section>
   <!-- Next Section -->

<!-- ================= WHY CHOOSE US ================= -->

<section id="why-us" class="py-24 bg-slate-950">

    <div class="max-w-7xl mx-auto px-6">

        <!-- Heading -->

        <div class="text-center mb-20">

            <span class="text-orange-500 uppercase tracking-[4px] font-semibold">
                Why Choose Us
            </span>

            <h2 class="text-5xl font-bold mt-4">
                Experience Bike Rentals Like Never Before
            </h2>

            <p class="text-slate-400 max-w-3xl mx-auto mt-6 text-lg leading-8">

                We make renting a bike simple, affordable and secure.
                Whether you're planning a weekend ride, daily commute,
                or an adventurous road trip, we've got the perfect ride
                waiting for you.

            </p>

        </div>

        <!-- Features -->

        <div class="grid gap-8 md:grid-cols-2 lg:grid-cols-4">

            <!-- Feature 1 -->

            <div
                class="group bg-slate-900 rounded-3xl p-8 border border-slate-800 hover:border-orange-500 transition duration-500 hover:-translate-y-2">

                <div
                    class="w-16 h-16 rounded-2xl bg-orange-500 flex items-center justify-center text-3xl mb-8 group-hover:rotate-6 transition">

                    🏍

                </div>

                <h3 class="text-2xl font-bold mb-4">

                    Premium Bikes

                </h3>

                <p class="text-slate-400 leading-7">

                    Ride well-maintained premium motorcycles from top brands
                    including KTM, Royal Enfield, Yamaha, Honda and TVS.

                </p>

            </div>

            <!-- Feature 2 -->

            <div
                class="group bg-slate-900 rounded-3xl p-8 border border-slate-800 hover:border-orange-500 transition duration-500 hover:-translate-y-2">

                <div
                    class="w-16 h-16 rounded-2xl bg-orange-500 flex items-center justify-center text-3xl mb-8 group-hover:rotate-6 transition">

                    💰

                </div>

                <h3 class="text-2xl font-bold mb-4">

                    Affordable Pricing

                </h3>

                <p class="text-slate-400 leading-7">

                    Transparent pricing with no hidden charges.
                    Pay only for the duration you ride.

                </p>

            </div>

            <!-- Feature 3 -->

            <div
                class="group bg-slate-900 rounded-3xl p-8 border border-slate-800 hover:border-orange-500 transition duration-500 hover:-translate-y-2">

                <div
                    class="w-16 h-16 rounded-2xl bg-orange-500 flex items-center justify-center text-3xl mb-8 group-hover:rotate-6 transition">

                    ⚡

                </div>

                <h3 class="text-2xl font-bold mb-4">

                    Instant Booking

                </h3>

                <p class="text-slate-400 leading-7">

                    Book your favourite bike online in just a few clicks
                    without lengthy paperwork.

                </p>

            </div>

            <!-- Feature 4 -->

            <div
                class="group bg-slate-900 rounded-3xl p-8 border border-slate-800 hover:border-orange-500 transition duration-500 hover:-translate-y-2">

                <div
                    class="w-16 h-16 rounded-2xl bg-orange-500 flex items-center justify-center text-3xl mb-8 group-hover:rotate-6 transition">

                    🎧

                </div>

                <h3 class="text-2xl font-bold mb-4">

                    24/7 Support

                </h3>

                <p class="text-slate-400 leading-7">

                    Our support team is always available to help
                    before, during and after your ride.

                </p>

            </div>

        </div>

    </div>

</section>
    <!-- How it works -->
<!-- ================= HOW IT WORKS ================= -->

<section class="py-24 bg-slate-900">

    <div class="max-w-7xl mx-auto px-6">

        <!-- Heading -->

        <div class="text-center mb-20">

            <span class="uppercase tracking-[4px] text-orange-500 font-semibold">

                How It Works

            </span>

            <h2 class="text-5xl font-bold mt-4">

                Rent Your Dream Bike in Minutes

            </h2>

            <p class="text-slate-400 max-w-3xl mx-auto mt-6 text-lg">

                Renting a bike has never been easier. Follow these simple
                steps and start your next adventure.

            </p>

        </div>

        <!-- Timeline -->

        <div class="relative">

            <!-- Line -->

            <div class="hidden lg:block absolute top-14 left-0 w-full h-1 bg-slate-700"></div>

            <div class="grid md:grid-cols-2 lg:grid-cols-5 gap-10 relative">

                <!-- STEP 1 -->

                <div class="text-center">

                    <div
                        class="relative z-10 w-28 h-28 mx-auto rounded-full bg-orange-500 flex items-center justify-center text-5xl shadow-xl">

                        🏍

                    </div>

                    <div class="mt-8">

                        <span
                            class="text-orange-500 font-semibold">

                            STEP 01

                        </span>

                        <h3
                            class="text-2xl font-bold mt-3">

                            Browse Bikes

                        </h3>

                        <p
                            class="text-slate-400 mt-4 leading-7">

                            Explore our premium collection and choose the
                            perfect bike for your journey.

                        </p>

                    </div>

                </div>

                <!-- STEP 2 -->

                <div class="text-center">

                    <div
                        class="relative z-10 w-28 h-28 mx-auto rounded-full bg-orange-500 flex items-center justify-center text-5xl shadow-xl">

                        📅

                    </div>

                    <div class="mt-8">

                        <span class="text-orange-500 font-semibold">

                            STEP 02

                        </span>

                        <h3
                            class="text-2xl font-bold mt-3">

                            Select Date

                        </h3>

                        <p
                            class="text-slate-400 mt-4 leading-7">

                            Pick your rental duration and preferred pickup
                            schedule.

                        </p>

                    </div>

                </div>

                <!-- STEP 3 -->

                <div class="text-center">

                    <div
                        class="relative z-10 w-28 h-28 mx-auto rounded-full bg-orange-500 flex items-center justify-center text-5xl shadow-xl">

                        🪪

                    </div>

                    <div class="mt-8">

                        <span class="text-orange-500 font-semibold">

                            STEP 03

                        </span>

                        <h3
                            class="text-2xl font-bold mt-3">

                            Verify Details

                        </h3>

                        <p
                            class="text-slate-400 mt-4 leading-7">

                            Upload your driving license and complete the
                            verification process.

                        </p>

                    </div>

                </div>

                <!-- STEP 4 -->

                <div class="text-center">

                    <div
                        class="relative z-10 w-28 h-28 mx-auto rounded-full bg-orange-500 flex items-center justify-center text-5xl shadow-xl">

                        💳

                    </div>

                    <div class="mt-8">

                        <span class="text-orange-500 font-semibold">

                            STEP 04

                        </span>

                        <h3
                            class="text-2xl font-bold mt-3">

                            Confirm Booking

                        </h3>

                        <p
                            class="text-slate-400 mt-4 leading-7">

                            Review your booking details and make a secure
                            online payment.

                        </p>

                    </div>

                </div>

                <!-- STEP 5 -->

                <div class="text-center">

                    <div
                        class="relative z-10 w-28 h-28 mx-auto rounded-full bg-green-500 flex items-center justify-center text-5xl shadow-xl">

                        🚀

                    </div>

                    <div class="mt-8">

                        <span class="text-green-400 font-semibold">

                            STEP 05

                        </span>

                        <h3
                            class="text-2xl font-bold mt-3">

                            Ride & Return

                        </h3>

                        <p
                            class="text-slate-400 mt-4 leading-7">

                            Pick up your bike, enjoy your ride and return it
                            on time.

                        </p>

                    </div>

                </div>

            </div>

        </div>

    </div>

</section>


    <!-- Footer -->

    <jsp:include page="components/footer.jsp"/>

</body>

</html>