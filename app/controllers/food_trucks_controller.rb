class FoodTrucksController < ApplicationController
  before_action :set_foodtruck, only: [:show, :edit]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:search].nil? || params[:search].empty?
      @foodtrucks = policy_scope(FoodTruck).order(created_at: :desc)
    else
      @foodtrucks = policy_scope(FoodTruck).where(category: params[:search]).order(created_at: :desc)
      if @foodtrucks.empty?
        flash[:error] = "Couldn't find your search !"
        redirect_to root_path
      else
        @foodtrucks
      end
    end
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

  def edit
    authorize @foodtruck
  end

  def update
    if @foodtruck.update(foodtruck_params)
      redirect_to food_truck_path(@foodtruck)
      flash[:notice] = 'Food Truck updated'
    else
      render :edit
      flash.now[:error] = 'Food truck not updated !'
    end
    authorize @foodtruck
  end

  private

  def foodtruck_params
    params.require(:food_truck).permit(:name, :category, :price, :city, :description, :photo, :search)
  end

  def set_foodtruck
    @foodtruck = FoodTruck.find(params[:id])
  end
end
