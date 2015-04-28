module Api
  module V1
    class BaseController < ApplicationController
      protect_from_forgery with: :null_session

      def authenticate_user!
        token, options = ActionController::HttpAuthentication::Token.token_and_options(request)
        if options && (username = options[:username])
          @current_user = User.find_by(username: username, authentication_token: token)
        end

        unauthenticate! unless @current_user
      end

      def unauthenticate!
        return render json: { message: 'You are not authorized' }, status: :unauthorized
      end
    end
  end
end
