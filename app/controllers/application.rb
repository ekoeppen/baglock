# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  # Pick a unique cookie name to distinguish our session data from others'
  session :session_key => '_BagLock_session_id'
  
  def current_user
    @session[:user_id] ? Login.find(@session[:user_id]) : nil
  end
  
  def current_user=(user)
    @session[:user_id] = if user then user.id else nil end
  end
  
  def user_can_modify?
    return (current_user != nil and current_user.can_modify)
  end

end
