
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

    <% request.setCharacterEncoding("UTF-8"); %>
<title>결제페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

    <style>

        .paycontainer {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }


        .container {
            margin-top: 20px;
        }

        .address {
            border: 1px solid #ddd;
            padding: 20px;
        }

        .bill {
            border: 1px solid #ddd;
            box-shadow: 0 0 0 0;
            padding: 20px;
        }
    </style>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>

<div class="container">

        <div class="route mt-3">
            장바구니 > 주문결제 > 주문완료
        </div>

        <div class="paycontainer mt-3">
            <div class="address col-md-8">
                <h2>배송지정보</h2>
                <hr>
                <form>
                    <div class="mb-3">
                        <label for="recipientName" class="form-label">받는사람</label>
                        <input type="text" class="form-control" id="recipientName">
                    </div>
                    <div class="mb-3">
                        <label for="phoneNumber" class="form-label">휴대폰 번호</label>
                        <input type="tel" class="form-control" id="phoneNumber" placeholder="숫자만 입력">
                    </div>
                    <div class="mb-3">
                        <label for="sample6_address" class="form-label">주소입력</label>
                        <input type="text" class="form-control" id="sample6_postcode" placeholder="우편번호">
                        <input class="btn btn-primary mt-2" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
                        <input type="text" class="form-control mt-2" id="sample6_address" placeholder="주소">
                        <input type="text" class="form-control" id="sample6_detailAddress" placeholder="상세주소">
                        <input type="text" class="form-control" id="sample6_extraAddress" placeholder="참고항목">
                    </div>

                    <div class="mb-3">
                        <label for="deliveryRequest" class="form-label">배송 요청 사항</label>
                        <select class="form-select" id="deliveryRequest">
                            <option value="">배송 시 요청 사항을 선택해주세요.</option>
                            <option value="경비실에 맡겨주세요.">경비실에 맡겨주세요.</option>
                            <option value="택배보관함에 넣어놔주세요.">택배보관함에 넣어놔주세요.</option>
                            <option value="집 현관문 앞에 놓아주세요.">집 현관문 앞에 놓아주세요.</option>
                        </select>
                    </div>
                </form>
            </div>
            <div class="bill col-md-4">
                <div class="mb-3 d-flex justify-content-between">
                    <span>총 상품금액 : </span>
                    <span>배송비 : </span>
                </div>
                <hr>
                <div class="mb-3">
                    <span>결제 예정 금액 : </span>
                </div>
                <button class="btn btn-primary" style="width: 100%;">결제하기</button>
            </div>
        </div>
    </div>

<%--https://postcode.map.daum.net/guide 다음우편주소api--%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = '';
                var extraAddr = '';
                if (data.userSelectedType === 'R') {
                    addr = data.roadAddress;
                } else {
                    addr = data.jibunAddress;
                }
                if(data.userSelectedType === 'R'){
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if(extraAddr !== ''){
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