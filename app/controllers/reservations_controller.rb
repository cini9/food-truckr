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

    if @reservation.checkout_date > @reservation.checkin_date && @reservation.save
      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [{
          name: @foodtruck.name,
          amount: @foodtruck.price_cents * 100 * (@reservation.checkout_date - @reservation.checkin_date).to_i,
          currency: 'CHF',
          quantity: (@reservation.checkout_date - @reservation.checkin_date).to_i
        }],
        success_url: food_truck_reservation_payments_paid_url(@foodtruck, @reservation),
        cancel_url: reservations_url
      )

      @reservation.update(checkout_session_id: session.id)
      redirect_to reservations_path
    else

      if @reservation.errors.any?
        flash[:alert] = @reservation.errors.messages[:user_id].join
      end
      if @reservation.checkout_date <= @reservation.checkin_date
        flash[:alert] = "Checkout date must be later than Checkin date!"
      end
      redirect_to food_truck_path(@foodtruck.id)

    end
  end

  def index
    @userreservations = Reservation.where(user_id: current_user.id)
    @ownerreservations = Reservation.joins(:food_truck).where("food_trucks.user_id = #{current_user.id}")
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
    flash.now[:notice] = 'Booked'
  end

  def show
    @reservation = current_user.reservations.find(params[:id])
  end

  private

  def reservation_params
    params.require(:reservation).permit(:checkin_date, :checkout_date)
  end
end
