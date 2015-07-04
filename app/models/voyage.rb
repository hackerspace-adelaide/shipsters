class Voyage < ActiveRecord::Base
  belongs_to :ship
  has_many :stops
end
