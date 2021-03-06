class EventsController < ApplicationController

  before_action :set_event, only: [:show, :edit, :update, :destroy, :vote, :dislike]
  before_action :set_congress
  before_action :authenticate_user!, except: [:index, :show]
  respond_to :js, :json, :html
  layout "insideapplication"
  # GET /events
  # GET /events.json
  def index
    @events = @congress.events.all
    @events_by_date = @events.group_by(&:start_date)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @months = ["Enero", "Febrero","Marzo", "Abril","Mayo", "Junio","Julio", "Agosto","Septiembre", "Octubre","Noviembre", "Diciembre"]
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.congress = @congress
    respond_to do |format|
      if @event.save
        format.html { redirect_to @congress, notice: 'Evento creado con éxito.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to [@congress, @events], notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to @congress, notice: 'Se ha eliminado el evento' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    def set_congress
      @congress = Congress.find(params[:congress_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :description, :start_date, :ending_date, :start_time, :user, :congress, :color)
    end
  end
