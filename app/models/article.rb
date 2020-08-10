class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3 }
  validates :text, presence: true, length: { minimum: 10, maximum: 5000 }

  belongs_to :author, class_name: 'User'
  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
end
