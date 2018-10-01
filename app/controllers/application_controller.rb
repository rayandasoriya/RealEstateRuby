class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit( :sign_up, keys: [:first_name, :last_name,:phone, :email, :password, :is_hunter, :is_realtor, :contact_method])
    # devise_parameter_sanitizer.for(:account_update){|u| u.permit(:first_name, :last_name,:phone, :name, :email, :password, :current_password, :is_hunter, :is_realtor)}
  end
end
