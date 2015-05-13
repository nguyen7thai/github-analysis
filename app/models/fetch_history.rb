class FetchHistory < ActiveRecord::Base
  STATUS = [
    SUCCESS = 'Success',
    FAILED = 'Failed',
    STARTED = 'Started',
  ]

  scope :success, -> { where(status: SUCCESS) }

  def self.start_fetching type
    create(fetch_type: type, status: STARTED)
  end

  def self.last_fetch type
    FetchHistory.success.where(fetch_type: type).order(finished_at: :desc).first
  end

  def self.last_all_comments_fetch
    success.where(fetch_type: 'DataFetch::AllReposCommentFetch').last
  end

  def mark_as_success
    update_attributes(status: SUCCESS, finished_at: DateTime.now)
  end
end
