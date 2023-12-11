<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <% request.setCharacterEncoding("UTF-8"); %>
    <%@include file="/WEB-INF/inc/header.jsp" %>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


    <style>

        .top-background {
            height: 70px;
            background-color: #ade8ef;
        }

        @font-face {
            font-family: 'yg-jalnan';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        @font-face {
            font-family: 'KCCChassam';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/KCCChassam.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }

        @font-face {
            font-family: 'JalnanGothic';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_231029@1.1/JalnanGothic.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        .map_wrap,
        .map_wrap * {
            margin: 0;
            padding: 0;
            font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
            font-size: 12px;
        }

        .map_wrap a,
        .map_wrap a:hover,
        .map_wrap a:active {
            color: #000;
            text-decoration: none;
        }

        .map_wrap {
            position: relative;
            width: 100%;
            height: 100%;
        }

        #menu_wrap {
            position: absolute;
            top: 0;
            left: 0;
            bottom: 0;
            width: 250px;
            margin: 10px 0 30px 10px;
            padding: 5px;
            overflow-y: auto;
            background: rgba(255, 255, 255, 0.7);
            z-index: 1;
            font-size: 12px;
            border-radius: 10px;
        }

        .bg_white {
            background: #fff;
        }

        #menu_wrap hr {
            display: block;
            height: 1px;
            border: 0;
            border-top: 2px solid #5F5F5F;
            margin: 3px 0;
        }

        #menu_wrap .option {
            text-align: center;
        }

        #menu_wrap .option p {
            margin: 10px 0;
        }

        #menu_wrap .option button {
            margin-left: 5px;
        }

        #placesList li {
            list-style: none;
        }

        #placesList .item {
            position: relative;
            border-bottom: 1px solid #888;
            overflow: hidden;
            cursor: pointer;
            min-height: 65px;
        }

        #placesList .item span {
            display: block;
            margin-top: 4px;
        }

        #placesList .item h5,
        #placesList .item .info {
            text-overflow: ellipsis;
            overflow: hidden;
            white-space: nowrap;
        }

        #placesList .item .info {
            padding: 10px 0 10px 55px;
        }

        #placesList .info .gray {
            color: #8a8a8a;
        }

        #placesList .info .jibun {
            padding-left: 26px;
            background: url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;
        }

        #placesList .info .tel {
            color: #009900;
        }

        #placesList .item .markerbg {
            float: left;
            position: absolute;
            width: 36px;
            height: 37px;
            margin: 10px 0 0 10px;
            background: url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;
        }

        #placesList .item .marker_1 {
            background-position: 0 -10px;
        }

        #placesList .item .marker_2 {
            background-position: 0 -56px;
        }

        #placesList .item .marker_3 {
            background-position: 0 -102px
        }

        #placesList .item .marker_4 {
            background-position: 0 -148px;
        }

        #placesList .item .marker_5 {
            background-position: 0 -194px;
        }

        #placesList .item .marker_6 {
            background-position: 0 -240px;
        }

        #placesList .item .marker_7 {
            background-position: 0 -286px;
        }

        #placesList .item .marker_8 {
            background-position: 0 -332px;
        }

        #placesList .item .marker_9 {
            background-position: 0 -378px;
        }

        #placesList .item .marker_10 {
            background-position: 0 -423px;
        }

        #placesList .item .marker_11 {
            background-position: 0 -470px;
        }

        #placesList .item .marker_12 {
            background-position: 0 -516px;
        }

        #placesList .item .marker_13 {
            background-position: 0 -562px;
        }

        #placesList .item .marker_14 {
            background-position: 0 -608px;
        }

        #placesList .item .marker_15 {
            background-position: 0 -654px;
        }

        #pagination {
            margin: 10px auto;
            text-align: center;
        }

        #pagination a {
            display: inline-block;
            margin-right: 10px;
        }

        #pagination .on {
            font-weight: bold;
            cursor: default;
            color: #777;
        }

        .container {
            width: 100%;
            height: 100%;
            margin: auto;
        }

        .first {
            display: flex;
            height: 91%;
            background-size: cover;
        }

        .first > div:nth-child(1) {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .box {
            align-items: center;
            height: 50px;
            width: 100px;
            padding: 10px;
            text-align: center;
            margin: 15px;
            border-radius: 17px;
            cursor: pointer;
        }


        .edit {
            height: 40px;
            width: 70px;
            padding: 10px;
            text-align: center;
            margin: 15px;
            border-radius: 17px;
        }

        #addedbox {
            position: relative;
            color: #031b27;
            width: 350px;
            overflow: scroll;
            background-color: #98dde3;
        }

        #addedbox > div {
            margin: 10px;
            padding: 5px;
            margin-bottom: 25px;
            border-radius: 10px;
            height: 170px;
            display: flex;
            justify-content: space-between;
            flex-direction: column;
            box-shadow: 2px 2px 7px rgba(0, 0, 0, 0.5);
            background-color: #a7f3fa;
        }

        @font-face {
            font-family: 'KOTRAHOPE';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2110@1.0/KOTRAHOPE.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }

        #addedbox > h1 {
            margin: 20px;
            color: #06193d;
            font-family: "yg-jalnan";
        }

        #addedbox > div > div span {
            padding-top: 5px;
            font-weight: 500;
            color: #06405b;
            font-family: 'KOTRAHOPE';
        }

        #addedbox > div > div > h5 {
            font-weight: 300;
            font-size: 17px;
            font-family: "yg-jalnan";
        }


        .plan-data {
            font-size: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .plan-content {
            width: 150px;
        }

        .map-content {
            width: 100%;
        }

        .choice-box {
            width: 200px;
            font-size: 15px;
            height: 777px;
        }

        #addedbox span {
            display: block;
        }

        .d-none {
            display: none;
        }

        .draggable .dragging {
            opacity: 0.5;
            height: 100px;
        }

        .data {
            font-size: 15px;
        }

        .delete {
            font-size: 15px;
        }

        input[type='date'] {
            border: none;
            /*/ / 테두리 설정은 본인 맘대로 position: relative;*/
            /*/ / 캘린더 아이콘을 클릭해야만 달력이 보이기 때문에 이 영역 자체를 제어하기 위해 설정 width: 100 %;*/
            padding: 10px;
            background: url(../../../assets/Calendar.svg) no-repeat right 10px center /35px auto;
            /*/ / 배경에 커스텀 아이콘을 넣어주자 ! x축은 오른쪽에서부터 10 px 떨어지게 하고, y축은 가운데 정렬하고, width 35 px에 height auto라는 크기를 부여한다 . background-color: #bbbbbb;*/
            box-shadow: 2px 2px 7px rgba(0, 0, 0, 0.2);
            border-radius: 8px;
            text-align: center;
            font-size: 100%;
            margin-bottom: 20px;
        }

        .pd {
            padding-top: 10px;
            padding-bottom: 10px;
        }

        .day {
            color: #ffffff;
        }

        @font-face {
            font-family: 'Pretendard-Regular';
            src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
            font-weight: 400;
            font-style: normal;
        }

        .choice-box {
            font-family: 'Pretendard-Regular';
        }

        .save {
            position: absolute;
            right: 15px;
            top: 20px;
        }

        .date {
            font-family: 'yg-jalnan';
        }

        .choice-box {
            padding-top: 30px;
        }
    </style>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>
