json.array!(@voyages) do |voyage|
  json.extract! voyage, :id, :ship_id
  json.url voyage_url(voyage, format: :json)
end
