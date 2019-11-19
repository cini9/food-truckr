class FoodTrucksController < ApplicationController
  before_action :set_foodtruck, only: [:show, :edit, :new]
  def index
  end

  def new
  end

  def show
    @foodtruck = FoodTruck.find(params[:id])
  end

  private

  def set_foodtruck
    @foodtruck = FoodTruck.find(params[:id])
  end
end
