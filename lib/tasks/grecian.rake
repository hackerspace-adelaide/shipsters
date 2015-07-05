require 'open-uri'

namespace :grecian do
  desc "TODO"
  task :create => :environment do
    ship = Ship.create(name: "Grecian", launched: Date.parse("June 1849"))
    print ship.id, "\n"
    voyage = Voyage.create(ship: ship)
    print voyage.id, "\n"

    passenger_names = [
      "Mr ALDERSON",
      "Mrs HYDE",
      "Mr BABBAGE",
      "Mr POLHILL",
      "Mr GILBERT",
      "Mr T. THACKER",
      "Thacker (wife)",
      "Thacker (child)",
      "Thacker (child)",
      "Miss GLIDDON",
      "Mr WARRENER",
      "Mr HENDERSON",
      "Miss WIGLEY",
      "Miss HARDIN",
      "Mr GALLMORE",
      "Miss JACOBS",
      "Mr BERWASH",
      "Mr JOHNSON",
      "Mr FRIEND",
      "Mr BARMSLEY",
      "Mr CALF",
      "Mrs Calf",
      "Calf (child)",
      "Miss HOWDEN",
      "Mr CULLERME",
      "Mr HUMMEL",
      "Hummel (wife)",
      "Hummel (child)",
      "Mr GILLESPE, Mr",
      "Mr RADCLIFFE",
      "Radcliffe (wife)",
      "Radcliffe (child)",
      "Mr HALSTONE", 
      "Mr STOKES",
      "Stokes (wife)",
      "Stokes (child)" ]

    passengers = []
    for passenger_name in passenger_names
      passengers.append(Passenger.create(name: passenger_name))
    end

    from_port = Port.find_or_create_by(name: "London")
    print from_port.id, "\n"
    from_stop = Stop.create(voyage: voyage, port: from_port, departure: Date.parse("13-06-1849"))
    from_stop.embarked.append(passengers)
    from_stop.save
    print from_stop.id, "\n"

    to_port = Port.find_or_create_by(name: "Adelaide")
    print to_port.id, "\n"
    to_stop = Stop.create(voyage: voyage, port: to_port, arrival: Date.parse("September 24, 1849"))
    to_stop.disembarked.append(passengers)
    to_stop.save
    print to_stop.id, "\n"

  end
end


