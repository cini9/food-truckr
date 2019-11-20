class AddPriceToFoodTrucks < ActiveRecord::Migration[5.2]
  def change
    add_monetize :food_trucks, :price
  end
end
