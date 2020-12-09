class Article < ApplicationRecord
  has_many :viewers
  validates :title, presence: true,
            length: {minimum: 5}
end
