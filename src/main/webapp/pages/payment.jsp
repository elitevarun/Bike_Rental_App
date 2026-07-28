
<%@page import="java.time.LocalDateTime"%>
<%@page import="com.bikerantalapp.Implementation.PaymentsDAOImpl"%>
<%@page import="com.bikerentalapp.DAO.PaymentsDAO"%>
<%@page import="com.bikerantalapp.Implementation.BookingsDAOImpl"%>
<%@page import="com.bikerentalapp.DAO.BookingsDAO"%>
<%@page import="com.bikerentalapp.DTO.Booking"%>
<%@page import="com.bikerentalapp.DTO.User"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
User user = (User) session.getAttribute("user");

if (user == null) {
	response.sendRedirect("login.jsp");
	return;
}

//Booking booking = (Booking) request.getAttribute("booking");
//BookingsDAO bdao=new BookingsDAOImpl();
//Booking booking=bdao.findById(1);
Integer bookingId = Integer.parseInt(request.getParameter("bookingId"));

		PaymentsDAO pdao = new PaymentsDAOImpl();
		BookingsDAO bdao = new BookingsDAOImpl();

		Booking booking = bdao.findById(bookingId);
if (booking == null) {
	response.sendRedirect("../BookingController?action=myBookings");
	return;
}


 LocalDateTime currentDateTime = LocalDateTime.now(); 
%>

<!DOCTYPE html>
<html>

<head>

<%@include file="../components/head.jsp"%>

<title>Payment</title>

</head>

<body class="bg-slate-950 font-poppins text-white">

	<jsp:include page="../components/navbar.jsp" />

	<section class="pt-32 pb-20">

		<div class="max-w-6xl mx-auto px-6">

			<div class="grid lg:grid-cols-2 gap-10">

				<!-- ====================================== -->
				<!-- LEFT -->
				<!-- ====================================== -->

				<div class="bg-slate-900 rounded-3xl shadow-xl p-10">

					<h2 class="text-4xl font-bold">Booking Summary</h2>

					<p class="text-slate-400 mt-3">Review your booking before
						payment.</p>

					<div class="mt-10 space-y-5">

						<div class="flex justify-between">

							<span class="text-slate-400"> Booking ID </span> <span> #<%=booking.getBookingId()%>

							</span>

						</div>

						<div class="flex justify-between">

							<span class="text-slate-400"> Start Date </span> <span> <%=booking.getStartDate()%>

							</span>

						</div>

						<div class="flex justify-between">

							<span class="text-slate-400"> End Date </span> <span> <%=booking.getEndDate()%>

							</span>

						</div>

						<div class="flex justify-between">

							<span class="text-slate-400"> Rental Days </span> <span> <%=booking.getTotalDays()%>

							</span>

						</div>

						<hr class="border-slate-700">

						<div class="flex justify-between text-3xl font-bold">

							<span> Total Amount </span> <span class="text-orange-500">

								₹<%=booking.getTotalAmount()%>

							</span>

						</div>

					</div>

				</div>



				<!-- ====================================== -->
				<!-- RIGHT -->
				<!-- ====================================== -->

				<div class="bg-slate-900 rounded-3xl shadow-xl p-10">

					<h2 class="text-4xl font-bold">Payment</h2>

					<p class="text-slate-400 mt-3">Choose your payment method.</p>

					<form action="${pageContext.request.contextPath}/PaymentController" method="post" class="mt-10">

						<input type="hidden" name="bookingId"
							value="<%=booking.getBookingId()%>"> 
							<input type="hidden"
							name="amount" value="<%=booking.getTotalAmount()%>">

						<div class="space-y-5">

							<label
								class="payment-option flex items-center gap-5 bg-slate-800 rounded-2xl p-5 cursor-pointer border border-transparent hover:border-orange-500 transition">

								<input type="radio" name="paymentMode" value="UPI" required>

								<div>

									<h3 class="text-xl font-semibold">UPI</h3>

									<p class="text-slate-400">Google Pay, PhonePe, Paytm</p>

								</div>

							</label>
							
							 <label
								class="payment-option flex items-center gap-5 bg-slate-800 rounded-2xl p-5 cursor-pointer border border-transparent hover:border-orange-500 transition">

								<input type="radio" name="paymentMode" value="Card">

								<div>

									<h3 class="text-xl font-semibold">Credit / Debit Card</h3>

									<p class="text-slate-400">Visa, MasterCard, RuPay</p>

								</div>

							</label> 
							
							
							<label
								class="payment-option flex items-center gap-5 bg-slate-800 rounded-2xl p-5 cursor-pointer border border-transparent hover:border-orange-500 transition">

								<input type="radio" name="paymentMode" value="Net Banking">

								<div>

									<h3 class="text-xl font-semibold">Net Banking</h3>

									<p class="text-slate-400">All major banks</p>

								</div>

							</label> <label
								class="payment-option flex items-center gap-5 bg-slate-800 rounded-2xl p-5 cursor-pointer border border-transparent hover:border-orange-500 transition">

								<input type="radio" name="paymentMode" value="Cash">

								<div>

									<h3 class="text-xl font-semibold">Cash</h3>

									<p class="text-slate-400">Pay while collecting the bike</p>

								</div>

							</label>

						</div>
						
						
						<input type="hidden"
							name="status" value="pending">
					
						<input type="hidden"
							name="payment_date" value="<%=currentDateTime%>">	
						
						

						<button type="submit"
							class="w-full mt-10 bg-orange-500 hover:bg-orange-600 py-4 rounded-xl text-xl font-semibold transition">

							Pay Now</button>

					</form>

				</div>

			</div>

		</div>

	</section>
	
	
	<jsp:include page="../components/footer.jsp"/>

</body>

</html>