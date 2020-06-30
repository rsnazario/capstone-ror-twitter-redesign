module OpinionsHelper
  def yet_to_follow
    (User.all - current_user.ppl_following)
  end
end
