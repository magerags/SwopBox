class BoxesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_box, only: [:show, :edit, :update, :destroy]
  
  def index
    if params[:query].present?
      @query = params[:query]
      @boxes = Box.where("name LIKE ?", "%#{@query}%")
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
