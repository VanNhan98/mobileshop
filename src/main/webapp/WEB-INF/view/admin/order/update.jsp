<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8" />
                    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                    <title>Order</title>
                    <link href="/css/styles.css" rel="stylesheet" />
                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>
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
                                    <h1 class="mt-4">Order</h1>
                                    <ol class="breadcrumb mb-4">
                                        <li class="breadcrumb-item active">Order</li>
                                    </ol>
                                    <div class=" mt-5">
                                        <div class="row">
                                            <div class="col-md-6 col-12 mx-auto">
                                                <h3>Update a order</h3>
                                                <hr />

                                                <form:form method="post" action="/admin/order/update" class="row"
                                                    modelAttribute="newOrder">
                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                        value="${_csrf.token}" />
                                                    <div class="mb-3" style="display: none;">
                                                        <label class="form-label">Id:</label>
                                                        <form:input type="text" class="form-control" path="id" />
                                                    </div>
                                                    <div class="mb-3">
                                                        <label>Order id = ${newOrder.id} </label>
                                                        &nbsp; &nbsp; &nbsp; &nbsp;
                                                        <label class="form-label">Price:
                                                            <fmt:formatNumber type="number"
                                                                value="${newOrder.totalPrice}" /> đ
                                                        </label>
                                                    </div>
                                                    <div class="mb-3 col-12 col-md-6">
                                                        <label class="form-label">User:</label>
                                                        <form:input type="text" class="form-control" disabled="true"
                                                            path="user.fullName" />
                                                    </div>
                                                    <div class="mb-3 col-12 col-md-6">
                                                        <label class="form-label">Status:</label>
                                                        <form:select class="form-select" path="status">
                                                            <form:option value="PENDING">PENDING</form:option>
                                                            <form:option value="SHIPPING">SHIPPING</form:option>
                                                            <form:option value="COMPLETE">COMPLETE</form:option>
                                                            <form:option value="CANCEL">CANCEL</form:option>
                                                        </form:select>
                                                    </div>
                                                    <div class="col-12 mb-5">
                                                        <button type="submit" class="btn btn-warning">Update</button>
                                                    </div>
                                                </form:form>
                                            </div>

                                        </div>

                                    </div>
                                </div>
                        </div>
                        </main>
                    </div>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                        crossorigin="anonymous"></script>
                    <script src="js/scripts.js"></script>
                </body>

                </html>