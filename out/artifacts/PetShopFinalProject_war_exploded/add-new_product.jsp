<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/5/2022
  Time: 9:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Pet Shop</title>
    <link rel="icon" type="image/png" href="./assets/images/pet-shop-center-icon_24877-3877.png"/>
    <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css?family=Roboto:400,700"
    />
    <!-- https://fonts.google.com/specimen/Roboto -->
    <link rel="stylesheet" href="admin/assets/css/fontawesome.min.css" />
    <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href="admin/assets/jquery-ui-datepicker/jquery-ui.min.css" type="text/css" />
    <!-- http://api.jqueryui.com/datepicker/ -->
    <link rel="stylesheet" href="admin/assets/css/bootstrap.min.css" />
    <!-- https://getbootstrap.com/ -->
    <link rel="stylesheet" href="admin/assets/css/templatemo-style.css">
    <!--
	Product Admin CSS Template
	https://templatemo.com/tm-524-product-admin
	-->
</head>
<body>
<nav class="navbar navbar-expand-xl">
    <div class="container h-100">
        <a class="navbar-brand" href="<%=request.getContextPath()%>/report">
            <h1 class="tm-site-title mb-0">Product Admin</h1>
        </a>
        <button
                class="navbar-toggler ml-auto mr-0"
                type="button"
                data-toggle="collapse"
                data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent"
                aria-expanded="false"
                aria-label="Toggle navigation"
        >
            <i class="fas fa-bars tm-nav-icon"></i>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mx-auto h-100">
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/report">
                        <i class="fas fa-tachometer-alt"></i> Dashboard
                        <span class="sr-only">(current)</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="<%=request.getContextPath()%>/AdminProduct">
                        <i class="fas fa-shopping-cart"></i> Products
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/ListAdminAccount">
                        <i class="far fa-user"></i> Accounts
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">
                        <i class="far fa-file-alt"></i>
                        User Website
                    </a>
                </li>

            </ul>
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link d-block" href="adminLogin.jsp">
                        Admin, <b>Logout</b>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container tm-mt-big tm-mb-big">
    <div class="row">
        <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
            <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                <div class="row">
                    <div class="col-12">
                        <h2 class="tm-block-title d-inline-block">Add Product</h2>
                    </div>
                </div>
                <div class="row tm-edit-product-row" style="display: block">
                    <div class="col-xl-12 col-lg-12 col-md-12">
                        <form action="<%=request.getContextPath()%>/HandleProductAdmin?action=addProduct" class="tm-edit-product-form" method="post">
                            <div style="display: flex">
                                <div style="flex: 1;padding-right: 15px">
                                    <div class="form-group mb-3">
                                        <label
                                                for="name"
                                        >Product Name
                                        </label>
                                        <input
                                                id="name"
                                                name="name"
                                                type="text"
                                                class="form-control validate"
                                                required
                                        />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label>Description</label
                                        >
                                        <textarea
                                                class="form-control validate"
                                                name="description"
                                                rows="3"
                                                required
                                        ></textarea>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label
                                                for="category"
                                        >Category</label
                                        >
                                        <select
                                                class="custom-select tm-select-accounts"
                                                id="category"
                                                name="category"
                                        >
                                            <option selected>Select category</option>
                                            <c:forEach items="${listCategory}" var="category">
                                                <option value="${category.getIdCategory()}">${category.getCategory()}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="row">
                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            <label
                                                    for="brand"
                                            >Brand
                                            </label>
                                            <input
                                                    id="brand"
                                                    name="brand"
                                                    type="text"
                                                    class="form-control validate"
                                                    required
                                            />
                                        </div>
                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            <label
                                                    for="price"
                                            >Price
                                            </label>
                                            <input
                                                    id="price"
                                                    name="price"
                                                    type="number"
                                                    class="form-control validate"
                                                    required
                                            />
                                        </div>
                                    </div>
                                </div>
                                <div style="flex: 1">
                                    <div class="col-xl-12 col-lg-12 col-md-12 mx-auto mb-4" style="padding-right: 0">
                                        <div class="tm-product-img-dummy mx-auto">
                                            <i
                                                    class="fas fa-cloud-upload-alt tm-upload-icon"
                                                    onclick="document.getElementById('fileInput').click();"
                                            ></i>
                                        </div>
                                        <div class="custom-file mt-3 mb-3">
                                            <input id="fileInput" name="fileInput" type="file" style="display:none;" />
                                            <input
                                                    type="button"
                                                    class="btn btn-primary btn-block mx-auto"
                                                    value="UPLOAD PRODUCT IMAGE"
                                                    onclick="document.getElementById('fileInput').click();"
                                            />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12">
                                <button type="submit" class="btn btn-primary btn-block text-uppercase">Add Product Now</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<footer class="tm-footer row tm-mt-small">
    <div class="col-12 font-weight-light">
        <p class="text-center text-white mb-0 px-4 small">
            Copyright &copy; <b>2022</b> All rights reserved.

            Design: <a rel="nofollow noopener" href="https://templatemo.com" class="tm-footer-link">Vngocz & TrNguyen</a>
        </p>
    </div>
</footer>

<script src="admin/assets/js/jquery-3.3.1.min.js"></script>
<!-- https://jquery.com/download/ -->
<script src="admin/assets/jquery-ui-datepicker/jquery-ui.min.js"></script>
<!-- https://jqueryui.com/download/ -->
<script src="admin/assets/js/bootstrap.min.js"></script>
<!-- https://getbootstrap.com/ -->
<script>
    $(function() {
        $("#expire_date").datepicker();
    });
</script>
</body>
</html>
