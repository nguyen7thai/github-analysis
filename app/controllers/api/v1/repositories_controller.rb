class Api::V1::RepositoriesController < Api::V1::BaseController
  before_action :authenticate_user!

  def index
    list_repos = Repository.all
    render json: list_repos, each_serializer: Api::V1::RepositorySerializer
  end
end
