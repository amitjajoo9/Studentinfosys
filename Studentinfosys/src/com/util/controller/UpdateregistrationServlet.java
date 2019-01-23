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
 * Servlet implementation class UpdateregistrationServlet
 */
@WebServlet("/UpdateregistrationServlet")

public class UpdateregistrationServlet extends HttpServlet {private static final long serialVersionUID = 1L;
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String Studentid=request.getParameter("Studentid");	
    String Firstname =request.getParameter("Firstname");
    String Lastname=request.getParameter("Lastname");
    String Fathername=request.getParameter("Fathername");
    String Mothername=request.getParameter("Mothername");
    String DOB=request.getParameter("DOB");
    String Gender=request.getParameter("Gender");
    String Course=request.getParameter("Course");
    String Email =request.getParameter("Email");
    String Mobileno =request.getParameter("mobileno");
    String Alternatemobile=request.getParameter("Alternatemobile");
    String Address=request.getParameter("Address");
    String City=request.getParameter("City");
    String State=request.getParameter("State");
    String Image=request.getParameter("Image");
    String Passyear=request.getParameter("Passyear");


    
    
    try
    {
        PrintWriter out=response.getWriter();
    Class.forName("com.mysql.jdbc.Driver");
	  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentinfo","root","root");
	  System.out.println(con);
	 String studentid="select studentid from studentregistration where studentid='"+Studentid+"'";
	  String query="insert into studrecord(Firstname,Lastname,Fathername,Mothername,DOB,Gender,Course,Email,Mobileno,Alternatemobile,Address,City,State,Image,passyear) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	    
	    PreparedStatement ps=con.prepareStatement(query);
	    
	    ps.setString(1,Firstname);
	    ps.setString(2,Lastname);
	    ps.setString(3,Fathername);
	    ps.setString(4,Mothername);
	    ps.setString(5,DOB);
	    ps.setString(6,Gender);
	    ps.setString(7,Course);
	    ps.setString(8,Email);
	    ps.setString(9,Mobileno);
	    ps.setString(10,Alternatemobile);
	    ps.setString(11,Address);
	    ps.setString(12,City);
	    ps.setString(13,State);
	    ps.setString(14,Image);
	    ps.setString(15,Passyear);
	   	    
	    int i=ps.executeUpdate();
	    if(i==1)
	    
	    {
	    	out.println("Record updated succcessfully");
	    	
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
