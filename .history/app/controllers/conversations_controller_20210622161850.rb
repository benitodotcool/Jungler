class ConversationsController < ApplicationController
  before_action :set_conversation, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :user_authorized?, only: %i[ show edit update destroy ]
  
  # GET /conversations or /conversations.json

  def index
    @conversations = conversations_allowed
    @messages= Message.all
    @user_game_stats = UserGameStat.new
  end

  # GET /conversations/1 or /conversations/1.json
  def show
    @conversation_id = params[:id]
    @current_conversation= Conversation.find(@conversation_id )
    @messages= Message.all
    @conversations = conversations_allowed
    #@content = if Message.where(conversation_id:@conversation.id).last.content != nil
    #@time_ago = Message.where(conversation_id:@conversation.id).last.updated_at.strftime( "%H:%M")
  
  end

  # GET /conversations/new
  def new
    @conversation = Conversation.new
  end

  # GET /conversations/1/edit
  def edit
  end

  # POST /conversations or /conversations.json
  def create
    @conversation = Conversation.new(conversation_params)

    respond_to do |format|
      if @conversation.save
        format.html { redirect_to @conversation, notice: "Conversation was successfully created." }
        format.json { render :show, status: :created, location: @conversation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conversations/1 or /conversations/1.json
  def update
    respond_to do |format|
      if @conversation.update(conversation_params)
        format.html { redirect_to @conversation, notice: "Conversation was successfully updated." }
        format.json { render :show, status: :ok, location: @conversation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conversations/1 or /conversations/1.json
  def destroy
    @conversation.destroy
    respond_to do |format|
      format.html { redirect_to :root, notice: "Conversation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conversation
      @conversation = Conversation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def conversation_params
      params.fetch(:conversation, {})
    end

    def user_authorized?
      user_id_a = Conversation.find(params[:id]).participant_a_id
      user_id_b = Conversation.find(params[:id]).participant_b_id
    
      if user_id_a == current_user.id || user_id_b == current_user.id 
        return true 
      else
        flash[:alert] = "Accès interdit !"
        redirect_to conversations_path
        return false
      end 
    end

    def conversations_allowed

      condition_1 = Conversation.where(participant_a_id:current_user.id)
      condition_2 = Conversation.where(participant_b_id:current_user.id)

      @conversations = condition_1 + condition_2

    end
    
end

