<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
                            <h1 class="mt-4">Manage Products</h1>
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item active"> <a href="/admin">Dashboard</a> </li>
                            </ol>
                            <div class="container mt-5">
                                <div class="row">
                                    <div class=" col-12 mx-auto">
                                        <h3>Delete The Product With Id = ${id}</h3>
                                        <hr />
                                    </div>
                                    <div class="alert alert-danger" role="alert">
                                        Are you sure to delete this product ?
                                    </div>
                                    <form:form method="post" action="/admin/product/delete" modelAttribute="newProduct">
                                        <div class="mb-3" style="display: none;">
                                            <label class="form-label">ID:</label>
                                            <form:input value="${id}" type="text" class="form-control" path="id" />
                                        </div>
                                        <button class="btn btn-danger">Confirm</button>
                                    </form:form>
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