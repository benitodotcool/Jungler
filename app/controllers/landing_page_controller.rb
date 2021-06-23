class LandingPageController < ApplicationController
  def index
    @all_users       = User.all.count
    @all_matchs      = Conversation.all.count
    @all_messages    = Message.all.count
    @user            = User.new
    begin
    @user_game_stat = UserGameStat.find_by(user_id:current_user.id)
    rescue
    end
  end

  def show
  
  end
end
