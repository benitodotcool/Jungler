class LandingPageController < ApplicationController
  def index
    @all_users    = User.all.count
    @all_matchs   = Conversation.all.count
    @all_messages = Message.all.count
    @user = User.new
    @user_game_stats = User_game
  end
end
