class Commit < ActiveRecord::Base
  belongs_to :repository
  has_many :comments
  serialize :raw_data

  def changed_files
    raw_data ? raw_data.to_h[:files] : []
  end
end
