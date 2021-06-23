class DiscoveryController < ApplicationController
  def index
    begin
    @user_game_stat = UserGameStat.find_by(user_id:current_user.id)
    rescue
    end
  end
end
