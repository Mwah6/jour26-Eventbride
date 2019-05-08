class UsersController < ApplicationController
  # before_action :authenticate_user!, only: [:show]
  before_action :current_user, only: [:show]
  before_action :check_user, only: [:show]

  def show
    @user = User.find(params[:id])
    @events = Event.where(administrator: @user)

  end

  private
  def check_user
    unless current_user == User.find(params[:id])
      flash[:danger] = "Ce n'est pas votre profil"
      redirect_to events_path
    end
  end
end
