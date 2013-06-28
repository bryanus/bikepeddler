class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
  	
  end

private

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def authorize
  	redirect_to login_url, alert: "Not authorized" if current_user.nil?
  end

  def correct_user?
    @user = User.find(params[:id])

    if current_user.nil? #If they are not logged in, just show listings only
      false
    else
      current_user.id == @user.id #else check if they are the correct_user to show edit form or not
    end
  end

  helper_method :correct_user?

end
