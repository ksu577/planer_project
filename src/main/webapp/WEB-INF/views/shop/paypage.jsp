<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

    <% request.setCharacterEncoding("UTF-8"); %>
    <title>결제페이지</title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
        }

        .container {
            padding-top: 70px;
            margin-top: 20px;
            padding: 20px;
            border-radius: 8px; /* Add some border-radius for a softer look */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Add a subtle box shadow */
        }

        .route {
            font-size: 14px;
            color: #868e96; /* Set a muted color for the route text */
        }

        .address, .bill {
            border: 1px solid #ddd;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* Add a slight box shadow */
            padding: 20px;
            margin-top: 15px;
            border-radius: 8px; /* Add border-radius for a softer look */
        }

        form {
            margin-bottom: 0;
        }

        label {
            font-weight: bold;
        }

        input[type="text"],
        input[type="tel"],
        select {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ced4da;
            border-radius: 4px;
            box-sizing: border-box;
        }

        #deliveryRequest {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ced4da;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .btn-primary {
            width: 100%;
            padding: 10px;
        }

        @media (max-width: 768px) {
            .paycontainer {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .address, .bill {
                width: 100%;
            }

            .top-backgroun{
                height: 70px;
                background-color: #98dde3;
            }

        }

    </style>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>


<div class="top-backgroun">
</div>

<div class="container">

    <div class="route mt-3">
        장바구니 > 주문결제 > 주문완료
    </div>

    <div class="paycontainer mt-3">
        <form action="/shop/insertOrder.wow" id="cartForm" method="post">
            <div class="address col-md-8">
                <h2>배송지정보</h2>
                <hr>
                <div class="mb-3">
                    <label for="recipientName" class="form-label">수령인</label>
                    <input type="text" class="form-control" name="takeName" id="recipientName" value="${member.name}">
                </div>
                <div class="mb-3">
                    <label for="phoneNumber" class="form-label">휴대폰 번호</label>
                    <input type="tel" class="form-control" name="takeHp" id="phoneNumber"
                           placeholder="-를 제외한 숫자만 입력 (ex.01012345678)"
                           value="${member.phnum}">

                </div>
                <div class="mb-3">
                    <label for="sample6_address" class="form-label">주소입력</label>
                    <input type="text" class="form-control" name="takeMail" id="sample6_postcode" placeholder="우편번호">
                    <input class="btn btn-primary mt-2" type="button" onclick="sample6_execDaumPostcode()"
                           value="우편번호 찾기"><br>
                    <input type="text" class="form-control mt-2" name="takeAdd" id="sample6_address" placeholder="주소">
                    <input type="text" class="form-control" name="takeDetailAdd" id="sample6_detailAddress"
                           placeholder="상세주소">
                    <input type="text" class="form-control" name="takeAutoAdd" id="sample6_extraAddress"
                           placeholder="참고항목">
                </div>
                <div class="mb-3">
                    <label for="deliveryRequest" name="takeReq" class="form-label">배송 요청 사항</label>
                    <select class="form-select" name="takeReq" id="deliveryRequest">
                        <option value="">배송 시 요청 사항을 선택해주세요.</option>
                        <option value="경비실에 맡겨주세요.">경비실에 맡겨주세요.</option>
                        <option value="택배보관함에 넣어놔주세요.">택배보관함에 넣어놔주세요.</option>
                        <option value="집 현관문 앞에 놓아주세요.">집 현관문 앞에 놓아주세요.</option>
                    </select>
                </div>

            </div>
            <div class="bill">
                <h2>주문서</h2>
                <hr>
                <c:forEach var="cartItem" items="${listCart}">
                    <div class="cart-item">
                        <span> 상품명 : ${cartItem.productName}</span>
                        <hr>
                        <span> ${cartItem.amount}개 x </span>
                        <span> 가격 : ${cartItem.price} 원 = </span>
                        <span> 가격 : ${cartItem.price * cartItem.amount} 원</span>
                        <hr>
                    </div>
                </c:forEach>
                <br>
                <div class="mb-3 d-flex justify-content-between">
                    <span>총 상품금액 : ${sumMoney} 원</span>
                    <span>배송비 : 3000 원</span>
                </div>
                <hr>
                <div class="mb-3">
                    <span>결제 예정 금액 :  ${sumMoney + 3000}원</span>
                </div>
                <button type="button" class="btn btn-primary testbtn" style="width: 100%;" onclick="kpay()"
                        id="testbtn">결제하기
                </button>
            </div>
        </form>
    </div>
</div>

<%--https://postcode.map.daum.net/guide 다음우편주소api--%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function kpay() {
        var takeAddValue = document.getElementById("sample6_address").value;
        if (!takeAddValue || takeAddValue.trim() === "") {
            alert('주소가 비었습니다.');
            return false;
        } else {
            $.ajax({
                url: '/test/kakaopay.wow',
                dataType: 'json',
                type: 'post',
                contentType: 'application/json',
                success: function (data) {
                    const msg = JSON.parse(data.message);
                    console.log(msg); // tid
                    const next_redirect_pc_url = msg.next_redirect_pc_url;
                    window.open(next_redirect_pc_url, "_blank", "width=500, height=700");

                },
                error: function (error) {
                    alert(error);
                }
            });
        }
    }


    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function (data) {
                var addr = '';
                var extraAddr = '';
                if (data.userSelectedType === 'R') {
                    addr = data.roadAddress;
                } else {
                    addr = data.jibunAddress;
                }
                if (data.userSelectedType === 'R') {
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if (extraAddr !== '') {
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }

</script>
</body>
</html>
