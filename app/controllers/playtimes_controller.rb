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
    @playtime.users << current_user
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
    if @playtime.update_attributes(params.require(:playtime).permit(:game_id))
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

  def join
    @playtime = Playtime.find(params[:id])
    # Make sure current user is not already in playtime
    #if current_user
    # Make sure playtime is not full. Compare users to num_of_players
    if(@playtime.users.exists?(current_user.id) || @playtime.users.count >= @playtime.num_of_players)
      puts "******* CANNOT JOIN PLAYTIME *********"
    else

      @playtime.users << current_user
      if @playtime.save
        flash.now.notice = "You have joined this Playtime"
      end
    end
    render :show

  end
end
