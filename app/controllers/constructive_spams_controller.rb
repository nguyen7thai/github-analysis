class ConstructiveSpamsController < ApplicationController
  def create
    commit = Commit.find(params[:commit_id])
    DataPush::CommentPush.new(commit).review_comment
    render json: { status: :ok }
  end
end
