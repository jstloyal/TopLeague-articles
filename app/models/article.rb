class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3 }
  validates :text, presence: true, length: { minimum: 10, maximum: 5000 }
  validates :image, presence: true

  belongs_to :author, class_name: 'User'
  has_many :article_categories
  has_many :categories, through: :article_categories
  has_many :votes, dependent: :destroy
  has_many :voters, through: :votes
  has_many :users_vote, through: :votes, source: :user
  mount_uploader :image, ImageUploader

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
  scope :highest_vote, -> { order(votes_count: :desc) }
end
