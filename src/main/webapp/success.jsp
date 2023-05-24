<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Success</title>
</head>
<body>
<h1>Success! Please choose the books you want to order:</h1>
<form action="saveOrder" method="POST">
  <table>
    <tr>
      <th>Select</th>
      <th>ID</th>
      <th>Title</th>
      <th>Author</th>
      <th>Publication Date</th>
      <th>Version</th>
      <th>Genre</th>
      <th>Price</th>
      <th>Type</th>
    </tr>
    <%@ page import="java.util.List" %>
    <%@ page import="com.example.demo5.book.Book" %>
    <%
      List<Book> books = (List<Book>) request.getAttribute("books");
      for (Book book : books) {
    %>
    <tr>
      <td><input type="checkbox" name="bookIDs" value="<%= book.getId() %>" /></td>
      <td><%= book.getId() %></td>
      <td><%= book.getBookTitle() %></td>
      <td><%= book.getAuthorName() %></td>
      <td><%= book.getPublicationDate() %></td>
      <td><%= book.getVersion() %></td>
      <td><%= book.getGenre() %></td>
      <td><%= book.getPrice() %></td>
      <td><%= book.getType() %></td>
    </tr>
    <% } %>
  </table>
  <input type="hidden" name="customerId" value="<%= request.getParameter("customerId") %>" />
  <input type="submit" value="Submit Order" />
</form>
</body>
</html>
