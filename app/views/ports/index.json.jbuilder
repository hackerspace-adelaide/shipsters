json.array!(@ports) do |port|
  json.extract! port, :id, :name, :latitude, :longitude
  json.url port_url(port, format: :json)
end
