module OpinionsHelper
  def posted(user)
    Opinion.where(author_id: user.id).count
  end
end
