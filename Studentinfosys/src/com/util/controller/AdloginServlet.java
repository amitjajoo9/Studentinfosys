package com.util.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


	@WebServlet("/AdloginServlet")
	public class AdloginServlet extends HttpServlet {
		private static final long serialVersionUID = 1L;
	       
	   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		   String adname=request.getParameter("adminid");
		   String pass=request.getParameter("pass");
		   System.out.println(adname+""+pass);
		   
		   try
		   {
			  Class.forName("com.mysql.jdbc.Driver");
			  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentinfo","root","root");
			  System.out.println(con);
			    
			  Statement st=con.createStatement();
			  String query="select * from admlogin";
			  System.out.println(query);
			  ResultSet rs=st.executeQuery(query);
			  PrintWriter out=response.getWriter();
			  String admname="";
			  String passw="";
			  while(rs.next())
			  {
				  admname=rs.getString(1);
				  passw=rs.getString(2);
	 			  
				  System.out.println(rs.getString(1)+""+rs.getString(2));
				 
			  }
			  
			  if(adname.equals(adname)&& pass.equals(passw))
			  {
				  HttpSession session=request.getSession();  
			        session.setAttribute("adname",adname);  
			      
				  RequestDispatcher rd=request.getRequestDispatcher("Admindesk.jsp");
				  rd.forward(request, response);
				  
			  }
			  else
			  {
				  request.setAttribute("msg", "<h4> sorry username and password  InValid  </h4>");
				  RequestDispatcher rd = request.getRequestDispatcher("Adminlogin.jsp");
  				rd.include(request, response); 
			  }
			  con.close();	   
			  }
		   catch(Exception e)
		   {
			   
		   }
		}

	}


