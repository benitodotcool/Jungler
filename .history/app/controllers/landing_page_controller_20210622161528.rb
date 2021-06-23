class LandingPageController < ApplicationController
  def index
    @all_users    = User.all.count
    @all_matchs   = Conversation.all.count
    @all_messages = Message.all.count
    @user = User.new
    @user_game_stats = UserGameStat.all
    @user_game_stats = UserGameStat.all
  end
end
