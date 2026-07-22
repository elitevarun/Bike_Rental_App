
<%@page import="com.bikerentalapp.DTO.User"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
User user = (User) session.getAttribute("user");

if (user == null) {
	response.sendRedirect("login.jsp");

}
%>

<!DOCTYPE html>
<html>

<head>

<%@ include file="../components/head.jsp"%>

<title>Edit Profile</title>

</head>

<body class="bg-slate-950 font-poppins text-white">

	<jsp:include page="../components/navbar.jsp" />

	<section class="py-28">

		<div class="max-w-4xl mx-auto px-6">

			<div class="bg-slate-900 rounded-3xl shadow-2xl overflow-hidden">

				<!-- Header -->

				<div class="bg-gradient-to-r from-orange-500 to-orange-600 p-8">

					<h1 class="text-4xl font-bold">Edit Profile</h1>

					<p class="text-orange-100 mt-3">Update your personal
						information.</p>

				</div>
				<!-- Account Information -->
				<div class="mx-10 mt-8 mb-2">
					<div class="bg-slate-800 border border-slate-700 rounded-xl p-5">
						<h3 class="text-lg font-semibold text-orange-400">Account
							Information</h3>

						<p class="text-slate-400 mt-2">This is the email address
							associated with your account. It cannot be changed.</p>

						<div class="mt-4">
							<span class="text-slate-400 text-sm">Email Address</span>
							<p class="text-white text-lg font-medium mt-1">
								<%=user.getEmail()%>
							</p>
						</div>
					</div>
				</div>

				<!-- Form -->

				<div class="p-10">

					<form action="../updateuser" method="post">

						
						<input type="hidden" name="userId" value="<%=user.getUserId()%>">

						<div class="grid md:grid-cols-2 gap-6">

							<!-- First Name -->

							<div>

								<label class="text-slate-300"> First Name </label> <input
									type="text" name="firstName" value="<%=user.getFirstName()%>"
									required
									class="w-full mt-2 p-4 rounded-xl bg-slate-800 border border-slate-700 focus:border-orange-500 outline-none">

							</div>

							<!-- Last Name -->

							<div>

								<label class="text-slate-300"> Last Name </label> <input
									type="text" name="lastName" value="<%=user.getLastName()%>"
									required
									class="w-full mt-2 p-4 rounded-xl bg-slate-800 border border-slate-700 focus:border-orange-500 outline-none">

							</div>


			                 <!-- eamil -->
							<input type="hidden" name="email" value="<%=user.getEmail()%>">

							<!-- Phone -->

							<div>

								<label class="text-slate-300"> Phone </label> <input type="text"
									name="phone" value="<%=user.getPhone()%>" required
									class="w-full mt-2 p-4 rounded-xl bg-slate-800 border border-slate-700 focus:border-orange-500 outline-none">

							</div>

							<!-- DL -->

							<div>

								<label class="text-slate-300"> Driving License </label> <input
									type="text" name="drivingLicenseNo"
									value="<%=user.getDrivingLicenseNo()%>" required
									class="w-full mt-2 p-4 rounded-xl bg-slate-800 border border-slate-700 focus:border-orange-500 outline-none">

							</div>

							<!-- Address -->

							<div class="md:col-span-2">

								<label class="text-slate-300"> Address </label>

								<textarea name="address" rows="4"
									class="w-full mt-2 p-4 rounded-xl bg-slate-800 border border-slate-700 focus:border-orange-500 outline-none resize-none"><%=user.getAddress()%></textarea>

							</div>

						</div>
<%
String msg = (String) request.getAttribute("msg");

if (msg != null) {
%>
    <%= msg %>
<%
}
%>

						<div class="flex gap-5 mt-10">

							<button type="submit"
								class="bg-orange-500 hover:bg-orange-600 px-8 py-4 rounded-xl font-semibold">

								Update Profile</button>

							<a href="userdashboard.jsp"
								class="border border-slate-600 hover:border-orange-500 px-8 py-4 rounded-xl transition">

								Cancel </a>

						</div>

					</form>

				</div>

			</div>

		</div>

	</section>

	<jsp:include page="../components/footer.jsp" />

</body>

</html>