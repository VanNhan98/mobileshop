<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Document</title>
                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <link rel="stylesheet" href="/client/css/style.css">

            </head>

            <body>
                <!-- !-- start include header -->
                <jsp:include page="../layout/header.jsp" />
                <!-- end include header -->
                <!--start slide show -->
                <jsp:include page="../layout/banner.jsp" />
                <!--end slide show -->
                <!--  products items -->
                <div class="container">
                    <div class="row align-items-center mb-3">
                        <div class="col-12 col-lg-4 text-start mb-2 mb-lg-0">
                            <h3>MOBILE PRODUCTS</h3>
                        </div>
                        <div class="col-12 col-lg-8 text-lg-end text-start">
                            <div class="btn-product">
                                <a href="" style="text-decoration: none; color: black;">ALL PRODUCTS</a>
                            </div>
                        </div>
                    </div>
                    <div class="row g-4 mt-3">
                        <c:forEach var="product" items="${products}">
                            <div class="col-12 col-sm-6 col-md-4 col-lg-3">
                                <div class="product-item mb-4 position-relative">
                                    <div class="product-top">
                                        <a href="" class="product-img">
                                            <img src="/images/product/${product.image}" alt="" class="img-fluid">
                                        </a>
                                    </div>
                                    <div class="text-white rounded px-3 py-1 position-absolute"
                                        style="top: 10px; left: 20px;background-color: #ae8181;">
                                        Mobile
                                    </div>
                                    <div class="product-info text-center">
                                        <a href="/product/${product.id}" class="product-name mt-3">${product.name}</a>
                                        <a href="/product/${product.id}" class="product-des">${product.shortDesc}</a>
                                        <p class="product-price">
                                            <fmt:formatNumber type="number" value="${product.price}" />đ
                                        </p>
                                        <a href="#" class="btn-add-cart btn px-3">
                                            <i class="fa fa-shopping-bag me-2"></i> ADD TO CART
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>


                </div>
                </div>
                <!-- end products items -->
                <!-- feature sp -->
                <jsp:include page="../layout/feature.jsp" />
                <!-- end feature sp -->

                <!-- start footer -->
                <jsp:include page="../layout/footer.jsp" />

            </body>

            </html>