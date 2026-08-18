package com.bikerentalapp.servlet;

import java.io.IOException;

import com.bikerantalapp.Implementation.UsersDAOImpl;
import com.bikerentalapp.DAO.UsersDAO;
import com.bikerentalapp.DTO.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet{
      
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	     UsersDAO udao=new UsersDAOImpl();
	     User u=new User();
	     u.setFirstName(req.getParameter("firstName"));
	     u.setLastName(req.getParameter("lastName"));
	     u.setEmail(req.getParameter("email"));
	     u.setPhone(req.getParameter("phone"));
	     u.setDrivingLicenseNo(req.getParameter("drivingLicenseNo"));
	     u.setAddress(req.getParameter("address"));
	     u.setPassword(req.getParameter("password"));
	     if(req.getParameter("password").equals(req.getParameter("confirmPassword"))) {
	    	     udao.registerUser(u);
	    	     resp.sendRedirect(req.getContextPath()+"/pages/login.jsp?regmsg=Successfully+Registed");
	     }
	     else {
	    	 resp.sendRedirect(req.getContextPath()+"/pages/register.jsp");
	     }
	     
	}
}
