class LandingPageController < ApplicationController
  def index
    @all_users    = User.all.count
    @all_matchs   = Conversation.all.count
    @all_messages = Message.all.count
    @user = User.new
    
    @user_game_stats = UserGameStat.new
    @users = User.tagged_with(current_user.tag_list).where.not(id: current_user.id).shuffle
    @user_select = user_selected
    @conversations = Conversation.all
    @messages = Message.order("created_at DESC").all
    @user = User.new
    @user_game_stat = UserGameStat.new 
  end

  def show
    
  end
end
