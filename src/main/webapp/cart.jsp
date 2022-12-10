<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 11/20/2022
  Time: 4:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Pet Shop</title>
    <link rel="icon" type="image/png" href="./assets/images/pet-shop-center-icon_24877-3877.png"/>
    <!-- google font -->
    <link
            href="//fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200;0,300;0,400;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet">
    <!-- Template CSS Style link -->
    <link rel="stylesheet" href="assets/css/style-starter.css">
</head>
<body>
<section class="h-100 h-custom" style="background-color: #d2c9ff;">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-12">
                <div class="card card-registration card-registration-2" style="border-radius: 15px;">
                    <div class="card-body p-0">
                        <div class="row g-0">
                            <div class="col-lg-8">
                                <div class="p-5">
                                    <div class="d-flex justify-content-between align-items-center mb-5">
                                        <h1 class="fw-bold mb-0 text-black">Shopping Cart</h1>
                                        <h6 class="mb-0 text-muted">${listOder.size()} items</h6>
                                    </div>

                                    <div class="" style="padding-bottom: 30px">
                                        <h6 class="mb-0"><a href="shop.jsp" class="text-body"><i
                                                class="fas fa-long-arrow-alt-left me-2"></i>Back to shop</a></h6>
                                    </div>
                                    <div class="row mb-4 d-flex justify-content-between align-items-center">
                                        <div class="col-md-2 col-lg-2 col-xl-2" style="text-align: center">
                                            Image
                                        </div>
                                        <div class="col-md-3 col-lg-3 col-xl-3" style="text-align: center">
                                            Name
                                        </div>
                                        <div class="col-md-3 col-lg-3 col-xl-2 d-flex" style="text-align: center">
                                            Quality
                                        </div>
                                        <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1" style="text-align: center">
                                            Total Price
                                        </div>
                                        <div class="col-md-1 col-lg-1 col-xl-1 text-end" style="text-align: center">

                                        </div>
                                    </div>

                                    <c:forEach items="${listOder}" var="oder">
                                        <hr class="my-4">
                                        <div class="row mb-4 d-flex justify-content-between align-items-center">
                                            <div class="col-md-2 col-lg-2 col-xl-2">
                                                <a href="<%=request.getContextPath()%>/ViewProduct?idproduct=${oder.getIdProduct()}">
                                                    <img
                                                            src="./assets/images/${oder.getUrlImage()}"
                                                            class="img-fluid rounded-3" alt="Cotton T-shirt">
                                                </a>
                                            </div>
                                            <div class="col-md-3 col-lg-3 col-xl-3">
                                                <h6 class="text-muted">Shirt</h6>
                                                <h6 class="text-black mb-0">${oder.getNameProduct()}</h6>
                                            </div>
                                            <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                                                <a class="btn btn-link px-2"
                                                   href="<%=request.getContextPath()%>/updatecart?idcart=${oder.getIdCart()}&currentAmount=${oder.getAmount()}&caseAmount=down">
                                                        <%--                                                        onclick="this.parentNode.querySelector('input[type=number]').stepDown()">--%>
                                                    <i class="fas fa-minus"></i>
                                                </a>

                                                    <%--                                                <input id="form" min="0" name="quantity" value="${oder.getAmount()}" type="number"--%>
                                                    <%--                                                       class="form-control form-control-sm" />--%>
                                                <a class="form-control form-control-sm amount-cart">${oder.getAmount()}</a>

                                                <a class="btn btn-link px-2"
                                                   href="<%=request.getContextPath()%>/updatecart?idcart=${oder.getIdCart()}&currentAmount=${oder.getAmount()}&caseAmount=up">
                                                        <%--                                                        onclick="this.parentNode.querySelector('input[type=number]').stepUp()">--%>
                                                    <i class="fas fa-plus"></i>
                                                </a>
                                            </div>
                                            <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                                <h6 class="mb-0">$ ${oder.getTotalPrice()}</h6>
                                            </div>
                                            <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                                                    <%--                                                <a href="<%=request.getContextPath()%>/deletecart?idcart=${oder.getIdCart()}" class="text-muted cartdeletebtn">--%>
                                                    <%--                                                    <i class="fas fa-times"></i>--%>
                                                    <%--                                                </a>--%>
                                                <a onclick="deletecart(${oder.getIdCart()})"
                                                   class="text-muted cartdeletebtn">
                                                    <i class="fas fa-times"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </c:forEach>
                                    <hr class="my-4">
                                </div>
                            </div>
                            <div class="col-lg-4 bg-grey">
                                <div class="p-5">
                                    <form action="./checkout" method="post">
                                        <h3 class="fw-bold mb-5 mt-2 pt-1">Summary</h3>
                                        <hr class="my-4">

                                        <div class="d-flex justify-content-between mb-4">
                                            <h5 class="text-uppercase">${listOder.size()} items</h5>
                                            <h5>$ ${billPrice}</h5>
                                        </div>

                                        <h5 class="text-uppercase mb-3">Shipping</h5>

                                        <div class="mb-4 pb-2">
                                            <select multiple class="select" name="ship"
                                                    onchange="validateSelectBox(this)">
                                                <c:forEach items="${listShip}" var="ship" varStatus="loop">
                                                    <option value="${loop.index}">${ship.getType()}-
                                                        $${ship.getPrice()}</option>
                                                </c:forEach>
                                            </select>
                                        </div>

                                        <h5 class="text-uppercase mb-3">Address</h5>
                                        <div class="mb-4">
                                            <div class="form-outline">
                                                <input type="text" id="address" name="address"
                                                       class="form-control form-control-lg"/>
                                                <label class="form-label" for="address">Enter your address</label>
                                            </div>
                                        </div>

                                        <h5 class="text-uppercase mb-3">Phone Number</h5>
                                        <div class="mb-4">
                                            <div class="form-outline">
                                                <input type="text" id="phonenumber" name="phonenumber"
                                                       class="form-control form-control-lg"/>
                                                <label class="form-label" for="phonenumber">Enter your phone
                                                    number</label>
                                            </div>
                                        </div>

                                        <hr class="my-4">

                                        <div class="d-flex justify-content-between mb-5">
                                            <h5 class="text-uppercase">Total price</h5>
                                            <h5>$ ${totalbillPrice}</h5>
                                        </div>

                                        <button type="submit" class="btn btn-dark btn-block btn-lg"
                                                data-mdb-ripple-color="dark">Register
                                        </button>

                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
<script language="javascript">
    function validateSelectBox(obj) {
        // Lấy danh sách các options
        var options = obj.children;

        // lặp qua từng option và kiểm tra thuộc tính selected
        for (var i = 0; i < options.length; i++) {
            if (options[i].selected) {
                window.location = "./viewcart?ship=" + i;
            }
        }
    }
</script>
<script>
    function deletecart(id) {
        let choice = confirm("Bạn có muốn xóa sản phẩm?");
        if (choice == true) {
            window.location = "<%=request.getContextPath()%>/deletecart?idcart=" + id;
        } else {

        }
    }
</script>
</html>
