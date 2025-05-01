<%@ page import="java.sql.*, dao.BookDAO, model.Book" %>
<%
    String q = request.getParameter("q");
li
    List<Book> books = new ArrayList<>();
    if (q != null && !q.isEmpty()) {
        books.add(new Book("Test Book 1", "Test Author"));
        books.add(new Book("Test Book 2", "Test Author"));
    }

    for (Book book : books) {
%>
    <p><%= book.getTitle() %> - <%= book.getAuthor() %></p>
<%
    }
%>
