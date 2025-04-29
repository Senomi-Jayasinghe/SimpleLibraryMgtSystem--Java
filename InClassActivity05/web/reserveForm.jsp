<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Book"%>
<%@page import="model.User"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reserve Book</title>
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
            max-width: 600px;
            margin: 2rem auto;
            background: white;
            padding: 2rem;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 128, 0.1);
        }

        h2 {
            color: #003366;
            margin-bottom: 1.5rem;
        }

        .book-info {
            margin-bottom: 2rem;
        }

        .book-info p {
            margin: 0.5rem 0;
            font-size: 1.1rem;
        }

        .reserve-btn {
            background-color: #004080;
            color: white;
            padding: 0.6rem 1.2rem;
            border: none;
            border-radius: 6px;
            font-size: 1rem;
            cursor: pointer;
        }

        .reserve-btn:disabled {
            background-color: #ccc;
            cursor: not-allowed;
        }
        
        .form-group {
            margin-bottom: 1.2rem;
            display: flex;
            flex-direction: column;
        }

        .form-group label {
            font-weight: 500;
            margin-bottom: 0.4rem;
            color: #003366;
        }

        .form-group input[type="text"] {
            padding: 0.5rem;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 1rem;
        }
    </style>
</head>
<body>
    <%
        User user = (User) session.getAttribute("user");
        if (user == null) {
            request.setAttribute("errorMessage", "ACCESS DENIED!");
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }
    %>
    <div class="navbar">
        <div>Library System</div>
        <a href="searchBook">Back to Search</a>
    </div>

    <div class="container">
        <h2>Book Reservation</h2>
        <%
            Book book = (Book) request.getAttribute("book");
            if (book != null) {
        %>
        <div class="book-info">
            <p><strong>Title:</strong> <%= book.getTitle() %></p>
            <p><strong>Author:</strong> <%= book.getAuthor() %></p>
            <p><strong>Status:</strong> <%= book.getStatus() %></p>
        </div>

        <form action="reserveBook" method="post">
            <div class="form-group">
                <label for="studentName">Your Name:</label>
                <input type="text" name="studentName" id="studentName" required />
            </div>

            <input type="hidden" name="studentId" value="<%= user.getId() %>" />
            <input type="hidden" name="bookId" value="<%= book.getId() %>" />

            <div class="form-group">
                <input type="submit" value="Reserve Book" class="reserve-btn" />
            </div>
        </form>

        <%
            } else {
        %>
        <p>Book details not found.</p>
        <%
            }
        %>
    </div>

</body>
</html>