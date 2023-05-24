<%@ page contentType="text/html;charset=UTF-8" %>

<html
        lang="en"
>
<head>
    <meta charset="utf-8" />


    <title>Admin Dashboard</title>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
            rel="stylesheet"
    />

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="assets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

    <link rel="stylesheet" href="assets/vendor/libs/apex-charts/apex-charts.css" />

    <!-- Page CSS -->

    <!-- Helpers -->
    <script src="assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="assets/js/config.js"></script>
</head>

<body>

<!-- Layout wrapper -->
<div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">
        <!-- Menu -->

        <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
            <div class="app-brand demo">
                <a href="CustomerManagePage.jsp" class="app-brand-link">
                    <span class="app-brand-text demo menu-text fw-bolder ms-2">My Bookstore</span>
                </a>


            </div>


            <ul class="menu-inner py-1">
                <!-- Dashboard -->
                <li class="menu-item active">
                    <a href="CustomerManagePage.jsp" class="menu-link">
                        <div>💼  Dashboard</div>
                    </a>
                </li>


                <!-- Layouts -->

                <li class="menu-header small text-uppercase">
                    <span class="menu-header-text">Pages</span>
                </li>

                <li class="menu-item">
                    <a  href="#" class="menu-link">
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
        <div class="layout-page">
            <!-- Navbar -->

            <nav
                    class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
                    id="layout-navbar"
            >
                <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
                    <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
                        🟣
                    </a>
                </div>

                <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">


                </div>
            </nav>

            <!-- / Navbar -->

            <!-- Content wrapper -->
            <div class="content-wrapper">
                <!-- Content -->

                <div class="container-xxl flex-grow-1 container-p-y">
                    <div class="row">
                        <div class="col-lg-8 mb-4 order-0">
                            <div class="card">
                                <div class="d-flex align-items-end row">
                                    <div class="col-sm-7">
                                        <div class="card-body">
                                            <h5 class="card-title text-primary">Good morning [customer name]! 🎉</h5>
                                            <p class="mb-4">
                                                Discover your favourite now 🤗
                                            </p>

                                        </div>
                                    </div>
                                    <div class="col-sm-5 text-center text-sm-left">
                                        <div class="card-body pb-0 px-0 px-md-4">
                                            <img
                                                    src="assets/img/illustrations/man-with-laptop-light.png"
                                                    height="340"
                                            />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>



                        <div class="col-12 col-md-8 col-lg-4 order-3 order-md-2">
                            <div class="row">
                                <div class="col-6 mb-4">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="card-title d-flex align-items-start justify-content-between">
                                                <div class="avatar flex-shrink-0">
                                                    <img src="assets/img/icons/unicons/paypal.png" alt="Credit Card" class="rounded" />
                                                </div>
                                                <div class="dropdown">
                                                    <button
                                                            class="btn p-0"
                                                            type="button"
                                                            id="cardOpt4"
                                                            data-bs-toggle="dropdown"
                                                            aria-haspopup="true"
                                                            aria-expanded="false"
                                                    >
                                                        <i class="bx bx-dots-vertical-rounded"></i>
                                                    </button>
                                                    <div class="dropdown-menu dropdown-menu-end" aria-labelledby="cardOpt4">
                                                        <a class="dropdown-item" href="javascript:void(0);">View More</a>
                                                        <a class="dropdown-item" href="javascript:void(0);">Delete</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <span class="d-block mb-1">Number of books</span>
                                            <h3 id="totalCustomer" class="card-title text-nowrap mb-2"></h3>

                                        </div>
                                    </div>
                                </div>



                                <!-- </div>
                <div class="row"> -->
                            </div>
                        </div>



                    </div>

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



<!-- Core JS -->
<!-- build:js assets/vendor/js/core.js -->
<script src="assets/vendor/libs/jquery/jquery.js"></script>
<script src="assets/vendor/libs/popper/popper.js"></script>
<script src="assets/vendor/js/bootstrap.js"></script>
<script src="assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

<script src="assets/vendor/js/menu.js"></script>
<!-- endbuild -->

<!-- Vendors JS -->
<script src="assets/vendor/libs/apex-charts/apexcharts.js"></script>

<!-- Main JS -->
<script src="assets/js/main.js"></script>

<!-- Page JS -->
<script src="assets/js/dashboards-analytics.js"></script>

<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>

<!-- Add the script right before the closing </body> tag -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function() {
        // First AJAX call
        $.ajax({
            type: 'POST',
            url: 'bookServlet1',
            data: { action: 'countTotalCustomer' },
            success: function(data) {
                $('#totalCustomer').html(data); // Update the element with the received value
            },
            error: function() {
                console.log('Error fetching total customer count.');
            }
        });

    });
</script>
</body>
</html>
