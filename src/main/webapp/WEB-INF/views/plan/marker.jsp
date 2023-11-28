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
        div {
            border: 1px solid black;
        }

        body {
            border: 1px solid red;
            padding-top: 70px;
        }

        .container1 {
            height: 850px;
        }

        .first {
            display: flex;
            height: 850px;
            background-size: cover;
            z-index: 0;
        }

        .selectplace-nav {
            z-index: 4;
        }

        .besidenav {
            z-index: 5;
            background-color: white;
        }

        .first > div:nth-child(1) {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .first > div:nth-child(1) > div:nth-child(1) {
            /* 여행지 설정 버튼 */
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            /* 세로 가운데 정렬 */
        }

        .first > div:nth-child(2) {
            width: 350px;
        }


        /* .first>div:nth-child(2)>div:nth-child(2){ */
        /* 명소 음식 숙소 */
        /* height: 20%; */
        /* } */
        .box {
            align-items: center;
            height: 50px;
            width: 100px;
            padding: 10px;
            text-align: center;
            margin: 15px;
            border-radius: 17px;
        }

        .edit {
            height: 40px;
            width: 70px;
            padding: 10px;
            text-align: center;
            margin: 15px;
            border-radius: 17px;
        }

        .selectplace {
            display: flex;
            justify-content: center;
        }

        .selectplace > div {
            height: 100%;
            width: 100%;
        }

        .selectbox {
            height: 100%;
            flex-direction: column;
            justify-content: center;
            /* 가로 가운데 정렬 */
            align-items: center;
            /* 세로 가운데 정렬 */
        }

        .selectbox > div {
            display: flex;
            height: 80px;
            padding: 10px;
            text-align: center;
        }

        .textbox {
            height: 100%;
            width: 100%;
        }

        .smallimgbox {
            height: 50px;
            width: 50px;
            padding: 10px;
            text-align: center;
            margin: 5px;
            border-radius: 20px;
        }

        .selectplace-nav {
            background-color: rgba(255, 255, 255, 0.62);

            border-radius: 50px;

            position: absolute;
            height: 850px;

            transform: translate(201px, 0);
            box-shadow: 4px 0px 4px 0px gainsboro;
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
    </style>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>
<div class="container1">
    <div class="first" id="map">
        <div class="besidenav">
            <div>
                <div class="box" onclick="f_allDay()">전체일정</div>
                <div class="selectplace" id="day"></div>
            </div>
            <div>
                <button class="edit" onclick="f_update()">수정</button>

                <button class="edit" onclick="f_delete()">삭제</button>
            </div>
        </div>
        <div class="selectplace-nav">
            <div class="selectbox" id="select-box"></div>
        </div>
    </div>
</div>
<!-- 모달 창 -->
<div id="myModal" class="modal">
    <div class="modal-content">
        <form action="/share/plan" method="post">
            <!-- 모달 내용을 추가하세요 -->
            <input type="hidden" name="planTitle" value="${title}">
            <input type="text" name="shareId">

            <button type="submit" onclick="submitForm()">전송</button>

            <button type="button" onclick="closeModal()">지움</button>
        </form>
    </div>
</div>

<div class="col-sm-2 col-sm-offset-10 text-right">
    <a href="/plan/excelDown?title=${title}" class="btn  btn-sm btn-default" target="_blank"
       id="excelDown">excelDown</a>
</div>
<button onclick="f_share()">공유하기</button>

</body>
<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dea7138cdf709909de935ce835cefee1&libraries=services"></script>
<script>
    const v_drawer = document.getElementsByClassName("selectplace-nav")[0];
    const titleH1 = document.getElementById("title");
    const day_div = document.getElementById("day");
    const tour_div = document.getElementById("select-box");

    // 모달 열기
    function openModal() {
        var modal = document.getElementById('myModal');
        modal.style.display = 'block';
    }

    // 모달 닫기
    function closeModal() {
        var modal = document.getElementById('myModal');
        modal.style.display = 'none';
    }

    // 전송 버튼 동작
    function submitForm() {
        // 모달 내용 전송 또는 기타 작업 수행
        // 여기에 전송 로직을 추가하세요.

        // 모달 닫기
        closeModal();
    }

    // f_share 함수 수정
    function f_share() {
        openModal();
    }

    function f_drawer() {
        v_drawer.classList.add("slide-in");
        v_drawer.classList.remove("slide-out");
    }


    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(36.3267842155492, 127.407836053487), // 지도의 중심좌표
            level: 5// 지도의 확대 레벨
        };

    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다


    $(document).on("click", ".day_count", function () {

        tour_div.innerHTML = ""

        let day_num = $(this).text();
        let regex = /[^0-9]/g;
        let result = day_num.replace(regex, "");

        console.log(result)


        $.ajax({
            url: "/plan/marker.wow",
            type: "POST",
            dataType: "json",
            data: {
                "result": result,
                "title": title
            },
            success: function (result) {
                let json_marker = result;
                console.log(json_marker)

                map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
                var points = [];

                for (let i = 0; i < result.length; i++) {

                    points[i] = (new kakao.maps.LatLng(result[i].ylab, result[i].xlab));

                    console.log(result[i].ylab, result[i].xlab);

                }

                // 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
                var bounds = new kakao.maps.LatLngBounds();

                var i, marker;
                for (i = 0; i < points.length; i++) {
                    // 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다
                    marker = new kakao.maps.Marker({position: points[i]});
                    marker.setMap(map);

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

                    var imageSrc = "/resources/img/marker" + i + ".png";

                    // 마커 이미지의 이미지 크기 입니다
                    var imageSize = new kakao.maps.Size(50, 50);

                    // 마커 이미지를 생성합니다
                    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

                    // 마커를 생성합니다
                    var marker = new kakao.maps.Marker({
                        map: map, // 마커를 표시할 지도
                        position: positions[i].latlng, // 마커를 표시할 위치
                        title: positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                        image: markerImage // 마커 이미지
                    });
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
                        strokeWeight: 5, // 선의 두께 입니다
                        strokeColor: '#28ad02', // 선의 색깔입니다
                        strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
                        strokeStyle: 'solid' // 선의 스타일입니다
                    });

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
                console.log(result)

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
                        '<div>'
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
        div.classList.add('day_count');
        div.textContent = '${planList.dayCount}일차';
        day_div.appendChild(div)
        console.log("${planList.dayCount}일차")
    }
    </c:forEach>

    let title = '${title}';
    titleH1.innerHTML = title;
    console.log(title)

    function f_delete() {
        location.href = encodeURI("/plan/planDelete.wow?title=" + title + "");
    }

    function f_update() {
        location.href = encodeURI("/plan/plan.wow?planTitle=" + title + "");
    }

    function f_allDay() {

    }
</script>

</html>
