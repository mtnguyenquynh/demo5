<%@ page import="com.example.demo5.book.Book" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>View Order</title>
    <script>
        window.addEventListener('load', function() {
            // Check if form has already been submitted in this session
            if (!sessionStorage.getItem('formSubmitted')) {
                var form = document.createElement('form');
                form.method = 'get';
                form.action = 'orderServlet';
                var input = document.createElement('input');
                input.type = 'hidden';
                input.name = 'action';
                input.value = 'view';
                form.appendChild(input);
                document.body.appendChild(form);
                form.submit();

                // Set session variable to indicate form has been submitted
                sessionStorage.setItem('formSubmitted', 'false');
            }
        });
    </script>
    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />

    <link href="assets/css/main.css" rel="stylesheet" />


    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="assets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

    <!-- Page CSS -->

    <!-- Helpers -->
    <script src="assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="assets/js/config.js"></script>
</head>

<body>
<div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">
        <!-- Menu -->

        <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
            <div class="app-brand demo">
                <a href="CustomerManagePage.jsp" class="app-brand-link">
                    <span class="app-brand-text demo menu-text fw-bolder ms-2">My Bookstore</span>
                </a>

            </div>

            <!-- Layouts -->
            <ul class="menu-inner py-1">

                <li class="menu-item active">
                    <a href="CustomerManagePage.jsp" class="menu-link">
                        <div>💼 Dashboard</div>
                    </a>
                </li>


                <li class="menu-header small text-uppercase">
                    <span class="menu-header-text">Pages</span>
                </li>

                <li class="menu-item">
                    <a href="#" class="menu-link">
                        <div>👨‍💼 Account Settings</div>
                    </a>

                </li>

                <!-- Components -->
                <li class="menu-header small text-uppercase"><span class="menu-header-text">LIBRARY</span></li>

                <li class="menu-item">
                    <a href="viewOrder.jsp" class="menu-link ">
                        <div>📕 Your Book</div>
                    </a>

                </li>

                <!-- Forms & Tables -->
                <li class="menu-header small text-uppercase"><span class="menu-header-text">BOOK STORE</span></li>
                <!-- Tables -->
                <li class="menu-item">
                    <a href="customerBookList.jsp" class="menu-link">
                        <div>📚 Library</div>
                    </a>
                </li>
            </ul>
        </aside>
        <!-- / Menu -->

        <!-- Layout container -->
        <div class="layout-page s003">
            <!-- Navbar -->

            <nav
                    class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme d-flex justify-content-center"
                    id="layout-navbar"
            >
                <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
                    <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
                        🟣
                    </a>
                </div>


                <script src="assets/js/extention/choices.js"></script>
                <script>
                    const choices = new Choices('[data-trigger]',
                        {
                            searchEnabled: false,
                            itemSelectText: '',
                        });

                </script>


            </nav>

            <!-- Content wrapper -->
            <div class="content-wrapper">
                <!-- Content -->

                <div class="container-xxl flex-grow-1 container-p-y">
                    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Your Order / </span>Total Books </h4>
                    <!-- Basic Bootstrap Table -->
                    <div class="card">
                        <div class="table-responsive text-nowrap">
                            <table class="table">
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
    </tr>
    </thead>
    <tbody>
    <% List<Book> books = (List<Book>) request.getAttribute("booksInOrder");
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
    </tr>
    <%  }
        } %>
    </tbody>
</table>

                        </div>
                    </div>







                    <hr class="my-5" />











                </div>
                <!-- / Content -->



                <div class="content-backdrop fade"></div>
            </div>
            <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
    </div>

    <!-- Overlay -->
    <div class="layout-overlay layout-menu-toggle"></div>
</div>
<!-- / Layout wrapper -->
<!-- build:js assets/vendor/js/core.js -->
<script src="assets/vendor/libs/jquery/jquery.js"></script>
<script src="assets/vendor/libs/popper/popper.js"></script>
<script src="assets/vendor/js/bootstrap.js"></script>
<script src="assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

<script src="assets/vendor/js/menu.js"></script>
<!-- endbuild -->

<!-- Vendors JS -->

<!-- Main JS -->
<script src="assets/js/main.js"></script></body>
</html>

