<%-- 
    Document   : update-car
    Created on : Jun 8, 2025, 2:36:14 PM
    Author     : Le Thanh Trong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page isELIgnored ="false" %>
<%@ page import="models.dto.CarDTO" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Car</title>
        
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

        input[type=number]::-webkit-inner-spin-button,
        input[type=number]::-webkit-outer-spin-button {
                -webkit-appearance: auto;
                margin: 0;
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
        
        <!-- Car Update -->
        <div class="car-update">
            <div class="container mt-5">
                <div class="card shadow-sm" style="border: none;">
                    <div class="card-header" style="background: #fff;">
                        <h2>Update Car</h2>
                    </div>
                    <%
                        CarDTO car = (CarDTO) request.getAttribute("carDetail");
                    %>
                    <form action="update-car" method="post" class="card-body">
                        <div class="form-group">
                            <label for="carID">CarId</label>
                            <input type="text" class="form-control" id="carID" name="txtCarID" value="<%= car.getCarID() %>" readonly />
                        </div>
                        <div class="form-group">
                            <label for="carName">CarName</label>
                            <input type="text" class="form-control" id="carName" name="txtCarName" value="<%= car.getCarName() %>" required />
                        </div>
                        <div class="form-group">
                            <label for="manufacturer">Manufacturer</label>
                            <input type="text" class="form-control" id="manufacturer" name="txtManufacturer" value="<%= car.getManufacturer() %>" required />
                        </div>
                        <div class="form-group">
                            <label for="price">Price</label>
                            <input type="number" step="0.01" class="form-control" id="price" name="txtPrice" value="<%= car.getPrice() %>" required />
                        </div>
                        <div class="form-group">
                            <label for="releasedYear">ReleasedYear</label>
                            <input type="number" class="form-control" id="releasedYear" name="txtReleasedYear" value="<%= car.getReleasedYear() %>" required />
                        </div>
                        <button type="submit" class="btn btn-primary">Save</button>
                    </form>
                </div>
            </div>
        </div>

        
        
        <script src="js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <script src="js/jquery.slim.min.js" type="text/javascript"></script>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>    
    </body>
</html>
