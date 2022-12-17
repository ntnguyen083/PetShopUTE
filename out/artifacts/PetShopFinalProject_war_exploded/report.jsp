<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/6/2022
  Time: 11:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta http-equiv="X-UA-Compatible" content="ie=edge" />
  <title>Accounts </title>
  <link
          rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Roboto:400,700"
  />
  <!-- https://fonts.google.com/specimen/Roboto -->
  <link rel="stylesheet" href="admin/assets/css/fontawesome.min.css" />
  <!-- https://fontawesome.com/ -->
  <link rel="stylesheet" href="admin/assets/css/bootstrap.min.css" />
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
      <a class="navbar-brand" href="admin.jsp">
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
            <a class="nav-link" href="admin.jsp">
              <i class="fas fa-tachometer-alt"></i> Dashboard
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item dropdown">
            <a
                    class="nav-link active dropdown-toggle"
                    href="#"
                    id="navbarDropdown1"
                    role="button"
                    data-toggle="dropdown"
                    aria-haspopup="true"
                    aria-expanded="false"
            >
              <i class="far fa-file-alt"></i>
              <span> Reports </span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="adminproduct.jsp">
              <i class="fas fa-shopping-cart"></i> Products
            </a>
          </li>

          <li class="nav-item">
            <a class="nav-link" href="accounts_admin.jsp">
              <i class="far fa-user"></i> Accounts
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
        <h2 class="tm-block-title">Orders List</h2>
        <table class="table">
          <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">STATUS</th>
            <th scope="col">USERNAME</th>
            <th scope="col">TOTALPRICE</th>
            <th scope="col">EMAIL</th>
            <th scope="col">ADDRESS</th>
            <th scope="col">PHONENUMBER</th>
          </tr>
          </thead>
          <tbody>
          <c:forEach items="${listReport}" var="report">
          <tr>
            <th scope="row"><b>#${report.getId()}</b></th>
            <td style="display: flex; align-items: center">
              <c:choose>
                <c:when test="${report.getStatus()==1}">
                  <div class="tm-status-circle moving">
                  </div>
                  <span>Checkout</span>
                </c:when>
                <c:otherwise>
                  <div class="tm-status-circle pending">
                  </div>
                  <span>Shopping</span>
                </c:otherwise>
              </c:choose>
            </td>
            <td><b>${report.getUsername()}</b></td>
            <td><b>${report.getTotalPrice()}</b></td>
            <td><b>${report.getEmail()}</b></td>
            <td><b>${report.getAddress()}</b></td>
            <td><b>${report.getPhoneNumber()}</b></td>
          </tr>
          </c:forEach>
          </tbody>
        </table>
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
</div>

<script src="/..admin/assets/js/jquery-3.3.1.min.js"></script>
<!-- https://jquery.com/download/ -->
<script src="admin/assets/js/bootstrap.min.js"></script>
<!-- https://getbootstrap.com/ -->
</body>
</html>
