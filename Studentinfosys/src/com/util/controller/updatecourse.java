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
 * Servlet implementation class updatecourse
 */
@WebServlet("/updatecourse")
public class updatecourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String Coursecode = request.getParameter("Coursecode");
		String Course=request.getParameter("Course");
		String Duration=request.getParameter("Duration");
		String Year=request.getParameter("Year");
		String Totalfees=request.getParameter("Totalfees");
		String Semester=request.getParameter("Semester");
		
		
		if(Coursecode != null)
		{
		Connection con = null;
		PreparedStatement ps = null;
		PrintWriter  out=null;
		int personID = Integer.parseInt(Coursecode);
		System.out.println(personID);
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentinfo","root","root");
			  System.out.println(con);
		String sql="update coursedetail set Coursecode=?,Coursecode=?,Duration=?,Year=?,Totalfees=?,Semester=? where Coursecode="+Coursecode;
		ps = con.prepareStatement(sql);
		ps.setString(1,Coursecode);
		ps.setString(2, Course);
		ps.setString(3, Duration);
		ps.setString(4,Year);
		ps.setString(5, Totalfees);
		ps.setString(6, Semester);
		
		
		int i = ps.executeUpdate();
		System.out.println(i);
		if(i > 0)
		{
		out.print("Record Updated Successfully");
		}
		else
		{
		out.print("There is a problem in updating Record.");
		} 
		}
		catch(Exception sql)
		{
		request.setAttribute("error", sql);
		out.println(sql);
		}
		}
	
	}

}
