package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entity.Note;
import com.helper.FactoryProvider;

public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SaveNoteServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try
		{
			String title=request.getParameter("title");
			String content=request.getParameter("content");
			
			Note note=new Note(title,content,new Date());
			
			//System.out.println(note.getId()+" "+note.getTitle());
			Session session=FactoryProvider.getFactory().openSession();
			Transaction transaction=session.beginTransaction();
			session.save(note);
			transaction.commit();
			session.close();
			
			response.setContentType("text/html");
			PrintWriter pw=response.getWriter();
			pw.println("<h1 style='text-align:center;'>Note Added Successfully</h1>");
			pw.println("<h1 style='text-align:center;'><a href='all_notes.jsp'>click to view all the todos here</h1>");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
