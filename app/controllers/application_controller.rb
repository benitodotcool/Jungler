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
    @user_game_stat = UserGameStat.find_by(user_id:current_user.id)
    if current_user.summoner_name != nil && @user_game_stat.level !=nil && @user_game_stat.primary_role !=nil && @user_game_stat.secondary_role !=nil && @user_game_stat.description !=nil
      return true
    else
      return false
    end
  end
  def incomplete_profile_redirect
    if is_profile_completed? 
      return true
    else
      return false
      redirect_to edit_user_path(current_user.id)
      flash[:alert] = "complète tes infos !"
    end  
  end

  
  
  #binding.pry
  #binding.pry

  
  
end
