class Repository < ActiveRecord::Base
  has_many :comments
  has_many :commits
  serialize :raw_data
end
