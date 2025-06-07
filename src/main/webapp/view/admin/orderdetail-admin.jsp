<%-- 
    Document   : orderdetail-admin
    Created on : Mar 7, 2024, 1:32:47 AM
    Author     : Asus
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin</title>
        <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="../../css/admin_style.css">
        <link rel="stylesheet" href="../../css/manager.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <style>
            .datatable-table td, th {
                padding: 8px; /* Adjust the value to set the desired spacing */
            }

            .modal-add {
                font-size: 12px;
            }

            .form-group input,
            .form-group textarea {
                font-size: 11px; /* You can adjust the font size as needed */
            }

            .scrollable-table {
                max-height: 600px; /* Đặt chiều cao tối đa của bảng */
                overflow: auto; /* Tạo thanh cuộn nếu bảng vượt quá kích thước tối đa */
            }
        </style>
        <script src="../../js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <div class="wrapper">
            <jsp:include page="sidebar.jsp"></jsp:include>
                <div style="" class="main" id="layoutSidenav_content">
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Order Detail</h1>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                List of products
                            </div>
                            <div class="card-body scrollable-table">
                                <table id="datatablesSimple" class="datatable-table" >
                                    <thead>
                                        <tr style="font-size: 19px">
                                            <th>Product name</th>
                                            <th style="width: 15%">Image</th>
                                            <th style="width: 15%">Quantity</th>
                                            <th style="width: 15%">Unit price</th>
                                            <th style="width: 25%">Total amount</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${requestScope.listDetail}" var = "Detail">
                                        <tr style="font-size: 15px">
                                            <td>${Detail.name}</td>
                                            <td><img style="width: 50%" src="${Detail.image}"></td>
                                            <td>${Detail.amount}</td>
                                            <td><fmt:formatNumber value="${Detail.price}" type="number" groupingUsed="true" />đ</td>
                                            <td><fmt:formatNumber value="${Detail.price * Detail.amount}" type="number" groupingUsed="true" />đ</td>
                                        </tr>  
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="card-footer">
                            <p>Total amount of order: <fmt:formatNumber value="${Order.total_money}" type="number" groupingUsed="true" />đ</p>
                        </div>
                    </div>
                    <div>
                        <a style="text-decoration: none" href="listOrderAdmin">← Back</a>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
        <script type="text/javascript" src="../../js/hamburger.js"></script>
</html>
