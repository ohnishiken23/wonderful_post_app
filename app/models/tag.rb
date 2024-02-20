class Tag < ApplicationRecord
  validates :name, presence: true

  has_many :article_tags
  has_many :articles, through: :article_tags
end
