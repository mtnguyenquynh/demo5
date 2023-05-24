<%@ page import="com.example.demo5.book.TransactionStats" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: WIN 10
  Date: 5/17/2023
  Time: 8:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
            input.value = 'statistics';
            form.appendChild(input);
            document.body.appendChild(form);
            form.submit();

            // Set session variable to indicate form has been submitted
            sessionStorage.setItem('formSubmitted', 'true');
        }
    });
</script>

<% if (request.getAttribute("transactionStats") != null) { %>
<h2>Transaction Statistics</h2>
<table >
    <tr>
        <th>Customer ID</th>
        <th>Number of Books Purchased</th>
    </tr>
    <% for (TransactionStats stats : (List<TransactionStats>)request.getAttribute("transactionStats")) { %>
    <tr>
        <td><%= stats.getCustomerId() %></td>
        <td><%= stats.getNumBooksPurchased() %></td>
    </tr>
    <% } %>
</table>
<% } %>

</body>
</html>
