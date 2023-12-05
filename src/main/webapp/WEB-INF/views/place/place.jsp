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
            width: 1700px;
        }

        .selectcategory {
            text-align: right;
        }

        .cell {
            text-align: center;
            width: 330px;
            height: 330px;
            background-color: white;
        }


        .cell {
            background-color: rgb(255, 255, 255);
            box-shadow: none; /* 초기에는 그림자 없음 */
            transition: box-shadow 0.3s ease, transform 0.5s ease; /* 그림자에 트랜지션 효과 적용 */
        }

        .cell > .bottom > h1{
            text-align: end;
        }

        .cell:hover {
            border-radius: 20px;
            /*box-shadow: 0px 0px 3px 2px rgb(135, 206, 250); !* 마우스 호버 시 그림자 나타남 *!*/
            transform: scale(1.1); /* 이미지 크기를 1.1배로 확대 */
        }

        .place-box a {
            text-decoration: none;
        }

        .place-box {
            text-decoration: none;
            cursor: pointer;
            margin: auto;
            width: 1400px;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            border-radius: 20px;
        }

        .place-box > div {
            width: calc(1200px / 4 - 20px);
            height: 400px;
            border: 0;
            border-bottom: 20px;
            overflow: hidden;
            margin: 10px;
        }

        .top > img {
            border-radius: 20px;
        }

        .top > img:hover{
            box-shadow: 0px 0px 3px 3px rgb(135, 206, 250); /* 마우스 호버 시 그림자 나타남 */
        }


        .bottom {
            text-align: center;
            padding-top: 10px;
            display: flex;
            align-items: self-end;
            /*align-items: center; 지역 글씨 가운데로 내 생각엔 오른쪽 끝이 이뻐서 그렇게 해둠*/
            justify-content: space-between;
            width: 232px;
            height: 65px;
            color: black;
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

        .bottom h3 {
            text-align: left;
        }

        .modalcontainer {
            margin: 10px;
            padding: 10px;
            display: flex;
            align-items: center;
            justify-content: space-between;;
        }

        /*.nav-bar>div:nth-child(1)*/
        .modalcontainer > div {
            text-align: left;
            margin: 20px;
            padding: 20px;
            border: 1px red;
            width: 90%;
            height: 90%;
        }


        .modal2 {
            background-color: white;
            width: 400px;
            height: 300px;
            border-radius: 20px;
            box-shadow: 4px 4px 4px 4px gainsboro;
            position: fixed;
            top: 10%;
            left: 50%;
            transform: translate(-50%, 0);
        }

        .align-end2 {
            text-align: end;
        }

        @keyframes summon {
            0% {
                height: 0;
                width: 0;
            }

            100% {
                height: 512px;
                width: 960px;
            }
        }

        @keyframes down {
            0% {
                top: 0%;
                transform: translate(-50%, -100%);
            }

            100% {
                top: 10%;
                transform: translate(-50%, 0);
            }
        }

        .modal-summon {
            /*animation: summon 1s forwards; 애니메이션 효과로 뜨게하는거 아래는 바로 뜨게하는거*/
            animation: summon forwards;
        }

        .d-none2 {
            display: none;
        }

        .top-background{
            height: 70px;
            background-color: #98dde3;
        }

    </style>

</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>

<div class="top-background">

</div>
<div class="container">
    <div class="selectcategory">
        <div class="btn-group">
            <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown"
                    aria-expanded="false">
                여행지 보는 순서 설정
            </button>
            <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="#"> 인기순 </a></li>
                <li><a class="dropdown-item" href="#"> 한글 글자순서 </a></li>
                <li><a class="dropdown-item" href="#"> 영어 스펠링순서 </a></li>
            </ul>
        </div>
    </div>

    <div class="place-box">
        <c:forEach var="place" items="${placeList}">
            <div class="cell" onclick="f_summon('${place.placeNum}')">
                <div class="top">
                    <img height="280px" width="280px"
                         src="<%=request.getContextPath()%>/imgDownload/showImg.wow?fileName=${place.img}&filePath=${place.imgPath}"
                         alt="">
                </div>
                <div class="bottom" style="text-align: left;">
                    <h1> ${place.englishName} </h1>
                    <h3> ${place.placeName} </h3>
                    <a href="" hidden="true"> ${place.placeNum} </a>
                </div>
            </div>
        </c:forEach>
    </div>


    <div class="modal2 modal-summon d-none2">
        <div class="align-end2">
            <img onclick="f_close2()" height="35px" width="35px"
                 src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAgVBMVEUDAQT///8AAAC2tra5ubmzs7Ovr6+2tbazsrPu7u75+fnX19eSkZKEg4RTUlPi4uKsq6yenp7S0dJoZ2gNCw7p6OlubW7Hx8cjIiSmpaYxMDFQT1A6OjsrKixLSktzcnOJiYpCQUIkIyVZWVlhYGF6eXoZGBrBwMGPjo9ERESYmJmURzJAAAAKgElEQVR4nOWd2XriOgyAE5UyTTJQQlIolKUdpu2Zvv8DHrthyeZYsuVgUl3ON1X8I1neZDkIXUsczUerdJK9bLYfeR4EQZ5/bDcv2SRdjZIodv79wKHup+TuNdtASYJCyv+0ySaz5MlhK1wRzmeLf3kFq12OnG+L8dxRS1wQJuk00LM1OXdp4qA13ITRrwXCcmrKxThibhEr4ePsYARXxTysHjkbxUcYj18s8S6QuxlfjOUiXGYseBfIv0umlrEQRumaD+8Muf1i6ZIMhMk7N94Zcs8QXK0J51M3fEfGnfUwaUm43LjjOzK+WXZIK8LlzineCXJnxWhBmEx74CsYpxa+akwYLdz6ZxUR9sZx1ZAw/uqP78iYGk4CzAiX6175CsatWXc0IYz3vfMVjAsTMxoQjvp10DIi3PVAGP29El/BmJEjDpXw8+N6fN+MH59uCSdXNOARESYOCR/7D6FtiGvSCplC+OkBnxSAkRvC354ASsT/HBDGfc1CMSJmquihEUv49OwPnxT4g91FRhLOc78ABWKOXG/gCH2JMWUBwI2MKMKVh4ASccVF+OUjnxRIeQhfvbSgFIDfHITXn6ipBTOF0xJO/OWTokfUEb76DSgQdY6qIfzy2EULAV246Sb0c5ioim7Q6CT89J9PSvfQ30U4vwELSgHomsB1ED55NxdVCeQd03A1YezZaqJL4Fm9mFITTm8HUCBO6YS/bwmwa1hUEY5uJMqcRL2WUhA+3higRFTswCkIt7cGKBDXFELPp9vtopiEtxLSNy34D2voGhVdsY0wIp9NALyz59PQNcJH27FNG+FfOuCYOfgC/ArHdMQMRziiA96LP7tjRCw0PtARW84Xm4QxVa+0YPHL8OW1FS0lWxGg6adNwgVZ6+xsfB7Ey1EvHXGhJ1wSlV4AuRy1cFEzRIBGOkOdMCaO9ScX5UOUQeYi1L4I6/oqo05I3P0tW1CKvaNWAcPwnor41U0Y0fRVLciBWAckO2oj2NQIaWGmbkEpdo5a7oMnITpqPdhUCROSsqYFba3YnjDzi9iqatptlZC0rm+zoB1i00ULofXF2nq/QkgaKVSA5ojqlCcSYm3EqBDuSHraXLQQs76osqAUUl+EFxXhksWCUkys2J20RkMsG7FMuKFcVOoCNEHUZeVREOGtnXDOB0iNf1Ljg0YjpS+WN8FLhC9oDXpAqhUxeZWEHw0ObYT4sRADSLNiV5C5CN6K5Y23C+E7LyDFitjMWALie5MQPSPFAuKt2DZVs0QszU7PhNhFBR4Qa0VKbjPa9S9LjDMhcl1IAcQh0pK3sYMGbOuE2NG+5OAY0c9uqNnp2M3q86h/IszQTkprkM6tqPrQ4eu8s3gkxK988WEB0yQqIH7GCxBXCGfcYxcO0ZkFpe5xhZC2quD63Xn9oa78pUxIOy7ksiJVD21RdprXFIQr6jSZA5HT3VtbuSoRHsj73Pb9hzsqNz9wuBAS9xAD+u/fbJ7TPnj8QnQmvDdZkds10N0wUfrG/ZmQehhj0sQqosth4vKR/ZmQfeOoTcpW6AVQfOVESNi+qCowbWY/gOI7yZEwNdzBNe2LffTB4kPpkRC/QdNANLFFXxY87n5LQvODBpO+6H6YuDQvKAhtEmUNmut6oK+0bv5NSFhXtCmhTr36ctHv1o2/CU1GQ3NEWg0oGwsGxVmiIHyzPbU1uCSPFOsT5X+S8CmwPHqn9kW8WCc+QB4JwsQ6fcKVFRnyc8SYH4Rj7gQRjwADeBCEHLmkLhBZ0o/gVRBi9xG7NbEjWkbRU7syQUg4F+1SxYzIlCMHmzAgpyKqdLGGG74kwDiI+FIm+QYNvlxViALDxWGbMjYrMuYbQxKQM4I7tDEhsmYbjwLiVmm3OpZww5oxDrPAdIHfrk+bUaEXnmHi3KI04L08Yu+ozBeuYBKwDPgljZaI3DfKIAuMN2lUKq0GDc4gUzRnGvBMaco6LazIDigmNQH/LTXziOrg0iNsAwf110wRXdzqhOcgZ1dq2hf5XVRK7oTQyIqO7uU64QtMhv5bu3isvparkJu7eEwfMtzZcPj9cPixdPjj4fDnNMOflw5/bTH89eHw1/jD36cZ/l7b8PdLh7/n7eW5BV9fhOgHnD0N//zwB5wBD/8cf/i5GMPPp/E4J8q6L8qimEEY/ht6Xpt1biIN8Bq5iT3nl9JWHyz5pXY5wuQG95ojnBR53uahxizPW10ypE0Y8rz7z9XvK5X9nKvf/30L2t/Z37cwHPNt7sz0E27Od2auce+pD0e93HsyvLtmcwO077trV7l/SHNUo/uHd2fC4d8hvdI9YMfhpnwPmH6Xm6NxrhGPNUrM7uPzOJjbe4jV+/jEmgpcQcLpBK5aU4FWF4PPuVyGm1pdjOvVNnE1gavXNiHUp6E1SV+fxpEV6/VpXNUY0q/uqIjGNYbwdaIowQFXJ4qCiK321awTRaj1hW8QttYXXiO6H15egTKp14a1IrY5+OiMLg/ZVq+NUnMPh0ipuYezIr7+ZVvNPVLdRAwirW4ixooEwFItYcPal/rfnFr7Uq+RUvuyVErYtH6pzor89UtJJVrb65fSatB2I5qs5rqtyFGDllhHuAvRrI5wFyJPHWG2FYZpLWg1Isnp1bWgqfW8VVY0r+etQmSr502tyd6OaFOTvR2RVlm/XES4QUitq9/mqHZ19dsQOevqh3tS69qsaPs2QlMj9W2EffXP/Xvfou4XVEDN+xbUU5o6IscbJVVHJb9RUn9a1v6dmfJvzvPOTBmRPDfSvjNj8FbQxYr8bwWRLah/K4gabMqIfOl2J78gv9pVDzOthF682fVgZMHLBlsnoT/vrtE1wqiJw/Z2Hu9NCXm2ZfCwHPLtvB/w/uHw37D8Ae+QhuH69hBpb8ne3rVc9cVj1ZvO9K54XSG/6fwD3uX+AW+rh/Hz7SDCc3O2picMn/JbQZTp3CaEVqm1fQqUt7hJhCKgXrvxGFGHUT1huLoBK8LxlQczwjD1HhEaGzM0Qv+HRfVAiCT0fRKumG5TCAWiv4ygB0QQCkf1FRG0Looj9Dfc6IIMmtDTQUM3TFAIvVxLaQZ6ImE4926OCnnXVI1OGD55ttKAPx2TbSPCMJ565KkAU/VyyZTQp1ED4D98swmE3sQbbIyhE4aPaw8YAdakm7YkQh+mcJiJmg1huHRQ340E+EHxUBPCMMquaEaArO3whZewuK18Jb6280EHhGG8vwoiwB49CFoSit7Yf1AF2DaSEBwShvFXv64qvpaaGNCcUEScfX+M4kt7coSxJgzDpK+ZqpiFJvrmOCAU3fGlB0aAnVkH5CAUjG9ufVVof7PisyYUvnpwxyg075DrXIeEYj4+ccMo44tF/2MkFHE1XXNDCn3bL+P4WRYWQiHLBfBBSlWZZfc7CxehmATcT1kgpZLdzHB4bxE+QiGPs4MlpPzzw4pWS0ojrIRCojs51zHBLP5sP2bpfCXhJpSSrA4BjbL437uUIXQ2xAWhlPl48S9HWLP4L/C2GFsPfApxRSjlKbl7zTZQkirWt2yyySzB7u6aiEvCQuIoGc3SSTbdbJ9z+U5Bnj9vN9Nsks5GScQXM1XyPzBZktU5FTceAAAAAElFTkSuQmCC"
                 alt="">
            <div class="modalcontainer">
                <div>
                    <p id="AreaTitleEng" style="font-size: 20px; color: #8a8a8a; font-weight: bold;"></p>
                    <p id="AreaTitle" style="font-size: 35px; color: black; font-weight: bold;"></p>
                    <hr>
<%--                    <p id="AreaContents" style="font-size: 20px; color: black;" ></p>--%>
                    <h3 id="AreaContents"></h3>
                    <hr>
                    <div style="display: flex; justify-content: flex-end;">
                        <button class="btn btn-primary" onclick="makeplanner()" style="width: 120px; height: 35px; font-size: 15px">
                            일정만들기 >
                        </button>
                    </div>
                </div>
                <div>
                    <img id="modalImage" height="330px" width="330px" src="" alt="">
                </div>
            </div>
        </div>
    </div>

</div>

<script>
    const v_modal2 = document.getElementsByClassName("modal2")[0];



    function f_summon(placeNum) {
        $.ajax({
            url: '/place/placeView',
            dataType: 'json',
            data: {
                'placeNum': placeNum
            },
            type: "post",
            success: function (data) {
                console.log(data);



                $("#AreaTitle").html(data['placeName']);
                $("#AreaTitleEng").html(data['englishName'])
                $("#AreaContents").html(data['placeContext']);

                // 이미지를 가져와서 모달 이미지에 설정
                var modalImgElement = $("#modalImage");
                modalImgElement.attr('src', '<%=request.getContextPath()%>/imgDownload/showImg.wow?fileName=' + data['img'] + '&filePath=' + data['imgPath']);

                v_modal2.classList.remove("d-none2");
            },
            error: function (error) {
                console.log(error);
            }
        });
    }

    function f_close2() {
        v_modal2.classList.add("d-none2");
    }

    function makeplanner() {
        window.location.href = "/plan/title.wow"
    }

</script>


</body>
</html>
