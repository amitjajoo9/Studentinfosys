package com.util.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class coursedetailservlet
 */
@WebServlet("/coursedetailservlet")

public class coursedetailservlet extends HttpServlet {private static final long serialVersionUID = 1L;
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String Coursecode =request.getParameter ("Coursecode");		
    String Course =request.getParameter("Course");
    String Duration=request.getParameter("Duration");
    String Year=request.getParameter("Year");
    String Totalfees=request.getParameter("Totalfees");
    //String Semester=request.getParameter("Semester");
    
    int tolfee=Integer.valueOf(Totalfees);
    
    try
    {
        PrintWriter out=response.getWriter();
    Class.forName("com.mysql.jdbc.Driver");
	  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentinfo","root","root");
	  ResultSet rs=null;
	  System.out.println(con);
	  Statement st=con.createStatement();
	   rs=st.executeQuery("select * from coursedetail where Coursecode='"+Coursecode+"'");
	  if(!rs.next()) 
	  {
	  
	  String query="insert into coursedetail(Coursecode,Course,Duration,Year,Totalfees) values(?,?,?,?,?)";
	    
	    PreparedStatement ps=con.prepareStatement(query);
	    ps.setString(1,Coursecode);
	    ps.setString(2,Course);
	    ps.setString(3,Duration);
	    ps.setString(4,Year);
	    ps.setInt(5,tolfee);

	    int i=ps.executeUpdate();
	    if(i==1)
	    
	    {
	    	request.setAttribute("msg", "Record is successfully insert");
	    	RequestDispatcher rd=request.getRequestDispatcher("coursedetail.jsp");
	    	rd.forward(request, response);
	    	//out.println("Recorded insert successfully");
	    	
	    }
	    else
	    {
	    	out.println("error occur");
	    }
	    
	  }
	  else
	  {
		  request.setAttribute("msg", "Record is already available!Please insert new record");
		  RequestDispatcher rd=request.getRequestDispatcher("coursedetail.jsp");
	    	rd.forward(request, response);
	  }
	  
    }
    catch(Exception e )
    {
    	System.out.println("sql exception"+e);
    }
    }

}
