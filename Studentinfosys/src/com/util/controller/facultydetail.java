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
 * Servlet implementation class facultydetail
 */
@WebServlet("/facultydetail")
public class facultydetail extends HttpServlet {private static final long serialVersionUID = 1L;
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
	String Facultyname =request.getParameter ("Facultyname");		
    String Qualification=request.getParameter("Qualification");
    String Experience=request.getParameter("Experience");
    String Subject=request.getParameter("Subject");
    String Lastwork=request.getParameter("Lastwork");
    String Department=request.getParameter("Department");
    String Email=request.getParameter("Email");
    String Mobileno=request.getParameter("Mobileno");
    String Address=request.getParameter("Address");
    String State=request.getParameter("state");
    String City=request.getParameter("city");
    try
    {
    	PrintWriter out=response.getWriter();
    	
   Class.forName("com.mysql.jdbc.Driver");
	  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentinfo","root","root");
	  System.out.println(con);
	  String query="insert into facultydetail(Facultyname,Qualification,Experience,Subject,Lastwork,Department,Email,Mobileno,Address,State,City) values(?,?,?,?,?,?,?,?,?,?,?)";
	    PreparedStatement ps=con.prepareStatement(query);
	   
	    ps.setString(1,Facultyname);
	    ps.setString(2,Qualification);
	    ps.setString(3,Experience);
	    ps.setString(4,Subject);
	    ps.setString(5,Lastwork);
	    ps.setString(6,Department);
	    ps.setString(7,Email);
	    ps.setString(8,Mobileno);
	    ps.setString(9,Address);
	    ps.setString(10,State);
	    ps.setString(11,City);
	    
	    int i=ps.executeUpdate();
	    if(i==1)
	    {
	    	RequestDispatcher rd=request.getRequestDispatcher("facultydetail.jsp");
	    	rd.forward(request, response);
	    	out.println("Record insert succcessfully");
	    	
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
