<%-- 
    Document   : car-detail.jsp
    Created on : Jun 8, 2025, 1:57:32 PM
    Author     : Le Thanh Trong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page isELIgnored ="false" %>
<%@ page import="java.util.List" %>
<%@ page import="models.dto.CarDTO" %>
<%@ page import="models.dao.CarDAO" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    
    <link href="css/base.css" rel="stylesheet" type="text/css"/>
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    
</head>

<body>
    
    <style>
        *{
            box-sizing: border-box;
        }

        body{
            margin: 0;
            background: #f8f9fa;
        }
    </style>
    
    <!-- Header -->
    <header class="header" style="background: #fff; border-bottom: 1px solid #dee2e6; box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);">
        <div class="container-fluid">
            <div class="inner-wrap" style="padding: 8px;">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <a class="navbar-brand" href="./home" style="font-size: 25px;">AutomobileWebApp</a>
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


    <!-- Section One -->
    <div class="section-one bg-light" style="padding: 8px 50px;">
        <div class="container-fluid">
            <div class="inner-wrap">
                <div class="row">
                    <h1 class="inner-title" style="margin-top: 20px; margin-bottom: 20px;">Car List</h1>
                </div>
                <div class="row">
                    <a class="btn-create" href="./create-new" style="font-size: 18px; font-weight: 300; margin-bottom: 20px;">Create New</a>
                </div>
            </div>
        </div>
    </div>
    <!-- End Section One -->


    <!-- Section Two -->
    <div class="section-two bg-light" style="padding: 8px 50px;">
        <div class="container-fluid">
            <div class="inner-wrap">
                
                <!<!-- Warning -->                   
                <%
                    String msg = request.getParameter("message");
                    String alertType = request.getParameter("type");

                    if (msg == null || alertType == null) {
                        msg = (String) request.getAttribute("message");
                        alertType = (String) request.getAttribute("type");
                    }

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
                                
                                <form action="<%= request.getContextPath() %>/update-car" method="get" style="display:inline;">
                                    <input type="hidden" name="id" value="<%= item.getCarID() %>" />
                                    <button type="submit" class="btn btn-link p-0 m-0 align-baseline">Edit</button>
                                </form>
                                |
                                <form action="<%= request.getContextPath() %>/car-detail" method="post" style="display:inline;">
                                    <input type="hidden" name="id" value="<%= item.getCarID() %>" />
                                    <button type="submit" class="btn btn-link p-0 m-0 align-baseline">Details</button>
                                </form>
                                |
                                <form action="<%= request.getContextPath() %>/delete" method="post" style="display:inline;">
                                    <input type="hidden" name="id" value="<%= item.getCarID() %>" />
                                    <button type="submit" class="btn btn-link p-0 m-0 align-baseline">Delete</button>
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
    
    
    <script src="js/bootstrap.bundle.min.js" type="text/javascript"></script>
    <script src="js/jquery.slim.min.js" type="text/javascript"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>    
</body>

</html>
