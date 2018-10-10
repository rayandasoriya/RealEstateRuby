class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :validate_user, only: [:show, :update, :destroy, :index, :new], :if => lambda{ Rails.env.test?}
  before_action :authenticate_user!

  # GET /
  def index
    if user_signed_in? && !current_user.is_admin
      respond_to do |format|
        format.html { redirect_to root_path }
      end
    end
    @users = User.all 
  end

  # GET /hunters
  def hunter 
    if user_signed_in? && !current_user.is_admin
      respond_to do |format|
        format.html { redirect_to root_path }
      end
    end
    @users = User.where(is_hunter: 1)
  end

  # GET /realtor
  def realtor 
    if user_signed_in? && !current_user.is_admin
      respond_to do |format|
        format.html { redirect_to root_path }
      end
    end
    @users= User.where(is_realtor: 1)
  end

  def switch
    if session[:role].present? 
      if session[:role] == 'hunter'
        session[:role] = 'realtor'
      elsif session[:role] == 'realtor'
        session[:role] = 'hunter'
      end
    else
      if current_user.is_realtor
        session[:role] = 'realtor'
      else
        session[:role] = 'hunter'
      end
    end
    redirect_to root_path
  end

  # Not implemented yet.
  def show
  end

  # GET /user/id/edit
  def edit
  end


  def validate_user
    if !user_signed_in?
      redirect_to root_path
    end

    if @user != @current_user
      redirect_to root_path
    end
  end



  # GET /user/new
  def new
    if user_signed_in? && !current_user.is_admin
      respond_to do |format|
        format.html { redirect_to root_path }
      end
    end
    @user = User.new
  end

  # PATCH/PUT /user/1
  # PATCH/PUT /user/1.json
  def update
    respond_to do |format|
      if @user.update_without_password(user_params)
        format.html { redirect_to root_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # Create User Account
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save!
        format.html { redirect_to root_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # Destroy user Account
  def destroy
    @user = User.find(params[:id])
    # Property.where(@property.user_id == params[:id]).destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'User was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.fetch(:user, {})
    params.require(:user).permit(:first_name, :last_name, :phone, :email, :password, :password_confirmation, :is_hunter, :is_realtor, :company_id, :contact_method, :current_role)
  end
end
