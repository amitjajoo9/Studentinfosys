package com.util.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
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
 * Servlet implementation class timetableservlet
 */
@WebServlet("/timetableservlet")

public class timetableservlet extends HttpServlet {private static final long serialVersionUID = 1L;
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String Subcode =request.getParameter ("Subcode");		
    String Day =request.getParameter("Day");
    String Course=request.getParameter("Course");
    String Subject=request.getParameter("Subject");
    String Semester=request.getParameter("Semester");
    String Examdate=request.getParameter("Examdate");
    
      try
    {
        PrintWriter out=response.getWriter();
    Class.forName("com.mysql.jdbc.Driver");
	  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentinfo","root","root");
	  System.out.println(con);
	  String query="insert into tabletime(Subid,Day,Course,Subject,Semester,Examdate) values(?,?,?,?,?,?)";
	    
	    PreparedStatement ps=con.prepareStatement(query);
	    
	    ps.setString(1,Subcode);
	    ps.setString(2,Day);
	    ps.setString(3,Course);
	    ps.setString(4,Subject);
	    ps.setString(5,Semester);
	    ps.setString(6,Examdate);
	    int i=ps.executeUpdate();
	    if(i==1)
	    
	    {
	    	request.setAttribute("msg", "Record is successfully insert");
	        
	    	out.println("Record insert successfully");
		    	RequestDispatcher rd=request.getRequestDispatcher("timetable.jsp");
		    	rd.forward(request, response);
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
