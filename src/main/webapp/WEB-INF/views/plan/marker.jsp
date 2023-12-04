<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>
    <title>여행 마커~</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap CSS -->
    <% request.setCharacterEncoding("UTF-8"); %>
    <%@include file="/WEB-INF/inc/header.jsp" %>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    <style>
        @font-face {
            font-family: 'yg-jalnan';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        @font-face {
            font-family: 'Pretendard-Regular';
            src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
            font-weight: 400;
            font-style: normal;
        }

        @font-face {
            font-family: 'KCCChassam';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/KCCChassam.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }

        @font-face {
            font-family: 'KOTRAHOPE';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2110@1.0/KOTRAHOPE.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }

        body {
            padding-top: 70px;
        }

        .container1 {
            display: flex;
            height: 100%;
        }

        .box1 {
            position: absolute;
            top: 30px;
            width: 100%;
            height: 50px;
        }

        .place {
            position: absolute;
            top: 90px;
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            height: 500px;
        }

        .place > div {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100%;
            margin: 10px;
            height: 50px;
        }

        .side-bar {
            position: relative;
            width: 300px;
            text-align: center;
            font-family: 'Pretendard-Regular';
            font-size: 20px;
        }


        .place-list {
            width: 200px;
        }


        .btns {
            position: absolute;
            width: 100%;
            bottom: 50px;
        }


        .place-btn {
            margin-bottom: 10px;
            height: 50px;
        }

        .selectplace-nav {
            width: 500px;
            display: flex;
            justify-content: center;
            background-color: #a7f3fa;
            overflow: scroll;
        }

        .place-list {
            width: 100%;
        }

        .place-list > h1 {
            margin: 20px;
            font-family: 'yg-jalnan';
        }

        .selectplace-nav > div > div {
            margin-bottom: 50px;
            height: 120px;
            display: flex;
            justify-content: space-between;
            flex-direction: column;
            box-shadow: 2px 2px 7px rgba(0, 0, 0, 0.5);
            background-color: #a7f3fa;
            margin: 30px;
            font-family: 'yg-jalnan';
            font-size: 13px;
            border-radius: 10px;
            padding: 10px;
        }

        .selectplace-nav > div > div > div:first-child {
            font-size: 25px;
        }

        .selectplace-nav > div > div > div:nth-child(2) {
            font-size: 17px;
        }

        .selectplace-nav > div > div > div:nth-child(3) {
            font-family: 'KOTRAHOPE';
            font-size: 15px;
        }

        .place-list > div {
            position: relative;
        }

        .place-img {
            position: absolute;
            right: 10px;
            top: 15px;
        }


        @keyframes slideIn {
            0% {
                transform: translate(-100%, 0);
            }

            100% {
                transform: translate(53%, 0);
            }
        }

        .slide-in {
            /* 애니메이션 종료 후 종료상태 유지 forwards */
            animation: slideIn 1s forwards;
        }

        @keyframes slideOut {
            /* 0% 100% 대신 from to 넣어줘도 됨 둘이 같음 */
            0% {
                transform: translate(0, 0);
            }

            100% {
                transform: translate(-100%, 0);
            }
        }

        .slide-out {
            animation: slideOut 1s forwards;
        }

        .atag {
            text-decoration: none;
            color: #1e1e1e;
        }

        .btn {
            display: flex;
            justify-content: center;
            align-items: center;
        }
    </style>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>
<div class="container1" onclick="f_drawer()">
    <div class="side-bar">
        <div class="box1">
            <button type="button" class="btn btn-secondary h-100 w-75 day_count">전체일정</button>
        </div>
        <div class="place" id="day"></div>
        <div class="btns">
            <div class="place-btn">
                <button class="btn btn-info w-75 h-75" onclick="f_return()">일정 홈</button>
            </div>
            <c:if test="${user.getId() ne param.id}">
                <div class="place-btn">
                    <button class="btn btn-info w-75 h-75" onclick="f_shareDel()">공유취소</button>
                </div>
            </c:if>
            <c:if test="${user.getId() eq param.id}">
                <div class="place-btn">
                    <button type="button" class="btn btn-info w-75 h-75" data-bs-toggle="modal"
                            data-bs-target="#exampleModal"
                            data-bs-whatever="@mdo">친구에게 공유하기
                    </button>
                </div>
                <div class="place-btn">
                    <button class="btn btn-info w-75 h-75" onclick="f_update()">수정</button>
                </div>
                <div class="place-btn">
                    <button class="btn btn-info w-75 h-75" onclick="f_delete()">삭제</button>
                </div>
            </c:if>
            <div class="place-btn">
                <button class="btn btn-info w-75 h-75">
                    <a class="atag" href="/plan/excelDown?title=${title}&id=${param.id}" target="_blank"
                       id="excelDown">excelDown</a>
                </button>
            </div>
        </div>

    </div>
    <div class="selectplace-nav">
        <div class="place-list" id="select-box"></div>
    </div>
    <div class="first" id="map" style="width:100%;height:100%;">
    </div>
</div>
<!-- 모달 창 -->


<form action="/share/plan" id="shareForm" method="post">
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">New message</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="mb-3">
                            <label for="recipient-name" class="col-form-label">Recipient:</label>
                            <input type="text" class="form-control" name="shareId" id="recipient-name">
                            <input type="hidden" name="planTitle" value="${title}">
                            <input type="hidden" name="id" value="${user.getId()}">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기
                    </button>
                    <button type="button" class="btn btn-primary" onclick="submitForm()">보내기</button>
                </div>
            </div>
        </div>
    </div>
</form>

</body>
<script type=" text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dea7138cdf709909de935ce835cefee1&libraries=services">
</script>
<script>
    const v_drawer = document.getElementsByClassName("selectplace-nav")[0];
    const titleH1 = document.getElementById("title");
    const day_div = document.getElementById("day");
    const tour_div = document.getElementById("select-box");

    function f_shareDel() {
        location.href = encodeURI("/plan/shareDel.wow?id=${param.id}&planTitle=${param.planTitle}&shareId=${user.getId()}")
    }

    // 전송 버튼 동작
    function submitForm() {
        // 모달 내용 전송 또는 기타 작업 수행
        // 여기에 전송 로직을 추가하세요.

        var f = $("#shareForm");

        $.ajax({
            url: "/share/plan",
            type: "POST",
            dataType: "json",
            data: f.serialize(),
            success: function (result) {
                alert(result["result"]);
            },
            error: function (error) {
                console.log(error);
            }
        });

    }


    function f_drawer() {
        v_drawer.classList.remove("d-none");
    }

    function f_return() {
        location.href = "/plan/myPlan.wow";
    }

    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(36.3267842155492, 127.407836053487), // 지도의 중심좌표
            level: 3// 지도의 확대 레벨
        };

    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
    let marker_list = [];
    let polyline_list = [];

    $(document).on("click", ".day_count", function () {

        tour_div.innerHTML = ""

        let day_num = $(this).text();
        let regex = /[^0-9]/g;
        let result1 = day_num.replace(regex, "");
        console.log(result1)
        if (result1 == null || result1 == "") {
            result1 = 0
        }

        console.log(result1)

        $.ajax({
            url: "/plan/marker.wow",
            type: "POST",
            dataType: "json",
            data: {
                "id": new URL(location.href).searchParams.get('id'),
                "result": result1,
                "title": title
            },
            success: function (result) {
                let json_marker = result;
                console.log(json_marker);

                for (let i = 0; i < marker_list.length; i++) {
                    marker_list[i].setMap(null);
                }
                for (let i = 0; i < polyline_list.length; i++) {
                    console.log(polyline_list[i]);
                    polyline_list[i].setMap(null);
                }


                // var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

                var points = [];

                for (let i = 0; i < result.length; i++) {

                    points[i] = (new kakao.maps.LatLng(result[i].ylab, result[i].xlab));

                    console.log(result[i].ylab, result[i].xlab);

                }

                // 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
                var bounds = new kakao.maps.LatLngBounds();

                marker = new kakao.maps.Marker({position: points[i]});
                for (i = 0; i < points.length; i++) {
                    // 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다
                    marker = new kakao.maps.Marker({position: points[i]});
                    marker.setMap(map);
                    marker_list.push(marker);


                    // LatLngBounds 객체에 좌표를 추가합니다
                    bounds.extend(points[i]);
                }


                // 마커를 표시할 위치와 title 객체 배열입니다
                var positions = [];

                for (let i = 0; i < result.length; i++) {
                    positions[i] = {
                        title: '"' + result[i].placeName + '"',
                        latlng: new kakao.maps.LatLng(result[i].ylab, result[i].xlab)
                    }
                }

                // 마커 이미지의 이미지 주소입니다
                for (var i = 0; i < positions.length; i++) {

                    if (i + 2 <= 9) {
                        var imageSrc = "/resources/img/00" + (i + 2) + ".png";
                    } else {
                        var imageSrc = "/resources/img/0" + (i + 2) + ".png";
                    }

                    // 마커 이미지의 이미지 크기 입니다
                    var imageSize = new kakao.maps.Size(45, 45);

                    // 마커 이미지를 생성합니다
                    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);


                    // 마커를 생성합니다
                    var marker = new kakao.maps.Marker({
                        map: map, // 마커를 표시할 지도
                        position: positions[i].latlng, // 마커를 표시할 위치
                        title: positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                        image: markerImage // 마커 이미지
                    });

                    marker_list.push(marker);
                }

                // 선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다

                // var linePath = [
                // new kakao.maps.LatLng(33.452344169439975, 126.56878163224233),
                // new kakao.maps.LatLng(33.452739313807456, 126.5709308145358),
                // new kakao.maps.LatLng(33.45178067090639, 126.5726886938753)
                // ];

                let linePath;
                let lineLine = new daum.maps.Polyline();
                let distance;

                for (var i = 0; i < positions.length; i++) {
                    if (i != 0) {
                        linePath = [positions[i - 1].latlng, positions[i].latlng]
                    }

                    lineLine.setPath(linePath);


                    // 지도에 표시할 선을 생성합니다
                    var polyline = new kakao.maps.Polyline({
                        path: linePath, // 선을 구성하는 좌표배열 입니다
                        strokeWeight: 3, // 선의 두께 입니다
                        strokeColor: '#28ad02', // 선의 색깔입니다
                        strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
                        strokeStyle: 'solid' // 선의 스타일입니다
                    });

                    polyline_list.push(polyline);

                    distance = Math.round(lineLine.getLength());
                    displayCircleDot(positions[i].latlng, distance);

                }

                function displayCircleDot(position, distance) {
                    if (distance > 0) {
                        var distanceOverlay = new daum.maps.CustomOverlay({
                            content: '<div class="dotOverlay "> 거리 <span class="number">'
                                + distance + '</span>m</div>',
                            position: position,
                            yAnchor: 1,
                            zIndex: 2
                        });
                        polyline.setMap(map);
                    }
                }

                map.setBounds(bounds);

                const flaticon = "https://cdn-icons-png.flaticon.com";

                if (result1 != 0) {
                    tour_div.innerHTML = '<h1>' + result[0]["dayCount"] + "일차" + '</h1>';
                } else {
                    tour_div.innerHTML = '<h1>전체일정</h1>';
                }

                for (let i = 0; i < result.length; i++) {
                    tour_div.innerHTML += '<div>' +
                        '<div>'
                        + (i + 1) +
                        '</div>' +
                        '<div>'
                        + result[i]["placeName"] +
                        '</div>' +
                        '<div>'
                        + result[i]["placeLoadAddress"] +
                        '</div>' +
                        '<img id="place-img' + i + '"  class="place-img" width="40px" height="40px">' +
                        '</div>';

                    let p_img = document.getElementById("place-img" + i)
                    if (result[i]["placeLoadAddress"].substring(0, 2) == "서울") {
                        p_img.src = flaticon + "/128/2195/2195482.png";
                    } else if (result[i]["placeLoadAddress"].substring(0, 2) == "대전") {
                        p_img.src = flaticon + "/128/992/992710.png";
                    } else if (result[i]["placeLoadAddress"].substring(0, 2) == "경기") {
                        p_img.src = flaticon + "/128/3048/3048352.png";
                    } else if (result[i]["placeLoadAddress"].substring(0, 2) == "충북") {
                        p_img.src = flaticon + "/128/1150/1150353.png";
                    } else if (result[i]["placeLoadAddress"].substring(0, 2) == "세종") {
                        p_img.src = flaticon + "/128/5789/5789257.png";
                    } else if (result[i]["placeLoadAddress"].substring(0, 2) == "전남") {
                        p_img.src = flaticon + "/128/7389/7389073.png";
                    } else if (result[i]["placeLoadAddress"].substring(0, 2) == "강원") {
                        p_img.src = flaticon + "/128/933/933248.png";
                    } else if (result[i]["placeLoadAddress"].substring(0, 2) == "충남") {
                        p_img.src = flaticon + "/128/1146/1146825.png";
                    } else if (result[i]["placeLoadAddress"].substring(0, 2) == "전북") {
                        p_img.src = flaticon + "/128/8269/8269621.png";
                    } else if (result[i]["placeLoadAddress"].substring(0, 2) == "제주") {
                        p_img.src = flaticon + "/128/4789/4789874.png";
                    } else if (result[i]["placeLoadAddress"].substring(0, 2) == "부산") {
                        p_img.src = flaticon + "/128/10641/10641465.png";
                    } else if (result[i]["placeLoadAddress"].substring(0, 2) == "대구") {
                        p_img.src = flaticon + "/128/5139/5139161.png";
                    } else if (result[i]["placeLoadAddress"].substring(0, 2) == "인천") {
                        p_img.src = flaticon + "/128/4244/4244785.png";
                    } else if (result[i]["placeLoadAddress"].substring(0, 2) == "광주") {
                        p_img.src = flaticon + "/128/2861/2861698.png";
                    } else if (result[i]["placeLoadAddress"].substring(0, 2) == "울산") {
                        p_img.src = flaticon + "/128/1045/1045140.png";
                    } else if (result[i]["placeLoadAddress"].substring(0, 2) == "경북") {
                        p_img.src = flaticon + "/128/2639/2639378.png";
                    } else if (result[i]["placeLoadAddress"].substring(0, 2) == "경남") {
                        p_img.src = flaticon + "/128/2271/2271030.png";
                    }
                }


            }, error: function (error) {
                console.log(error);
            }

        })
    });


    let unique = [];


    <c:forEach items="${planList}" var="planList">
    if (!unique.includes('${planList.dayCount}')) {
        unique.push('${planList.dayCount}');
        let div = document.createElement('div');
        let div2 = document.createElement('div');
        div.classList.add('day_count');
        div.classList.add('btn');
        div.classList.add('btn-outline-info');
        div.classList.add('w-75');
        div.classList.add('h-75');
        div.textContent = '${planList.dayCount}일차';
        div2.appendChild(div);
        day_div.appendChild(div2);
    }
    </c:forEach>

    let title = '${title}';
    // titleH1.innerHTML = title;
    console.log(title)

    function f_delete() {
        location.href = encodeURI("/plan/planDelete.wow?title=" + title + "");
    }

    function f_update() {
        location.href = encodeURI("/plan/plan.wow?planTitle=" + title + "");
    }

</script>

</html>
