class RealEstateAppController < ApplicationController
  def index
    if !user_signed_in?
      respond_to do |format|
        format.html { redirect_to new_user_session_path }
      end
    end
  end
end
