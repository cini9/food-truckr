class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :Foodtruckowner, :boolean
    add_column :users, :name, :string
    add_column :users, :description, :text
  end
end
