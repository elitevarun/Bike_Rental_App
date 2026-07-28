package com.bikerentalapp.servlet;

import java.io.IOException;
import java.time.LocalDateTime;

import com.bikerantalapp.Implementation.BookingsDAOImpl;
import com.bikerantalapp.Implementation.PaymentsDAOImpl;
import com.bikerentalapp.DAO.BookingsDAO;
import com.bikerentalapp.DAO.PaymentsDAO;
import com.bikerentalapp.DTO.Booking;
import com.bikerentalapp.DTO.Payment;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/PaymentController")
public class PaymentServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
          Payment p=new Payment();
	      PaymentsDAO pdao=new PaymentsDAOImpl();
	      
	      p.setBookingId(Integer.parseInt(req.getParameter("bookingId")));
	      p.setAmount(Double.parseDouble(req.getParameter("amount")));
	      p.setPaymentMode(req.getParameter("paymentMode"));
	      p.setPaymentStatus(req.getParameter("status"));
	      p.setPaymentDate(LocalDateTime.parse(req.getParameter("payment_date")));
	      pdao.registerPayment(p);
	      
	    
	      resp.sendRedirect(req.getContextPath()+"/pages/mybooking.jsp?msg=paymentSuccess");
	      	
	}

}
