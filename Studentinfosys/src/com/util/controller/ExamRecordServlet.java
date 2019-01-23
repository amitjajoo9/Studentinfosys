package com.util.controller;



import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ExamRecordServlet
 */

       
 



	@WebServlet("/ExamRecordServlet")

	public class ExamRecordServlet extends HttpServlet {private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Studentid =request.getParameter ("Studentid");		
	    String Studentname =request.getParameter("Studentname");
	    String Examyear=request.getParameter("Examyear");
	    String Course=request.getParameter("Course");
	    String Semester=request.getParameter("Semester");
	    String Examtype=request.getParameter("Examtype");
	    String Subject=request.getParameter("Subject");
	    
	    try
	    {
	        PrintWriter out=response.getWriter();
	    Class.forName("com.mysql.jdbc.Driver");
		  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentinfo","root","root");
		  System.out.println(con);
		  String query="insert into examrecord(Studentname,Examyear,Course,Semester,Examtype,Subject) values(?,?,?,?,?,?)";
		    
		    PreparedStatement ps=con.prepareStatement(query);
		    
		    ps.setString(1,Studentname);
		    ps.setString(2,Examyear);
		    ps.setString(3,Course);
		    ps.setString(4,Semester);
		    ps.setString(5,Examtype);
		    ps.setString(6,Subject);
		    int i=ps.executeUpdate();
		    if(i==1)
		    
		    {
		    	request.setAttribute("msg", "Record is successfully insert");
	           out.println("Record insert successfully");
		    	
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



