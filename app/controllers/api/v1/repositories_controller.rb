class Api::V1::RepositoriesController < Api::V1::BaseController
  before_action :authenticate_user!

  def index
    list_repos = Repository.all
    render json: list_repos, each_serializer: Api::V1::RepositorySerializer, root: false
  end

  def show
    repo = Repository.find(params[:id])
    order_by_comment_count = Analytics::CommentCount.new(repo.comments).call
    no_repply_comments = Analytics::NoReplyComments.new(repo.comments).call
    no_repply_comments.sort_by! { |comment| -comment.posted_at.to_i }
    no_repply_comments = ActiveModel::ArraySerializer.new no_repply_comments, each_serializer: Api::V1::CommentSerializer
    render json: {
      order_by_comment_count: order_by_comment_count,
      no_repply_comments: no_repply_comments
    }, status: :ok
  end
end
