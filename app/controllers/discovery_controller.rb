class DiscoveryController < ApplicationController
  def index
    @user_game_stat = UserGameStat.find_by(user_id:current_user.id)
  end
end
