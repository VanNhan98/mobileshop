<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <header>
            <div class="container d-flex align-items-center">
                <div class="col-6 col-md-2 logo d-flex p-2">
                    <img src="/client/images/logo.png">
                </div>
                <div class="col-6 col-md-6 menu d-flex p-2 ">
                    <li><a href="">Trang chủ</a></li>
                    <li><a href="">Sản phẩm</a></li>
                </div>

                <div class="col-6 col-md-4 other d-flex px-5">
                    <c:if test="${not empty pageContext.request.userPrincipal}">
                        <li><input placeholder=" Search" type="text"><i class="fa-solid fa-magnifying-glass"></i></li>
                        <li><a href=""><i class="fa-solid fa-cart-shopping"></i></a></li>
                        <div class="dropdown my-auto">
                            <a href="#" class="dropdown" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown"
                                aria-expanded="false" data-bs-toggle="dropdown" aria-expanded="false"
                                style="color: black;">
                                <i class="fa-solid fa-user"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end p-4" arialabelledby="dropdownMenuLink">
                                <li class="d-flex align-items-center flex-column" style="min-width: 300px;">
                                    <img style="width: 150px; height: 150px; border-radius: 50%; overflow: hidden;"
                                        src="/images/avatar/${sessionScope.avatar}" />
                                    <div class="text-center my-3">
                                        <c:out value="${sessionScope.fullName}" />
                                    </div>
                                </li>
                                <li><a class="dropdown-item" href="#">Quản lý tài khoản</a></li>
                                <li><a class="dropdown-item" href="#">Lịch sử mua hàng</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li>
                                    <form action="/logout" method="post">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                        <button class="dropdown-item" href="#">Đăng xuất</button>
                                    </form>
                                </li>

                            </ul>
                        </div>
                    </c:if>
                    <c:if test="${empty pageContext.request.userPrincipal}">
                        <a href="/login" style="text-decoration: none; color: black; font-weight: bold;">
                            Đăng Nhập
                        </a>
                    </c:if>
                </div>
            </div>

        </header>