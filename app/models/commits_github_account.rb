class CommitsGithubAccount < ActiveRecord::Base
  belongs_to :commit
  belongs_to :github_account
end
