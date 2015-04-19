module DataFetch
  module FetchService
    extend ActiveSupport::Concern

    def initialize github_service = GithubService
      @github_service = github_service
    end

    included do
      def self.call *args
        self.new.fetch *args
      end

      def self.schedule_call *args, options
        if last_fetch = FetchHistory.last_fetch(self.name)
          options.merge! since: last_fetch.finished_at
        end
        current_fetch = FetchHistory.start_fetching self.name
        self.new.fetch *args, options
        current_fetch.mark_as_success
      end
    end
  end
end
