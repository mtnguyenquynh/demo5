<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.demo5.book.Book" %>
<html>
<head>
    <title>Book List</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>

        // Function to reload the page
        function reloadPage() {
            setTimeout(function() {
                window.location.reload();
            }, 1000);
        }


        // Add event listener to form elements to detect changes
        const formElements = document.querySelectorAll('form input, form select, form textarea');
        formElements.forEach(function(element) {
            element.addEventListener('change', function() {
                formModified = true;
            });
        });


        // Add book form submit handler
        const addBookForm = document.getElementById('add-book-form');
        const submitButton = addBookForm.querySelector('button[type="submit"]');
        submitButton.addEventListener('click', function(event) {
            event.preventDefault();
            if (formModified) {
                reloadPage();
            } else {
                $.ajax({
                    type: "POST",
                    url: "bookServlet",
                    data: $(addBookForm).serialize() + "&action=add",
                    success: function () {
                        alert("Book added successfully!");
                        window.location.href = "BookList.jsp?action=view";
                    },
                    error: function () {
                        alert("Error adding book");
                    }
                });
            }
        });



        // Add event listener to update book form to reload page after book has been updated
        const updateForm = document.getElementById('update-book-form');
        updateForm.addEventListener('submit', function(event) {
            event.preventDefault();
            const formData = new FormData(updateForm);
            $.ajax({
                type: "POST",
                url: "bookServlet",
                data: formData,
                processData: false,
                contentType: false,
                success: function() {
                    alert("Book updated successfully!");
                    reloadPage();
                },
                error: function() {
                    alert("Error updating book");
                }
            });
        });

        function updateBook(event) {
            event.preventDefault();
            var formData = new FormData($("#update-form")[0]);
            $.ajax({
                type: "POST",
                url: "bookServlet",
                data: formData,
                processData: false,
                contentType: false,
                success: function() {
                    alert("Book updated successfully!");
                    window.location.href = "BookList.jsp";
                },
                error: function() {
                    alert("Error updating book");
                }
            });
        }

    </script>
</head>
<body>
<h1>Book List</h1>
<form id="search-book-form" method="post" action="bookServlet?action=search">
    <label for="filter">Filter by:</label>
    <select name="filter" id="filter">
        <option value="Book_Title">Book Title</option>
        <option value="Author_Name">Author Name</option>
        <option value="Price">Price</option>
        <option value="Type">Type</option>
    </select>
    <input type="text"
           name="value"
           id="search-value"
           placeholder="Enter search value"
    />
    <button type="submit"  id="search-button">Search</button>
</form>
<br>
<form method="get" action="addBook.jsp">
    <button type="submit">Add</button>
</form><br>
<br>
<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Title</th>
        <th>Author</th>
        <th>Publication Date</th>
        <th>Version</th>
        <th>Genre</th>
        <th>Price</th>
        <th>Type</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody id="book-table-body">
    <% ArrayList<Book> books = (ArrayList<Book>) request.getAttribute("books");
        if (books != null) {
            for (Book book : books) { %>
    <tr>
        <td><%= book.getId() %></td>
        <td><%= book.getTitle() %></td>
        <td><%= book.getAuthor() %></td>
        <td><%= book.getPublicationDate() %></td>
        <td><%= book.getVersion() %></td>
        <td><%= book.getGenre() %></td>
        <td><%= book.getPrice() %></td>
        <td><%= book.getType() %></td>
        <td>
            <form method="post" action="bookServlet">
                <input type="hidden" name="id" value="<%= book.getId() %>">
                <button type="submit" name="action" value="remove" onclick="return confirm('Are you sure you want to delete this book?')">Delete</button>
            </form>
            <form method="get" action="UpdateBook.jsp">
                <input type="hidden" name="id" value="<%= book.getId() %>">
                <button type="submit">Update</button>
            </form>
        </td>
    </tr>
    <%   }
    } %>
    </tbody>
</table>
<script>
    window.addEventListener('load', function() {
        // Check if form has already been submitted in this session
        if (!sessionStorage.getItem('formSubmitted')) {
            var form = document.createElement('form');
            form.method = 'post';
            form.action = 'bookServlet';
            var input = document.createElement('input');
            input.type = 'hidden';
            input.name = 'action';
            input.value = 'view';
            form.appendChild(input);
            document.body.appendChild(form);
            form.submit();

            // Set session variable to indicate form has been submitted
            sessionStorage.setItem('formSubmitted', 'true');
        }
    });
</script> </body> </html>
<script>


    // Add event listener to add book button
    const addBookButton = document.getElementById("add-book-button");
    addBookButton.addEventListener("click", () => {
        const popupWindow = window.open("addBook.jsp", "Add Book", "width=500,height=500");

        // Add event listener to form submit button
        const submitButton = popupWindow.document.getElementById("submit-book-button");
        submitButton.addEventListener("click", async (event) => {
            event.preventDefault();

            // Get form data
            const form = popupWindow.document.getElementById("add-book-form");
            const formData = new FormData(form);

            try {
                // Send asynchronous request to add new book
                const response = await fetch("bookServlet", {
                    method: "POST",
                    body: formData,
                });

                if (response.ok) {
                    // Display success message, close popup window, and redirect to BookList.jsp with view action
                    alert("New book added successfully.");
                    popupWindow.close();
                    const url = "BookList.jsp?action=view";
                    window.location.href = url + "&" + encodeURIComponent(formData.toString());
                } else {
                    throw new Error("Failed to add new book.");
                }
            } catch (error) {
                console.error(error);
                alert(error.message);
            }
        });
    });

</script>

<script>
    // Get all the "Update" buttons
    const updateButtons = document.querySelectorAll('button[value="update"]');

    // Add an event listener to each button
    updateButtons.forEach(button => {
        button.addEventListener('click', event => {
            // Get the current row
            const row = event.target.closest('tr');

            // Get the current value of the column that we want to edit
            const cell = row.querySelector('.edit-column');
            if (cell) {
                const currentValue = cell.textContent.trim();

                // Replace the text with an input element
                const input = document.createElement('input');
                input.type = 'text';
                input.value = currentValue;
                cell.textContent = '';
                cell.appendChild(input);

                // Focus the input element
                input.focus();

                // Change the button text to "Save"
                button.textContent = 'Save';

                // Add an event listener to the button
                button.addEventListener('click', () => {
                    // Get the new value
                    const newValue = input.value.trim();

                    // Send an AJAX request to the server to update the value in the database
                    const xhr = new XMLHttpRequest();
                    xhr.open('POST', 'updateBook', true);
                    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                    xhr.onreadystatechange = () => {
                        if (xhr.readyState === 4 && xhr.status === 200) {
                            // Update the table cell with the new value
                            cell.textContent = newValue;

                            // Change the button text back to "Update"
                            button.textContent = 'Update';

                            // Remove the event listener from the button
                            button.removeEventListener('click', null);
                        }
                    };
                    xhr.send(`id=${row.getAttribute('data-id')}&column=${cell.getAttribute('data-column')}&value=${encodeURIComponent(newValue)}`);
                });
            }
        });
    });
</script>

