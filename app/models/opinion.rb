class Opinion < ApplicationRecord
  # Validations
  validates :text, presence: true, length: { maximum: 126 }

  # Association
  belongs_to :author, class_name: 'User'

  # Scope
  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
end
