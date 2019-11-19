class AddUserIdToFoodTrucks < ActiveRecord::Migration[5.2]
  def change
    add_reference :food_trucks, :user, foreign_key: true
  end
end
