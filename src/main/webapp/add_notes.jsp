<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Notes</title>
<%@include file="js/all_css_js.jsp"%>
</head>
<body>
	<div class="container-fluid">
		<%@include file="Navbar.jsp"%>
		<br>
		<h1>Add Notes</h1>

		<!-- This is form  -->

		<form action="SaveNoteServlet" method="post">
			<div class="form-group">
				<label for="title">Note Title</label> <input name="title" required type="title"
					class="form-control" id="title"
					aria-describedby="emailHelp" placeholder="Add Notes"> 
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">Note Content</label>
				<textarea name="content" required id="content" placeholder="Add Content"class="form-control" 
				style="height:300px"></textarea>
				
			</div>
			<div class="container text-center">
			<button type="submit" class="btn btn-primary">Add</button>
			</div>
		</form>

	</div>
</body>
</html>
