class FoodTrucksController < ApplicationController
  def index
    @foodtrucks = FoodTruck.all
  end

  def new
  end

  def show
  end
end
