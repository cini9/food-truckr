class FoodTrucksController < ApplicationController
  before_action :set_foodtruck, only: [:show, :edit, :new]
  def index
    @foodtrucks = FoodTruck.all
  end

  def new
  end

  def show
  end

  private

  def set_foodtruck
    @foodtruck = FoodTruck.find(params[:id])
  end
end
