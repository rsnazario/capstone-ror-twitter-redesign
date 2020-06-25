class User < ApplicationRecord
  has_many :thoughts, class_name: 'Opinion', foreign_key: 'author_id'
  has_many :follows, foreign_key: 'follower_id', class_name: 'Following'
  has_many :followers, foreign_key: 'followed_id', class_name: 'Following'
end
