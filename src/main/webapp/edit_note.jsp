<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.entity.Note"%>
<%@page import="org.hibernate.Session"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Notes</title>
<%@include file="js/all_css_js.jsp"%>
</head>
<body>

	<div class="container-fluid">
		<%@include file="Navbar.jsp"%>
		<h1>Edit Notes</h1>

		<%
		int noteId = Integer.parseInt(request.getParameter("note_id").trim());
		Session s = FactoryProvider.getFactory().openSession();
		Note note = (Note) s.get(Note.class, noteId);
		%>

		<form action="UpdateServlet" method="post">
			<input value="<%=note.getId()%>" name="note_id" type="hidden"/>
			<div class="form-group">
				<label for="title">Note Title</label> <input name="title" required
					type="title" class="form-control" id="title"
					aria-describedby="emailHelp" placeholder="Add Notes"
					value="<%=note.getTitle()%>" />
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">Note Content</label>
				<textarea name="content" required id="content"
					placeholder="Add Content" class="form-control"
					style="height: 300px"><%=note.getContent()%></textarea>

			</div>
			<div class="container text-center">
				<button type="submit" class="btn btn-success">Save changes</button>
			</div>
		</form>
</body>
</html>