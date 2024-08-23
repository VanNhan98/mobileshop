<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <html lang="en">


            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Order Success</title>

                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <link rel="stylesheet" href="/client/css/style.css">


            </head>

            <body>

                <jsp:include page="../layout/header.jsp" />


                <div class="container" style="margin-top: 100px;">
                    <div class="row ">
                        <div class="col-12 mt-5">
                            <div class="alert alert-success" role="alert">
                                Cảm ơn bạn đã đặt hàng, đơn hàng đã được xác nhận thành công.
                            </div>
                        </div>
                    </div>
                </div>



                <jsp:include page="../layout/footer.jsp" />


                <!-- Back to Top -->
                <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
                        class="fa fa-arrow-up"></i></a>


                <!-- Template Javascript -->
                <script src="/client/js/main.js"></script>
            </body>

            </html>