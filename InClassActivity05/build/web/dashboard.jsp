<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: #f0f6ff;
        }

        .navbar {
            background-color: #004080;
            color: white;
            padding: 1rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            font-weight: 500;
        }

        .container {
            padding: 2rem;
            max-width: 1000px;
            margin: auto;
        }

        .welcome {
            margin-bottom: 2rem;
            font-size: 1.2rem;
            color: #003366;
        }

        .cards {
            display: flex;
            gap: 1.5rem;
            flex-wrap: wrap;
        }

        .card {
            flex: 1 1 200px;
            background: white;
            padding: 1.5rem;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 128, 0.1);
            text-align: center;
        }

        .card a {
            display: block;
            text-decoration: none;
            color: #004080;
            font-size: 1rem;
            font-weight: 600;
            transition: color 0.3s;
        }

        .card a:hover {
            color: #0059b3;
        }
    </style>
</head>
<body>
    <%
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }
    %>

    <div class="navbar">
        <div>Library Dashboard</div>
        <a href="logout">Logout</a>
    </div>

    <div class="container">
        <div class="welcome">
            Welcome, <strong><%= user.getUsername() %></strong> [<%= user.getRole() %>]
        </div>

        <div class="cards">
            <% if ("Student".equals(user.getRole())) { %>
                <div class="card">
                    <a href="searchBook">Search & Reserve Books</a>
                </div>
            <% } else if ("Admin".equals(user.getRole())) { %>
                <div class="card">
                    <a href="addBook.jsp">Add Books</a>
                </div>
                <div class="card">
                    <a href="viewReservation">View Reservations</a>
                </div>
            <% } %>
        </div>
    </div>
</body>
</html>