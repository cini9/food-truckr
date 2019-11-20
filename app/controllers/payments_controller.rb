class PaymentsController < ApplicationController
  def new
    @reservation = current_user.reservations.where(accepted_at: nil).find(params[:reservation_id])
  end
end
