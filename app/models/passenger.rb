require 'elasticsearch/model'

class Passenger < ActiveRecord::Base
	belongs_to :embarked_passengers
  belongs_to :disembarked_passengers
  accepts_nested_attributes_for :embarked_passengers
  accepts_nested_attributes_for :disembarked_passengers

  delegate :stop, to: :embarked_passengers, allow_nil: true

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
end
