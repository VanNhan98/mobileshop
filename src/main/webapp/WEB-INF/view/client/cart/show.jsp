<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

                    <!-- !-- start include header -->
                    <jsp:include page="../layout/header.jsp" />
                    <!-- end include header -->
                    <!-- Cart Page Start -->
                    <div class="container py-5" style="margin-top: 90px;">
                        <div class="mb-3">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/"
                                            style="text-decoration: none; color: #72AEC8; font-weight: 500;">Home</a>
                                    </li>
                                    <li class="breadcrumb-item active" aria-current="page">
                                        Shopping Cart Details
                                    </li>
                                </ol>
                            </nav>
                        </div>
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">Products</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Quantity</th>
                                        <th scope="col">Total</th>
                                        <th scope="col">Handle</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <c:forEach var="cartDetail" items="${cartDetails}" varStatus="status">
                                        <tr>
                                            <th scope="row">
                                                <div class="d-flex align-items-center">
                                                    <img src="/images/product/${cartDetail.product.image}"
                                                        class="img-fluid me-5 rounded-circle"
                                                        style="width: 80px; height: 80px;" alt="">
                                                </div>
                                            </th>
                                            <td>
                                                <p class="mb-0 mt-4">
                                                    <a href="/product/${cartDetail.product.id}"
                                                        style="color: black; text-decoration: none;" target="_blank">
                                                        ${cartDetail.product.name}
                                                    </a>
                                                </p>
                                            </td>
                                            <td>
                                                <p class="mb-0 mt-4">
                                                    <fmt:formatNumber type="number" value="${cartDetail.price}" /> đ
                                                </p>
                                            </td>
                                            <td>
                                                <div class="input-group quantity mt-4" style="width: 100px;">
                                                    <div class="input-group-btn">
                                                        <button
                                                            class="btn btn-sm btn-minus rounded-circle bg-light border">
                                                            <i class="fa fa-minus"></i>
                                                        </button>
                                                    </div>
                                                    <input type="text"
                                                        class="form-control form-control-sm text-center border-0"
                                                        value="${cartDetail.quantity}"
                                                        data-cart-detail-id="${cartDetail.id}"
                                                        data-cart-detail-price="${cartDetail.price}"
                                                        data-cart-detail-index="${status.index}">
                                                    <div class="input-group-btn">
                                                        <button
                                                            class="btn btn-sm btn-plus rounded-circle bg-light border">
                                                            <i class="fa fa-plus"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <p class="mb-0 mt-4" data-cart-detail-id="${cartDetail.id}">
                                                    <fmt:formatNumber type="number"
                                                        value="${cartDetail.price * cartDetail.quantity}" />đ
                                                </p>
                                            </td>
                                            <td>
                                                <form method="post" action="/delete-cart-product/${cartDetail.id}">
                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                        value="${_csrf.token}" />
                                                    <button class="btn btn-md rounded-circle bg-light border mt-4">
                                                        <i class="fa fa-times text-danger"></i>
                                                    </button>
                                                </form>

                                            </td>

                                        </tr>
                                    </c:forEach>


                                </tbody>

                            </table>
                            <div style="margin-top: 60px;">
                                <c:if test="${ empty cartDetails}">
                                    <tr>
                                        <td colspan="6">
                                            Không có sản phẩm trong giỏ hàng
                                        </td>
                                    </tr>
                                </c:if>

                            </div>

                        </div>
                        <c:if test="${not empty cartDetails}">
                            <div class="mt-5 row justify-content-start">
                                <div class="col-12 col-md-8">
                                    <div class=" rounded" style="background-color:#dae2e9">
                                        <div class="p-4">
                                            <h1 class="display-6 mb-4">Order <span class="fw-normal">Information</span>
                                            </h1>
                                            <div class="d-flex justify-content-between mb-4">
                                                <h5 class="mb-0 me-4">SubTotal:</h5>
                                                <p class="mb-0" data-cart-total-price="${totalPrice}">
                                                    <fmt:formatNumber type="number" value="${totalPrice}" />
                                                    đ
                                                </p>
                                            </div>
                                            <div class="d-flex justify-content-between">
                                                <h5 class="mb-0 me-4">Shipping</h5>
                                                <div class="">
                                                    <p class="mb-0">0</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="py-4 mb-4 border-top border-bottom d-flex justify-content-between">
                                            <h5 class="mb-0 ps-4 me-4">Total</h5>
                                            <p class="mb-0 pe-4" data-cart-total-price="${totalPrice}">
                                                <fmt:formatNumber type="number" value="${totalPrice}" />
                                                đ
                                            </p>
                                        </div>
                                        <form:form action="/confirm-checkout" method="post" modelAttribute="cart">
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                            <div style="display: none;">
                                                <c:forEach var="cartDetail" items="${cart.cartDetails}"
                                                    varStatus="status">
                                                    <div class="mb-3">
                                                        <div class="form-group">
                                                            <label>Id:</label>
                                                            <form:input class="form-control" type="text"
                                                                value="${cartDetail.id}"
                                                                path="cartDetails[${status.index}].id" />
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Quantity:</label>
                                                            <form:input class="form-control" type="text"
                                                                value="${cartDetail.quantity}"
                                                                path="cartDetails[${status.index}].quantity" />
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                            <button
                                                class="btn btn-product border-secondary rounded-pill px-4 py-3 text-black text-uppercase mb-4"
                                                type=" button">Proceed Checkout</button>
                                        </form:form>
                                    </div>

                                </div>
                            </div>
                    </div>
                    </c:if>

                    </div>
                    <!-- Cart Page End -->

                    <!-- start footer -->
                    <jsp:include page="../layout/footer.jsp" />

                </body>



                </html>