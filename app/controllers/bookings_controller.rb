class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  
  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to booking_path
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
    params.require(:booking).permit(:start_date, :end_date, :user_id)
  end

  def set_booking
    @booking = booking.find(params[:id])
  end
end
