class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: [:index, :home], unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end

  protected

  def configure_permitted_parameters
    # devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password)v}

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(
        :name,
        :description,
        :food_truck_owner,
        :email,
        :password,
        :current_password,
        :avatar
      )
    end
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)|(^reservations$)|(^payments$)/
  end
end
