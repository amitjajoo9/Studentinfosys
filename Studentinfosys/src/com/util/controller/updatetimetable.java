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
 * Servlet implementation class updatetimetable
 */
@WebServlet("/updatetimetable")
public class updatetimetable extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String  Subcode= request.getParameter("Subcode");
		String Day=request.getParameter("Day");
		String Course=request.getParameter("Course");
		String Subject=request.getParameter("Subject");
		String Semester=request.getParameter("Semester");
		String Examdate=request.getParameter("Examdate");
		
		if(Subcode != null)
		{
		Connection con = null;
		PreparedStatement ps = null;
		PrintWriter  out=null;
		int personID = Integer.parseInt(Subcode);
		System.out.println(personID);
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentinfo","root","root");
			  System.out.println(con);
		String sql="update timetable set Subcode=?,Day=?,Course=?,Subject=?,Semester=?,Examdate=? where Subcode="+Subcode;
		ps = con.prepareStatement(sql);
		ps.setString(1,Subcode);
		ps.setString(2, Day);
		ps.setString(3, Course);
		ps.setString(4, Subject);
		ps.setString(5, Semester);
		ps.setString(6, Examdate);
		
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
