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
 * Servlet implementation class studrecordservlet
 */
@WebServlet("/studrecordservlet")

public class studrecordservlet extends HttpServlet {private static final long serialVersionUID = 1L;
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String Studentid =request.getParameter ("Studentid");		
    String Name =request.getParameter("Name");
    String Course=request.getParameter("Course");
    String Joiningdate=request.getParameter("Joiningdate");
    String Totalfees=request.getParameter("tolfee");
    String Paidfees=request.getParameter("Paidfees");
    String Duefees=request.getParameter("Duefees");
    String Duration=request.getParameter("Duration");
    String Mobileno=request.getParameter("Mobileno");
    int studid=Integer.valueOf(Studentid);
    int tolfee=Integer.valueOf(Totalfees);
    int paidfee=Integer.valueOf(Paidfees);
    int duefee=tolfee-paidfee;
    
    try
    {
        PrintWriter out=response.getWriter();
    Class.forName("com.mysql.jdbc.Driver");
	  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentinfo","root","root");
	  System.out.println(con);
	  String query="insert into studrecord(Studentid,Name,Course,Joiningdate,Totalfees,Paidfees,Duefees,Duration,Mobileno) values(?,?,?,?,?,?,?,?,?)";
	    
	    PreparedStatement ps=con.prepareStatement(query);
	    
	    ps.setInt(1,studid);
	    ps.setString(2,Name);
	    ps.setString(3,Course);
	    ps.setString(4,Joiningdate);
	    ps.setInt(5,tolfee);
	    ps.setInt(6,paidfee);
	    ps.setInt(7,duefee);
	    ps.setString(8,Duration);
	    ps.setString(9,Mobileno);
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
