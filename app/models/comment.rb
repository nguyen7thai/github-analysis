class Comment < ActiveRecord::Base
  belongs_to :repository
  belongs_to :commit
  belongs_to :github_account

  serialize :raw_data

  delegate :committer, :to => :commit

  scope :comments_from, -> (from_date) { where('posted_at >= ?', from_date) }
end
