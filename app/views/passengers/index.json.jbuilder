json.array!(@passengers) do |passenger|
  json.extract! passenger, :id, :name, :birthplace, :deathplace, :birthdate, :deathdate, :notability
  json.url passenger_url(passenger, format: :json)
end
