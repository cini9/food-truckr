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
      redirect_to reservations_path
    else
      render "food_trucks/show"
    end
  end

  def index
    @userreservations = Reservation.where(user_id: current_user.id)
    @ownerreservations = Reservation.joins(:food_truck).where(user_id: current_user.id)
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.accepted_at.nil?
      @reservation.accepted_at = Time.now
    else
      @reservation.paid_at = Time.now
    end
    @reservation.save
    redirect_to reservations_path
  end

  private

  def reservation_params
    params.require(:reservation).permit(:checkin_date, :checkout_date)
  end

end
