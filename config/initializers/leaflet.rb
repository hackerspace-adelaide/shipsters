# Leaflet.tile_layer = "http://{s}.tiles.mapbox.com/v3/#{ENV["MAP_TILES_API_KEY"]}/{z}/{x}/{y}.png"
# Leaflet.tile_layer = "https://api.tiles.mapbox.com/v4/#{ENV["MAP_RESOURCE"]}.json?access_token=#{ENV["MAP_TILES_API_KEY"]}"
Leaflet.tile_layer = "http://a.tiles.mapbox.com/v4/#{ENV["MAP_RESOURCE"]}/{z}/{x}/{y}.png?access_token=#{ENV["MAP_TILES_API_KEY"]}"
# You can also use any other tile layer here if you don't want to use Cloudmade - see http://leafletjs.com/reference.html#tilelayer for more
Leaflet.attribution = "Your attribution statement"
Leaflet.max_zoom = 18
# Leaflet.detect_retina = true