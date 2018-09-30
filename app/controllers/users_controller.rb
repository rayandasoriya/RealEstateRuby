class UsersController < ApplicationController

  def index
    @users = User.all 
  end

  def hunter 
    @users = User.where(is_hunter: 1)
  end

  def realtor 
    @users= User.where(is_realtor: 1)
  end

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
