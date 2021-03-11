class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  
  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
    @box = Box.find(params[:box_id])
  end

  def create
    @event = Event.new(event_params)
    @event.box = Box.find(params[:box_id])
    if @event.save
      redirect_to box_path(Box.find(params[:box_id]))
    else
      render :new
    end
  end

  def edit
  end 

  def update
    @event.update(event_params)
    redirect_to event_path
  end

  def destroy
    @event.destroy
    redirect_to event_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :start_date, :end_date, :box_id)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
