<%@ page import="bean.UserBean" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 11/20/2022
  Time: 4:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Pet Shop</title>
    <link rel="icon" type="image/png" href="./assets/images/pet-shop-center-icon_24877-3877.png"/>
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet"/>
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="assets/css/style-starter.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="./assets/fonts/font-awesome-4.7.0/css/font-awesome.css">
</head>
<body>

<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="#!">Pet Shop</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span
                class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
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
                    <%if (user != null) {%>
                    <p class="hellouser">Xin chào,<%=user.getUserName()%>
                    </p>
                    <%}%>
                </li>
                <li class="nav-item btn-signout">
                    <%if (user != null) {%>
                    <i class="fa fa-sign-out" aria-hidden="true"></i>
                    <%}%>
                </li>
            </ul>
            <div class="btnViewCart btn-outline-dark">
                <a href="<%=request.getContextPath()%>/viewcart?idProduct=${product.id}&ship=0" class="ViewCartLink"><i
                        class="bi-cart-fill me-1"></i>
                    Cart
                </a>
            </div>
        </div>
    </div>
</nav>
<!-- Product section-->
<section class="py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="row gx-4 gx-lg-5 align-items-center">
            <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="./assets/images/${product.urlImage}"
                                       alt="..."/></div>
            <div class="col-md-6">

                <h1 class="display-5 fw-bolder">${product.name}</h1>
                <div class="fs-5 mb-5">
                    <span>Price: $${product.price}</span>
                </div>
                <p class="lead">Decription: ${product.description}</p>
                <form class="d-flex" action="<%=request.getContextPath()%>/bill?idProduct=${product.id}" method="post">
                    <div>
                        <div class="form-outline amountform">
                            <input type="text" id="amount" name="amount" value="1" class="form-control form-control-lg amountinput"/>
                        </div>
                    </div>
                    <button class="btn btn-outline-dark flex-shrink-0" type="submit">
                        <i class="bi-cart-fill me-1"></i>
                        Add to cart
                    </button>
                </form>
            </div>
        </div>
    </div>
</section>
<!-- Related items section-->
<section class="py-5 bg-light">
    <div class="container px-4 px-lg-5 mt-5">
        <h2 class="fw-bolder mb-4">Related products</h2>
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
            <c:forEach items="${listRelatedProduct}" var="relatedProduct">
                <div class="col mb-5">
                    <a class="card h-100"
                       href="<%=request.getContextPath()%>/ViewProduct?idproduct=${relatedProduct.id}">
                        <!-- Product image-->
                        <img class="card-img-top" src="./assets/images/${relatedProduct.urlImage}" alt="..."/>
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">${relatedProduct.name}</h5>
                                <!-- Product price-->
                                    ${relatedProduct.price}
                            </div>
                        </div>
                    </a>
                </div>
            </c:forEach>

        </div>
    </div>
</section>
<!-- Footer-->
<footer class="py-5 bg-dark">
    <div class="container"><p class="m-0 text-center text-white">Copyright by Vngocz & TrNguyen</p></div>
</footer>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
<script src="assets/js/shopping-cart.js"></script>
<script src="assets/js/script.js"></script>
<%-- Script login--%>
<script>
    var login = document.querySelector(".nav--login > p");
    if (login.classList.contains("hellouser")) {
        var sublogin = document.querySelector(".nav--login .nav-link");
        sublogin.style.display = "none";
    }
</script>

<script>
    var btnsignout = document.querySelector(".btn-signout");
    btnsignout.onclick = function () {
        window.location = "./login.jsp";
    }
</script>
</body>
</html>
