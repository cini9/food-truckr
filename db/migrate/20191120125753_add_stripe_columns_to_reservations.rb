class AddStripeColumnsToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :state, :string
    add_column :reservations, :reservation_sku, :string
    add_monetize :reservations, :amount
    add_column :reservations, :checkout_session_id, :string
  end
end
