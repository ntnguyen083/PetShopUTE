<%@ page import="bean.CategoryBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="murach.DAO.CategoryDAO" %>
<%@ page import="bean.UserBean" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 11/20/2022
  Time: 4:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Pet Shop</title>
    <link rel="icon" type="image/png" href="./assets/images/pet-shop-center-icon_24877-3877.png"/>
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="assets/css/style-starter.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="./assets/fonts/font-awesome-4.7.0/css/font-awesome.css">
</head>
<body>
<!-- header -->
<header id="site-header" class="fixed-top nav-fixed">
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light">
            <a class="navbar-brand" href="index.jsp">
                <i class="fas fa-dog"></i>Pet <span>Shop</span>
            </a>
            <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon fa icon-expand fa-bars"></span>
                <span class="navbar-toggler-icon fa icon-close fa-times"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarScroll">
                <ul class="navbar-nav mx-auto my-2 my-lg-0 navbar-nav-scroll">
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="index.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="<%=request.getContextPath()%>/shop">Shop</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="about.jsp">About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="services.jsp">Services</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="contact.jsp">Contact</a>
                    </li>
                    <li class="nav-item nav--login">
                        <a class="nav-link" href="login.jsp">Sign in</a>
                        <%UserBean user = (UserBean) session.getAttribute("user"); %>
                        <%if(user!=null){%>
                        <p class="hellouser">Xin chào,<%=user.getUserName()%></p>
                        <%}%>
                    </li>
                    <li class="nav-item btn-signout">
                        <%if(user!=null){%>
                        <i class="fa fa-sign-out" aria-hidden="true"></i>
                        <%}%>
                    </li>
                </ul>
            </div>
            <!-- toggle switch for light and dark theme -->
            <div class="cont-ser-position">
                <nav class="navigation">
                    <div class="theme-switch-wrapper">
                        <label class="theme-switch" for="checkbox">
                            <input type="checkbox" id="checkbox">
                            <div class="mode-container">
                                <i class="gg-sun"></i>
                                <i class="gg-moon"></i>
                            </div>
                        </label>
                    </div>
                </nav>
            </div>

            <!-- //toggle switch for light and dark theme -->
        </nav>
    </div>
</header>
<!-- //header -->

<div class="bg-dark cate-container">
    <div class="container px-4 px-lg-5 my-5">
        <ul class="category row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4">
            <c:forEach items="${listCategory}" var="cate">
                <li class="category-item">
                    <a href="<%=request.getContextPath()%>/GetProductByCategoryID?idCategory=${cate.idCategory}" class="category-item--link">${cate.category}</a>
                </li>
            </c:forEach>
        </ul>

    </div>
