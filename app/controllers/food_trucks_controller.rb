class FoodTrucksController < ApplicationController
  def index
    @food_trucks = FoodTruck.all
  end

  def new
  end

  def show
  end
end
