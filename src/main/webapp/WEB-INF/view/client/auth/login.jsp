<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Document</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
                <link rel="stylesheet" href="/css/style.css">
            </head>

            <body>

                <body class="bg-primary">
                    <div id="layoutAuthentication">
                        <div id="layoutAuthentication_content">
                            <main>
                                <div class="container">
                                    <div class="row justify-content-center">
                                        <div class="col-lg-5">
                                            <div class="card shadow-lg border-0 rounded-lg mt-5">
                                                <div class="card-header">
                                                    <h3 class="text-center font-weight-light my-4">Login</h3>
                                                </div>
                                                <div class="card-body">
                                                    <form>
                                                        <div class="form-floating mb-3">
                                                            <input class="form-control" id="inputEmail" type="email"
                                                                placeholder="name@example.com" />
                                                            <label for="inputEmail">Email address</label>
                                                        </div>
                                                        <div class="form-floating mb-3">
                                                            <input class="form-control" id="inputPassword"
                                                                type="password" placeholder="Password" />
                                                            <label for="inputPassword">Password</label>
                                                        </div>
                                                        <div class="form-check mb-3">
                                                            <input class="form-check-input" id="inputRememberPassword"
                                                                type="checkbox" value="" />
                                                            <label class="form-check-label"
                                                                for="inputRememberPassword">Remember
                                                                Password</label>
                                                        </div>
                                                        <div
                                                            class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                            <a class="small" href="password.html">Forgot Password?</a>
                                                            <div class="mt-4 mb-0">
                                                                <div class="d-grid">
                                                                    <button class="btn btn-primary btn-block">
                                                                        Login
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                                <div class="card-footer text-center py-3">
                                                    <div class="small"><a href="register.html">Need an account? Sign
                                                            up!</a></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </main>
                        </div>
                    </div>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                        crossorigin="anonymous"></script>
                    <script src="js/scripts.js"></script>
                </body>
            </body>

            </html>