class Category < ApplicationRecord
  validates :name, presence: true

  has_many :article_categories, dependent: :destroy
  has_many :articles, through: :article_categories
  has_many :ordered_by_most_recent, -> { order(created_at: :desc) }, through: :article_categories, source: :article
end
