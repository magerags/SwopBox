class VisitorsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]


  def new
    @visitor = Visitor.new
  end

  def create
    @visitor = Visitor.new(visitor_params)
    @visitor.save
  end

  private 

  def visitor_params
    params.require(:visitor).permit(:email)
  end
end

