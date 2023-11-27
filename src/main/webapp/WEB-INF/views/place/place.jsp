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
            padding-top: 80px;
            width: 1225px;
        }

        .selectcategory {
            text-align: right;

        }

        .carousel {
            width: 1200px;
            height: 600px;
            overflow: hidden;
        }

        .cell {
            background-color: white;
            border-radius: 20px;
            box-shadow: 0px 0px 4px 2px gainsboro;
        }

        .place-box a {
            text-decoration: none;
        }

        .place-box {
            text-decoration: none;
            cursor: pointer;
            margin: auto;
            width: 1200px;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            border-radius: 20px;
        }

        .place-box > div {
            width: calc(1200px / 4 - 20px);
            height: 400px;
            border: 0;
            box-shadow: 1px 1px 4px 1px black;
            border-bottom: 20px;
            overflow: hidden;
            margin: 10px;
        }

        .top {
            height: 80%;
            border-radius: 20px;
            box-shadow: 0px 0px 4px 2px gainsboro;
        }

        .bottom {
            display: flex;
            align-items: center;
            justify-content: space-between;
            height: 20%;
            color: rgb(0, 102, 0);
            flex-direction: column;
        }

        .bottom a {
            color: rgb(0, 102, 0);
            padding-top: 8px;
            padding-bottom: 8px;
            padding-left: 12px;
            padding-right: 12px;
            border-radius: 20px;
            cursor: pointer;
        }

        .modal {
            width: 800px;
            height: 600px;
            border-radius: 15px;
            box-shadow: 4px 4px 4px 4px rgb(128, 128, 128);

            position: fixed;
            top: 15%;
            left: 50%;

            background-color: white;
            transform: translate(-50%, 0);

        }

        .modal-summon {
            animation: summon 0.01s forwards;
        }

        @keyframes summon {
            0% {
                height: 0;
                width: 0;
            }

            100% {
                height: 700px;
                width: 700px;
                top: 10%
            }
        }

        .black-wall {
            position: absolute;
            width: 100%;
            height: 270%;
            background-color: #000000b4;
            top: 0
        }
    </style>

</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>

<div class="container">
    <div class="selectcategory">
        <div class="btn-group">
            <button type="button" class="btn btn-success dropdown-toggle" data-bs-toggle="dropdown"
                    aria-expanded="false">
                보는순서설정
            </button>
            <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="#"> 인기순 </a></li>
                <li><a class="dropdown-item" href="#"> 글자순 </a></li>
                <li><a class="dropdown-item" href="#"> 글자역순 </a></li>
            </ul>
        </div>
    </div>


    <div class="place-box">
        <c:forEach var="place" items="${placeList}">
            <div class="cell">
                <div class="top">
                    <img height="320px" width="328px" src="" alt="">
                </div>
                <div class="bottom">
                    <a href=""> ${place.placeName} </a>
                    <a href="" hidden="true"> ${place.placeNum} </a>
                </div>
            </div>
        </c:forEach>
    </div>


    <div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" style="width: 300px;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">${place.placeName}</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    ${place.placeContext}
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // 각 셀을 클릭했을 때 모달창을 띄우는 함수
    document.querySelectorAll('.cell').forEach(cell => {
        cell.addEventListener('click', function () {
            // 해당 셀의 placeNum 가져오기
            const placeId = this.getAttribute('data-place-id');
            const myModal = new bootstrap.Modal(document.getElementById('myModal'), {
                keyboard: false
            });
            myModal.show();
        });
    });
</script>


</body>
</html>
