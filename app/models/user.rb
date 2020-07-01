class User < ApplicationRecord
  
  mount_uploader :photo, ImageUploader
  mount_uploader :coverImage, ImageUploader

  has_many :thoughts, class_name: 'Opinion', foreign_key: 'author_id'

  has_many :follows, foreign_key: 'follower_id', class_name: 'Following'
  has_many :ppl_following, through: :follows, source: 'followed'

  has_many :followers, foreign_key: 'followed_id', class_name: 'Following'
  has_many :ppl_followers, through: :followers, source: 'follower'

  def friends_and_own_posts
    Opinion.where(author: ppl_following)
      .or(Opinion.where(author: self)).ordered_by_most_recent
  end
end
