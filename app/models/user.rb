class User < ApplicationRecord
  has_many :thoughts, class_name: 'Opinion', foreign_key: 'author_id'

  def yet_to_follow 
    yet = User.all
    exclude_list = [current_user.id]
    current_user.ppl_following.each do |following| 
      exclude_list << following.followed_id
    end
    yet
  end

  has_many :follows, foreign_key: 'follower_id', class_name: 'Following'
  has_many :ppl_following, through: :follows, source: 'followed'

  scope :yet, -> { where('followed_id > ?', 1) }


  has_many :followers, foreign_key: 'followed_id', class_name: 'Following'
  has_many :ppl_followers, through: :followers, source: 'followed'
end
