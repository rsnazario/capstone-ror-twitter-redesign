module UsersHelper
  def user_following
    Following.find_by(follower_id: current_user.id, followed_id: @user.id)
  end
end
