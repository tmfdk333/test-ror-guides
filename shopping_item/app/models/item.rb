class Item < ApplicationRecord
  belongs_to :category
  validates :image, presence: true, length: { minimum: 6 }
  validates :address, presence: true, length: { minimum: 6 }
end
