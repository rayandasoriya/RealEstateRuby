class QueriesController < ApplicationController
  before_action :set_query, only: [:show, :edit, :update, :destroy]

  # GET /queries
  # GET /queries.json
  def index
    if current_user.is_admin
      @queries = Query.all
    elsif session[:role] == 'hunter'
      @queries = Query.where(user_id: current_user.id)
    elsif session[:role] == 'realtor'
      property_id = Property.where(company_id: current_user.company_id).pluck(:id)
      @queries = Query.where(property_id: property_id)
    end
  end

  # GET /queries/1
  # GET /queries/1.json
  def show
  end

  # GET /queries/1/edit
  def edit
  end

  def reply
    @reply = Reply.new(reply_params)
    @reply.user_id = current_user.id

    # Find that Query to redirect back to same page/ Re-render the same page
    @query = Query.find(@reply.query_id)
    # Respond
    respond_to do |format|
      if @reply.save
        ReplyMailer.with(reply: @reply).new_reply_mail.deliver_now
        format.html { redirect_to @query, notice: 'Reply successfully posted.' }
        format.json { render :show, status: :created, location: @query }
      else 
        flash[:error] = "Cannot Post a Reply at this Moment, Please try again later."
        render :new
        return 
      end 
    end 
  end

  # POST /queries
  # POST /queries.json
  def create
    @query = Query.new(query_params)
    # Set User and Property_id to the Queries
    @query.user_id = current_user.id

    respond_to do |format|
      if @query.save
        format.html { redirect_to @query, notice: 'Query was successfully created.' }
        format.json { render :show, status: :created, location: @query }
      else
        format.html { render :new }
        format.json { render json: @query.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /queries/1
  # DELETE /queries/1.json
  def destroy
    @query.destroy
    respond_to do |format|
      format.html { redirect_to queries_url, notice: 'Query was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_query
      @query = Query.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def query_params
      params.fetch(:query_params, {}).permit(:subject, :message, :property_id)
    end

    def reply_params
      params.fetch(:reply_params, {}).permit(:message, :query_id)
    end
end