</div>
<!-- Section-->
<section class="py-5">
    <div class="text-center text-white">
        <h1 class="display-4 fw-bolder">Product</h1>
    </div>
    <div class="container px-4 px-lg-5 mt-5">
        <div class="btnViewCart btn-outline-dark cartatshop">
            <a href="<%=request.getContextPath()%>/viewcart?ship=0" class="ViewCartLink"><i class="bi-cart-fill me-1"></i>
                Cart
            </a>
        </div>
        <form action="<%=request.getContextPath()%>/SearchProduct" method="post" class="d-flex search-header">
            <input class="form-control" name="search" type="search" placeholder="Enter Keyword..." aria-label="Search" required="">
            <button class="btn btn-style" type="submit">Search</button>
        </form>
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
            <c:choose>
                <c:when test="${listProductByID != null}">
                    <c:forEach items="${listProductByID}" var="product">
                        <div class="col mb-5">
                            <div class="card h-100 product-form">
                                <a href="product.jsp" class="profile-product">
                                    <!-- Product image-->
                                    <img class="card-img-top" src="./assets/images/${product.urlImage}" alt="...">
                                    <!-- Product details-->
                                    <div class="card-body p-4">
                                        <div class="text-center product-text">
                                            <!-- Product name-->
                                            <h5 class="fw-bolder">${product.name}</h5>
                                            <!-- Product price-->
                                            <span>${product.price}</span>
                                        </div>
                                    </div>
                                    <!-- Product actions-->
                                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="<%=request.getContextPath()%>/bill?idProduct=${product.id}">Add to cart</a></div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <c:choose>
                        <c:when test="${listProductSearch != null}">
                            <c:forEach items="${listProductSearch}" var="search">
                                <div class="col mb-5">
                                    <div class="card h-100 product-form">
                                        <a href="<%=request.getContextPath()%>/ViewProduct?idproduct=${search.id}" class="profile-product">
                                            <!-- Product image-->
                                            <img class="card-img-top" src="./assets/images/${search.urlImage}" alt="...">
                                            <!-- Product details-->
                                            <div class="card-body p-4">
                                                <div class="text-center product-text">
                                                    <!-- Product name-->
                                                    <h5 class="fw-bolder">${search.name}</h5>
                                                    <!-- Product price-->
                                                    <span>$${search.price}</span>
                                                </div>
                                            </div>
                                            <!-- Product actions-->
                                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="<%=request.getContextPath()%>/bill?idProduct=${product.id}">Add to cart</a></div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${listProduct}" var="product">
                                <div class="col mb-5">
                                    <div class="card h-100 product-form">
                                        <a href="<%=request.getContextPath()%>/ViewProduct?idproduct=${product.id}" class="profile-product">
                                            <!-- Product image-->
                                            <img class="card-img-top" src="./assets/images/${product.urlImage}" alt="...">
                                            <!-- Product details-->
                                            <div class="card-body p-4">
                                                <div class="text-center product-text">
                                                    <!-- Product name-->
                                                    <h5 class="fw-bolder">${product.name}</h5>
                                                    <!-- Product price-->
                                                    <span>$${product.price}</span>
                                                </div>
                                            </div>
                                            <!-- Product actions-->
                                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="<%=request.getContextPath()%>/bill?idProduct=${product.id}&action=default">Add to cart</a></div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</section>
<!-- Footer-->
<footer class="py-5 bg-dark">
    <div class="container"><p class="m-0 text-center text-white">Copyright by Vngocz &amp; Trguyen </p></div>
</footer>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
<!-- Code injected by live-server -->
<script>
    // <![CDATA[  <-- For SVG support
    if ('WebSocket' in window) {
        (function () {
            function refreshCSS() {
                var sheets = [].slice.call(document.getElementsByTagName("link"));
                var head = document.getElementsByTagName("head")[0];
                for (var i = 0; i < sheets.length; ++i) {
                    var elem = sheets[i];
                    var parent = elem.parentElement || head;
                    parent.removeChild(elem);
                    var rel = elem.rel;
                    if (elem.href && typeof rel != "string" || rel.length == 0 || rel.toLowerCase() == "stylesheet") {
                        var url = elem.href.replace(/(&|\?)_cacheOverride=\d+/, '');
                        elem.href = url + (url.indexOf('?') >= 0 ? '&' : '?') + '_cacheOverride=' + (new Date().valueOf());
                    }
                    parent.appendChild(elem);
                }
            }
            var protocol = window.location.protocol === 'http:' ? 'ws://' : 'wss://';
            var address = protocol + window.location.host + window.location.pathname + '/ws';
            var socket = new WebSocket(address);
            socket.onmessage = function (msg) {
                if (msg.data == 'reload') window.location.reload();
                else if (msg.data == 'refreshcss') refreshCSS();
            };
            if (sessionStorage && !sessionStorage.getItem('IsThisFirstTime_Log_From_LiveServer')) {
                console.log('Live reload enabled.');
                sessionStorage.setItem('IsThisFirstTime_Log_From_LiveServer', true);
            }
        })();
    }
    else {
        console.error('Upgrade your browser. This Browser is NOT supported WebSocket for Live-Reloading.');
    }

</script>
<%-- Script login--%>
<script>
    var login = document.querySelector(".nav--login > p");
    if(login.classList.contains("hellouser"))
    {
        var sublogin = document.querySelector(".nav--login .nav-link");
        sublogin.style.display = "none";
    }
</script>

<script>
    var btnsignout = document.querySelector(".btn-signout");
    btnsignout.onclick = function ()
    {
        let choice = confirm("Bạn có muốn đăng xuất?");
        if (choice == true) {
            window.location = "<%=request.getContextPath()%>/LogoutServlet";
        } else {

        }
    }
</script>
</body>
</html>