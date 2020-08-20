class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
    #@user = User.find(session[:user_id]) # for showing current user on page
    @future_events = Event.where('date > ?', Date.today)
    @past_events = Event.where('date < ?', Date.today)
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
    @attend = @event.attendees
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
    @add_attend = Attendance.new
    @add_attend.event_attended_id = @event.id
    @add_attend.attendee_id = session[:user_id]
    if @add_attend.save
      redirect_to events_path
    else
      redirect_to root_url
    end
  end


  # POST /events
  def create
    @user = User.find(session[:user_id]) # for showing current user on page
    @event = Event.new(event_params)
    @event.creator_id = current_user.id
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:description, :location, :date, :creator_id)
    end
 end