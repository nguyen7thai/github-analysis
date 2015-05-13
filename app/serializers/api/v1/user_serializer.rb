module Api
  module V1
    class UserSerializer < ActiveModel::Serializer
      attributes :id, :username, :token

      def token
        object.generate_authentication_token
      end
    end
  end
end
