<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <title>View User</title>
                <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="sb-nav-fixed">
                <!-- start include header -->
                <jsp:include page="../layout/header.jsp" />
                <!-- end include header -->
                <div id="layoutSidenav">
                    <!-- start include sidebar -->
                    <jsp:include page="../layout/sidebar.jsp" />
                    <!-- end include sidebar -->
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Manage Users</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item active"><a href="/admin">Dashboard</a> </li>
                                </ol>

                                <div class="container mt-5">
                                    <div class="row">
                                        <div class=" col-12 mx-auto">
                                            <h3>User detail id = ${id}</h3>
                                            <hr />
                                        </div>
                                        <div class="card" style="width: 60%;">
                                            <div class="card-header">
                                                User Information
                                            </div>
                                            <ul class="list-group list-group-flush">
                                                <li class="list-group-item">ID: ${user.id} </li>
                                                <li class="list-group-item">Email: ${user.email} </li>
                                                <li class="list-group-item">Full Name: ${user.fullName} </li>
                                                <li class="list-group-item">Address: ${user.address} </li>
                                                <li class="list-group-item">Phone Number: ${user.phone} </li>
                                            </ul>

                                        </div>

                                    </div>
                                    <a href="/admin/user" class=" btn btn-success mt-3">Back</a>
                                </div>
                            </div>
                    </div>
                    </main>
                </div>
            </body>

            </html>