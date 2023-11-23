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
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            color: #495057;
        }

        .row{
            width: 100%;
            height: 80%;
        }

        h1 {
            color: #007bff;
        }

        #map {
            height: 100%;
            width: 100%;
            border: 1px solid #dee2e6;
            border-radius: 5px;
            margin-bottom: 20px;
        }

        .day-container {
            font-size: 30px;
            color: #fff;
            border-radius: 5px;
            padding: 10px;
            margin-bottom: 20px;
        }
        .day-container div {
            background-color: #38ff00;
            margin: 10px;
        }

        .map-container {
            width: 100%;
            height: 350px;
            border: 1px solid #dee2e6;
            border-radius: 5px;
            margin-bottom: 20px;
        }

        .day-count {
            cursor: pointer;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: 1px solid #007bff;
            border-radius: 5px;
            margin-right: 10px;
            transition: background-color 0.3s ease;
        }

        .day-count:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>
<div class="container mt-5">

    <h1 id="title"></h1>
    <div class="row">
            <div id="map" class="map-container"></div>
        <div>
        </div>
            <div id="day" class="day-container"></div>
    </div>


    <button onclick="f_delete()">삭제</button>
    <button onclick="f_update()">수정</button>
</div>

</body>
<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dea7138cdf709909de935ce835cefee1&libraries=services"></script>
<script>
    const titleH1 = document.getElementById("title");
    const day_div = document.getElementById("day");

    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(36.3267842155492, 127.407836053487), // 지도의 중심좌표
            level: 5// 지도의 확대 레벨
        };

    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다


    $(document).on("click", ".day_count", function () {

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

                    console.log(result[i].ylab, result[i].xlab)

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
</script>

</html>
