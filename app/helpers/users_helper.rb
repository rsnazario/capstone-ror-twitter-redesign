# rubocop:disable Layout/LineLength

module UsersHelper
  def user_following(user)
    Following.find_by(follower_id: current_user.id, followed_id: user.id)
  end

  def am_i_following?(table, user)
    return unless table.include? user
    return if user == @c

    link_to raw('<i id="follow-now" class="fas fa-plus fa-size ml-2 mr-4"></i>'), followings_path(follower_id: @c.id, followed_id: user.id), method: :post
  end

  def delete?(table, user)
    return unless table.include? user

    link_to raw('<i class="fas fa-user-minus fa-size ml-3"></i>'), following_path(user_following(user)), method: :delete
  end
end

# rubocop:enable Layout/LineLength
