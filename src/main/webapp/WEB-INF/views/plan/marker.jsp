<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <% request.setCharacterEncoding("UTF-8"); %>
    <%@include file="/WEB-INF/inc/header.jsp" %>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>
<div id="map" style="width:100%;height:350px;"></div>
<div id="day" style="width: 100%; height: 100px; font-size: 30px; display: flex; justify-content: space-between; align-items: center"></div>
<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dea7138cdf709909de935ce835cefee1&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(36.3267842155492, 127.407836053487), // 지도의 중심좌표
            level: 5// 지도의 확대 레벨
        };

    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    var points = [];
    <c:forEach items="${planList}" var="planList">
    points.push(new kakao.maps.LatLng(${planList.ylab}, ${planList.xlab}));
    </c:forEach>

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

    function setBounds() {
        // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
        // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
        map.setBounds(bounds);
    }

    var distanceOverlay;
    var dots = {}

    // 마커를 표시할 위치와 title 객체 배열입니다
    var positions = [
        <c:forEach items="${planList}" var="planList">
        {
            title: '${planList.placeName}',
            latlng: new kakao.maps.LatLng(${planList.ylab}, ${planList.xlab})
        },
        </c:forEach>
    ];

    // 마커 이미지의 이미지 주소입니다
    var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

    for (var i = 0; i < positions.length; i++) {

        // 마커 이미지의 이미지 크기 입니다
        var imageSize = new kakao.maps.Size(24, 35);

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
            strokeColor: '#FFAE00', // 선의 색깔입니다
            strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
            strokeStyle: 'solid' // 선의 스타일입니다
        });

        distance = Math.round(lineLine.getLength());
        displayCircleDot(positions[i].latlng, distance);

    }

    function displayCircleDot(position, distance) {
        if (distance > 0) {
            var distanceOverlay = new daum.maps.CustomOverlay({
                content: '<div class="dotOverlay">거리 <span class="number">'
                    + distance + '</span>m</div>',
                position: position,
                yAnchor: 1,
                zIndex: 2
            });
            polyline.setMap(map);
        }
    }


    const day_div = document.getElementById(day);


    let unique = [];

    <c:forEach items="${planList}" var="planList">
    if (!unique.includes('${planList.totalDay}')) {
        unique.push('${planList.totalDay}');
        let div = document.createElement('div');
        div.textContent = '${planList.totalDay}일차'
        day_div.appendChild(div);
    }
    </c:forEach>
</script>

</body>
</html>
