class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!,only: [:edit]

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :birth_date, :area_id, :address, :phone_number])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :birth_date, :area_id, :address, :phone_number])
  end

end
