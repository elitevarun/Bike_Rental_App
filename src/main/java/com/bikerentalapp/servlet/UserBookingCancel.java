package com.bikerentalapp.servlet;

import java.io.IOException;

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

@WebServlet("/userBookingCancel")
public class UserBookingCancel extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		VehiclesDAO vdao = new VehiclesDAOImpl();
		BookingsDAO bdao = new BookingsDAOImpl();
		Booking b = bdao.findById(Integer.parseInt(req.getParameter("id")));
        int bookingId=b.getBookingId();
		System.out.println(req.getParameter("id"));
		
		
		PaymentsDAO pdao = new PaymentsDAOImpl();
		Payment p = pdao.findByBookingId(bookingId);
		System.out.println(b.getBookingId());
		if (b.getBookingStatus().equalsIgnoreCase("Pending")) {

			bdao.udpateBookingStatus(b.getBookingId(), "Cancelled");
			vdao.updateVehicleStatus(b.getVehicleId(), true);
			pdao.updatePaymentStatus(p.getPaymentId(), "Refunded");

			resp.sendRedirect(req.getContextPath() + "/pages/mybooking.jsp");

		} else if (b.getBookingStatus().equalsIgnoreCase("Confirmed")) {
			resp.sendRedirect(req.getContextPath() + "/pages/mybooking.jsp?msgs=You+Cannot+Cancel");

		} else if (b.getBookingStatus().equalsIgnoreCase("Completed")) {
			resp.sendRedirect(req.getContextPath() + "/pages/mybooking.jsp?msgs=You+Cannot+Cancel");

		} else if (b.getBookingStatus().equalsIgnoreCase("Cancelled")) {

			resp.sendRedirect(req.getContextPath() + "/pages/mybooking.jsp?msgs=You+Cannot+Cancel");

		}
	
	}
}
