json.array!(@stops) do |stop|
  json.extract! stop, :id, :voyage_id, :port_id, :arrival, :departure
  json.url stop_url(stop, format: :json)
end
