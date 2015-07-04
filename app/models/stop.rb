class Stop < ActiveRecord::Base
  belongs_to :voyage
  belongs_to :port
end
