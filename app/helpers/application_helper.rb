module ApplicationHelper

	def search_controller
		return_controller = 'passengers'
		if controller_name == 'ships'
			return_controller = controller_name
		end
		return return_controller
	end

  def sorted_stops(voyage)
		return voyage.stops.sort_by{|a,b| a.try(:arrival) && b.try(:arrival) ? a.try(:arrival) <=> b.try(:arrival) : a.try(:arrival) ? -1 : 1 }
	end
		

	def voyage_start(voyage)
		return sorted_stops(voyage).first
	end

	def voyage_stop(voyage)
		return sorted_stops(voyage).last
	end

	def embarked_ports_for_passenger(passenger)
		EmbarkedPassenger.where(passenger_id: passenger.id)
	end

	def disembarked_ports_for_passenger(passenger)
		DisembarkedPassenger.where(passenger_id: passenger.id)
	end

end
