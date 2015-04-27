class Api::V1::SessionsController < Api::V1::BaseController
  def create
    if user = User.authenticate(params[:username], params[:password])
      render json: UserSerializer.new(user), status: :ok
    else
      render json: { message: 'Invalid username/password' }, status: :unauthorized
    end
  end
end
