module ApplicationHelper
	def search_controller
		return_controller = 'passengers'
		if controller_name == 'ships'
			return_controller = controller_name
		end
		return return_controller
	end
end
