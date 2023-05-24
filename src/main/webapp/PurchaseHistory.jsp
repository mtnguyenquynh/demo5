<%@ page import="com.example.demo5.book.BookOrderHistory" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
  <meta charset="UTF-8">
  <title>Purchase History</title>
</head>
<body>


<script>
  window.addEventListener('load', function() {
    // Check if form has already been submitted in this session
    if (!sessionStorage.getItem('formSubmitted')) {
      var form = document.createElement('form');
      form.method = 'post';
      form.action = 'bookServlet1';
      var input = document.createElement('input');
      input.type = 'hidden';
      input.name = 'action';
      input.value = 'history';
      form.appendChild(input);
      document.body.appendChild(form);
      form.submit();

      // Set session variable to indicate form has been submitted
      sessionStorage.setItem('formSubmitted', 'true');
    }
  });
</script>

<h1>Purchase History</h1>

<% if (request.getAttribute("purchaseHistory") != null) { %>
<table >
  <tr>
    <th>Customer ID</th>
    <th>Book ID</th>
    <th>Transaction Date</th>
  </tr>
  <% for (BookOrderHistory purchase : (List<BookOrderHistory>)request.getAttribute("purchaseHistory")) { %>
  <tr>
    <td><%= purchase.getCustomerId() %></td>
    <td><%= purchase.getBookId() %></td>
    <td><%= purchase.getTransactionDate() %></td>
  </tr>
  <% } %>
</table>
<% } %>

</body>
</html>