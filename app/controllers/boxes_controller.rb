class BoxesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_box, only: [:show, :edit, :update, :destroy]
  
  def index
    if params[:query].present?
      @query = params[:query]
      @boxes = Box.where("name LIKE ?", "%#{@query}%")
    elsif params[:filter].present?
      @filter = params[:filter]
      case @filter
      when "under5"
        @boxes = Box.where("price < 5000")
      when "5to10"
        @boxes = Box.where("price > 5000").where("price < 10000")
      when "10to20"
        @boxes = Box.where("price > 10000").where("price < 20000 ")
      when "over20"
        @boxes = Box.where("price >= 20000")
      else
        @boxes = Box.all
      end
    else
      @boxes = Box.all
    end
  end

  def show
  end

  def new
    @box = Box.new
  end

  def create
    @box = Box.new(box_params)
    @box.user = current_user

    if @box.save
      redirect_to boxes_path
    else
      render :new
    end
  end

  def edit
  end 

  def update
    @box.update(box_params)
    redirect_to boxes_path
  end


  def destroy
    @box.destroy
    redirect_to boxes_path
  end

  private

  def box_params
    params.require(:box).permit(:name, :description, :venue, :seats, :price, :rating, :location, :user_id, photos: [])
  end

  def set_box
    @box = Box.find(params[:id])
  end
end
