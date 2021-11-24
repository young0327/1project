		// 지도와 함께 쓸 수 있는 다양한 라이브러리
			// 1) services : 장소 검색, 주소를 좌표로 변환해주는 라이브러리
			// 2) clusterer : 마커를 찍어줄 수 있는 라이브러리
			// 3) drawing : 지도 위에 마커나 그래픽을 그려줄 구 있는 라이브러리
			
			
			
			// javascript 문법
			// 카카오맵 api 코드를 작성하는 공간
			// 1) 지도를 담을 영역을 가져오자
			let container = document.getElementById('map');
var options = { //지도를 생성할 때 필요한 기본 옵션
   center: new kakao.maps.LatLng(35.110759, 126.877471), //지도의 중심좌표.
   level: 3 //지도의 레벨(확대, 축소 정도)
};
var map = new kakao.maps.Map(container, options);
//services : 장소검색, 주소를 좌표로 변환해주는 라이브러리
//clusterer : 마커를 찍어줄 수 있는 라이브러리
//drawing : 지도 위에 마커를 두거나 그래픽적 요소를 가지게 할 수 있음
//클릭한 위치에 마커 생성
let marker = new kakao.maps.Marker({
   position: map.getCenter()
})
marker.setMap(map);

// 지도에 클릭 이벤트를 등록합니다
// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다

kakao.maps.event.addListener(map, 'click', function(mouseEvent) {

   // 클릭한 위도, 경도 정보를 가져옵니다 
   var latlng = mouseEvent.latLng;

   // 마커 위치를 클릭한 위치로 옮깁니다
   marker.setPosition(latlng);

   var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
   message += '경도는 ' + latlng.getLng() + ' 입니다';

   var resultDiv = document.getElementById('clickLatlng');
   resultDiv.innerHTML = message;
			});