<div class="top-background">

</div>

<div class="first">
    <div class="choice-box">
        <div style="text-align: center">
            <div class="date">출발일</div>
            <input type="date" id="startdate">
            <div class="date">도착일</div>
            <input type="date" id="enddate">
            <!-- <div class="box" id="box1">여행지설정</div>
            <div class="box" id="box2">날짜생성</div> -->
            <%--            <div class="box" id="box3" onclick="f_date()">확인!</div>--%>
            <%--            <div class="box" id="box3" onclick="f_day1()">임시!</div>--%>
            <div class="d-grid gap-2">
                <button type="button" onclick="f_date()" class="btn btn-outline-info btn-lg">확인</button>
            </div>
            <div class="d-grid gap-3">
                <div class="pd">

                </div>
                <div class="day1 d-none pd">
                    <button type="button" class="btn btn-info btn-lg day1 day w-50" id="day1" onclick="f_day(1)">1일차
                    </button>
                    <%--                    <button type="button" onclick="f_day1()" class="btn btn-outline-info btn-lg">저장</button>--%>
                </div>
                <div class="day2 d-none pd">
                    <button type="button" class="btn btn-info btn-lg day2 day w-50" id="day2" onclick="f_day(2)">2일차
                    </button>
                    <%--                    <button type="button" onclick="f_day1()" class="btn btn-outline-info btn-lg">저장</button>--%>
                </div>
                <div class="day3 d-none pd">
                    <button type="button" class="btn btn-info btn-lg day3 day w-50" id="day3" onclick="f_day(3)">3일차
                    </button>
                    <%--                    <button type="button" onclick="f_day1()" class="btn btn-outline-info btn-lg">저장</button>--%>
                </div>
                <div class="day4 d-none pd">
                    <button type="button" class="btn btn-info btn-lg day4 day w-50" id="day4" onclick="f_day(4)">4일차
                    </button>
                    <%--                    <button type="button" onclick="f_day1()" class="btn btn-outline-info btn-lg">저장</button>--%>
                </div>
                <div class="day5 d-none pd">
                    <button type="button" class="btn btn-info btn-lg day5 day w-50" id="day5" onclick="f_day(5)">5일차
                    </button>
                    <%--                    <button type="button" onclick="f_day1()" class="btn btn-outline-info btn-lg">저장</button>--%>
                </div>
                <div class="day6 d-none pd">
                    <button type="button" class="btn btn-info btn-lg day6 day w-50" id="day6" onclick="f_day(6)">6일차
                    </button>
                    <%--                    <button type="button" onclick="f_day1()" class="btn btn-outline-info btn-lg">저장</button>--%>
                </div>
                <div class="day7 d-none pd">
                    <button type="button" class="btn btn-info btn-lg day7 day w-50" id="day7" onclick="f_day(7)">7일차
                    </button>
                    <%--                    <button type="button" onclick="f_day1()" class="btn btn-outline-info btn-lg">저장</button>--%>
                </div>
            </div>
            <%--            <div class="day1 none" id="day1" onclick="f_day(1)">1일차</div>--%>
            <%--            <div class="day2 none" id="day2" onclick="f_day(2)">2일차</div>--%>
            <%--            <div class="day3 none" id="day3" onclick="f_day(3)">3일차</div>--%>
            <%--            <div class="day4 none" id="day4" onclick="f_day(4)">4일차</div>--%>
            <%--            <div class="day5 none" id="day5" onclick="f_day(5)">5일차</div>--%>
            <%--            <div class="day6 none" id="day6" onclick="f_day(6)">6일차</div>--%>
            <%--            <div class="day7 none" id="day7" onclick="f_day(7)">7일차</div>--%>
        </div>
        <div class="mg_btm" style="text-align: center; height: 50px">
            <c:if test="${fn:length(planList) != 0}">
                <button type="button" class="h-100 w-75 btn btn-outline-secondary btn-block btn-lg" onclick="f_turn()">
                    이전
                </button>
            </c:if>
            <button type="button" class="h-100 w-75 btn btn-outline-secondary btn-block btn-lg" onclick="f_send()">다음
            </button>
        </div>
    </div>

    <div id="addedbox" class="d-none">

    </div>
    <div class="map-content">

        <div class="map_wrap">
            <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>

            <div id="menu_wrap" class="bg_white">
                <div class="option">
                    <div>
                        <form onsubmit="searchPlaces(); return false;">
                            키워드 : <input type="text" value="희영빌딩" id="keyword" size="15">
                            <button type="submit" onclick="f_search()">검색하기</button>
                        </form>
                    </div>
                </div>
                <hr>
                <ul id="placesList"></ul>
                <div id="pagination"></div>
            </div>
        </div>

    </div>
