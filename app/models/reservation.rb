class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :food_truck
  validates :checkin_date, presence: true
  validates :checkout_date, presence: true
end
