class Reservation < ApplicationRecord

  monetize :amount_cents

  belongs_to :user
  belongs_to :food_truck
  validates :checkin_date, presence: true
  validates :checkout_date, presence: true
  validate :forbids_owner_booking

  private

  def forbids_owner_booking
    errors.add(:user_id, "You cannot book your own Food Truck!") if user_id == food_truck.user_id
  end

end