</div>
</body>
<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dea7138cdf709909de935ce835cefee1&libraries=services"></script>

<script>

    let day_count = 0;
    // 전체 플랜 1-n일차
    let plan_Array = []

    // n일차 장소 순서
    let schedule1 = []

    let day1 = {};

    let startDateValue;
    let endDateValue;

    let startdate_date = new Date();
    let enddate_date = new Date();

    const addedbox = document.getElementById("addedbox");
    let buttonpointer = 0;
    let checkFirst = false;

    init();
    $(document).ready(function () {
        <c:if test="${fn:length(planList) == 0}">
        checkFirst = true;
        </c:if>
    });

    function f_turn() {
        if (confirm("수정된 내용이 저장되지 않습니다.") == true) {    //확인

            location.href = "/plan/marker.wow?planTitle=${title}&id=${user.getId()}";

        } else {   //취소

            return false;

        }
    }


    // 마커를 담을 배열입니다
    var markers = [];

    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    // 지도를 생성합니다
    var map = new kakao.maps.Map(mapContainer, mapOption);

    // 장소 검색 객체를 생성합니다
    var ps = new kakao.maps.services.Places();


    // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({zIndex: 1});

    // 키워드로 장소를 검색합니다
    searchPlaces();

    // 키워드 검색을 요청하는 함수입니다
    function searchPlaces() {

        var keyword = document.getElementById('keyword').value;

        if (!keyword.replace(/^\s+|\s+$/g, '')) {
            alert('키워드를 입력해주세요!');
            return false;
        }

        // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
        ps.keywordSearch(keyword, placesSearchCB);
    }

    // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
    function placesSearchCB(data, status, pagination) {
        if (status === kakao.maps.services.Status.OK) {

            // 정상적으로 검색이 완료됐으면
            // 검색 목록과 마커를 표출합니다
            displayPlaces(data);
            Array.from(data).forEach(item => {
                console.log(item.x);
            })

            // 페이지 번호를 표출합니다
            displayPagination(pagination);

        } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

            alert('검색 결과가 존재하지 않습니다.');
            return;

        } else if (status === kakao.maps.services.Status.ERROR) {

            alert('검색 결과 중 오류가 발생했습니다.');
            return;

        }
    }

    // 검색 결과 목록과 마커를 표출하는 함수입니다
    function displayPlaces(places) {

        var listEl = document.getElementById('placesList'),
            menuEl = document.getElementById('menu_wrap'),
            fragment = document.createDocumentFragment(),
            bounds = new kakao.maps.LatLngBounds(),
            listStr = '';

        // 검색 결과 목록에 추가된 항목들을 제거합니다
        removeAllChildNods(listEl);

        // 지도에 표시되고 있는 마커를 제거합니다
        removeMarker();

        for (var i = 0; i < places.length; i++) {

            // 마커를 생성하고 지도에 표시합니다
            var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
                marker = addMarker(placePosition, i),
                itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

            // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
            // LatLngBounds 객체에 좌표를 추가합니다
            bounds.extend(placePosition);

            // 마커와 검색결과 항목에 mouseover 했을때
            // 해당 장소에 인포윈도우에 장소명을 표시합니다
            // mouseout 했을 때는 인포윈도우를 닫습니다
            (function (marker, title) {
                kakao.maps.event.addListener(marker, 'mouseover', function () {
                    displayInfowindow(marker, title);
                });

                kakao.maps.event.addListener(marker, 'mouseout', function () {
                    infowindow.close();
                });

                itemEl.onmouseover = function () {
                    displayInfowindow(marker, title);
                };

                itemEl.onmouseout = function () {
                    infowindow.close();
                };
            })(marker, places[i].place_name);

            fragment.appendChild(itemEl);
        }

        // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
        listEl.appendChild(fragment);
        menuEl.scrollTop = 0;

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    }

    // 검색결과 항목을 Element로 반환하는 함수입니다
    function getListItem(index, places) {

        var el = document.createElement('li'),
            itemStr = '<span class="markerbg marker_' + (index + 1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

        if (places.road_address_name) {
            itemStr += '    <span>' + places.road_address_name + '</span>' +
                '   <span class="jibun gray">' + places.address_name + '</span>';
        } else {
            itemStr += '    <span>' + places.address_name + '</span>';
        }

        itemStr += '  <span class="tel">' + places.phone + '</span>' +
            '</div>';

        el.innerHTML = itemStr;
        el.className = 'item';

        return el;
    }

    // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
    function addMarker(position, idx, title) {
        var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
            imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
            imgOptions = {
                spriteSize: new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
                spriteOrigin: new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
                offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
            },
            markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
                position: position, // 마커의 위치
                image: markerImage
            });

        marker.setMap(map); // 지도 위에 마커를 표출합니다
        markers.push(marker);  // 배열에 생성된 마커를 추가합니다

        return marker;
    }

    // 지도 위에 표시되고 있는 마커를 모두 제거합니다
    function removeMarker() {
        for (var i = 0; i < markers.length; i++) {
            markers[i].setMap(null);
        }
        markers = [];
    }

    // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
    function displayPagination(pagination) {
        var paginationEl = document.getElementById('pagination'),
            fragment = document.createDocumentFragment(),
            i;

        // 기존에 추가된 페이지번호를 삭제합니다
        while (paginationEl.hasChildNodes()) {
            paginationEl.removeChild(paginationEl.lastChild);
        }

        for (let i = 1; i <= pagination.last; i++) {
            var el = document.createElement('a');
            el.href = "#";
            el.innerHTML = i;

            if (i === pagination.current) {
                el.className = 'on';
            } else {
                el.onclick = (function (i) {
                    return function () {
                        pagination.gotoPage(i);
                    }
                })(i);
            }

            fragment.appendChild(el);
        }
        paginationEl.appendChild(fragment);
    }

    // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
    // 인포윈도우에 장소명을 표시합니다
    function displayInfowindow(marker, title) {
        var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

        infowindow.setContent(content);
        infowindow.open(map, marker);
    }

    // 검색결과 목록의 자식 Element를 제거하는 함수입니다
    function removeAllChildNods(el) {
        while (el.hasChildNodes()) {
            el.removeChild(el.lastChild);
        }
    }


    function f_search() {
        const info_data = document.getElementsByClassName("info");

    }


    $(document).on("click", ".info", function () {
        // 버튼을 클릭할 때 발생하는 이벤트

        // $("#addedbox").scrollTop($("#addedbox")[0].scrollHeight);

        var objDiv = document.getElementById("addedbox");
        objDiv.scrollTop = objDiv.scrollHeight;

        const button_id = "minus" + buttonpointer;
        const box_id = "plus" + buttonpointer;

        addedbox.innerHTML += "<div class='draggable' draggable='true' id ='" + box_id + "'> " +
            "<div class='data'>" + $(this)[0].innerHTML + "</div><div class='d-grid gap-2'>" +
            "<button class='delete btn btn-outline-primary' id='" + button_id +
            "'  onclick=\"f_minus('" + box_id + "')\" > 제거 </button></div></div>";

        buttonpointer = buttonpointer + 1
    });

    function f_minus(box_id) {

        const deleteb = document.getElementById(box_id);
        deleteb.remove();
    }

    function isSameDat(start, today) {

        let returnBoolean = false;

        // 24/1/1
        // 23/12/4
        if ((Math.ceil((startdate_date - today) / (60 * 60 * 24) / 1000) + 1) >= 1) {
            returnBoolean = true;
                console.log(Math.ceil((startdate_date - today) / (60 * 60 * 24) / 1000) + 1)
        }
        // if (start.getFullYear() >= today.getFullYear()) {
        //     if (start.getMonth() >= today.getMonth()) {
        //         if (start.getDate() > today.getDate()) {
        //         }
        //     }
        // }


        return returnBoolean;
    }

    function f_date() {
        for (let i = 1; i <= 7; i++) {
            document.querySelector(".day" + i + "").classList.add("d-none");
        }
        console.log(plan_Array)

        let diff = 0;

        const startdate = document.getElementById("startdate").value;
        const enddate = document.getElementById("enddate").value;
        const today = new Date();
        const year = today.getFullYear();
        const month = today.getMonth();
        const date = today.getDate();
        const realToday = year + "" + month + "" + date;


        startdate_date = new Date(startdate);
        enddate_date = new Date(enddate);

        diff = Math.ceil(((enddate_date - startdate_date) / (60 * 60 * 24) / 1000)) + 1;


        // const headerTag = document.createElement('h1');
        // const textNode = document.createTextNode('textNode of headerTag');


        if (diff > 8) {
            alert("8일 이상은 지정할 수 없습니다.");
        } else if (diff <= 0) {
            alert("시간을 거꾸로 할 수는 없습니다..;");
        } else if (!isSameDat(startdate_date, today)) {
            if (checkFirst == false) {
                checkFirst = true;
            } else {
                alert("과거로 갈 수는 없습니다...");
            }
        } else {
            addedbox.classList.remove("d-none");
            if (diff < plan_Array.length) {

                for (let i = plan_Array.length; i > diff; --i) {
                    plan_Array.length = i;
                }
            }
            for (let i = 1; i <= diff; i++) {
                document.querySelector(".day" + i + "").classList.remove("d-none");
            }
        }
    }

    Date.prototype.yyyymmdd = function () {
        var yyyy = this.getFullYear().toString();
        var mm = (this.getMonth() + 1).toString();
        var dd = this.getDate().toString();

        return yyyy + "" + (mm[1] ? mm : '0' + mm[0]) + "" + (dd[1] ? dd : '0' + dd[0]);
    }

    function f_day(count) {
        if (count == 0 || count == undefined || count == null) {
            addedbox.innerHTML = '';
        } else {
            addedbox.innerHTML = '<h1>' + count + '일차</h1> <button type="button" onclick="f_day1()" class="btn btn-outline-dark btn-lg save">저장</button>';
        }
        day_count = count;
        makeSchedulePlace(count)
    }


    function isEmpty(str) {

        if (typeof str == "undefined" || str == null || str == "")
            return true;
        else
            return false;
    }


    function f_day1() {

        // if(schedule1[date-1] 가 비어있으면 넣고 비어있지않으며녀 for문쓰고 어쩌구  )
        schedule1 = [];

        const geocoder = new kakao.maps.services.Geocoder();
        const addressSearch = address => {
            return new Promise((resolve, reject) => {
                geocoder.addressSearch(address, function (result, status) {
                    if (status === kakao.maps.services.Status.OK) {

                        resolve({result});
                    } else {
                        reject(status);
                    }
                });
            });
        };


        (async () => {
            try {

                const addbox = $("#addedbox").find("div").find(".data");


                for (let i = 0; i < addbox.length; i++) {
                    // init
                    day1 = {};


                    const addressInfo = addbox[i];


                    const childrens = addressInfo.children;

                    console.log("childrens");
                    console.log(childrens);

                    day1["placeName"] = (childrens[0].innerHTML);
                    //  세번째 방법

                    try {
                        day1["placeLoadAddress"] = (childrens[1].innerHTML);
                        console.log(day1["placeLoadAddress"]);
                    } catch (error) {
                        //console.error(error);
                    }


                    try {
                        day1["placeAddress"] = (childrens[2].innerHTML);
                        console.log(day1["placeAddress"]);
                    } catch (error) {
                        //console.error(error);
                    }


                    try {
                        day1["planNum"] = (childrens[3].innerHTML);
                        console.log(day1["planNum"]);
                    } catch (error) {
                        // day1["planNum"] == 9999
                    }

                    try {
                        day1["totalDay"] = (day_count);
                    } catch (error) {
                        //console.error(error);
                    }

                    try {
                        day1["startDate"] = ((startdate_date).yyyymmdd)();
                    } catch (error) {
                        //console.error(error);
                    }
                    try {
                        day1["endDate"] = ((enddate_date).yyyymmdd());
                    } catch (error) {
                        //console.error(error);
                    }

                    if (day1["placeLoadAddress"] != null) {
                        const data = await addressSearch(childrens[1].innerHTML);

                        try {
                            day1["xlab"] = data.result[0].x;  //data.result[0].y, data.result[0].x
                        } catch (error) {
                            //console.error(error);
                        }

                        try {
                            day1["ylab"] = data.result[0].y;
                        } catch (error) {
                            //console.error(error);
                        }
                    }


                    day1["planTitle"] = ("${title}");

                    schedule1.push(day1);
                }
            } catch (e) {
                console.error(e);
            }
        })();


        plan_Array[day_count] = schedule1;


        console.log(plan_Array);
        alert(day_count + '일차 임시 저장 완료');
    }

    // 동기 지연 함수
    function sleep(ms) {
        var start = Date.now() + ms;
        while (Date.now() < start) {
        }
    }

    function makeSchedulePlace(day) {

        const schedule = plan_Array[day];
        console.log(plan_Array)

        if (typeof schedule === 'undefined') {
            console.log("해당 일자 스케줄 없음")
            return;
        }

        let html = "";
        html += '<h1>' + day + '일차</h1>';
        html += '<button type="button" onclick="f_day1()" class="btn btn-outline-dark btn-lg save">저장</button>'
        for (let i = 0; i < Object.keys(schedule).length; i++) {
            let day_schedule = schedule[i];
            html += '<div class="draggable" draggable="true" id="plus' + i + '">';
            html += '<div class="data">';
            html += '<h5>' + day_schedule["placeName"] + '</h5>';
            html += '<span>' + day_schedule["placeLoadAddress"] + '</span>';
            html += '<span class="jibun gray">' + day_schedule["placeAddress"] + '</span>';
            //
            // if (day_schedule["planNum"] != 9999) {
            //     html += '<span class="tel"></span>' + day_schedule["planNum"] + '</span>';
            // }
            html += '</div>';
            html += '<div class="d-grid gap-2">';
            html += '<button class="delete btn btn-outline-danger" id="minus' + i + '" onclick="f_minus(\'plus' + i + '\')"> 제거 </button>';
            html += '</div>';
            html += '</div>';
        }

        $('#addedbox').html(html);

        // $('#addedbox').html(day + '일차');

    }

    function f_send() {
        let title = "${title}";
        console.log(plan_Array);
        $.ajax({
            type: "post",
            url: "/plan/plan.wow",
            data: {"plan": JSON.stringify(plan_Array), "title": title},
            success: function (data) {
                console.log(data)
                location.href = encodeURI("/plan/marker.wow?planTitle=${title}&id=${id}");
            }, error: function (err) {
                console.log("error: " + err)
            }
        });
    }

    // headerTag.appendChild(textNode);


    function init() {

        if (${empty planList}) {
            console.log("plan 정보가 없습니다.")
            return;
        }

        let lastDayCount = 0;
        let currentDayCount;

        <c:forEach var="planVO" items="${planList}" varStatus="index">

        day1 = {}
        currentDayCount =
        ${planVO.dayCount}

        if (lastDayCount == 0) {
            lastDayCount = currentDayCount;
            startDateValue = "${planVO.startDate}".split(' ')[0]
            endDateValue = "${planVO.endDate}".split(' ')[0]
        }

        if (lastDayCount < currentDayCount) {
            plan_Array.push(schedule1)
            schedule1 = [];
            console.log(schedule1)
            lastDayCount = currentDayCount;
        }

        day1["endDate"] = endDateValue
        day1["placeAddress"] = "${planVO.placeAddress}"
        day1["placeLoadAddress"] = "${planVO.placeLoadAddress}"
        day1["placeName"] = "${planVO.placeName}"
        day1["planTitle"] = "${planVO.planTitle}"
        day1["startDate"] = startDateValue
        day1["totalDay"] = currentDayCount
        day1["xlab"] = "${planVO.xlab}"
        day1["ylab"] = "${planVO.ylab}"

        schedule1.push(day1);
        console.log("HI : ", schedule1)
        plan_Array[${planVO.dayCount}] = schedule1;

        <%--if (${index.last}) {--%>
        <%--}--%>

        </c:forEach>

        console.log("origin", plan_Array)

        $("#startdate").val(startDateValue)
        $("#enddate").val(endDateValue)
        f_date();

        if (lastDayCount > 0) {
            makeSchedulePlace(0);
        }

        console.log("last :", plan_Array)
    }

    f_day(1)

</script>
</html>