class CommitsController < ApplicationController
  before_action :require_logged_in

  def index
    @repository = Repository.find(params[:repository_id])
    @commits = @repository.commits.order(committed_at: :desc)
  end

  def show
    @commit = Commit.find(params[:id])
    @results = []
    # @results = Analytics::CommitReview.new(@commit).call
  end
end
