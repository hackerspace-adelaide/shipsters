class Stop < ActiveRecord::Base
  belongs_to :voyage

  has_many :embarked_passengers
  has_many :disembarked_passengers

  has_many :embarked, through: :embarked_passengers, source: :passenger
  has_many :disembarked, through: :disembarked_passengers, source: :passenger
  
  #accepts_nested_attributes_for :embarked, allow_destroy: true
  #accepts_nested_attributes_for :disembarked, allow_destroy: true
end
