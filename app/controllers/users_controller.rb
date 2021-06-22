class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update ]
  before_action :set_user_game_stat, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :user_authorized?, only: %i[update destroy ]
  require 'pry'
  require 'dotenv'
  Dotenv.load('.env')
  require 'rest-client'
  #before_action :is_profile_completed?
  
  # GET /users or /users.json
  def index
    @users = User.tagged_with(current_user.tag_list).where.not(id: current_user.id).shuffle
    @user_select = user_selected
    @conversations = Conversation.all
    @messages = Message.order("created_at DESC").all
  end

  # GET /users/1 or /users/1.json
  def show
  
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
      if @user.id == current_user.id
        return true 
      else
        flash[:alert] = "Accès interdit !"
        redirect_to root_path
        return false
      end
  end

  # POST /users or /users.json
  def create
    
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        UserGameStat.create!(id:current_user.id, user_id: current_user.id)
        format.html { redirect_to @user, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /users/1 or /users/1.json
  def update

      if @user.update!(user_params)  
        if UserGameStat.exists?(id:current_user.id) == false
          @user_game_stat = UserGameStat.create!(id:current_user.id, user_id: current_user.id)
        end
        
      else
        respond_to do |format|
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  
      @summoner_name = User.find(params[:id]).summoner_name
      get_api_summoner(@summoner_name)
      #binding.pry
    
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:summoner_name, :id, :user_game_stat_id, :email, :tag_list)
    end

    def set_user_game_stat
      @user_game_stat = UserGameStat.find_by(user_id:@user.id)
    end

    def user_authorized?
      @user = User.find(params[:id])
      if @user.id == current_user.id
        return true 
      else
        flash[:alert] = "Tu n'es pas autorisé à faire ça !"
        redirect_to root_path
        return false
      end 
    end


    def user_selected
      
      @users.map do |user|
        if is_match_exists?(user)
            next
        end
        return  @user_select = user
        break
      end
      return false

    end
    
    
    def is_match_exists?(user)
      condition_1 = Match.exists?(requestor_id:current_user.id, receiver_id: user.id)
      if condition_1 == true 
        return true
      end
    end

    
      
  
      #@summoner_name = summoner_name.gsub!(/\s/,'').downcase #pb restant
      
      def get_api_summoner(summoner_name)

        
        @summoner_name = summoner_name.strip.downcase
        binding.pry #checker si .strip fonctionne !
        
        #rescue
        #@summoner_name = summoner_name
        #else
        #@summoner_name = summoner_name.gsub!(/\s/,'').downcase
        #end
#
          @env =  ENV['RIOT_API_KEY']

        begin
          @response_summoner = RestClient.get ("https://euw1.api.riotgames.com/lol/summoner/v4/summoners/by-name/#{summoner_name}?api_key=#{@env}")
        rescue
          render :edit, notice: "Oups! Il ya eu un couac" 
        else 
        response_summoner_in_hash = eval(@response_summoner.body)
        @summoner_id              = response_summoner_in_hash.values_at(:id).join
        @level                    = response_summoner_in_hash.values_at(:summonerLevel).join
        @icon_profile_id          = response_summoner_in_hash.values_at(:profileIconId).join
        
        end

        begin
        @champions_response = RestClient.get ("https://euw1.api.riotgames.com/lol/champion-mastery/v4/champion-masteries/by-summoner/#{@summoner_id}?api_key=#{@env}")
        
        @last_3_champions = eval(@champions_response.body)
        rescue

        else
          begin
            @first_champion_level  = @last_3_champions[0].values_at(:championLevel).join
            @first_champion_id     = @last_3_champions[0].values_at(:championId).join 
            @second_champion_level = @last_3_champions[1].values_at(:championLevel).join
            @second_champion_id    = @last_3_champions[1].values_at(:championId).join 
            @third_champion_level  = @last_3_champions[2].values_at(:championLevel).join
            @third_champion_id     = @last_3_champions[2].values_at(:championId).join

            @champions_list_response = RestClient.get ("https://ddragon.leagueoflegends.com/cdn/11.13.1/data/en_US/champion.json")
            @champions_list = eval(@champions_list_response.body)
          rescue
          end
        binding.pry
        end
        #@first_chex:qampion_name     = @last_3_champions[0].values_at(:championId).join 
      
        if @summoner_id != nil
          UserGameStat.find(current_user.id).update(
            summoner_id: @summoner_id, 
            level: @level, 
            #first_champion_id: @first_champion_id, 
            #first_champion_level: @first_champion_level,
            #second_champion_id: @seconde_champion_id, 
            #second_champion_level: @seconde_champion_level,
            #third_champion_id: @third_champion_id, 
            #third_champion_level: @third_champion_level 
          )
          if User.find(current_user.id).update(icon_profile_id:@icon_profile_id)
            respond_to do |format|
            format.html {redirect_to user_path(current_user.id), notice: "User was successfully updated." }
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
