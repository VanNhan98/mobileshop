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

                    <div class="container py-5" style="margin-top: 100px;">
                        <div class="row g-4 mb-5">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/"
                                            style="text-decoration: none; color: #72AEC8; font-weight: 500;">Home</a>
                                    </li>
                                    <li class="breadcrumb-item active" aria-current="page">
                                        List Product
                                    </li>
                                </ol>
                            </nav>


                            <div class="row g-4 fruite">
                                <div class="col-12 col-md-4">
                                    <div class="row g-4">
                                        <div class="col-12" id="factoryFilter">
                                            <div class="mb-2"><b>Hãng sản xuất</b></div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="factory-1"
                                                    value="APPLE">
                                                <label class="form-check-label" for="factory-1">Apple</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="factory-2"
                                                    value="SAMSUNG">
                                                <label class="form-check-label" for="factory-2">SamSung</label>
                                            </div>

                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="factory-3"
                                                    value="XIAOMI">
                                                <label class="form-check-label" for="factory-3">Xiaomi</label>
                                            </div>

                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="factory-4"
                                                    value="OPPO">
                                                <label class="form-check-label" for="factory-4">Oppo</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="factory-5"
                                                    value="VIVO">
                                                <label class="form-check-label" for="factory-5">Vivo</label>
                                            </div>
                                        </div>
                                        <div class="col-12" id="targetFilter">
                                            <div class="mb-2"><b>Mục đích sử dụng</b></div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="target-1"
                                                    value="GAMING">
                                                <label class="form-check-label" for="target-1">Chơi game</label>
                                            </div>

                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="target-2"
                                                    value="CHUP-ANH-DEP">
                                                <label class="form-check-label" for="target-2">Chụp ảnh đẹp</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="target-3"
                                                    value="DIEN-THOAI-GAP">
                                                <label class="form-check-label" for="target-3">Điện thoại gập</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="target-4"
                                                    value="DUNG-LUONG-LON">
                                                <label class="form-check-label" for="target-4">Dung lượng lớn</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="target-5"
                                                    value="CAU-HINH-CAO">
                                                <label class="form-check-label" for="target-5">Cấu hình cao</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="target-6"
                                                    value="PIN-CAO">
                                                <label class="form-check-label" for="target-5">Pin cao</label>
                                            </div>


                                        </div>
                                        <div class="col-12" id="priceFilter">
                                            <div class="mb-2"><b>Mức giá</b></div>

                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="price-2"
                                                    value="duoi-10-trieu">
                                                <label class="form-check-label" for="price-2">Dưới 10 triệu</label>
                                            </div>

                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="price-3"
                                                    value="10-toi-15-trieu">
                                                <label class="form-check-label" for="price-3">Từ 10 - 15
                                                    triệu</label>
                                            </div>

                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="price-4"
                                                    value="15-toi-25-trieu">
                                                <label class="form-check-label" for="price-4">Từ 15 - 25
                                                    triệu</label>
                                            </div>

                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="price-5"
                                                    value="tren-25-trieu">
                                                <label class="form-check-label" for="price-5">Trên 25 triệu</label>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="mb-2"><b>Sắp xếp</b></div>

                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" id="sort-1"
                                                    value="gia-tang-dan" name="radio-sort">
                                                <label class="form-check-label" for="sort-1">Giá tăng dần</label>
                                            </div>

                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" id="sort-2"
                                                    value="gia-giam-dan" name="radio-sort">
                                                <label class="form-check-label" for="sort-2">Giá giảm dần</label>
                                            </div>

                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" id="sort-3" checked
                                                    value="gia-nothing" name="radio-sort">
                                                <label class="form-check-label" for="sort-3">Không sắp xếp</label>
                                            </div>

                                        </div>
                                        <div class="col-12">
                                            <button
                                                class="btn-add-cart btn border-secondary rounded-pill px-4 py-3  text-uppercase mb-4"
                                                id="btnFilter">
                                                Lọc Sản Phẩm
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-md-8 text-center">
                                    <div class="row g-4">
                                        <c:if test="${totalPages ==  0}">
                                            <div>Không tìm thấy sản phẩm</div>
                                        </c:if>
                                        <c:forEach var="product" items="${products}">
                                            <div class="col-md-6 col-lg-4">
                                                <div class="product-item mb-4 position-relative">
                                                    <div class="product-top">
                                                        <a href="" class="product-img">
                                                            <img src="/images/product/${product.image}" alt=""
                                                                class="img-fluid">
                                                        </a>
                                                    </div>
                                                    <div class="text-white rounded px-3 py-1 position-absolute"
                                                        style="top: 10px; left: 20px;background-color: #ae8181;">
                                                        Mobile
                                                    </div>
                                                    <div class="product-info text-center">
                                                        <a href="/product/${product.id}"
                                                            class="product-name mt-3">${product.name}</a>
                                                        <a href="/product/${product.id}"
                                                            class="product-des">${product.shortDesc}</a>
                                                        <p class="product-price">
                                                            <fmt:formatNumber type="number" value="${product.price}" />đ
                                                        </p>
                                                        <form action="/add-product-to-cart-from-products/${product.id}"
                                                            method="post">
                                                            <input type="hidden" name="${_csrf.parameterName}"
                                                                value="${_csrf.token}" />
                                                            <button class="btn-add-cart btn px-3">
                                                                <i class="fa fa-shopping-bag me-2"></i> ADD TO CART
                                                            </button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                        <nav aria-label="Page navigation example">
                                            <ul class="pagination justify-content-center">
                                                <c:if test="${currentPage > 1}">
                                                    <li class="page-item">
                                                        <a class="page-link"
                                                            href="/products?page=${currentPage - 1}${queryString}"
                                                            aria-label="Previous">
                                                            <span aria-hidden="true">&laquo;</span>
                                                        </a>

                                                    </li>
                                                </c:if>
                                                <c:forEach begin="1" end="${totalPages}" var="i">
                                                    <li class="page-item ${currentPage == i ? 'active' :''}"><a
                                                            class="page-link" href="/products?page=${i}${queryString}">
                                                            ${i}
                                                        </a></li>
                                                </c:forEach>
                                                <c:if test="${totalPages > currentPage}">
                                                    <li>
                                                        <a class="page-link"
                                                            href="/product?page=${currentPage + 1}${queryString}"
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





                    <!-- start footer -->
                    <jsp:include page="../layout/footer.jsp" />

                </body>



                </html>