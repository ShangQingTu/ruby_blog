class Viewer < ApplicationRecord
  validates :name, presence: true
  belongs_to :article
end
