<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Google Font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap"
	rel="stylesheet">

<!-- Tailwind CSS -->
<script src="https://cdn.tailwindcss.com"></script>

<script>
tailwind.config = {
    theme: {
        extend: {
            fontFamily: {
                poppins: ['Poppins', 'sans-serif']
            },
            colors: {
                primary: '#f97316',
                secondary: '#0f172a'
            }
        }
    }
}
</script>

<nav
	class="fixed top-0 left-0 w-full z-50 bg-slate-900/80 backdrop-blur-md shadow-lg border-b border-slate-700">

	<div class="max-w-7xl mx-auto px-6">

		<div class="flex justify-between items-center h-20">

			<!-- Logo -->

			<a href="${pageContext.request.contextPath}/index.jsp" class="flex items-center gap-3"> <!-- Replace logo later -->

				<img src="../assets/images/logo.png"
				class="h-11 w-11 rounded-full object-cover bg-white p-1">

				<div>

					<h1 class="text-2xl font-bold text-white">
						Bike<span class="text-orange-500">Rental</span>
					</h1>

					<p class="text-xs text-gray-400 tracking-wide">Ride Beyond
						Limits</p>

				</div>

			</a>

			<!-- Desktop Menu -->

			<div class="hidden lg:flex items-center gap-10">

				<a href="${pageContext.request.contextPath}/index.jsp"
					class="text-gray-300 hover:text-orange-500 transition font-medium">
					Home </a> <a href="../pages/bikes.jsp"
					class="text-gray-300 hover:text-orange-500 transition font-medium">
					Bikes </a> <a href="../pages/about.jsp"
					class="text-gray-300 hover:text-orange-500 transition font-medium">
					About </a> <a href="../pages/contact.jsp"
					class="text-gray-300 hover:text-orange-500 transition font-medium">
					Contact </a>

			</div>

			<!-- Buttons -->

			<div class="hidden lg:flex gap-4">

				<a href="${pageContext.request.contextPath}/pages/login.jsp"
					class="px-5 py-2 border border-orange-500 rounded-full text-orange-500 hover:bg-orange-500 hover:text-white transition">

					Login </a> <a href="${pageContext.request.contextPath}/pages/register.jsp"
					class="px-5 py-2 rounded-full bg-orange-500 text-white hover:bg-orange-600 transition shadow-lg">

					Register </a>

			</div>

			<!-- Mobile Button -->

			<button id="menu-btn" class="lg:hidden text-white text-3xl">

				☰</button>

		</div>

	</div>

	<!-- Mobile Menu -->

	<div id="mobile-menu"
		class="hidden lg:hidden bg-slate-900 border-t border-slate-700">

		<div class="flex flex-col p-6 gap-5">

			<a href="../index.jsp" class="text-white">Home</a> <a
				href="../pages/bikes.jsp" class="text-white">Bikes</a> <a
				href="../pages/about.jsp" class="text-white">About</a> <a
				href="../pages/contact.jsp" class="text-white">Contact</a>

			<hr class="border-slate-700">

			<a href="../pages/login.jsp"
				class="border border-orange-500 rounded-lg py-2 text-center text-orange-500">

				Login </a> <a href="../pages/register.jsp"
				class="bg-orange-500 rounded-lg py-2 text-center text-white">

				Register </a>

		</div>

	</div>

</nav>

<script>

const btn = document.getElementById("menu-btn");

const menu = document.getElementById("mobile-menu");

btn.addEventListener("click", () => {

    menu.classList.toggle("hidden");

});

</script>