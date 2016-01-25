class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :created, :updated

  # Need this because JSONAPISerializer doesn't work with underscore case
  #   Such as in updated_at and created_at
  def created
    object.created_at
  end
  def updated
    object.updated_at
  end
end
