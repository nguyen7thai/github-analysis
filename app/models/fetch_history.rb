class FetchHistory < ActiveRecord::Base
  STATUS = [
    SUCCESS = 'Success',
    FAILED = 'Failed',
    STARTED = 'Started',
  ]

  def self.start_fetching type
    create(fetch_type: type, status: STARTED)
  end

  def self.last_fetch type
    FetchHistory.where(fetch_type: type, status: SUCCESS).order(finished_at: :desc).first
  end

  def mark_as_success
    update_attributes(status: SUCCESS, finished_at: DateTime.now)
  end
end
