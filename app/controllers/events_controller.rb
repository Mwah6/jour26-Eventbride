class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  # def show
  #   @event = Event.find(params[:id])
  #   @events = Comment.where(gossip: @gossip)
  # end

  def index
    @events = Event.all
  end
end
