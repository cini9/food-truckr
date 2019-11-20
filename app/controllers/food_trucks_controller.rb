class FoodTrucksController < ApplicationController
  before_action :set_foodtruck, only: [:show, :edit]

  def index
    @foodtrucks = policy_scope(FoodTruck).order(created_at: :desc)
  end

  def new
    @foodtruck = FoodTruck.new
    authorize @foodtruck
  end

  def create
    @foodtruck = FoodTruck.new(foodtruck_params)
    @foodtruck.user = current_user
    if @foodtruck.save
      redirect_to food_trucks_path
    else
      render 'new'
    end

    authorize @foodtruck
  end

  def show
    authorize @foodtruck
    @reservation = Reservation.new
  end

  private

  def foodtruck_params
    params.require(:food_truck).permit(:name, :category, :price, :city, :description, :photo)
  end

  def set_foodtruck
    @foodtruck = FoodTruck.find(params[:id])
  end
end
