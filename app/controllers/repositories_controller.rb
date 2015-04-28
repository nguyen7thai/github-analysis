class RepositoriesController < ApplicationController
  before_action :require_logged_in

  def index
    @list_repos = Repository.order(:name)
  end

  def show
    @repo = Repository.find(params[:id])
    @order_by_comment_count = Analytics::CommentCount.new(@repo.comments).call
    @no_repply_comments = Analytics::NoReplyComments.new(@repo.comments).call
    @no_repply_comments.sort_by! { |comment| -comment.posted_at.to_i }
  end
end
