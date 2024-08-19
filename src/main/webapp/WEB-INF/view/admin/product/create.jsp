<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <title>Dashboard</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");

                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL);
                            $("#avatarPreview").css({ "display": "block" });

                        });
                    });
                </script>
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
                                <h1 class="mt-4">Manage Products</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item active"><a href="/admin">Dashboard</a> </li>
                                </ol>
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h3>Create a product</h3>
                                            <hr />
                                            <form:form method="post" action="/admin/product/create" class="row"
                                                modelAttribute="newProduct" enctype="multipart/form-data">
                                                <input type="hidden" name="${_csrf.parameterName}"
                                                    value="${_csrf.token}" />
                                                <c:set var="nameError">
                                                    <form:errors path="name" cssClass="invalid-feedback" />
                                                </c:set>
                                                <c:set var="priceError">
                                                    <form:errors path="price" cssClass="invalid-feedback" />
                                                </c:set>
                                                <c:set var="detailError">
                                                    <form:errors path="detailDesc" cssClass="invalid-feedback" />
                                                </c:set>
                                                <c:set var="shortError">
                                                    <form:errors path="shortDesc" cssClass="invalid-feedback" />
                                                </c:set>
                                                <c:set var="quantityError">
                                                    <form:errors path="quantity" cssClass="invalid-feedback" />
                                                </c:set>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Name:</label>
                                                    <form:input type="text"
                                                        class="form-control ${not empty nameError ?'is-invalid':''}"
                                                        path="name" />
                                                    <!-- <form:errors path="name" cssClass="invalid-feedback" /> -->
                                                    ${nameError}
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Price:</label>
                                                    <form:input type="number"
                                                        class="form-control ${not empty priceError ?'is-invalid':''}"
                                                        path="price" />
                                                    ${priceError}
                                                </div>
                                                <div class="mb-3 col-12 ">
                                                    <label class="form-label">Detail Description:</label>
                                                    <form:textarea type="text"
                                                        class="form-control ${not empty detailError ?'is-invalid':''}"
                                                        path="detailDesc" />
                                                    ${detailError}
                                                </div>
                                                <div class="mb-3 col-12">
                                                    <label class="form-label">Short Description:</label>
                                                    <form:textarea type="text"
                                                        class="form-control ${not empty shortError ?'is-invalid':''}"
                                                        path="shortDesc" />
                                                    ${shortError}
                                                </div>
                                                <div class="mb-3 col-12 col-md-6 ">
                                                    <label class="form-label">Quantity:</label>
                                                    <form:input type="number"
                                                        class="form-control ${not empty quantityError ?'is-invalid':''}"
                                                        path="quantity" />
                                                    ${quantityError}
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Factory:</label>
                                                    <form:select class="form-select" path="factory">
                                                        <form:option value="APPLE">APPLE</form:option>
                                                        <form:option value="SAMSUNG">SAMSUNG</form:option>
                                                        <form:option value="XIAOMI">XIAOMI</form:option>
                                                        <form:option value="VIVO">VIVO</form:option>
                                                        <form:option value="OPPO">OPPO</form:option>
                                                    </form:select>
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Size:</label>
                                                    <form:select class="form-select" path="size">
                                                        <form:option value="SMALL">Small</form:option>
                                                        <form:option value="MEDIUM">Medium</form:option>
                                                        <form:option value="BIG">Big</form:option>

                                                    </form:select>
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Avatar:</label>
                                                    <label for="avatarFile" class="form-label"></label>
                                                    <input class="form-control" type="file" id="avatarFile"
                                                        accept=".png, .jpg, .jpeg" name="nameFile" />
                                                </div>
                                                <div class="mb-3 col-12">
                                                    <img alt="avatar preview" style="max-height: 250px; display: none;"
                                                        id="avatarPreview">
                                                </div>
                                                <div class="mb-3 col-12">
                                                    <button type="submit" class="btn btn-primary">Create</button>
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
                <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
                    crossorigin="anonymous"></script>
                <script src="js/demo/chart-area-demo.js"></script>
                <script src="ks/demo/chart-bar-demo.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
                    crossorigin="anonymous"></script>
                <script src="js/datatables-simple-demo.js"></script>
            </body>

            </html>