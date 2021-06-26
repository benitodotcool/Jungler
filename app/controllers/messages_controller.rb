class MessagesController < ApplicationController
  before_action :set_message, only: %i[ show edit update destroy ]

  def index
    @messages = Message.where(conversation_id:params[:id])
   
  end

  def show
    @conversation_id = params[:id]
  end

  def new
    @message = Message.new
  end

  def edit
  end

  def create
    @conversation_id = params[:conversation_id]
    @message = Message.new(message_params)
  
    respond_to do |format|
      if @message.save #todoDev
        format.html { redirect_to conversation_path(@conversation_id), success: "Ton message a bien été envoyé! Utilise le bouton refresh pour voir la réponse de l'autre joueur !" }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { redirect_to conversation_path(@conversation_id), warning: "Le message ne peut pas être vide !"}
      end
    end
  end

  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, success: "Ton message a bien été supprimé." }
      format.json { head :no_content }
    end
  end

  private
    def set_message
      @message = Message.find(params[:id])
    end
    

    def message_params
      params.permit(:user_id, :content, :conversation_id)
    end
end
