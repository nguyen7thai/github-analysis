module Analytics
  class ReviewCommentCount
    def initialize comments
      @comments = comments.where.not(commit_id: nil)
    end

    def call
      @comments = @comments.includes(commit: [:github_accounts]).reject do |comment|
        # debugger if comment.commit == nil
        comment.commit.github_account_ids.include? comment.github_account_id
      end
      CommentCount.new(@comments).call
    end
  end
end
