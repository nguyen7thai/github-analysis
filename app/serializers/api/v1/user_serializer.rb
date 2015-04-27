class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :token

  def token
    object.authentication_token
  end
end
