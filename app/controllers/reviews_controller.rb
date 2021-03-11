class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  
  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    @review = Review.new
    @booking = Booking.find(params[:booking_id])
  end

  def create
    @review = Review.new(review_params)
    @review.booking = Booking.find(params[:booking_id])
    if @review.save!
      redirect_to bookings_path
    else
      render :new
    end
  end

  def edit
  end 

  def update
    @review.update(review_params)
    redirect_to review_path
  end

  def destroy
    @review.destroy
    redirect_to review_path
  end

  private

  def review_params
    params.require(:review).permit(:rating, :description)
  end

  def set_review
    @review = Review.find(params[:id])
  end
end
