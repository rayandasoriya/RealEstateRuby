class UsersController < ApplicationController
  private
  def sign_up_params
    params.require(:user).permit(:id, :first_name, :last_name, :phone, :email, :password, :is_recruiter, :is_applicant)
  end

  def account_update_params
    params.require(:user).permit(:id, :first_name, :last_name,:phone, :name, :email, :password, :current_password, :is_recruiter, :is_applicant)
  end

  def user_params
    params.require(:user).permit(:id, :first_name, :last_name, :phone, :email, :password, :is_hunter, :is_realtor)
  end
end
