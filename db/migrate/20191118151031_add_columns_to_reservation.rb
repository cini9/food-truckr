class AddColumnsToReservation < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :CheckingDate, :date
    add_column :reservations, :CheckOutDate, :date
    add_column :reservations, :AcceptedAt, :date
    add_column :reservations, :PaidAt, :date
  end
end
