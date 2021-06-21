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
    if current_user.summoner_name != nil  && current_user.user_game_stat.level !=nil && current_user.user_game_stat.primary_role !=nil && current_user.user_game_stat.secondary_role !=nil && current_user.user_game_stat.description !=nil
      return true 
    else
      return false
    end
      
  end
end
