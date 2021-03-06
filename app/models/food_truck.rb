class FoodTruck < ApplicationRecord
  CATEGORIES = ["italian", "turkish", "belgian", "chinese", "japanese", "french", "burgers", "vegan"]

  mount_uploader :photo, PhotoUploader
  monetize :price_cents

  has_many :reservations, dependent: :destroy
  belongs_to :user
  validates :name, presence: true, uniqueness: true

  validates :category, inclusion: { in: CATEGORIES }
  validates :price, presence: true

  validates :city, presence: true
end
