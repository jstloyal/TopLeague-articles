class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3 }
  validates :text, presence: true, length: { minimum: 10, maximum: 5000 }

  belongs_to :author, class_name: 'User'
  has_many :article_categories
  has_many :categories, through: :article_categories
  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
end
