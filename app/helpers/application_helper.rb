module ApplicationHelper

	def search_controller
		return_controller = 'passengers'
		if controller_name == 'ships'
			return_controller = controller_name
		end
		return return_controller
	end

	def voyage_start(voyage)
		stops_sorted = voyage.stops.sort_by(&:arrival)
		return stops_sorted.first
	end

	def voyage_stop(voyage)
		stops_sorted = voyage.stops.sort_by(&:arrival)
		return stops_sorted.last
	end

end
