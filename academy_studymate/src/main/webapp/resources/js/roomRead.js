$(function() {
	var borAddr = $("#borAddr").val();
	
	$.post('/studymate/getLocation', 'borAddr=' + borAddr , function(resultMap) {
		var x = resultMap.wd;
		var y = resultMap.kd;
		
		var container = document.getElementById('map');
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new daum.maps.LatLng(x, y), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};
		var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴
		
		
		var markerPosition  = new daum.maps.LatLng(x, y); 

		//마커를 생성합니다
		var marker = new daum.maps.Marker({
		 position: markerPosition
		});
		//마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
		var mapTypeControl = new daum.maps.MapTypeControl();

		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new daum.maps.ZoomControl();
		map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
	});
	
});