// app/javascript/application.js
function initMap() {
  var mapOptions = {
    zoom: 10,
    center: { lat: 35.681236, lng: 139.767125 }  // デフォルトの位置
  };
  var map = new google.maps.Map(document.getElementById('map'), mapOptions);

  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var pos = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };
      map.setCenter(pos); // 現在地に中心を設定
    }, function() {
      handleLocationError(true, map.getCenter());
    });
  } else {
    handleLocationError(false, map.getCenter());
  }
}

function handleLocationError(browserHasGeolocation, pos) {
  alert(browserHasGeolocation ? "エラー: Geolocationサービスに失敗しました。" : "エラー: お使いのブラウザはGeolocationをサポートしていません。");
}

// initMap関数をグローバルスコープに設定
window.initMap = initMap;