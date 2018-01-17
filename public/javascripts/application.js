
<script>
  var map;
  function initMap() {
    map = new google.maps.Map(document.getElementById('map'), {
      center: {lat: -34.397, lng: 150.644},
      zoom: 8
    });
  }
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyACCs8Ut6aVSuu4RyOYqsP9XjOHZDuI2ks&callback=initMap"
async defer></script>
