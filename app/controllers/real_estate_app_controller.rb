class RealEstateAppController < ApplicationController
  def index
    if !user_signed_in?
      respond_to do |format|
        format.html { redirect_to new_user_session_path }
      end
    end
    if current_user
      if !session[:role].present? && current_user.is_realtor
        session[:role] = 'realtor'
      elsif !session[:role].present? && current_user.is_hunter
        session[:role] = 'hunter'
      end
    end
  end
end
