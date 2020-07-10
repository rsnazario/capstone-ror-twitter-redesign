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

  def picture?(user)
    unless user[:photo].nil?
      return (image_tag user.photo.thumb.url, class: 'm-2')
    else
      return raw('<i class="fas fa-user fa-3x m-2 mr-3"></i>')
    end
  end

  def profile_picture?(user)
    unless user[:photo].nil?
      return (image_tag user.photo.profile.url, class: 'm-2')
    else
      return raw('<i class="fas fa-user fa-3x m-2 mr-3"></i>')
    end
  end
end
