module FollowingsHelper
  def am_i_following?(table, user)
    if table.include? (user)
      return (link_to raw('<i id="follow-now" class="fas fa-plus fa-2x ml-2 mr-4"></i>'), followings_path(:follower_id => @c.id, :followed_id => user.id), :method => :post)
    end
  end
end
