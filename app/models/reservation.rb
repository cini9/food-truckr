class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :foodtruck
  validates :checkin_date, presence: true
  validates :checkout_date, presence: true
end
