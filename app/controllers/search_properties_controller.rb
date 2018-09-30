class SearchPropertiesController < ApplicationController
  before_action :set_search_property, only: [:show, :edit, :update, :destroy]

  # GET /search_properties
  # GET /search_properties.json
  def index
    @search_properties = SearchProperty.all
  end

  # GET /search_properties/1
  # GET /search_properties/1.json
  

  # GET /search_properties/new
  def new
    @search_property = SearchProperty.new
  end

  # GET /search_properties/1/edit
  def edit
  end

  # POST /search_properties
  # POST /search_properties.json
  def create
    Search.find_each(&:destroy)
    @search_property = SearchProperty.create(search_property_params)
    redirect_to @search_property
  end

  def show
    @search_property = SearchProperty.find(params[:id])
  end

  # PATCH/PUT /search_properties/1
  # PATCH/PUT /search_properties/1.json
  def update
    respond_to do |format|
      if @search_property.update(search_property_params)
        format.html { redirect_to @search_property, notice: 'Search property was successfully updated.' }
        format.json { render :show, status: :ok, location: @search_property }
      else
        format.html { render :edit }
        format.json { render json: @search_property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /search_properties/1
  # DELETE /search_properties/1.json
  def destroy
    @search_property.destroy
    respond_to do |format|
      format.html { redirect_to search_properties_url, notice: 'Search property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_search_property
    @search_property = SearchProperty.find(params[:id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def search_property_params
    params.fetch(:search_property, {})
    params.require(:search_property).permit(:address, :size, :price)
  end
end
