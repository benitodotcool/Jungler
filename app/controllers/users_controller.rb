class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update ]
  before_action :set_user_game_stat, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :user_authorized?, only: %i[update destroy ]
  #require 'pry'
  require 'dotenv'
  Dotenv.load('.env')
  #before_action :is_profile_completed?
  
  # GET /users or /users.json
  def index
    @users = User.all.where.not(id:current_user.id)
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
    @user.tag_list.add("Relax", "Peer-Learning", "Try-Hard").sample
    @user.save
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
    respond_to do |format|
      if @user.update(user_params)
        
        @summoner_name = current_user.summoner_name
        if UserGameStat.exists?(id:current_user.id) == false
          @user_game_stat = UserGameStat.create!(id:current_user.id, user_id: current_user.id)
        end
        get_api_summoner(@summoner_name)
      
        format.html {redirect_to request.referrer, notice: "User was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
    
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

    def get_api_summoner(summoner_name)
     #@summoner_name = User.find(current_user.id).summoner_name
     client = RiotGamesApiClient::Client.new(
       api_key: ENV['RIOT_API_KEY'],
       region: "euw1"
      )   
    response = client.get_lol_summoner(summoner_name: summoner_name)
    #response = client.get_lol_summoner(summoner_name: @summoner_name)
    @summoner_id = response.body['id']
    @level = response.body['summonerLevel']
      if @summoner_id != nil
        UserGameStat.find(current_user.id).update(summoner_id: @summoner_id, level: @level )
      end
      
    end

    def tagged
      if params[:tag].present?
        @users = User.tagged_with(params[:tag])
      else
        @users = User.all
      end
    end
  
#binding.pry

end
