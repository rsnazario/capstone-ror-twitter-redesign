class Opinion < ApplicationRecord
  validates :text, presence: true, length: { maximum: 126 }
  belongs_to :author, class_name: 'User'
  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
end
