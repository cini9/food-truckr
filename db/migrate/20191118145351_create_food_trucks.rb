class CreateFoodTrucks < ActiveRecord::Migration[5.2]
  def change
    create_table :food_trucks do |t|
      t.string :name
      t.string :category
      t.integer :price
      t.string :city
      t.text :description

      t.timestamps
    end
  end
end
