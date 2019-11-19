class ReservationsController < ApplicationController

  def new
    @foodtruck = Foodtruck.find(params[:foodtruck_id])
    @reservation = Reservation.new
  end

  def create
    @foodtruck = Foodtruck.find(params[:foodtruck_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.foodtruck = @foodtruck
    if @reservation.save
      redirect_to foodtruck_path(@foodtruck)
    else
      render "foodtrucks/show"
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
