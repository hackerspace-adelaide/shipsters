class Passenger < ActiveRecord::Base
	belongs_to :embarked, class_name: 'Stop'
  belongs_to :disembarked, class_name: 'Stop'
end
