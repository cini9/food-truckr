class ReservationsController < ApplicationController

  def new
    @foodtruck = FoodTruck.find(params[:food_truck_id])
    @reservation = Reservation.new
  end

  def create
    @foodtruck = FoodTruck.find(params[:food_truck_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @reservation.food_truck = @foodtruck
    if @reservation.save!
      redirect_to food_truck_reservations_path
    else
      render "food_trucks/show"
    end
  end

  def index
    @reservations = Reservation.where(user_id: current_user.id)
  end

  private

  def reservation_params
    params.require(:reservation).permit(:checkin_date, :checkout_date)
  end

end
