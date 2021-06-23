class CategoryController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
    @user = User.new
    @user_game_stats = UserGameStat.new

    @user_game_stat = UserGameStat.find_by(user_id:current_user.id)
  end
end
