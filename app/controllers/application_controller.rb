class ApplicationController < ActionController::Base
  
  

  

  
  
  private

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
  
  
  def after_sign_in_path_for(resource_or_scope)
  
    if is_profile_completed? 
      stored_location_for(resource_or_scope) || users_path #Tododev à changer pour rediriger vers conversations
    else
    
      flash[:alert] = "complète ton profil avant de swipper !"
      edit_user_path(current_user.id)
    end
  end

  def is_profile_completed?
    begin
      @user_game_stat = UserGameStat.find_by(user_id:current_user.id)
    if @user_game_stat.level != nil 
      return true
    else
      return false
    end
    rescue
      return false
    end
  end

  def incomplete_profile_redirect?
    if is_profile_completed? 
      return true
    else
      respond_to do |format|
        format.html { redirect_to edit_user_url(current_user.id), notice:  "Complète tes infos !" }
      end
      return false
    end  
  end

  def conversations_allowed

    condition_1 = Conversation.where(participant_a_id:current_user.id)
    condition_2 = Conversation.where(participant_b_id:current_user.id)

    @conversations = condition_1 + condition_2

  end
  
  #binding.pry
  #binding.pry

  
  
end
