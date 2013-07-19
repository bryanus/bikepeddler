class UsersController < ApplicationController

	before_filter :authorize, only: [:edit, :update]


	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			session[:user_id] = @user.id #logs them in once signed up
			redirect_to root_url, notice: "Thank you for signing up!"
		else
			render "new"
		end
	end

	def edit
		@user = User.find(params[:id])

		if correct_user(@user)
			# do stuff
			puts "awesome dude"
		else
			# redirect
			puts "EPIC FAIL"
		end

	end

	def show
		@user = User.find(params[:id]) #can also use current_user.id. which is better?
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(params[:user])
			redirect_to user_path(@user)
		else
      render 'edit'
    end
	end


end
