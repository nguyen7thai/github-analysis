class GithubAccount < ActiveRecord::Base
  has_many :comments
end
