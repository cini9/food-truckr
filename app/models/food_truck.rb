class FoodTruck < ApplicationRecord

  mount_uploader :photo, PhotoUploader

  has_many :reservations, dependent: :destroy
  has_many :users, through: :reservations
  validates :name, presence: true, uniqueness: true
  validates :category, inclusion: { in: [ "italian", "turkish", "belgian", "chinese", "japanese", "french", "burgers", "vegan" ] }
  validates :price, presence: true
  validates :city, presence: true

end
