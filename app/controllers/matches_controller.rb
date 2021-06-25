class MatchesController < ApplicationController
  before_action :set_match, only: %i[ show edit update destroy ]

  # GET /matches or /matches.json
  def index
    @matches = Match.all
  end

  # GET /matches/1 or /matches/1.json
  def show
  end

  # GET /matches/new
  def new
    @match = Match.new
  end

  # GET /matches/1/edit
  def edit
  end

  # POST /matches or /matches.json
  def create
    @users = User.all
    @user_select = @users.sample
    @match = Match.new(match_params)
    @user_swipped_id =  params[:receiver_id]
    @current_user_id = params[:requestor_id]
    @user_swipped = User.find(@user_swipped_id)
    respond_to do |format|
      if @match.save 
        if is_set? #tododev
        format.html { redirect_to users_path, notice: "MATCH avec #{@user_swipped.summoner_name}, va voir dans tes conversations !!"}
        else 
        format.html { redirect_to users_path }
        end
      end
    end
  end

  # PATCH/PUT /matches/1 or /matches/1.json
  def update
    respond_to do |format|
      if @match.update(match_params)
        format.html { redirect_to @match, notice: "Match was successfully updated." }
        format.json { render :show, status: :ok, location: @match }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matches/1 or /matches/1.json
  def destroy
    @match.destroy
    respond_to do |format|
      format.html { redirect_to matches_url, notice: "Match was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def match_params
      params.permit(:requestor_id,:receiver_id,:status, :users_tag_list)
    end

    def is_set?
    
     @user_swipped_id =  params[:receiver_id]
     @current_user_id = params[:requestor_id]
     @users_tag_list = params[:users_tag_list]
      condition_1 = Match.exists?(requestor_id: @current_user_id, receiver_id:@user_swipped_id,users_tag_list:@users_tag_list, status: true)
      condition_2 = Match.exists?(requestor_id:@user_swipped_id, receiver_id:@current_user_id,users_tag_list:@users_tag_list, status: true)
      
      if condition_1 == true && condition_2 == true 

        is_conversation_exists?
  
      end
    end

    def is_conversation_exists?

      condition_1 = Conversation.exists?(participant_a_id:@current_user_id, participant_b_id:@user_swipped_id)
      condition_2 = Conversation.exists?(participant_a_id:@user_swipped_id, participant_b_id:@current_user_id)
      
      if condition_1 == false && condition_2 == false
    
        @conversation = Conversation.create!(participant_a_id:@current_user_id, participant_b_id: @user_swipped_id) 

      end
    
    end

    
end
