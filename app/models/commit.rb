class Commit < ActiveRecord::Base
  belongs_to :repository
  serialize :raw_data
end
