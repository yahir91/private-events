class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]


  def index
    @upcomming_events = Event.upcomming_events
    @prev_events = Event.prev_events
  end

  def show
    @event = Event.find(params[:id])
    @attend = @event.attendees
  end


  def new
    @event = Event.new
  end

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

  def create
    @user = User.find(session[:user_id])
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

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:description, :location, :creator_id, :event_date)
  end
end
