class FoodTrucksController < ApplicationController
  before_action :set_foodtruck, only: [:show, :edit, :update]
  before_action :skip_pundit?, only: :home
  skip_before_action :authenticate_user!, only: [:index, :show, :home]

  def home
  end

  def index
    if params[:query].present?
      sql_query = " \
        food_trucks.name ILIKE :query \
        OR food_trucks.category ILIKE :query \
        OR food_trucks.city ILIKE :query \
      "
      @foodtrucks = policy_scope(FoodTruck).where(sql_query, query: "%#{params[:query]}%").order(created_at: :desc)
        if @foodtrucks.empty?
          flash[:alert] = "Couldn't find your search !"
          redirect_to root_path
        else
          @foodtrucks
        end
    else
      @foodtrucks = policy_scope(FoodTruck).order(created_at: :desc)
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
      redirect_to food_truck_path(@foodtruck)
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
      flash.now[:alert] = 'Food truck not updated !'
    end
    authorize @foodtruck
  end

  private

  def foodtruck_params
    params.require(:food_truck).permit(:name, :category, :price_cents, :city, :description, :photo, :search)
  end

  def set_foodtruck
    @foodtruck = FoodTruck.find(params[:id])
  end
end
