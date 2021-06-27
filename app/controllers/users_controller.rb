class UsersController < ApplicationController
  include UsersHelper
  before_action :set_user, only: %i[ show edit update ]
  before_action :set_user_game_stat, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :user_authorized?, only: %i[show edit update destroy ]
  before_action :incomplete_profile_redirect?, only: %i[index]
  require 'rest-client'
  require 'pry'
  require 'dotenv'
  Dotenv.load('.env')  
  
  def index    
    @users = User.tagged_with(current_user.tag_list).where.not(id: current_user.id).shuffle
    @user_select = user_selected
    @user_tag_list = current_user.tag_list.join
    @conversations = Conversation.all
    @messages = Message.order("created_at DESC").all
    @user_game_stat = UserGameStat.find_by(user_id:current_user.id)
    
    begin
      @ugs_selected = UserGameStat.find_by(user_id:@user_select.id)
    rescue
      @ugs_selected = 0
    end
  end
  
  def show
    @user_game_stat = UserGameStat.find_by(user_id:current_user.id)
  end

  def new
    @user = User.new
  end

  def edit
    @user_game_stat = UserGameStat.find_by(user_id:current_user.id)    
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, success: "Profil créé avec succès." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, warning: "Oups il y a un couac ! "  }
      end
    end
  
  end

  def update
    @summoner_name_origin = User.find(current_user.id).summoner_name
    respond_to do |format|
      
      if @user.update!(user_params)    
        
        @summoner_request = User.find(current_user.id).summoner_request
        
        if UserGameStat.exists?(user_id:current_user.id) == false
          @user_game_stat = UserGameStat.create!(user_id: current_user.id)
        end

        if @summoner_name_origin != @summoner_request
          get_api_summoner(@summoner_request)
          return
        else
          format.html {redirect_to users_path, success: "C'est bien noté #{@summoner_name_origin} !" }
        end
          format.js {}
  
      else
        format.html {redirect_to root_path(current_user.id), warning: "Oups il y a eu un couac" }
      end
    
    end       
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, danger: "Invocateur supprimé." }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      begin
        params.require(:user).permit(:summoner_request,:summoner_name, :id, :user_game_stat_id, :email, :tag_list,:primary_role, :secondary_role, :description)
      rescue
        params.permit(:summoner_name, :id, :user_game_stat_id, :email, :tag_list)
      end
    end

    def set_user_game_stat
      @user_game_stat = UserGameStat.find_by(user_id:@user.id)
    end

    def user_authorized?
      @user = User.find(params[:id])
      if @user.id == current_user.id
        return true 
      else
        respond_to do |format|
          format.html { redirect_to root_path, danger: "Tu ne peux pas faire cela !" }
        end
        return false
      end 
    end


    def user_selected
      
      @users.map do |user|
        if is_match_exists?(user)
            next
        elsif user.summoner_name.nil?
            next
        end
        return  @user_select = user
        break
      end
      return false

    end
    
    
    def is_match_exists?(user)
      condition_1 = Match.exists?(requestor_id:current_user.id, receiver_id: user.id, users_tag_list: current_user.tag_list)
      if condition_1 == true 
        return true
      end
    end

  
  def tagged
    if params[:tag].present?
      @users = User.tagged_with(params[:tag])
    else
      @users = User.all
    end
  end

end
