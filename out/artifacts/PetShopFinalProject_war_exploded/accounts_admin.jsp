<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/5/2022
  Time: 9:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<div class="" id="home">
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
                        <a class="nav-link" href="<%=request.getContextPath()%>/AdminProduct">
                            <i class="fas fa-shopping-cart"></i> Products
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link active" href="<%=request.getContextPath()%>/ListAdminAccount">
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
        <div class="col-12 tm-block-col">
            <div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll">
                <h2 class="tm-block-title">List Admin Account</h2>
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">USERNAME</th>
                        <th scope="col">EMAIL</th>
                        <th scope="col">ADDRESS</th>
                        <th scope="col">PHONENUMBER</th>
                        <th scope="col">PASSWORD</th>
                        <th scope="col">&nbsp;</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${listAdmin}" var="admin">
                        <tr>
                            <th scope="row"><b>#${admin.getIdUser()}</b></th>
                            <td><b>${admin.getUserName()}</b></td>
                            <td><b>${admin.getEmail()}</b></td>
                            <td><b>${admin.getAddress()}</b></td>
                            <td><b>${admin.getPhoneNumber()}</b></td>
                            <td><b>${admin.getPassWord()}</b></td>
                            <td class="text-center padlr-0">
                                <a onclick="deleteadmin(${admin.getIdUser()})" style="cursor: pointer" ;
                                   class="tm-product-delete-link">
                                    <i class="far fa-trash-alt tm-product-delete-icon"></i>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- row -->
        <div class="row tm-content-row" style="justify-content: space-around">
            <div class="tm-block-col tm-col-account-settings">
                <div class="tm-bg-primary-dark tm-block tm-block-settings">
                    <h2 class="tm-block-title">Create Admin's Account</h2>
                    <span>${messagecreate}</span>
                    <form action="<%=request.getContextPath()%>/creatAdminAcount" class="tm-signup-form row"
                          method="post">
                        <div class="form-group col-lg-6">
                            <label for="username">Account Name</label>
                            <input
                                    id="username"
                                    name="username"
                                    type="text"
                                    class="form-control validate"
                            />
                        </div>
                        <div class="form-group col-lg-6">
                            <label for="email">Account Email</label>
                            <input
                                    id="email"
                                    name="email"
                                    type="email"
                                    class="form-control validate"
                            />
                        </div>
                        <div class="form-group col-lg-6">
                            <label for="password">Password</label>
                            <input
                                    id="password"
                                    name="password"
                                    type="password"
                                    class="form-control validate"
                            />
                        </div>
                        <div class="form-group col-lg-6">
                            <label for="password2">Re-enter Password</label>
                            <input
                                    id="password2"
                                    name="password2"
                                    type="password"
                                    class="form-control validate"
                            />
                        </div>
                        <div class="form-group col-lg-6">
                            <label for="phone">Phone</label>
                            <input
                                    id="phone"
                                    name="phone"
                                    type="tel"
                                    class="form-control validate"
                            />
                        </div>
                        <div class="form-group col-lg-6">
                            <label for="address">Address</label>
                            <input
                                    id="address"
                                    name="address"
                                    type="text"
                                    class="form-control validate"
                            />
                        </div>
                        <div class="col-12">
                            <button
                                    type="submit"
                                    class="btn btn-primary btn-block text-uppercase"
                            >
                                Create Account
                            </button>
                        </div>
                    </form>
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
</div>

<script src="/..admin/assets/js/jquery-3.3.1.min.js"></script>
<!-- https://jquery.com/download/ -->
<script src="admin/assets/js/bootstrap.min.js"></script>
<!-- https://getbootstrap.com/ -->
<script>
    function deleteadmin(id) {
        let choice = confirm("Bạn có muốn xóa admin này không?");
        if (choice == true) {
            window.location = "<%=request.getContextPath()%>/deleteAdmin?idAdmin="+id;
        } else {

        }
    }
</script>
</body>
</html>
