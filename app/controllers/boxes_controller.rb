class BoxesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_box, only: [:show, :edit, :update, :destroy]
  
  def index
    @boxes = Box.all
  end

  def show
  end

  def new
    @box = Box.new
  end

  def edit
  end 

  def update
    @box.update(box_params)
    redirect_to boxes_path
  end

  def create
    @box = Box.new(box_params)

    if @box.save
      redirect_to boxes_path
    else
      render :new
    end
  end

  def destroy
    @box.destroy
    redirect_to boxes_path
  end

  private

  def box_params
    params.require(:box).permit(:name, :description, :medium, :size, :collection_id, :photo, :featured)
  end

  def set_box
    @box = Box.find(params[:id])
  end
end
