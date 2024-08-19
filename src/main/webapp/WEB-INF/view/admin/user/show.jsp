<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="utf-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <title>Manage Users</title>
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
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Dashboard</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active"> <a href="/admin">Dashboard</a> </li>
                        </ol>
                        <div class="mt-5">
                            <div class="row">
                                <div class="col-12 mx-auto">
                                    <div class="d-flex justify-content-between">
                                        <h3>Table Users</h3>
                                        <a href="/admin/user/create" class="btn btn-primary">Create User</a>
                                    </div>

                                    <table class="table table-bordered table-hover mt-5 text-center"
                                        style="align-items: center;">
                                        <thead>
                                            <tr>
                                                <th scope="col">ID</th>
                                                <th scope="col">FullName</th>
                                                <th scope="col">Role</th>
                                                <th scope="col">Avatar</th>
                                                <th scope="col">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="user" items="${users}">
                                                <tr>
                                                    <th>${user.id}</th>
                                                    <td>${user.fullName}</td>
                                                    <td>${user.role.name}</td>
                                                    <td>
                                                        <img src="/images/avatar/${user.avatar}" alt=""
                                                            style="width: 100px; height: 100px; object-fit: cover; ">
                                                    </td>
                                                    <td>
                                                        <a href="/admin/user/${user.id}"
                                                            class="btn btn-success">View</a>
                                                        <a href="/admin/user/update/${user.id}"
                                                            class="btn btn-warning">Update</a>
                                                        <a href="/admin/user/delete/${user.id}"
                                                            class="btn btn-danger">Delete</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Bootstrap JS -->
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                        crossorigin="anonymous"></script>

                </div>
            </div>

        </body>

        </html>