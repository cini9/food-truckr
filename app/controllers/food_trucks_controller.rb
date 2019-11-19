class FoodTrucksController < ApplicationController
  def index
    @foodtrucks = FoodTruck.all
  end

  def new
    @foodtruck = FoodTruck.new
  end

  def create
    foodtruck = FoodTruck.new(foodtruck_params)
    foodtruck.user = current_user
    foodtruck.save!
    redirect_to food_trucks_path
  end

  def show
  end

  private

  def foodtruck_params
    params.require(:food_truck).permit(:name, :category, :price, :city, :description, :photo)
  end
end
