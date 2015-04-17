class RepositoriesController < ApplicationController
  def index
    @list_repos = Repository.all
  end

  def show
    @repo = Repository.find(params[:id])
    @order_by_comment_count = Analytics::CommentCount.new(@repo.comments).call
    @no_repply_comments = Analytics::NoReplyComments.new(@repo.comments).call
    @no_repply_comments.sort_by! { |comment| -comment.posted_at.to_i }
  end
end
