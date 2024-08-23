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
                <script src="/client/js/main.js"></script>
            </head>

            <body>
                <!-- !-- start include header -->
                <jsp:include page="../layout/header.jsp" />
                <!-- end include header -->

                <div class="container" style="margin-top: 160px;">
                    <div class="mb-5">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="/"
                                        style="text-decoration: none; color: #DEAE6F; font-weight: bold;">Home</a>
                                </li>
                                <li class="breadcrumb-item active" aria-current="page">Product Details</li>
                            </ol>
                        </nav>
                    </div>
                    <div class="row g-4">
                        <div class="col-lg-8 col-xl-9">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="border rounded">
                                        <a href="#">
                                            <img src="/images/product/${product.image}" class="img-fluid rounded"
                                                alt="Image">
                                        </a>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <h4 class="fw-bold mb-3">${product.name}</h4>
                                    <p class="mb-3">${product.factory}</p>
                                    <h5 class="fw-bold mb-3">
                                        <fmt:formatNumber type="number" value="${product.price}" /> đ
                                    </h5>
                                    <div class="d-flex mb-4" style="color: #ffb524;">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star text-secondary"></i>
                                    </div>
                                    <p class="mb-4">${product.shortDesc}</p>
                                    <div class="input-group quantity mb-5" style="width: 100px;">
                                        <div class="input-group-btn">
                                            <button class="btn btn-sm btn-minus rounded-circle border">
                                                <i class="fa fa-minus"></i>
                                            </button>
                                        </div>
                                        <input type="text" class="form-control form-control-sm text-center border-0"
                                            value="1" data-cart-detail-index="0">
                                        <div class="input-group-btn">
                                            <button class="btn btn-sm btn-plus rounded-circle border">
                                                <i class="fa fa-plus"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <form action="/add-product-form-view-detail" method="post" modelAttribute="product">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                        <input class="form-control d-none" type="text" value="${product.id}"
                                            name="id" />

                                        <input class="form-control d-none" type="text" name="quantity"
                                            id="cartDetails0.quantity" />
                                        <button
                                            class="btn border border-secondary rounded-pill px-4 py-2 mb-4 btn-add-cart"><i
                                                class="fa fa-shopping-bag me-2"></i>
                                            Add to cart
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 col-xl-3">
                            <div class="row g-4 fruite">
                                <div class="col-lg-12">
                                    <div class="mb-4">
                                        <h4>Factory</h4>
                                        <ul class="list-unstyled  my-3">
                                            <li>
                                                <div class="d-flex justify-content-between factory-name mb-3">
                                                    <a href="#"><i class="fas fa-apple-alt me-2"></i>Sam Sung</a>
                                                    <span>(3)</span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="d-flex justify-content-between factory-name mb-3">
                                                    <a href="#"><i class="fas fa-apple-alt me-2"></i>Apple</a>
                                                    <span>(5)</span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="d-flex justify-content-between factory-name mb-3">
                                                    <a href="#"><i class="fas fa-apple-alt me-2"></i>Vivo</a>
                                                    <span>(2)</span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="d-flex justify-content-between factory-name mb-3">
                                                    <a href="#"><i class="fas fa-apple-alt me-2"></i>Xiomi</a>
                                                    <span>(8)</span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="d-flex justify-content-between factory-name">
                                                    <a href="#"><i class="fas fa-apple-alt me-2"></i>Oppo</a>
                                                    <span>(5)</span>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <nav>
                                <div class="nav nav-tabs mb-3">
                                    <button class="nav-link active border-white border-bottom-0" type="button"
                                        role="tab" id="nav-about-tab" data-bs-toggle="tab" data-bs-target="#nav-about"
                                        aria-controls="nav-about" aria-selected="true">Description</button>
                                </div>
                            </nav>
                            <div class="tab-content mb-5">
                                <div class="tab-pane active" id="nav-about" role="tabpanel"
                                    aria-labelledby="nav-about-tab">
                                    <p>${product.detailDesc}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- start footer -->
                <jsp:include page="../layout/footer.jsp" />

            </body>

            </html>