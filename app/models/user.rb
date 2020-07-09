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

  scope :not_following_users, lambda { |user|
    where('id NOT IN (?)',
          (user.follows.map(&:followed_id) << user.id)).limit(10)
      .order(created_at: :desc)
  }

  def self.search_by(search_term)
    where("LOWER(fullname) LIKE :search_term", search_term: "%#{search_term.capitalize}%").or where("LOWER(username) LIKE :search_term", search_term: "%#{search_term.downcase}%")
  end
end
