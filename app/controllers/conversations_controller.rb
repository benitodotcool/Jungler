class ConversationsController < ApplicationController
  before_action :set_conversation, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :user_authorized?, only: %i[ show edit update destroy ]
  before_action :incomplete_profile_redirect?

  def index
    @conversations = conversations_allowed
    @user_game_stat = UserGameStat.find_by(user_id:current_user.id)
    render stream: true
  end

  def show
    @conversation_id = @conversation.id
    @current_conversation= Conversation.find(@conversation.id )
    @messages= Message.where(conversation_id:@conversation.id)
    @conversations = conversations_allowed
    @user_game_stat = UserGameStat.find_by(user_id:current_user.id)
    render stream: true
  end

  def new
    @conversation = Conversation.new
  end

  def edit
  end

  def create
    @conversation = Conversation.new(conversation_params)

    respond_to do |format|
      if @conversation.save
        format.html { redirect_to @conversation, notice: "Nouvelle conversation créée." }
        format.json { render :show, status: :created, location: @conversation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @conversation.update(conversation_params)
        format.html { redirect_to @conversation, notice: "Conversation à jour." }
        format.json { render :show, status: :ok, location: @conversation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @conversation.destroy
    respond_to do |format|
      format.html { redirect_to @conversation, notice: "Conversation supprimée avec succès." }
      format.json { head :no_content }
    end
  end

  private
    def set_conversation
      @conversation = Conversation.find(params[:id])
    end

    def conversation_params
      params.fetch(:conversation, {})
    end

    def user_authorized?
      @user_id_a = Conversation.find(params[:id]).participant_a_id
      @user_a = User.find(@user_id_a)
      @user_id_b = Conversation.find(params[:id]).participant_b_id
      @user_b = User.find(@user_id_b)
    
      if @user_id_a == current_user.id || @user_id_b == current_user.id 
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

