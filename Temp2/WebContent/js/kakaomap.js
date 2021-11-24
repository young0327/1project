			//1)services : 장소 검색, 주소를 좌표로 변환해주는 라이브러리
			//2)clusterer : 마커를 찍어줄 수 있는 라이브러리 
			//3)drawing : 지도 위에 마커나 그래픽을 그려줄 수 있는 라이브러리
			
			
			
			
			//javascript 문법
			//카카오맵 api 코드를 작성하는 공간!!!
			//1) 지도를 담을 영역을 가져오자!
			let container = document.getElementById('map')
			
			//2) 지도에 넣어줄 기본 옵션
			let options = {
					//지도 중심좌료를 어디로 보여줄 것인지! --> 경도, 위도
					center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
					
					//지도의 레벨 --> 확대, 축소의 정도
					level: 3 //지도의 레벨(확대, 축소 정도)
					
			}
			
			//3) 지도 생성
			
			let map = new kakao.maps.Map(container, options);
			
			
			
			//클릭한 위치에 마커 생성
			
			let marker = new kakao.maps.Marker({ 
			    // 지도 중심좌표에 마커를 생성합니다 
			    position: map.getCenter() 
			}); 
			// 지도에 마커를 표시합니다
			marker.setMap(map);

			// 지도에 클릭 이벤트를 등록합니다
			// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
			kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
			    //mouseEvent ----> console창에 출력해보기

				
			    // 클릭한 위도, 경도 정보를 가져옵니다 
			    let latlng = mouseEvent.latLng; 
			    
			    // 마커 위치를 클릭한 위치로 옮깁니다
			    marker.setPosition(latlng);
			    
			    let message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
			    message += '경도는 ' + latlng.getLng() + ' 입니다';
			    

				let p = document.getElementById('mappoint')
				p.innerHTML += '<span>'+message+'</span><br>'
				console.log(message)
			});