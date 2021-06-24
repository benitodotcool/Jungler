class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update ]
  before_action :set_user_game_stat, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :user_authorized?, only: %i[edit update destroy ]
  before_action :incomplete_profile_redirect?, only: %i[index]
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
    @user_game_stat = UserGameStat.find_by(user_id:current_user.id)
  end

  # GET /users/1 or /users/1.json
  def show
    @user_game_stat = UserGameStat.find_by(user_id:current_user.id)
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user_game_stat = UserGameStat.find_by(user_id:current_user.id)        
    
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity, notice: "User was successfully created."  }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  
  end
  #binding.pry

  # PATCH/PUT /users/1 or /users/1.json
  def update
    @summoner_name_origin = User.find(@user.id).summoner_name
    respond_to do |format|
      if @user.update!(user_params)  
        
        if UserGameStat.exists?(user_id:current_user.id) == false
          @user_game_stat = UserGameStat.create!(user_id: current_user.id)
        end
        
        @summoner_name = User.find(@user.id).summoner_name
        if @summoner_name_origin != @summoner_name
        get_api_summoner(@summoner_name)
        
        format.html {redirect_to users_path, notice: "fin de l'appel API" }
        else
        format.html {redirect_to users_path, notice: "pas d'appel API" }
        end
        return
      else
        
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end       
  end

    
      
      #binding.pry


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
      begin
        params.require(:user).permit(:summoner_name, :id, :user_game_stat_id, :email, :tag_list,:primary_role, :secondary_role, :description)
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

    
      
    def get_api_summoner(summoner_name)
        
        @summoner_name = summoner_name.delete(' ').downcase
        @env =  ENV['RIOT_API_KEY']
         #Call Summoner
      begin
        @response_summoner = RestClient.get ("https://euw1.api.riotgames.com/lol/summoner/v4/summoners/by-name/#{@summoner_name}?api_key=#{@env}")
      rescue
        if @summoner_name == ""
          respond_to do |format|
            format.html {redirect_to edit_user_path(current_user.id), notice: "Veuillez saisir au moins un summoner_name" }
            end
        else
        respond_to do |format|
          format.html {redirect_to edit_user_path(current_user.id), notice: "Votre summoner_name n'est pas reconnu" }
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
      
        
          @user = User.find(current_user.id)
          @user.update!(icon_profile_id:@icon_profile_id)
          if @user.description.nil?
            @description = "Je recherche d'autres joueurs stylay pour faire une équipe canon !"
            @ugs.update!( description: @description)
          end
            
          respond_to do |format|
            if @summoner_id != nil
            format.html {redirect_to users_path, notice: "fin de l'appel API" }
            else
            end
          end
      end
        
      #binding.pry
    
    end

  
    def tagged
      if params[:tag].present?
        @users = User.tagged_with(params[:tag])
      else
        @users = User.all
      end
    end

  
    

end
