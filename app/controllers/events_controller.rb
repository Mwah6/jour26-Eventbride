class EventsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(start_date: params[:content], duration: params[:duration], title: params[:title], description: params[:description], price: params[:price], location: params[:location], administrator: current_user)
    if @event.save # essaie de sauvegarder en base @gossip
      flash[:success] = "Ton événement a été ajouté !"
      redirect_to events_path
    else
      flash[:danger] = "Ton événement n'est pas valide !"
      render new_event_path
    end
  end

  def show
    @event = Event.find(params[:id])

  end

  def index
    @events = Event.all
  end
end
