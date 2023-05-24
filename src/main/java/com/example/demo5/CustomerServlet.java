package com.example.demo5;

import com.example.demo5.connection.ConnectionDB;
import com.example.demo5.customer.CustomarDAO;
import com.example.demo5.customer.Customer;
import enumClass.CustomerColumn;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = {"/customerServlet"})
public class CustomerServlet extends  HttpServlet{


        private CustomarDAO customarDAO;

        public void init() {
            ConnectionDB connectionDB = new ConnectionDB();
            customarDAO = new CustomarDAO(connectionDB);
        }

        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String action = request.getParameter("action");

            if (action == null) {
                response.sendRedirect(request.getContextPath() + "/BookList.jsp");
                return;
            }

            switch (action) {
                case "add":
                    try {
                        addCustomer(request, response);
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }
                    break;

                case "view":
                    viewAllCustomers(request, response);
                    break;

                case "search":
                    searchCustomer(request, response);
                    break;
                case "remove":
                    removeCustomer(request,response);
                    break;

                default:
                    response.sendRedirect(request.getContextPath() + "/CustomerList1.jsp");
                    break;
            }
        }

    private void addCustomer(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, SQLException {
            String id = request.getParameter("id");
            String password = request.getParameter("password");
            String firstName = request.getParameter("fname");
            String dobString = request.getParameter("dob");
            String lastName = request.getParameter("lname");
           double amount = Double.parseDouble(request.getParameter("amount"));

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date dob = null;

            try {
                dob = sdf.parse(dobString);
            } catch (ParseException e) {
                e.printStackTrace();
            }

            Customer customer = new Customer(id, password, firstName, lastName, dob, amount);

            try {
                customarDAO.addCustomer(customer);
                request.setAttribute("customerAdded", true); // set the success message attribute
            } catch (SQLException e) {
                e.printStackTrace();
            }

            List<Customer> customers = customarDAO.listAllCustomers();
            request.setAttribute("customers", customers); // add the list of books to the request
            request.getRequestDispatcher("/CustomerLogin.jsp").forward(request, response);    }

    private void removeCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");


        try {
            customarDAO.deleteCustomer(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        List<Customer> customers = new ArrayList<>();

        try {
            customers = customarDAO.listAllCustomers();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("customers", customers);
        request.getRequestDispatcher("/CustomerList1.jsp").forward(request, response);

    }

        private void viewAllCustomers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            List<Customer> customers = null;

            try {
                customers = customarDAO.listAllCustomers();
            } catch (SQLException e) {
                e.printStackTrace();
            }

            // Set the list of books as a request attribute
            request.setAttribute("customers", customers);

            // Forward the request to the BookList.jsp page
            RequestDispatcher dispatcher = request.getRequestDispatcher("CustomerList1.jsp");
            dispatcher.forward(request, response);
        }

    private void searchCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String filterParam = request.getParameter("filter");
        String value = request.getParameter("value");

        // Map the filter parameter to a column name using an enum
        CustomerColumn filter = CustomerColumn.valueOf(filterParam.toUpperCase());

        ArrayList<Customer> customers = new ArrayList<>();

        customers = customarDAO.searchCustomer(filter, value);

        request.setAttribute("customers", customers);
        request.getRequestDispatcher("/CustomerList1.jsp").forward(request, response);
        System.out.println("Filter: " + filterParam);
        System.out.println("Value: " + value);
        if (customers == null || customers.isEmpty()) {
            System.out.println("No customers found");
        } else {
            System.out.println("Found " + customers.size() + " customers");
        }
        }

    }

