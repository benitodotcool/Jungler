class ApplicationController < ActionController::Base
  
  private

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
  
  def after_sign_in_path_for(user)
    stored_location_for(user) 
    edit_user_path(current_user.id)
  end

end
