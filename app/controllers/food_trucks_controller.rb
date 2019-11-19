class FoodTrucksController < ApplicationController
  before_action :set_foodtruck, only: [:show, :edit]
  def index
    if params[:search]
      @foodtrucks = FoodTruck.where(category: params[:search])
    else
      @foodtrucks = FoodTruck.all
    end
  end

  def new
    @foodtruck = FoodTruck.new
  end

  def create
    @foodtruck = FoodTruck.new(foodtruck_params)
    @foodtruck.user = current_user
    if @foodtruck.save
      redirect_to food_trucks_path
    else
      render 'new'
    end
  end

  def show
  end

  private

  def foodtruck_params
    params.require(:food_truck).permit(:name, :category, :price, :city, :description, :photo, :search)
  end

  def set_foodtruck
    @foodtruck = FoodTruck.find(params[:id])
  end
end
