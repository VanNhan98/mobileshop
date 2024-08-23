<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <title>Product</title>
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

                        <div class="container-fluid px-4">
                            <h1 class="mt-4">Manage Products</h1>
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item active"><a href="/admin">Dashboard</a></li>
                            </ol>
                            <div class="mt-5">
                                <div class="row">
                                    <div class="col-12 mx-auto">
                                        <div class="d-flex justify-content-between">
                                            <h3>Table Products</h3>
                                            <a href="/admin/product/create" class="btn btn-primary">Create</a>
                                        </div>

                                        <table class="table table-bordered table-hover mt-5 text-center"
                                            style="align-items: center;">
                                            <thead>
                                                <tr>
                                                    <th scope="col">ID</th>
                                                    <th scope="col">Name</th>
                                                    <th scope="col">Price</th>
                                                    <th scope="col">Factory</th>
                                                    <th scope="col">Image</th>
                                                    <th scope="col">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="product" items="${products}">
                                                    <tr>
                                                        <th>${product.id}</th>
                                                        <td>${product.name}</td>
                                                        <td>

                                                            <fmt:formatNumber type="number" value="${product.price}" />
                                                            đ

                                                        </td>
                                                        <td>
                                                            <img src="/images/product/${product.image}" alt=""
                                                                style="width: 100px; height: 100px; object-fit: cover; border-radius:2px ; ">
                                                        </td>
                                                        <td>${product.factory}</td>

                                                        <td>
                                                            <a href="/admin/product/${product.id}"
                                                                class="btn btn-success">View</a>
                                                            <a href="/admin/product/update/${product.id}"
                                                                class="btn btn-warning">Update</a>
                                                            <a href="/admin/product/delete/${product.id}"
                                                                class="btn btn-danger">Delete</a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                        <nav aria-label="Page navigation example">
                                            <ul class="pagination justify-content-center">
                                                <c:if test="${currentPage > 1}">
                                                    <li class="page-item">
                                                        <a class="page-link"
                                                            href="/admin/product?page=${currentPage - 1}"
                                                            aria-label="Previous">
                                                            <span aria-hidden="true">&laquo;</span>
                                                        </a>

                                                    </li>
                                                </c:if>
                                                <c:forEach begin="1" end="${totalPages}" var="i">
                                                    <li class="page-item ${currentPage == i ? 'active' :''}"><a
                                                            class="page-link" href="/admin/product?page=${i}">
                                                            ${i}
                                                        </a></li>
                                                </c:forEach>
                                                <c:if test="${totalPages > currentPage}">
                                                    <li>
                                                        <a class="page-link"
                                                            href="/admin/product?page=${currentPage + 1}"
                                                            aria-label="Next">
                                                            <span aria-hidden="true">&raquo;</span>
                                                        </a>
                                                    </li>
                                                </c:if>

                                            </ul>
                                        </nav>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="js/scripts.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
                    crossorigin="anonymous"></script>
                <script src="js/demo/chart-area-demo.js"></script>
                <script src="ks/demo/chart-bar-demo.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
                    crossorigin="anonymous"></script>
                <script src="js/datatables-simple-demo.js"></script>
            </body>

            </html>