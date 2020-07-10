module ApplicationHelper
  def not_following_users
    @users = User.not_following_users(current_user)
  end

  def current_following
    Following.where(follower_id: @c.id).count
  end

  def current_followed
    Following.where(followed_id: @c.id).count
  end
end
