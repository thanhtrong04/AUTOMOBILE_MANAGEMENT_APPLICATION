<%-- 
    Document   : create-car
    Created on : Jun 4, 2025, 1:57:11 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page isELIgnored ="false" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Car</title>

    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
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

    <!-- Create Car -->
    <div class="section-three">
        <div class="container">
            <div class="inner-wrap">
                <section class="form-section">
                    <h4 class="mb-4 text-center">Add New Car</h4>
                    <form>
                        <div class="form-group">
                            <label for="carId">CarId</label>
                            <input type="number" class="form-control" id="carId" placeholder="1">
                        </div>
                        <div class="form-group">
                            <label for="carName">CarName</label>
                            <input type="text" class="form-control" id="carName" placeholder="Civic">
                        </div>
                        <div class="form-group">
                            <label for="manufacturer">Manufacturer</label>
                            <input type="text" class="form-control" id="manufacturer" placeholder="Honda">
                        </div>
                        <div class="form-group">
                            <label for="price">Price</label>
                            <input type="number" class="form-control" id="price" placeholder="24000.00">
                        </div>
                        <div class="form-group">
                            <label for="releasedYear">ReleasedYear</label>
                            <input type="number" class="form-control" id="releasedYear" value="2025">
                        </div>


                        <button type="submit" class="col-sm-2 btn btn-primary btn-block py-1 px-2">Create</button>

                    </form>
                </section>
            </div>
        </div>
    </div>

    <!-- End Create Car -->

    <script src="js/bootstrap.bundle.min.js" type="text/javascript"></script>
    <script src="js/jquery.slim.min.js" type="text/javascript"></script>
    
</body>

</html>