class Commit < ActiveRecord::Base
  belongs_to :repository
  has_many :comments
  has_many :commits_github_account, dependent: :destroy
  has_many :github_accounts, through: :commits_github_account
  serialize :raw_data

  def changed_files
    raw_data ? raw_data.to_h[:files] : []
  end

  def author
    raw_data.to_h[:commit].to_h[:author].to_h.slice(:name, :email)
  end
end
