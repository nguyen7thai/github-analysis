module DataPush
  class CommentPush
    def initialize target
      @target = target
    end

    def review_comment
      review_results = Analytics::CommitReview.new(@target).call
      review_results.each do |file_name, results|
        results.each do |result|
          GithubService.commit_comment(@target.repository.name, @target.sha, file_name, result) if result.present?
        end
      end
    end
  end
end
