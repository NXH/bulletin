class EventsController < ApplicationController

  before_action :set_event, :only => [:show, :edit, :update, :destroy]

  def set_event
    @event = Event.find_by(id: params[:id])
  end

  def index
    page_number = params[:page].to_i

    if params[:page]
      @events = Event.offset((page_number - 1)*20).limit(20)
    else
      @events = Event.all
    end
  end

  def show

  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new
    @event.title = params[:title]
    @event.start_time = params[:start_time]
    @event.end_time = params[:end_time]
    @event.account_id = current_account.id
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

  end

  def update
    @event.title = params[:title]
    @event.start_time = params[:start_time]
    @event.end_time = params[:end_time]
    @event.account_id = current_account.id
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
    @event.destroy

    redirect_to events_url, notice: "Event deleted."
  end
end
