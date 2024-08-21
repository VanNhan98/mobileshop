<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Document</title>
                    <link rel="stylesheet"
                        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
                        rel="stylesheet">
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                    <link rel="stylesheet" href="/client/css/style.css">
                    <script src="/client/js/main.js"></script>

                </head>

                <body>

                    <jsp:include page="../layout/header.jsp" />

                    <!-- Cart Page Start -->

                    <div class="container py-5" style="margin-top: 80px;">
                        <div class="mb-3">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/"
                                            style="text-decoration: none; color: #DEAE6F; font-weight: bold;">Home</a>
                                    </li>
                                    <li class="breadcrumb-item active" aria-current="page">Purchase History</li>
                                </ol>
                            </nav>
                        </div>
                        <div class="table-responsive my-5">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">Product</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Quantity</th>
                                        <th scope="col">Total</th>
                                        <th scope="col">Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:if test="${ empty orders}">
                                        <tr>
                                            <td colspan="6">
                                                Không có đơn hàng nào được tạo
                                            </td>
                                        </tr>
                                    </c:if>
                                    <c:forEach var="order" items="${orders}">
                                        <tr>
                                            <td colspan="2">Order Code ${order.id}</td>
                                            <td colspan="1">
                                                <fmt:formatNumber type="number" value="${order.totalPrice}" /> đ
                                            </td>
                                            <td colspan="2"></td>
                                            <td colspan="1">
                                                ${order.status}
                                            </td>
                                        </tr>
                                        <c:forEach var="orderDetail" items="${order.orderDetails}">
                                            <tr>
                                                <th scope="row">
                                                    <div class="d-flex align-items-center">
                                                        <img src="/images/product/${orderDetail.product.image}"
                                                            class="img-fluid me-5 rounded-circle"
                                                            style="width: 80px; height: 80px;" alt="">
                                                    </div>
                                                </th>
                                                <td>
                                                    <p class="mb-0 mt-4">
                                                        <a href="/product/${orderDetail.product.id}" target="_blank"
                                                            style="text-decoration: none; color: #DEAE6F;">
                                                            ${orderDetail.product.name}
                                                        </a>
                                                    </p>
                                                </td>
                                                <td>
                                                    <p class="mb-0 mt-4">
                                                        <fmt:formatNumber type="number" value="${orderDetail.price}" />
                                                        đ
                                                    </p>
                                                </td>
                                                <td>
                                                    <div class="input-group quantity mt-4" style="width: 100px;">
                                                        <input type="text"
                                                            class="form-control form-control-sm text-center border-0"
                                                            value="${orderDetail.quantity}">
                                                    </div>
                                                </td>
                                                <td>
                                                    <p class="mb-0 mt-4">
                                                        <fmt:formatNumber type="number"
                                                            value="${orderDetail.price * orderDetail.quantity}" /> đ
                                                    </p>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:forEach>

                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- Cart Page End -->


                    <jsp:include page="../layout/footer.jsp" />


                    <!-- Back to Top -->
                    <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
                            class="fa fa-arrow-up"></i></a>
                </body>

                </html>