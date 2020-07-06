class AddIndexesToFollowings < ActiveRecord::Migration[5.2]
  def change
    add_index :followings, :follower_id
    add_index :followings, :followed_id
  end
end
