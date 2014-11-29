class QueueModelsController < ApplicationController
  before_action :set_queue_model, only: [:show, :edit, :update, :destroy]

  # GET /queue_models
  # GET /queue_models.json
  def index
    @queue_models = QueueModel.all
  end

  # GET /queue_models/1
  # GET /queue_models/1.json
  def show
  end

  # GET /queue_models/new
  def new
    @queue_model = QueueModel.new
  end

  # GET /queue_models/1/edit
  def edit
  end

  # POST /queue_models
  # POST /queue_models.json
  def create
    @queue_model = QueueModel.new(queue_model_params)

    respond_to do |format|
      if @queue_model.save
        format.html { redirect_to @queue_model, notice: 'Queue model was successfully created.' }
        format.json { render action: 'show', status: :created, location: @queue_model }
      else
        format.html { render action: 'new' }
        format.json { render json: @queue_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /queue_models/1
  # PATCH/PUT /queue_models/1.json
  def update
    respond_to do |format|
      if @queue_model.update(queue_model_params)
        format.html { redirect_to @queue_model, notice: 'Queue model was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @queue_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /queue_models/1
  # DELETE /queue_models/1.json
  def destroy
    @queue_model.destroy
    respond_to do |format|
      format.html { redirect_to queue_models_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_queue_model
      @queue_model = QueueModel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def queue_model_params
      params.require(:queue_model).permit(:name, :gps_lon, :gps_lat, :description, :image, :num_customer, :last_customer, :average_time)
    end
end

  # POST /queue_model/1/book.json
  def book
    # On crée un nouvel objet booking à partir des paramètres reçus
    @booking = Booking.new(booking_params)
    # On précise que cet object Booking dépend de la queue concernée
    @booking.queue_model = @queue_model

    respond_to do |format|
      if @booking.save
        format.json
      else
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_queue_model
      @queue_model = QueueModel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def show_params
      params.require(:queue_model).permit(:name, :gps_lat, :gps_lon, :image, :date)
    end

    # On ajoute les paramètres qu'on va envoyer avec le booking
    def booking_params
      params.require(:booking).permit(:user_id)
    end
end