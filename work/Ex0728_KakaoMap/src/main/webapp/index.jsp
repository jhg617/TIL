<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "KakaoMap 연습" %>
</h1>
<br/>
<div id="map" style="width:500px;height:400px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a5cf1bec1336ceadc3e64b722b9b034a"></script>
<script>
    var container = document.getElementById('map');
    var options = {
        center: new kakao.maps.LatLng(37.499334, 127.033162),
        level: 3
    };
    var map = new kakao.maps.Map(container, options);

    // 버튼을 클릭하면 아래 배열의 좌표들이 모두 보이게 지도 범위를 재설정합니다
    var points = [
        new kakao.maps.LatLng(37.499334, 127.033162),
        new kakao.maps.LatLng(33.452671, 126.574792),
        new kakao.maps.LatLng(33.451744, 126.572441)
    ];
    // 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
    var bounds = new kakao.maps.LatLngBounds();

    var i, marker;
    for (i = 0; i < points.length; i++) {
        // 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다
        marker =     new kakao.maps.Marker({ position : points[i] });
        marker.setMap(map);

        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(points[i]);
    }
</script>
</body>
</html>