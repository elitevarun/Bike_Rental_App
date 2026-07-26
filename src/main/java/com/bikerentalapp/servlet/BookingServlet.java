package com.bikerentalapp.servlet;

import java.io.IOException;
import java.sql.Date;

import com.bikerantalapp.Implementation.BookingsDAOImpl;
import com.bikerantalapp.Implementation.VehiclesDAOImpl;
import com.bikerentalapp.DAO.BookingsDAO;
import com.bikerentalapp.DAO.VehiclesDAO;
import com.bikerentalapp.DTO.Booking;
import com.bikerentalapp.DTO.User;
import com.bikerentalapp.DTO.Vehicle;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/booking")
public class BookingServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		VehiclesDAO vdao = new VehiclesDAOImpl();
		Vehicle vehicle = vdao.findById(Integer.parseInt(req.getParameter("id")));
		req.setAttribute("vehicle", vehicle);
		req.getRequestDispatcher("./pages/booking.jsp").forward(req, resp);
	}
	

}
//not in use