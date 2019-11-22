class PaymentsController < ApplicationController
  def new
    @reservation = current_user.reservations.where(accepted_at: nil).find(params[:reservation_id])
  end

  def paid
    @reservation = Reservation.find(params[:reservation_id])
    @reservation.paid_at = Time.now
    @reservation.save
    redirect_to reservations_path
  end
end
