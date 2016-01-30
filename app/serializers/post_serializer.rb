class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :username, :created, :updated
  has_many :comments

  def username
    user = object.user
    user.email if user
  end
  # Need this because JSONAPISerializer doesn't work with underscore case
  #   Such as in updated_at and created_at
  def created
    object.created_at
  end
  def updated
    object.updated_at
  end
end
