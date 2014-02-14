class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    # stuff for current user method
    return @user if @user
    user_id = session[:current_user_id]

    if user_id
      @user = User.find(user_id)
      return @user
    else
      return nil
    end
  end

  def require_user
    # stuff to require user
    if current_user
      return true
    else
      redirect_to new_session_url
    end
  end
end
