class CommentsController < ApplicationController
  before_action :require_logged_in

  def index
    comments = get_comments
    if params[:from_date].present?
      comments = comments.comments_from(params[:from_date])
    end

    if params[:people_list].present?
      people_list = params[:people_list].split("\r\n")
      comments = comments.where(username: people_list)
      @nocomment_people = people_list - comments.pluck(:username)
    end
    @comment_analytics = Analytics::CommentCount.new(comments).call
  end

  private
  def get_comments
    params[:repo] ? Repository.find(params[:repo]).comments : Comment.all
  end
end
