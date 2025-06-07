<%-- 
    Document   : dashboard-admin
    Created on : Mar 2, 2024, 9:01:01 PM
    Author     : Asus
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Organic Food</title>
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="../../css/manager.css">
    <link rel="stylesheet" type="text/css" href="../../css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script src="../../js/bootstrap.bundle.min.js"></script>
    <style>
        .card p, span {
            font-size: 15px;
            margin: 3px 3px;
        }
    </style>
</head>
<body>
<jsp:include page="header-user.jsp"></jsp:include>
<section class="h-100" style="background-color: #eee; padding-top: 20px">
    <div class="container h-100 py-5">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-10">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h3 class="fw-normal mb-0 text-black">Giỏ hàng</h3>
                </div>
                <c:forEach items="${sessionScope.cart.list}" var="list">
                    <div class="card rounded-2 mb-2">
                        <div class="card-body p-3">
                            <div class="row d-flex justify-content-between align-items-center">
                                <div class="col-md-2 col-lg-2 col-xl-2">
                                    <img
                                            src="${list.product.image}"
                                            class="img-fluid rounded-3">
                                </div>
                                <div class="col-md-3 col-lg-3 col-xl-3">
                                    <p class="lead fw-normal mb-2">${list.product.name}</p>
                                    <p><span class="text-muted">Đơn giá: </span><fmt:formatNumber value="${list.price}"
                                                                                                  type="number"
                                                                                                  groupingUsed="true"/>
                                    </p>
                                </div>
                                <div class="col-md-3 col-lg-3  d-flex">
                                    <div id="quantity-container" class="form-control form-control-sm"
                                         style="width: 80%; display: flex; justify-content: space-around">
                                        <div>
                                            <a class="btn btn-primary" id="btn-decrease"
                                               href="decreasequantity?product_id=${list.product.product_id}">-</a>
                                        </div>
                                        <div style="width: 60%">
                                            <form action="updatequantity?product_id=${list.product.product_id}"
                                                  method="post">
                                                <input style="width: 100%; margin-top: 4px" type="text" name="quantity"
                                                       id="quantity-input" value="${list.amount}">
                                            </form>
                                        </div>
                                        <div>
                                            <a class="btn btn-primary" id="btn-decrease"
                                               href="addtocart?product_id=${list.product.product_id}"
                                               onclick="increaseQuantity()">+</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                    <c:set var="total" value="${list.amount * list.price}" />
                                    <h5 class="mb-0"><fmt:formatNumber value="${total}" type="number" groupingUsed="true" /></h5>
                                </div>
                                <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                                    <a href="deletefromcart?product_id=${list.product.product_id}"
                                       class="text-danger"><i style="font-size: 25px" class="lni lni-trash-can"></i></a>
                                </div>
                                <div>
                                    <p>Product ID: ${list.product.product_id } </p>
                                </div>
                                <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                                    <a href="#!" class="text-danger"><i class="lni lni-trash fa-lg"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <div class="card">
                    <div class="card-body" style="display: flex; justify-content: space-between">
                        <div>
                            <p>Tổng giá trị đơn hàng:<fmt:formatNumber value="${cart.total_money}" type="number" groupingUsed="true" /></p>
                        </div>
                        <c:choose>
                            <c:when test="${sessionScope.user != null}">
                                <c:if test="${cart.total_money == 0 || cart.total_money == null}">
                                    <a href="../../product" type="button" class="btn btn-warning btn-block btn-center">Đặt
                                        hàng</a>
                                </c:if>
                                <c:if test="${cart.total_money != 0 && cart.total_money != null}">
                                    <a type="button" class="btn btn-warning btn-block btn-center"
                                       onclick="ConfirmInfo('${sessionScope.user.user_id}', '${user.fullname}', '${user.phone_number}', '${user.email}', '${user.address}', '${cart.total_money}')"
                                       data-bs-toggle="modal" data-bs-target="#confirmInfoModal"> Đặt hàng</a>
                                </c:if>
                            </c:when>
                            <c:when test="${sessionScope.user == null}">
                                <a href="../login.jsp" type="button" class="btn btn-warning btn-block btn-center">Đặt
                                    hàng</a>
                            </c:when>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Confirm order information -->
<div id="confirmInfoModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="order" method="post">
                <div class="modal-header">
                    <h4 class="modal-title">Confirm order information</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <input type="hidden" name="user_id" id="user_idInput"/>
                        <input type="hidden" name="total_money" id="total_moneyInput"/>
                        <label>Họ và tên</label>
                        <input name="fullname" type="text" class="form-control" id="fullnameInput" required>
                    </div>
                    <div class="form-group">
                        <label>Số điện thoại</label>
                        <input name="phone_number" type="text" class="form-control" id="phone_numberInput" required>
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <input name="email" type="text" class="form-control" id="emailInput" required>
                    </div>
                    <div class="form-group">
                        <label>Địa chỉ</label>
                        <input name="address" type="text" class="form-control" id="addressInput" required>
                    </div>
                    <div class="form-group">
                        <label>Ghi chú</label>
                        <textarea rows="5" name="note" type="text" class="form-control"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="reset" class="btn btn-default" data-bs-dismiss="modal" value="Cancel">
                    <input type="submit" class="btn btn-success" value="Xác nhận">
                </div>
            </form>
        </div>
    </div>
</div>

<jsp:include page="../footer.jsp"></jsp:include>

<script>
    function ConfirmInfo(user_id, fullname, phone_number, email, address, total_money) {
        document.getElementById('user_idInput').value = user_id;
        document.getElementById('phone_numberInput').value = phone_number;
        document.getElementById('fullnameInput').value = fullname;
        document.getElementById('emailInput').value = email;
        document.getElementById('addressInput').value = address;
        document.getElementById('total_moneyInput').value = total_money;
    }
</script>
</body>

</html>
