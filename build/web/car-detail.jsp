<%-- 
    Document   : car-detail.jsp
    Created on : Jun 8, 2025, 1:57:32 PM
    Author     : Le Thanh Trong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page isELIgnored ="false" %>
<%@ page import="models.dto.CarDTO" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Car Detail</title>

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

    <!-- Car Detail -->
    <div class="car-detail">
        <div class="container mt-5">
            <div class="card shadow-sm" style="border: none;">
                <div class="card-header" style="background: #fff;">
                    <h5 class="mb-10" style="font-size: 25px;">Car Details</h5>
                    <span style="font-size: 18px; font-weight: bold;">Car</span>
                </div>
                <%
                    CarDTO car = (CarDTO)request.getAttribute("carDetail");
                    
                %>
                <div class="card-body">
                    <div class="row mb-2">
                        <div class="col-sm-3"><strong>CarId</strong></div>
                        <div class="col-sm-9"><%= car.getCarID() %></div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-sm-3"><strong>CarName</strong></div>
                        <div class="col-sm-9"><%= car.getCarName() %></div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-sm-3"><strong>Manufacturer</strong></div>
                        <div class="col-sm-9"><%= car.getManufacturer() %></div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-sm-3"><strong>Price</strong></div>
                        <div class="col-sm-9"><%= car.getPrice() %></div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-sm-3"><strong>ReleasedYear</strong></div>
                        <div class="col-sm-9"><%= car.getReleasedYear() %></div>
                    </div>
                </div>
                <div class="card-footer" style="background: #fff; padding-left: 5px;">
                    <a href="#" class="col-sm-1">Edit</a> |
                    <a href="./home" class="col-sm-1">Back to List</a>
                </div>
            </div>
        </div>
    </div>
    <!-- End Car Detail -->



    <script src="js/bootstrap.bundle.min.js" type="text/javascript"></script>
    <script src="js/jquery.slim.min.js" type="text/javascript"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>    
   
</body>

</html>