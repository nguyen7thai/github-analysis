class CommentsController < ApplicationController
  before_action :require_logged_in

  def index
    @comment_analytics = Analytics::CommentCount.new(get_comments).call
  end

  private
  def get_comments
    params[:repo] ? Repository.find(params[:repo]).comments : Comment.all
  end
end
