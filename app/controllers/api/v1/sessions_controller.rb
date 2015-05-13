class Api::V1::SessionsController < Api::V1::BaseController
  def index
    render json: {}, status: :ok
  end

  def create
    if user = User.authenticate(params[:username], params[:password])
      render json: Api::V1::UserSerializer.new(user), status: :ok
    else
      render json: { message: 'Invalid username/password' }, status: :unauthorized
    end
  end
end
