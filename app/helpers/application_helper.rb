module ApplicationHelper
  def not_following_users
    @users = User.not_following_users(current_user)
  end

  def current_following(user)
    Following.where(follower_id: user.id).count
  end

  def current_followed(user)
    Following.where(followed_id: user.id).count
  end

  def picture?(user)
    if user[:photo].nil?
      raw('<i class="fas fa-user fa-3x m-2 mr-3"></i>')
    else
      (image_tag user.photo.thumb.url, class: 'm-2')
    end
  end

  def profile_picture?(user)
    if user[:photo].nil?
      raw('<i class="fas fa-user fa-3x m-2 mr-3"></i>')
    else
      (image_tag user.photo.profile.url, class: 'm-2')
    end
  end
end
