class UsersController < ApplicationController

	before_action :authorize, only: [:edit, :update]


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
		if @user.update(params[:user])
			redirect_to user_path(@user)
		else
      render 'edit'
    end
	end

	def destroy
		@user = User.destroy(params[:id])
		# @user.posts.each{|post| post.destroy}
		# should we delete all of tehir comments also? nah.
		# @user.comments.each{|post| post.destroy}
		redirect_to logout_path(@user)
	end


end
