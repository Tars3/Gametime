class PlaytimesController < ApplicationController
  before_action :authorize, except: [:index, :show]

  def index
    @playtimes = Playtime.all
  end

  def show
    @playtime = Playtime.find(params[:id])
  end

  def new
    @playtime = Playtime.new
  end

  def create
  @playtime = Playtime.new(params.require(:playtime).permit(:game_id, :time, :num_of_players))
    if @playtime.save
      redirect_to playtimes_path
    else
      render :new
    end
  end

  def edit
    @playtime = Playtime.find(params[:id])
  end

  def update
    @playtime = Playtime.find(params[:id])
    if @playtime.update_attributes(params.require(:playtime).permit(:game))
      redirect_to playtimes_path
    else
      render :edit
    end
  end

  def destroy
    @playtime = Playtime.find(params[:id])
    @playtime.destroy
    redirect_to playtimes_path
  end

end
