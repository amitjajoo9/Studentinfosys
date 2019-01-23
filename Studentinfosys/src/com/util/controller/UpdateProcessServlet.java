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
 * Servlet implementation class UpdateProcessServlet
 */
@WebServlet("/UpdateProcessServlet")
public class UpdateProcessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String Facultyid = request.getParameter("Facultyid");
		String Facultyname=request.getParameter("Facultyname");
		String Qualification=request.getParameter("Qualification");
		String Experience=request.getParameter("Experience");
		String Subject=request.getParameter("Subject");
		String Lastwork=request.getParameter("Lastwork");
		String Department=request.getParameter("Department");
		String Email=request.getParameter("Email");
		String Mobileno=request.getParameter("Mobileno");
		String Address=request.getParameter("Aaddress");
		String State=request.getParameter("State");
		String City=request.getParameter("City");
		
		if(Facultyid != null)
		{
		Connection con = null;
		PreparedStatement ps = null;
		PrintWriter  out=null;
		int personID = Integer.parseInt(Facultyid);
		System.out.println(personID);
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentinfo","root","root");
			  System.out.println(con);
		String sql="update facultydetail set Facultyid=?,Facultyname=?,Qualification=?,Experience=?,Subject=?,Lastwork=?,Department=?,Email=?,Mobileno=?,Address=?,State=?,City=? where Facultyid="+personID;
		ps = con.prepareStatement(sql);
		ps.setString(1,Facultyid);
		ps.setString(2, Facultyname);
		ps.setString(3, Qualification);
		ps.setString(4, Experience);
		ps.setString(5, Subject);
		ps.setString(6, Lastwork);
		ps.setString(7, Department);
		ps.setString(8, Email);
		ps.setString(9, Mobileno);
		ps.setString(10,Address);
		ps.setString(11, State);
		ps.setString(12,City);
		
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
