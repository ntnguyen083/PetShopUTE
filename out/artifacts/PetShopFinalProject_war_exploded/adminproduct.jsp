<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/5/2022
  Time: 9:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Pet Shop</title>
    <link rel="icon" type="image/png" href="./assets/images/pet-shop-center-icon_24877-3877.png"/>
    <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css?family=Roboto:400,700"
    />
    <!-- https://fonts.google.com/specimen/Roboto -->
    <link rel="stylesheet" href="admin/assets/css/fontawesome.min.css"/>
    <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href="admin/assets/css/bootstrap.min.css"/>
    <!-- https://getbootstrap.com/ -->
    <link rel="stylesheet" href="admin/assets/css/templatemo-style.css">
    <!--
	Product Admin CSS Template
	https://templatemo.com/tm-524-product-admin
	-->
</head>

<body id="reportsPage">
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
                    <a class="nav-link d-block" href="<%=request.getContextPath()%>/LogoutAdmin">
                        ${admin.getUserName()}, <b>Logout</b>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container mt-5">
    <div class="row tm-content-row">
        <div class="col-sm-12 col-md-12 col-lg-8 col-xl-8 tm-block-col">
            <div class="tm-bg-primary-dark tm-block tm-block-products">
                <div class="tm-product-table-container">
                    <table class="table table-hover tm-table-small tm-product-table">
                        <thead>
                        <tr>
                            <th scope="col">PRODUCT NAME</th>
                            <th scope="col">DESCRIPTION</th>
                            <th scope="col">BRAND</th>
                            <th scope="col">PRICE</th>
                            <th scope="col">&nbsp;</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${listProduct}" var="product">
                            <tr>
                                <td class="tm-product-name">${product.getName()}</td>
                                <td>${product.getDescription()}</td>
                                <td>${product.getBrand()}</td>
                                <td>$${product.getPrice()}</td>
                                <td class="padlr-0">
                                    <a href="<%=request.getContextPath()%>/storeddata?action=editproduct&idProduct=${product.getId()}&name=${product.getName()}&description=${product.getDescription()}&brand=${product.getBrand()}&price=${product.getPrice()}&idCategory=${product.getIdCategory()}&urlImage=${product.getUrlImage()}" class="tm-product-delete-link">
                                        <i class="far fa-wrench tm-product-delete-icon" style="font-weight: bold"></i>
                                    </a>
<%--                                    <a href="<%=request.getContextPath()%>/HandleProductAdmin?action=removeProduct&idproduct=${product.getId()}" class="tm-product-delete-link">--%>
<%--                                        <i class="far fa-trash-alt tm-product-delete-icon"></i>--%>
<%--                                    </a>--%>
                                    <a onclick="deleteproduct(${product.getId()})" class="tm-product-delete-link" style="cursor: pointer">
                                        <i class="far fa-trash-alt tm-product-delete-icon"></i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!-- table container -->
                <a href="add-new_product.jsp" class="btn btn-primary btn-block text-uppercase mb-3">Add new product</a>
            </div>
        </div>
        <div class="col-sm-12 col-md-12 col-lg-4 col-xl-4 tm-block-col">
            <div class="tm-bg-primary-dark tm-block tm-block-product-categories">
                <h2 class="tm-block-title">Product Categories</h2>
                <div class="tm-product-table-container-small">
                    <table class="table table-hover tm-table-small tm-product-table">
                        <tbody>
                        <c:forEach items="${listCategory}" var="category">
                            <tr>
                                <td class="tm-product-name">${category.getCategory()}</td>
                                <td class="text-center padlr-0">
                                    <a href="<%=request.getContextPath()%>/storeddata?action=editcategory&idcategory=${category.getIdCategory()}&category=${category.getCategory()}" class="tm-product-delete-link">
                                        <i class="far fa-wrench tm-product-delete-icon" style="font-weight: bold"></i>
                                    </a>
<%--                                    <a href="<%=request.getContextPath()%>/HandleProductAdmin?action=removeCategory&idcategory=${category.getIdCategory()}"--%>
<%--                                       class="tm-product-delete-link">--%>
<%--                                        <i class="far fa-trash-alt tm-product-delete-icon"></i>--%>
<%--                                    </a>--%>
                                    <a onclick="deletecategory(${category.getIdCategory()})" style="cursor: pointer" ;
                                       class="tm-product-delete-link">
                                        <i class="far fa-trash-alt tm-product-delete-icon"></i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!-- table container -->
                <button class="btn btn-primary btn-block text-uppercase mb-3 btnaddcategory">
                    Add new category
                </button>
                <div class="form-group mb-3 none">
                    <label for="newcategory">Category Name
                    </label>
                    <form class="addcategory"
                          action="<%=request.getContextPath()%>/HandleProductAdmin?action=addCategory" method="post">
                        <input id="newcategory" name="newcategory" type="text" class="form-control validate"
                               required="">
                        <button class="addcategory-link" type="submit">
                            <i class="fa fa-plus-square addcategory-icon" aria-hidden="true"></i>
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<footer class="tm-footer row tm-mt-small">
    <div class="col-12 font-weight-light">
        <p class="text-center text-white mb-0 px-4 small">
            Copyright &copy; <b>2022</b> All rights reserved.

            Design: <a rel="nofollow noopener" href="https://templatemo.com" class="tm-footer-link">Vngocz &
            TrNguyen</a>
        </p>
    </div>
</footer>

<script src="admin/assets/js/jquery-3.3.1.min.js"></script>
<!-- https://jquery.com/download/ -->
<script src="admin/assets/js/bootstrap.min.js"></script>
<!-- https://getbootstrap.com/ -->
<script>
    var btn = document.querySelector(".btnaddcategory");
    btn.onclick = function () {
        var form = document.querySelector(".addcategory");
        var parentform = form.parentElement;
        if (parentform.classList.contains("none")) {
            parentform.classList.remove("none");
        } else {
            parentform.classList.add("none");
        }
    }
</script>
<script>
    function deletecategory(id) {
        let choice = confirm("Bạn có muốn xóa doanh mục này không?");
        if (choice == true) {
            window.location = "<%=request.getContextPath()%>/HandleProductAdmin?action=removeCategory&idcategory="+id;
        } else {

        }
    }
</script>
<script>
    function deleteproduct(id) {
        let choice = confirm("Bạn có muốn xóa sản phẩm này không?");
        if (choice == true) {
            window.location = "<%=request.getContextPath()%>/HandleProductAdmin?action=removeProduct&idproduct="+id;
        } else {

        }
    }
</script>
</body>
</html>
