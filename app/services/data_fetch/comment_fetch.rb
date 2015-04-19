module DataFetch
  class CommentFetch
    include FetchService

    def fetch repo, options = {}
      github_comments = @github_service.repo_comments repo.name, options
      github_comments.each do |github_comment|
        Comment.find_or_create_by(github_id: github_comment[:id], repository_id: repo.id) do |comment|
          assign_comment_params comment, github_comment
          commit = Commit.find_by repository: repo, sha: github_comment[:commit_id]
          begin
            commit ||= CommitFetch.call repo, github_comment[:commit_id]
            comment.commit = commit
          rescue => e
            p "Cannot pull pull commit #{github_comment[:commit_id]}"
            p e
          end
        end
      end
    end

    private
    def assign_comment_params comment, params
      comment.assign_attributes(
        username:  params[:user][:login],
        body:      params[:body],
        posted_at: params[:created_at],
        line:      params[:position] || params[:line],
        position:  params[:original_position],
        commit_id: params[:commit_id],
        file_path: params[:path],
        raw_data:  params
      )
    end
  end
end
