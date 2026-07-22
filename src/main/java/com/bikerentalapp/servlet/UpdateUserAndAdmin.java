package com.bikerentalapp.servlet;

import java.io.IOException;

import com.bikerantalapp.Implementation.UsersDAOImpl;
import com.bikerentalapp.DAO.UsersDAO;
import com.bikerentalapp.DTO.User;
import com.mysql.cj.Session;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/updateuser")
public class UpdateUserAndAdmin extends HttpServlet {
          @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        	User u = new User();
        	UsersDAO udao=new UsersDAOImpl();
        	HttpSession session=req.getSession();
        	User user=(User)session.getAttribute("user");
        	if(user.getEmail().equals(req.getParameter("email")) && user.getUserId().equals(Integer.parseInt(req.getParameter("userId")))) {
        		u.setUserId(user.getUserId());
        		u.setFirstName(req.getParameter("firstName"));
        		u.setLastName(req.getParameter("lastName"));
        		u.setPhone(req.getParameter("phone"));
        		u.setAddress(req.getParameter("address"));
        		u.setDrivingLicenseNo(req.getParameter("drivingLicenseNo"));
        		udao.updateUser(u);
        		User uu=udao.findById(user.getUserId());
        		session.setAttribute("user", uu);
        		req.setAttribute("msg", "User Profile updated");
        		req.getRequestDispatcher("/pages/updateuser.jsp").forward(req, resp);
        	}
        	else {
        		req.setAttribute("msg", "User Profile Not updated");
        		req.getRequestDispatcher("/pages/updateuser.jsp").forward(req, resp);
        	}
        }
}
