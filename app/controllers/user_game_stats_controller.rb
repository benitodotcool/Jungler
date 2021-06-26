class UserGameStatsController < ApplicationController
  before_action :set_user_game_stat, only: %i[ show edit update destroy ]
  before_action :user_authorized?, only: %i[ show edit update destroy ]
  

  def index
    @user_game_stats = UserGameStat.all
  end

  def show
  end

  def new
    @user_game_stats = UserGameStat.new
  end

  def edit
  end

  def create
    @user_game_stats = UserGameStat.new(user_game_stat_params)
    respond_to do |format|

      if @user_game_stats.save
        
        format.html { redirect_to request.referrer, notice: "User game stat was successfully created." }
        format.json { render :show, status: :created, location: @user_game_stats }
      else
        format.html { redirect_to request.referrer, notice: "User game stat was successfully created." }

      end
    end
  end

  def update
    
    respond_to do |format|
      
      if @user_game_stats.update(user_game_stat_params)
        format.html { redirect_to users_path, notice: "User game stat was successfully updated." }
        format.json { render :show, status: :ok, location: @user_game_stat }
      else
        format.html { redirect_to request.referrer, warning: "oups, il y a eu un couac" }
      end
    end
  end

  def destroy
    @user_game_stats.destroy
    respond_to do |format|
      format.html { redirect_to user_game_stats_url, notice: "User game stat was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_user_game_stat
      @user_game_stats = UserGameStat.find(params[:id])
    end

    def user_game_stat_params
      params.require(:user_game_stat).permit(:level, :summoner_id, :user_id)
    end

    def user_authorized?
      @user = User.find(params[:id])
      if @user.id == current_user.id
        return true 
      else
        flash[:alert] = "Accès interdit !"
        redirect_to root_path
        return false
      end 
    end
end
