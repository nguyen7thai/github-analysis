class ConstructiveSpamsController < ApplicationController
  before_action :require_logged_in

  def create
    commit = Commit.find(params[:commit_id])
    DataPush::CommentPush.new(commit).review_comment
    render json: { status: :ok }
  end
end
