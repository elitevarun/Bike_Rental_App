package com.bikerentalapp.servlet;

import java.io.IOException;

import com.bikerantalapp.Implementation.AdminsDAOImpl;
import com.bikerantalapp.Implementation.UsersDAOImpl;
import com.bikerentalapp.DAO.AdminsDAO;
import com.bikerentalapp.DAO.UsersDAO;
import com.bikerentalapp.DTO.Admin;
import com.bikerentalapp.DTO.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class Login extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UsersDAO udao = new UsersDAOImpl();
		AdminsDAO adao = new AdminsDAOImpl();
		User u = udao.findByMailAndPassword(req.getParameter("email"), req.getParameter("password"));
		Admin a = adao.findByMailAndPassword(req.getParameter("email"), req.getParameter("password"));
		System.out.println(a);
		HttpSession session = req.getSession();
		if (u != null && u.getEmail().equals(req.getParameter("email"))
				&& u.getPassword().equals(req.getParameter("password"))) {

			session.setAttribute("user", u);
			resp.sendRedirect("./pages/userdashboard.jsp");
		} 
		else if (a != null) {
			if (a.getEmail().equals(req.getParameter("email")) && a.getPassword().equals(req.getParameter("password"))
					&& a.getRole().equalsIgnoreCase("super_admin")) {
				session.setAttribute("superAdmin", a);
				resp.sendRedirect("./pages/superadmindashboard.jsp");
			} 
			else if (a.getEmail().equals(req.getParameter("email"))
					&& a.getPassword().equals(req.getParameter("password"))
					&& a.getRole().equalsIgnoreCase("manager")) {
				session.setAttribute("managerAdmin", a);
				resp.sendRedirect("./pages/manageradmindashboard.jsp");
			} 
			else if (a.getEmail().equals(req.getParameter("email"))
					&& a.getPassword().equals(req.getParameter("password")) 
					&& a.getRole().equalsIgnoreCase("admin")) {
				session.setAttribute("admin", a);
				resp.sendRedirect("./pages/admindashboard.jsp");
			}
		}

		else {
			req.setAttribute("msg", "Data Not Found");
			req.getRequestDispatcher("/pages/login.jsp").forward(req, resp);
		}
	}

}
