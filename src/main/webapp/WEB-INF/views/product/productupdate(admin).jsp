    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <html>
    <head>
        <% request.setCharacterEncoding("UTF-8"); %>
        <%@include file="/WEB-INF/inc/header.jsp" %>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <style>
            .container {
                width: 100%;
                margin: auto;
            }

            .product-title {
                display: flex;
                justify-content: space-between;
                align-items: center;
                font-size: 24px;
                font-weight: bold;
                margin-top: 10px;
            }

            .product-price {
                font-size: 18px;
                color: green;
                margin-top: 10px;
            }

            .product-description {
                margin-top: 20px;
            }

            .product-buttons {
                margin-top: 20px;
            }

            .col-md-6 {
                border: 1px solid #ddd;
                box-shadow: 0 0 0 0;
                padding: 20px;
            }

            .product-options {
                margin-top: 20px;
            }

            .product-quantity {
                margin-top: 10px;
            }
        </style>


    </head>
    <body>
    <%@include file="/WEB-INF/inc/top.jsp" %>
    <div class="container">
        <h1 class="text-center">상품 상세 페이지</h1>
        <form action="/product/productModify(admin)" method="post"  enctype="multipart/form-data">
            <div class="row">
                <div class="col-md-6">
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label for="img" class="form-label">상품 이미지</label>
                            <input type="file" class="form-control" name="imgFile" id="img" accept="image/*" required>
                        </div>
                    </div>
                </div>
                <div class="col-md-6" style="height: 500px">
                    <div class="product-title">
                        <input type="hidden" name="productId" value="${product.productId}">

                        <input type="text" class="form-control" name="productName" value="${product.productName}" placeholder="상품명"
                               style="width:30%">

                    </div>
                    <input type="text" class="form-control" name="productPrice" value="${product.productPrice}" placeholder="가격"
                           style="width:30%">
                    <hr>
                    <input type="text" class="form-control" name="productDesc" value="${product.productDesc}" placeholder="상품상세설명"
                           style="height:40%">
                    <hr>
                    <input type="number" class="form-control" name="productAmount" value="${product.productAmount}" placeholder="물품 재고량 수정"
                           style="height:40%">
                    <hr>

                    <div class="product-buttons">
                        <button type="submit" class="btn btn-primary">수정완료</button>
                    </div>
                </div>
            </div>
        </form>
    </div>



    </body>


    </html>
