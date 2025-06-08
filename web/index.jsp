<%-- 
    Document   : index
    Created on : Jun 3, 2025, 11:46:33 PM
    Author     : admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page isELIgnored ="false" %>
<%@ page import="java.util.List" %>
<%@ page import="models.dto.CarDTO" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <link href="css/base.css" rel="stylesheet" type="text/css"/>
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
</head>

<body>
    <!-- Header -->
    <header class="header">
        <div class="container-fluid">
            <div class="inner-wrap">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <a class="navbar-brand" href="./home">AutomobileWebApp</a>
                    <div class="collapse navbar-collapse">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link" href="./home">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Privacy</a>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
    </header>
    <!-- End Header -->

    <!-- Seciton One -->
    <div class="section-one bg-light">
        <div class="container-fluid">
            <div class="inner-wrap">
                <div class="row">
                    <h1 class="inner-title">Car List</h1>
                </div>
                <div class="row">
                    <a class="btn-create" href="./create-new">Create New</a>
                </div>
            </div>
        </div>
    </div>
    <!-- End Section One -->

    <!-- Section Two -->
    <div class="section-two bg-light">
        <div class="container-fluid">
            <div class="inner-wrap">
                <%
                    String msg = (String) request.getAttribute("message");
                    String alertType = (String) request.getAttribute("alertType");
                    if (msg != null && alertType != null) {
                %>
                <div class="alert alert-<%= alertType %> alert-dismissible fade show text-center" role="alert">
                    <%= msg %>
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <%
                    }
                %>
                <table class="table">
                    <thead>
                        <tr>
                            <th>CardId</th>
                            <th>CarName</th>
                            <th>Manufacturer</th>
                            <th>Price</th>
                            <th>ReleasedYear</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            int count = 1;
                            List<CarDTO> listCar = (List<CarDTO>) request.getAttribute("listCar");
                            if (listCar != null) {
                            for (CarDTO item : listCar) {
                        %>
                        <tr>
                            <td><%= count++ %></td>
                            <td><%= item.getCarName() %></td>
                            <td><%= item.getManufacturer() %></td>
                            <td><%= item.getPrice() %></td>
                            <td><%= item.getReleasedYear() %></td>
                            <td>
                                <a href="#">Edit | </a>
                                <form action="<%= request.getContextPath() %>/car-detail" method="post" style="display:inline;">
                                    <input type="hidden" name="id" value="<%= item.getCarID() %>" />
                                    <button type="submit" class="btn btn-link p-0 m-0 align-baseline">Details</button>
                                </form>
                                |
                                <form action="<%= request.getContextPath() %>/delete" method="post" style="display:inline;">
                                    <input type="hidden" name="id" value="<%= item.getCarID() %>" />
                                    <button type="submit" class="btn btn-link text-danger p-0 m-0 align-baseline">Delete</button>
                                </form>
                               
                            </td>
                        </tr>
                        <%
                                }
                            }
                        %>

                        
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <!-- End Section Two -->
    
    <script src="js/jquery.slim.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.bundle.min.js" type="text/javascript"></script>
    
</body>

</html>
