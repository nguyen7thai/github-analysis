class Api::V1::CommentSerializer < ActiveModel::Serializer
  attributes :id, :username, :posted_at, :html_url

  def html_url
    object.raw_data.to_hash[:html_url]
  end
end
