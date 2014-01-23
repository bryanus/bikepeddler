class PasswordResetsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by_email(params[:email])
  	user.send_password_reset if user
  	#The notice is shown whether the user is found or not. This makes things a little more secure so that a malicious user can’t determine whether a given user exists in the database.
  	redirect_to root_url, :notice => "Email sent with password rest instructions."
  end

  def edit
  	@user = User.find_by_password_reset_token!(params[:id])
  end

  def update
	  @user = User.find_by_password_reset_token!(params[:id])
	  if @user.password_reset_sent_at < 2.hours.ago
	    redirect_to new_password_reset_path, :alert => "Password reset has expired."
	  elsif @user.update(params[:user])
	    redirect_to root_url, :notice => "Password has been reset."
	  else
	    render :edit
	  end
	end
end
