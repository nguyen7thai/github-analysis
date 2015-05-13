module Api
  module V1
    class BaseController < ApplicationController
      protect_from_forgery with: :null_session

      def authenticate_user!
        token, options = ActionController::HttpAuthentication::Token.token_and_options(request)

        begin
          payload = Auth::AuthToken.decode(token)
          if payload[:exp] > Time.now.to_i
            @current_user = User.find_by(username: payload[:username])
          else
            return render json: { message: 'Token expired' }, status: :unauthorized
          end
        rescue
          p 'Token Decode failed'
        end
        unauthenticate! unless @current_user
      end

      def unauthenticate!
        return render json: { message: 'You are not authorized' }, status: :unauthorized
      end
    end
  end
end
