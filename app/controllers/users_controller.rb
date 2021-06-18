class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :set_user_game_stat, only: %i[ show edit update destroy ]
  # GET /users or /users.json
  def index
    @users = User.all
    @user_select = @users.sample
<<<<<<< HEAD
    @conversations = Conversation.all
    @messages = Message.order("created_at DESC").all
    
  
=======
    # respond_to do |format|
    #   format.js { }
    # end
>>>>>>> 35a5dbd5caa85f352424e5892aac4775533441af
  end

  # GET /users/1 or /users/1.json
  def show
    # respond_to do |format|
    #   format.js { }
    # end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
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
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
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
      params.require(:user).permit(:summoner_name, :id)
    end

    def set_user_game_stat
      @user_game_stat = UserGameStat.find_by(user_id:@user.id)
    end
end
