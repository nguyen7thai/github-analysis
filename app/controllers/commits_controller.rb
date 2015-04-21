class CommitsController < ApplicationController
  def index
    @repository = Repository.find(params[:repository_id])
    @commits = @repository.commits.order(committed_at: :desc)
  end

  def show
    @commit = Commit.find(params[:id])
    @results = Analytics::CommitReview.new(@commit).call
  end
end
