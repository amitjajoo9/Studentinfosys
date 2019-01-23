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
 * Servlet implementation class examupdateservlet
 */
@WebServlet("/examupdateservlet")
public class examupdateservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String Studentid = request.getParameter("Studentid");
		String Studentname=request.getParameter("Studentname");
		String Examyear=request.getParameter("Examyear");
		String Course=request.getParameter("Course");
		String Semester=request.getParameter("Semester");
		String Examtype=request.getParameter("Examtype");
		String Subject=request.getParameter("Subject");
		
		
		if(Studentid != null)
		{
		Connection con = null;
		PreparedStatement ps = null;
		PrintWriter  out=null;
		int personID = Integer.parseInt(Studentid);
		System.out.println(personID);
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentinfo","root","root");
			  System.out.println(con);
		String sql="update examrecord set Studentname=?,Examyear=?,Course=?,Semester=?,Examtype=?,Subject=? where Studentid="+Studentid;
		ps = con.prepareStatement(sql);
		ps.setString(1,Studentname);
		ps.setString(2,Examyear);
		ps.setString(3,Course);
		ps.setString(4,Semester);
		ps.setString(5,Examtype);
		ps.setString(6,Subject);
		
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
