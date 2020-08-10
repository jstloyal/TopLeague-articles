class User < ApplicationRecord
  validates :name, presence: true, length: { minimum: 4, maximum: 25 },
            uniqueness: { case_sensitive: false}

  has_many :articles, class_name: 'Article', foreign_key: :author_id
end
