class Comment < ActiveRecord::Base
  belongs_to :repository
  belongs_to :commit

  serialize :raw_data

  delegate :committer, :to => :commit
end
