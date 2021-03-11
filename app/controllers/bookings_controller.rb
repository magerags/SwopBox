class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  
  def index
    @bookings = Booking.where(user: current_user)
  end

  def show
  end

  def new
    @booking = Booking.new
    @box = Box.find(params[:box_id])
    @event = Event.find(params[:event_id])
  end

  def create
    @booking = Booking.new(user: current_user)
    @booking.event = Event.find(params[:event_id])
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  def edit
  end 

  def update
    @booking.update(booking_params)
    redirect_to booking_path
  end

  def destroy
    @booking.destroy
    redirect_to booking_path
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id)
  end

  def set_booking
    @booking = booking.find(params[:id])
  end
end
