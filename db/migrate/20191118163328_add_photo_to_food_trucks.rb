class AddPhotoToFoodTrucks < ActiveRecord::Migration[5.2]
  def change
    add_column :food_trucks, :photo, :string
  end
end
