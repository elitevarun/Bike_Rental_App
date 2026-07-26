package com.bikerentalapp.servlet;

import java.io.IOException;
import java.sql.Date;
import java.util.Comparator;

import com.bikerantalapp.Implementation.BookingsDAOImpl;
import com.bikerentalapp.DAO.BookingsDAO;
import com.bikerentalapp.DTO.Booking;
import com.bikerentalapp.DTO.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/BookingController")
public class BookingController extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		User user=(User)session.getAttribute("user");
		Booking booking = new Booking();
        BookingsDAO bdao=new BookingsDAOImpl();
        
		booking.setUserId(user.getUserId());
		booking.setVehicleId(Integer.parseInt(req.getParameter("vehicleId")));
		booking.setStartDate(Date.valueOf(req.getParameter("startDate")));
		booking.setEndDate(Date.valueOf(req.getParameter("endDate")));
		booking.setTotalDays(Integer.parseInt(req.getParameter("totalDays")));
		booking.setTotalAmount(Double.valueOf(req.getParameter("totalAmount")));
		booking.setBookingStatus("Pending");

		bdao.registerBooking(booking);
		
		Booking recentBooking=bdao.findAll().stream().sorted(Comparator.comparing(Booking::getBookingId).reversed()).findFirst().orElse(null);
        
		Integer recentId=recentBooking.getBookingId();
        
        
        
        if(recentId!=null) {
        	
        	
				resp.sendRedirect(req.getContextPath() +"/pages/payment.jsp?bookingId=" + recentId);

        }
	}
}
