<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.Book"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Book</title>
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

        .search-bar {
            margin-bottom: 1.5rem;
            display: flex;
            gap: 1rem;
        }

        input[type="text"] {
            padding: 0.5rem;
            border-radius: 6px;
            border: 1px solid #ccc;
            flex: 1;
        }

        input[type="submit"] {
            padding: 0.5rem 1rem;
            border: none;
            background-color: #004080;
            color: white;
            border-radius: 6px;
            cursor: pointer;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 128, 0.1);
        }

        th, td {
            padding: 1rem;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #e6f0ff;
            color: #003366;
        }

        form.reserve-form {
            margin: 0;
        }

        .reserve-btn {
            background-color: #004080;
            color: white;
            padding: 0.4rem 0.8rem;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }
    </style>
</head>
<body>

    <div class="navbar">
        <div>Library System</div>
        <a href="logout">Logout</a>
    </div>

    <div class="container">
        <form action="searchBook" method="post" class="search-bar">
            <input type="text" name="title" placeholder="Search books by title" />
            <input type="submit" value="Search" />
        </form>

        <table>
            <tr>
                <th>Book ID</th>
                <th>Title</th>
                <th>Author</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
            <%
                List<Book> books = (List<Book>) request.getAttribute("bookList");
                if (books != null && !books.isEmpty()) {
                    for (Book b : books) {
            %>
            <tr>
                <td><%= b.getId() %></td>
                <td><%= b.getTitle() %></td>
                <td><%= b.getAuthor() %></td>
                <td><%= b.getStatus() %></td>
                <td>
                    <% if (!"Reserved".equals(b.getStatus())) { %>
                        <form action="reserveBook" method="get" class="reserve-form">
                            <input type="hidden" name="bookId" value="<%= b.getId() %>" />
                            <input type="submit" value="Reserve" class="reserve-btn"/>
                        </form>
                    <% } else { %>
                        <span style="color: gray;">Already Reserved</span>
                    <% } %>
                </td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="4">No books found.</td>
            </tr>
            <%
                }
            %>
        </table>
    </div>
</body>
</html>