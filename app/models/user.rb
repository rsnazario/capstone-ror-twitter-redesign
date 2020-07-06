class User < ApplicationRecord
  # Validations
  before_save { self.username = username.downcase }
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 15 }
  validates :fullname, presence: true, length: { minimum: 5, maximum: 50 }
  # CarrierWave Image Uploader

  mount_uploader :photo, ImageUploader
  mount_uploader :coverImage, ImageUploader

  # Associations

  has_many :thoughts, class_name: 'Opinion', foreign_key: 'author_id'

  has_many :follows, foreign_key: 'follower_id', class_name: 'Following'
  has_many :ppl_following, through: :follows, source: 'followed'

  has_many :followers, foreign_key: 'followed_id', class_name: 'Following'
  has_many :ppl_followers, through: :followers, source: 'follower'

  def friends_and_own_posts
    Opinion.where(author: ppl_following)
      .or(Opinion.where(author: self)).ordered_by_most_recent
  end

  scope :not_following_users, lambda { |user|
    where('id NOT IN (?)',
          (user.follows.map(&:followed_id) << user.id)).limit(10)
      .order(created_at: :desc)
  }
end
