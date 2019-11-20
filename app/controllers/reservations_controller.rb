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
    @reservation.amount_cents = @foodtruck.price_cents
    if @reservation.save!
      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [{
          name: @foodtruck.name,
          # images: [@foodtruck.photo_url],
          amount: @foodtruck.price_cents,
          currency: 'CHF',
          quantity: 1
        }],
        success_url: food_truck_reservation_url(@foodtruck, @reservation),
        cancel_url: food_truck_reservation_url(@foodtruck, @reservation)
      )

      @reservation.update(checkout_session_id: session.id)
      redirect_to reservations_path
    else
      render "food_trucks/show"
    end
  end

  def index
    @reservations = Reservation.where(user_id: current_user.id)
  end

  def show
    @reservation = current_user.reservations.find(params[:id])
  end

  private

  def reservation_params
    params.require(:reservation).permit(:checkin_date, :checkout_date)
  end

end
