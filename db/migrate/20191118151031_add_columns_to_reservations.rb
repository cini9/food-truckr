class AddColumnsToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :checkin_date, :date
    add_column :reservations, :checkout_date, :date
    add_column :reservations, :accepted_at, :date
    add_column :reservations, :paid_at, :date
  end
end
