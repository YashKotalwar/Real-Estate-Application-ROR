require "#{Rails.root}/app/mailers/agent_mailer.rb"
class PropertiesController < ApplicationController
  before_action :set_property, only: %i[ show edit update destroy favorite unfavorite]
  before_action :authenticate_account!, only: [:new, :create, :destroy]
  before_action :set_sidebar, except: [:show]
  # GET /properties or /properties.json
  def index
    @properties = Property.all
    @properties1 = Property.all.includes(:images)
    if params[:q]
      @properties = @properties.where("name LIKE ? OR price LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%")
    end
  end




  def favorite
    current_account.favorite_properties << @property
    redirect_to properties_path, notice: "Added to favorites"
  end

  def unfavorite
    current_account.favorite_properties.delete(@property)
    redirect_to properties_path, notice: "Removed from favorites"
  end

  # GET /properties/1 or /properties/1.json
  def show
    @agent = @property.account
    @agent_properties = Property.where(account_id: @agent.id ).where.not(id: @property.id)
    # ActiveStorage::Current.set(url_options: { host: request.base_url })
  end

  # GET /properties/new
  def new
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit
  end

  # POST /properties or /properties.json
  def create
    @property = Property.new(property_params)
    if params[:images]
      params[:images].each do |image|
        @property.images.attach(image)
      end
    end

    @property.account_id = current_account.id

    respond_to do |format|
      if @property.save
        format.html { redirect_to property_url(@property), notice: "Property was successfully created." }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1 or /properties/1.json
  def update
    if params[:images]
      params[:images].each do |image|
        @property.images.attach(image)
      end
    end
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to property_url(@property), notice: "Property was successfully updated." }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1 or /properties/1.json
  def destroy
    @property.destroy

    respond_to do |format|
      format.html { redirect_to properties_url, notice: "Property was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def email_agent
    agent_id = params[:agent_id]
    first_name = params[:first_name]
    last_name = params[:last_name]
    email = params[:email]
    message = params[:message]

    agent = Agent.find(agent_id)

    # Send email using AgentMailer
    # AgentMailer.contact_agent(agent, first_name, last_name, email, message).deliver_later

    ContactMailer.email_agent(agent_id, first_name, last_name, email, message).deliver_now

    logger.debug "agent_id: #{agent_id}"
    logger.debug "First Name: #{first_name}"
    logger.debug "Last Name: #{last_name}"
    logger.debug "Email: #{email}"
    logger.debug "Message: #{message}"

    respond_to do |format|
      format.json { head :no_content }
    end

  end
  # def email_agent
  #   agent = Agent.find(params[:agent_id])
  #   first_name = params[:first_name]
  #   last_name = params[:last_name]
  #   email = params[:email]
  #   message = params[:message]

  #   AgentMailer.send_message(agent, message).deliver_now

  #   respond_to do |format|
  #     format.turbo_stream { head :no_content }
  #   end
  # end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    def set_sidebar
      @show_sidebar = true
    end

    # Only allow a list of trusted parameters through.
    def property_params
      # params.require(:property).permit(:name, :address, :price, :rooms, :bathrooms, :photo, :photo_cache)
      params.require(:property).permit(:name, :address, :price, :rooms, :bathrooms, :parking_spaces,:details,:available_date,:property_type,:for_sale ,images: [])
    end
end
