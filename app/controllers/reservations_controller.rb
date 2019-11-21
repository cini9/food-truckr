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
    if @reservation.save
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

      if @reservation.errors.any?
        flash[:notice] = @reservation.errors.messages[:user_id].join
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
  end

  def show
    @reservation = current_user.reservations.find(params[:id])
  end

  private

  def reservation_params
    params.require(:reservation).permit(:checkin_date, :checkout_date)
  end

end
