class RemovePriceFromFoodTrucks < ActiveRecord::Migration[5.2]
  def change
    remove_column :food_trucks, :price
  end
end
