class DisembarkedPassenger < ActiveRecord::Base
  belongs_to :stop
  belongs_to :passenger
end
