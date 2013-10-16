class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by_email(params[:email])
  	if user && user.authenticate(params[:password])
  		#session[:user_id] = user.id #store user id into the session
  		if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end
      redirect_to root_url
      flash[:notice] = "Welcome " + user.fname + "! You have logged in successfully."
  	else
  		flash.now.alert = "Invalid login. Please try again."
  		render "new" 
  	end
  end

  def destroy
  	#session[:user_id] = nil
  	cookies.delete(:auth_token)
    redirect_to root_url
    flash[:notice] = "You have logged out successfully."
  end

end
