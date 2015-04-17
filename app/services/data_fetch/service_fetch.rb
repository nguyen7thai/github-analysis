module DataFetch
  module ServiceFetch
    extend ActiveSupport::Concern

    def initialize github_service = GithubService
      @github_service = github_service
    end

    included do
      def self.call *args
        self.new.fetch *args
      end
    end
  end
end
