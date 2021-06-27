class UsersController < ApplicationController

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

    
      
    def get_api_summoner(summoner_request)
      begin
        @summoner_name = summoner_request
        @summoner_request = ERB::Util.url_encode(summoner_request.delete(' ').downcase)
        @env =  ENV['RIOT_API_KEY']
       #Call Summoner
      rescue
      else
        begin
          @response_summoner = RestClient.get ("https://euw1.api.riotgames.com/lol/summoner/v4/summoners/by-name/#{@summoner_request}?api_key=#{@env}")
        rescue
          
          if @summoner_request == "" &&  @summoner_name_origin == nil
            respond_to do |format|
              format.html {redirect_to edit_user_path(current_user.id), warning: "Tu dois renseigner un nom d'invocateur !" }
              end
          elsif @summoner_request == "" &&  @summoner_name_origin != nil
            respond_to do |format|
              format.html {redirect_to users_path, success: "Gloire à toi, #{@summoner_name_origin}" }
              end
          else
          respond_to do |format|
            format.html {redirect_to edit_user_path(current_user.id), warning: "#{summoner_request} n'est pas un nom d'invocateur valide !" }
            end
          end
        else 
          response_summoner_in_hash = eval(@response_summoner.body)
          @summoner_id              = response_summoner_in_hash.values_at(:id).join
          @level                    = response_summoner_in_hash.values_at(:summonerLevel).join
          @icon_profile_id          = response_summoner_in_hash.values_at(:profileIconId).join
          @name                     = response_summoner_in_hash.values_at(:name).join
    
        end
      
        #Call Champion
        begin
          @champions_response = RestClient.get ("https://euw1.api.riotgames.com/lol/champion-mastery/v4/champion-masteries/by-summoner/#{@summoner_id}?api_key=#{@env}")

          @last_3_champions = eval(@champions_response.body)
          @ugs = UserGameStat.find_by(user_id:@user.id)

          @first_champion_level  = @last_3_champions[0].values_at(:championLevel).join.to_i
          @first_champion_id     = @last_3_champions[0].values_at(:championId).join.to_i
          @second_champion_level = @last_3_champions[1].values_at(:championLevel).join.to_i
          @second_champion_id    = @last_3_champions[1].values_at(:championId).join.to_i
          @third_champion_level  = @last_3_champions[2].values_at(:championLevel).join.to_i
          @third_champion_id     = @last_3_champions[2].values_at(:championId).join.to_i
          
          @first_champion_name = CHAMPIONS.fetch(@first_champion_id )
          
          @second_champion_name = CHAMPIONS.fetch(@second_champion_id )
          
          @third_champion_name = CHAMPIONS.fetch(@third_champion_id )
          
          if @summoner_id != nil
            @ugs.update!( 
            first_champion_id: @first_champion_id, 
            first_champion_level: @first_champion_level,
            first_champion_name: @first_champion_name,
            second_champion_id: @second_champion_id, 
            second_champion_level: @second_champion_level,
            second_champion_name: @second_champion_name,
            third_champion_id: @third_champion_id, 
            third_champion_level: @third_champion_level,
            third_champion_name: @third_champion_name
            )
          end
        rescue
        end
        if @summoner_id != nil
          @ugs.update!( 
          summoner_id: @summoner_id, 
          level: @level
          )
    
          @summoner_request = CGI::unescape(@summoner_request)
          @user = User.find(current_user.id)
          @user.update!(icon_profile_id:@icon_profile_id, summoner_name:@summoner_name)
          
          if @user.description == ""
            description = "Rejoins-moi dans la Jungle !"
            @user.update!(description: description)
          end
          respond_to do |format|
            if @summoner_id != nil
              format.html {redirect_to users_path, success: "Gloire à toi, #{@summoner_request} ! " }
            else
            end
          end
        end
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
