module ApplicationHelper
  def not_following_users
    @users = User.not_following_users(current_user)
  end
end
