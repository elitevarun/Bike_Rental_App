package com.bikerentalapp.servlet;

import java.io.IOException;
import java.time.LocalDateTime;

import com.bikerantalapp.Implementation.BookingsDAOImpl;
import com.bikerantalapp.Implementation.PaymentsDAOImpl;
import com.bikerantalapp.Implementation.VehiclesDAOImpl;
import com.bikerentalapp.DAO.BookingsDAO;
import com.bikerentalapp.DAO.PaymentsDAO;
import com.bikerentalapp.DAO.VehiclesDAO;
import com.bikerentalapp.DTO.Booking;
import com.bikerentalapp.DTO.Payment;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/PaymentSave")
public class PaymentControler extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		VehiclesDAO vdao = new VehiclesDAOImpl();
		BookingsDAO bdao = new BookingsDAOImpl();
		PaymentsDAO pdao = new PaymentsDAOImpl();
		Payment p=pdao.findById(Integer.parseInt(req.getParameter("paymentId")));
		int paymentId=p.getPaymentId();
		int bookingId=p.getBookingId();
		Booking b=bdao.findById(bookingId);
		int vehicleId=b.getVehicleId();
		

		if (req.getParameter("status").equalsIgnoreCase("paid")) {
			pdao.updatePaymentStatus(paymentId, "Paid");
			bdao.udpateBookingStatus(bookingId, "Confirmed");
			vdao.updateVehicleStatus(vehicleId, false);
			resp.sendRedirect(req.getContextPath() + "/admin/adminPayments.jsp");
		} else if (req.getParameter("status").equalsIgnoreCase("Failed")) {
			pdao.updatePaymentStatus(paymentId, "Failed");
			bdao.udpateBookingStatus(bookingId, "Cancelled");
			vdao.updateVehicleStatus(vehicleId, true);
			resp.sendRedirect(req.getContextPath() + "/admin/adminPayments.jsp");
		} else if (req.getParameter("status").equalsIgnoreCase("Refunded")) {
			pdao.updatePaymentStatus(paymentId, "Refunded");
			bdao.udpateBookingStatus(bookingId, "Cancelled");
			vdao.updateVehicleStatus(vehicleId, true);
			resp.sendRedirect(req.getContextPath() + "/admin/adminPayments.jsp");
		}

	}

}
