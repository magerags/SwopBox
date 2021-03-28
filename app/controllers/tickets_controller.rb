class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  def show
  end

  private
  def set_ticket
    @ticket = Ticket.find(params[:id])
  end
end
