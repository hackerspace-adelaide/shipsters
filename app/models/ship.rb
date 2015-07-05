require 'elasticsearch/model'

class Ship < ActiveRecord::Base
	has_many :voyages

	include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
end
