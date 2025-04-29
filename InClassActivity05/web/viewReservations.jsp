<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reservations</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
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
            margin: 0 1rem;
        }

        .navbar a:hover {
            text-decoration: underline;
        }

        .container {
            padding: 2rem;
            max-width: 1000px;
            margin: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
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
        <h2>Book Reservations</h2>
        <table>
            <thead>
                <tr>
                    <th>Student ID</th>
                    <th>Student Name</th>
                    <th>Book ID</th>
                    <th>Reservation Date</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Reservation> reservations = (List<Reservation>) request.getAttribute("reservationList");
                    if (reservations != null && !reservations.isEmpty()) {
                        for (Reservation r : reservations) {
                %>
                <tr>
                    <td><%= r.getStudentId() %></td>
                    <td><%= r.getStudentName() %></td>
                    <td><%= r.getBookId() %></td>
                    <td><%= r.getReservationDate() %></td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="4">No reservations found.</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>

</body>
</html>
