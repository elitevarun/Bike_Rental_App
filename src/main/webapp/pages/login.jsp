<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<%@ include file="../components/head.jsp"%>

<title>Login | Bike Rental</title>

</head>

<body class="bg-slate-950 font-poppins">

	<jsp:include page="../components/navbar.jsp" />

	<section
		class="min-h-screen flex items-center justify-center px-6 py-32">

		<div class="max-w-7xl w-full">

			<div
				class="grid lg:grid-cols-2 bg-slate-900 rounded-3xl overflow-hidden shadow-2xl">

				<!-- Left Side -->

				<!-- Left Side -->

				<div class="hidden lg:block relative overflow-hidden">

					<!-- Full Background Image -->
					<img src="https://i.ibb.co/k2qBjBHg/registerimage.png"
						alt="Bike Rental"
						class="absolute inset-0 w-full h-full object-cover">

					<!-- Dark Overlay -->
					<div class="absolute inset-0 bg-black/50"></div>

					<!-- Text On Image -->
					<div
						class="relative z-10 h-full flex items-center justify-center p-16">

						<div class="text-center">

							<h2 class="text-5xl font-bold text-white">Ride Beyond Limits
							</h2>

							<p
								class="text-orange-100 mt-5 text-lg leading-8 max-w-md mx-auto">
								Premium bikes for unforgettable journeys. Experience freedom on
								every road.</p>

						</div>

					</div>

				</div>

				<!-- Right Side -->

				<div class="p-12 lg:p-16">

					<h2 class="text-4xl font-bold text-white">Welcome Back</h2>

					<p class="text-slate-400 mt-3">Login to continue your journey.

					</p>
					<%
					String regmsg = (String) request.getParameter("regmsg");
					%>
					<%
					if (regmsg != null) {
					%>
					<p class="text-slate-400 mt-3">
						<%

						%>>
						<%=regmsg%>
					</p>
					<%
					}
					%>
					<form action="../login" method="post" class="mt-10 space-y-6">

						<div>

							<label class="text-slate-300"> Email </label> <input type="email"
								name="email" placeholder="Enter your email" required
								class="w-full mt-2 px-5 py-4 rounded-xl bg-slate-800 border border-slate-700 focus:border-orange-500 outline-none text-white">

						</div>

						<div>

							<label class="text-slate-300"> Password </label> <input
								type="password" name="password" placeholder="Enter password"
								required
								class="w-full mt-2 px-5 py-4 rounded-xl bg-slate-800 border border-slate-700 focus:border-orange-500 outline-none text-white">

						</div>

						<div class="flex justify-between items-center">

							<label class="flex items-center gap-2 text-slate-400"> <input
								type="checkbox"> Remember Me

							</label> <a href="forgotPassword.jsp"
								class="text-orange-500 hover:underline"> Forgot Password? </a>

						</div>

						<button type="submit"
							class="w-full bg-orange-500 hover:bg-orange-600 transition py-4 rounded-xl text-white font-semibold text-lg">

							Login</button>

					</form>

					<div class="mt-8 text-center">

						<p class="text-slate-400">

							Don't have an account? <a href="register.jsp"
								class="text-orange-500 font-semibold"> Register </a>

						</p>

					</div>

				</div>

			</div>

		</div>

	</section>

	<jsp:include page="../components/footer.jsp" />

</body>

</html>