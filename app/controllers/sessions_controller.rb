class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by_email(params[:email])
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id #store user id into the session
  		redirect_to root_url, notice: "You have logged in successfully!"
  	else
  		flash.now.alert = "Invalid login. Please try again."
  		render "new" 
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_url, notice: "logged out!"
  end

end
