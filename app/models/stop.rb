class Stop < ActiveRecord::Base
  belongs_to :voyage
  belongs_to :port
  has_many :embarked, foreign_key: :id, class_name: "Passenger"
  has_many :disembarked, foreign_key: :id, class_name: "Passenger"
  accepts_nested_attributes_for :embarked, allow_destroy: true
  accepts_nested_attributes_for :disembarked, allow_destroy: true
end
