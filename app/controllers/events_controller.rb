class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    @event = Event.find_by(id: params[:id])
  end

  def new
  end

  def create
    @event = Event.new
    @event.title = params[:title]
    @event.start_time = params[:start_time]
    @event.end_time = params[:end_time]
    @event.account_id = params[:account_id]
    @event.description = params[:description]
    @event.location = params[:location]
    @event.category_id = params[:category_id]
    @event.person1 = params[:person1]
    @event.person2 = params[:person2]

    if @event.save
      redirect_to events_url, notice: "Event created successfully."
    else
      render 'new'
    end
  end

  def edit
    @event = Event.find_by(id: params[:id])
  end

  def update
    @event = Event.find_by(id: params[:id])
    @event.title = params[:title]
    @event.start_time = params[:start_time]
    @event.end_time = params[:end_time]
    @event.account_id = params[:account_id]
    @event.description = params[:description]
    @event.location = params[:location]
    @event.category_id = params[:category_id]
    @event.person1 = params[:person1]
    @event.person2 = params[:person2]

    if @event.save
      redirect_to events_url, notice: "Event updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find_by(id: params[:id])
    @event.destroy

    redirect_to events_url, notice: "Event deleted."
  end
end
