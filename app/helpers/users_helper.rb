module UsersHelper
  def user_following(user)
    Following.find_by(follower_id: current_user.id, followed_id: user.id)
  end

  def am_i_following?(table, user)
    if table.include? (user)
      return (link_to raw('<i id="follow-now" class="fas fa-plus fa-size ml-2 mr-4"></i>'), followings_path(:follower_id => @c.id, :followed_id => user.id), :method => :post)
    end
  end

  def will_delete?(table, user)
    if table.include? (user)
      return (link_to raw('<i class="fas fa-user-minus fa-2x ml-3"></i>'), following_path(user_following(user)), method: :delete)
    end
  end

  def am_i_following?(table, user)
    if table.include? (user)
      return (link_to raw('<i id="follow-now" class="fas fa-plus fa-size ml-2 mr-4"></i>'), followings_path(:follower_id => @c.id, :followed_id => user.id), :method => :post) unless user == @c
    end
  end

  def delete?(table, user)
    if table.include? (user)
      return (link_to raw('<i class="fas fa-user-minus fa-size ml-3"></i>'), following_path(user_following), method: :delete)
    end
  end
end
