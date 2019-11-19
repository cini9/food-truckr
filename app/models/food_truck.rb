class FoodTruck < ApplicationRecord

  CATEGORY = [ "italian", "turkish", "belgian", "chinese", "japanese", "french", "burgers", "vegan" ]

  mount_uploader :photo, PhotoUploader

  has_many :reservations, dependent: :destroy
  belongs_to :user
  validates :name, presence: true, uniqueness: true
  validates :category, inclusion: { in: CATEGORY }
  validates :price, presence: true
  validates :city, presence: true

end
