<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <% request.setCharacterEncoding("UTF-8"); %>
    <%@include file="/WEB-INF/inc/header.jsp" %>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


    <style>
        body {
            padding-top: 70px;
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

        div {
            border: 1px solid red;
        }

        body {
            border: 1px solid red;
        }

        .container {
            width: 100%;
            height: 100%;
            margin: auto;
        }

        .first {
            display: flex;
            height: 943px;
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
            width: 500px;
            overflow: scroll;
            background-color: lightgray;
        }

        #addedbox > div {
            margin-bottom: 10px;
            text-align: center;
            border-radius: 17px;
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
        }

        #addedbox span {
            display: block;
        }

        .none {
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
            width: 50px;
            font-size: 15px;
        }
    </style>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>


<div class="first">
    <div class="choice-box">
        <div>
            <input type="date" id="startdate">
            <input type="date" id="enddate">
            <!-- <div class="box" id="box1">여행지설정</div>
            <div class="box" id="box2">날짜생성</div> -->
            <div class="box" id="box3" onclick="f_date()">확인!</div>
            <div class="box" id="box3" onclick="f_day1()">임시!</div>
            <div class="day1 none" id="day1" onclick="f_day(1)">1일차</div>
            <div class="day2 none" id="day2" onclick="f_day(2)">2일차</div>
            <div class="day3 none" id="day3" onclick="f_day(3)">3일차</div>
            <div class="day4 none" id="day4" onclick="f_day(4)">4일차</div>
            <div class="day5 none" id="day5" onclick="f_day(5)">5일차</div>
            <div class="day6 none" id="day6" onclick="f_day(6)">6일차</div>
            <div class="day7 none" id="day7" onclick="f_day(7)">7일차</div>
        </div>
        <div>
            <div class="edit" onclick="f_send()">저장</div>
        </div>
    </div>

    <div id="addedbox">

    </div>
    <div class="map-content">

        <div class="map_wrap">
            <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>

            <div id="menu_wrap" class="bg_white">
                <div class="option">
                    <div>
                        <form onsubmit="searchPlaces(); return false;">
                            키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15">
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

    init();

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
            // console.log(data[0].x);

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


        const button_id = "minus" + buttonpointer;
        const box_id = "plus" + buttonpointer;


        addedbox.innerHTML += "<div class='draggable' draggable='true' id ='" + box_id + "'> <div class='data'>" + $(this)[0].innerHTML + "</div><button class='delete' id='" + button_id +
            "'  onclick=\"f_minus('" + box_id + "')\" > 제거 </button></div>";
        buttonpointer = buttonpointer + 1
    });

    function f_minus(box_id) {

        const deleteb = document.getElementById(box_id);
        deleteb.remove();
    };

    function f_date() {
        for (let i = 1; i <= 7; i++) {
            document.querySelector(".day" + i + "").classList.add("none");
        }
        console.log(plan_Array)

        let diff = 0;

        const startdate = document.getElementById("startdate").value;
        const enddate = document.getElementById("enddate").value;
        const today = new Date();

        startdate_date = new Date(startdate);
        enddate_date = new Date(enddate);

        diff = Math.ceil(((enddate_date - startdate_date) / (60 * 60 * 24) / 1000)) + 1;


        // const headerTag = document.createElement('h1');
        // const textNode = document.createTextNode('textNode of headerTag');

        if (diff < plan_Array.length) {
            console.log(diff);
            console.log(plan_Array.length);
            for (let i = plan_Array.length; i > diff; --i) {
                plan_Array.length = i
            }
        }

        if (diff > 8) {
            alert("8일 이상은 지정할 수 없습니다.");

        } else if (diff <= 0) {
            alert("시간을 거꾸로 할 수는 없습니다..;");
        } else if ((startdate_date - today) < 0) {
            alert("과거로 갈 수는 없습니다...")
        } else {
            for (let i = 1; i <= diff; i++) {
                document.querySelector(".day" + i + "").classList.remove("none");
            }
        }
    }

    function f_day(count) {
        addedbox.innerHTML = "";
        day_count = count;
        makeSchedulePlace(count)
    }


    Date.prototype.yyyymmdd = function () {
        var yyyy = this.getFullYear().toString();
        var mm = (this.getMonth() + 1).toString();
        var dd = this.getDate().toString();

        return yyyy + "" + (mm[1] ? mm : '0' + mm[0]) + "" + (dd[1] ? dd : '0' + dd[0]);
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
                for (let i = 0; i < $("#addedbox").find("div").find("div").length; i++) {
                    // init
                    day1 = {};


                    const addressInfo = $("#addedbox").find("div").find("div")[i];


                    const childrens = addressInfo.children;

                    //
                    // // 첫번째 방법
                    // if(childrens.length == 4)
                    // {
                    //
                    // }
                    // else if(childrens.length == 3)
                    // {
                    //
                    // }
                    //
                    // // 두번째 방법
                    // const json = JSON.parse(childrens);
                    //
                    // if( isEmpty(json.placeLoadAddress) )
                    // {
                    //
                    // }

                    day1["placeName"] = (childrens[0].innerHTML);
                    //  세번째 방법

                    try {
                        day1["placeLoadAddress"] = (childrens[1].innerHTML);
                    } catch (error) {
                        console.error(error);
                    }

                    try {
                        day1["placeAddress"] = (childrens[2].innerHTML);
                    } catch (error) {
                        console.error(error);
                    }

                    try {
                        day1["planNum"] = (childrens[3].innerHTML);
                    } catch (error) {
                        console.error(error);
                    }

                    try {
                        day1["totalDay"] = (day_count);
                    } catch (error) {
                        console.error(error);
                    }

                    try {
                        day1["startDate"] = ((startdate_date).yyyymmdd)();
                    } catch (error) {
                        console.error(error);
                    }
                    try {
                        day1["endDate"] = ((enddate_date).yyyymmdd());
                    } catch (error) {
                        console.error(error);
                    }

                    const data = await addressSearch(childrens[1].innerHTML);

                    try {
                        day1["xlab"] = data.result[0].x;  //data.result[0].y, data.result[0].x
                    } catch (error) {
                        console.error(error);
                    }

                    try {
                        day1["ylab"] = data.result[0].y;
                    } catch (error) {
                        console.error(error);
                    }

                    day1["planTitle"] = ("${title}");

                    schedule1.push(day1)
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

        for (let i = 0; i < Object.keys(schedule).length; i++) {
            let day_schedule = schedule[i];
            html += '<div class="draggable" draggable="true" id="plus' + i + '">';
            html += '<div class="data">';
            html += '<h5>' + day_schedule["placeName"] + '</h5>'
            html += '<span>' + day_schedule["placeLoadAddress"] + '</span>'
            html += '<span class="jibun gray">' + day_schedule["placeAddress"] + '</span>'
            if (day_schedule["planNum"] != null) {
                html += '<span class="tel"></span>' + day_schedule["planNum"] + '</span>'
            }
            html += '</div>'
            html += '<button class="delete" id="minus' + i + '" onclick="f_minus(\'plus' + i + '\')"> 제거 </button>'
            html += '</div>'
        }

        $('#addedbox').html(html);

    }

    function f_send() {
        console.log(plan_Array);
        $.ajax({
            type: "post",
            url: "/plan/plan.wow",
            data: {"plan": JSON.stringify(plan_Array)},
            success: function (data) {
                console.log(data)
                location.href = encodeURI("/plan/marker.wow?planTitle=${title}");
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

</script>
</html>