package com.util.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class attendance1servlet
 */
@WebServlet("/attendance1servlet")
public class attendance1servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  String rollno=request.getParameter("rollno"); 
		String studname =request.getParameter("studname");
		    String attendance=request.getParameter("attendance");
		    
		    try
		    {
		        PrintWriter out=response.getWriter();
		    Class.forName("com.mysql.jdbc.Driver");
			  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentinfo","root","root");
			  System.out.println(con);
			  String query="insert into attendance(studid,studname,attendance) values(?,?,?)";
			    
			    PreparedStatement ps=con.prepareStatement(query);
			    ps.setString(1,rollno);
			    ps.setString(2,studname);
			    ps.setString(3,attendance);
			   
			    int i=ps.executeUpdate();
			    if(i==1)
			    
			    {
			    	request.setAttribute("msg", "Record is successfully insert");
			    	RequestDispatcher rd=request.getRequestDispatcher("attendance.jsp");
			    	rd.forward(request, response);
			    	//out.println("Recorded insert successfully");
			    	
			    }
			    else
			    {
			    	out.println("error occur");
			    }
			    
			   
			  
		    }
		    catch(Exception e )
		    {
		    	System.out.println("sql exception"+e);
		    }
		    }
	
	}


