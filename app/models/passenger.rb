class Passenger < ActiveRecord::Base
	belongs_to :embarked, class_name: 'Stop'
  belongs_to :disembarked, class_name: 'Stop'
  accepts_nested_attributes_for :embarked
  accepts_nested_attributes_for :disembarked
end
