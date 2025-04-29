<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Book</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            background-color: #f0f6ff;
        }

        .navbar {
            background-color: #004080;
            padding: 1rem 2rem;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar .nav-links a {
            color: white;
            margin-left: 1.5rem;
            text-decoration: none;
            font-weight: 500;
        }

        .navbar .nav-links a:hover {
            text-decoration: underline;
        }

        .form-container {
            background: white;
            padding: 2rem 3rem;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 64, 128, 0.1);
            width: 100%;
            max-width: 400px;
            margin: 4rem auto;
        }

        h2 {
            color: #004080;
            margin-bottom: 1.5rem;
            text-align: center;
        }

        label {
            display: block;
            margin-bottom: 0.5rem;
            color: #003366;
        }

        input[type="text"] {
            width: 100%;
            padding: 0.5rem;
            margin-bottom: 1.5rem;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        input[type="submit"] {
            background-color: #004080;
            color: white;
            padding: 0.6rem 1.2rem;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            width: 100%;
            font-weight: bold;
        }

        input[type="submit"]:hover {
            background-color: #0059b3;
        }
    </style>
</head>
<body>
    <%
        User user = (User) session.getAttribute("user");
        if (user == null || !"Admin".equals(user.getRole())) {
            request.setAttribute("errorMessage", "ACCESS DENIED!");
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }
    %>

    <div class="navbar">
        <div><strong>Library Admin</strong></div>
        <div class="nav-links">
            <a href="addBook.jsp">Add Books</a>
            <a href="viewReservation">View Reservations</a>
            <a href="logout">Logout</a>
        </div>
    </div>

    <div class="form-container">
        <h2>Add a New Book</h2>
        <form action="addBook" method="post">
            <label for="title">Title:</label>
            <input type="text" name="title" id="title" required />

            <label for="author">Author:</label>
            <input type="text" name="author" id="author" required />

            <input type="submit" value="Add Book" />
        </form>
    </div>
</body>
</html>