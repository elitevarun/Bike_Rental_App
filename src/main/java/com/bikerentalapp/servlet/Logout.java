package com.bikerentalapp.servlet;

import java.io.IOException;

import com.bikerentalapp.DTO.Admin;
import com.bikerentalapp.DTO.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/logout")
public class Logout extends HttpServlet{
     @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         HttpSession session=req.getSession(false);
         User user=(User)session.getAttribute("user");
         Admin superAdmin=(Admin)session.getAttribute("superAdmin");
         Admin managerAdmin=(Admin)session.getAttribute("managerAdmin");
         Admin admin=(Admin)session.getAttribute("admin");
         if(user!=null || superAdmin!=null || managerAdmin!=null || admin!=null) {
        	 session.invalidate();
        
     		
         }
         resp.sendRedirect(req.getContextPath() + "/index.jsp");
    }
}
