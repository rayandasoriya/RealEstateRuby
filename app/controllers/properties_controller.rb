class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, only:[:search, :new_search]


  # GET /properties
  # GET /properties.json
  def index
    @properties = Property.all
  end

  # GET /properties/1
  # GET /properties/1.json
  def show
  end

  # GET /properties/new
  def new
    if current_user.company_id == nil
      redirect_to user_edit_path(current_user.id), :flash => { :error => "Cannot List a new Property without a Company" }
      return
    end
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit
  end

  # POST /properties
  # POST /properties.json
  def create
    @property = Property.new(property_params)
    # @property.images.attach(params[:images])
    @property.company_id = current_user.company_id
    @property.created_by = current_user.id
    respond_to do |format|
      if @property.save
        format.html { redirect_to @property, notice: 'Property was successfully created.' }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1
  # PATCH/PUT /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @property, notice: 'Property was successfully updated.' }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: 'Property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  INTEGER_MAX = 2147483647
  SIZE_MAPPING = {
    1 => [0, 500],
    2 => [500, 1500],
    3 => [1500, 3000],
    4 => [3000, INTEGER_MAX]
  }
  PRICE_MAPPING = {
    1 => [0, 100000],
    2 => [100000, 250000],
    3 => [250000, 500000],
    4 => [500000, 1000000],
    5 => [1000000, INTEGER_MAX]
  }

  def search 
    @sp = params.fetch(:search_params, {})
    @properties = Property.all
    @properties = @properties.where(:size => SIZE_MAPPING[@sp['size'].to_i][0]...SIZE_MAPPING[@sp['size'].to_i][1]) if @sp['size'].present?
    @properties = @properties.where(['address LIKE ?', "%#{@sp['address']}%"]) if @sp['address'].present? && @sp['address'] != ""
    @properties = @properties.where(:price => PRICE_MAPPING[@sp['price'].to_i][0]...PRICE_MAPPING[@sp['price'].to_i][1]) if @sp['price'].present?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_property
    @property = Property.find(params[:id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def property_params
    params.fetch(:property, {})
    params.require(:property).permit(:owner, :address, :price, :size, :floors, :style, :title, :basement, :content, :image)
  end
end
