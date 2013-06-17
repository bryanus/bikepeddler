class PostsController < ApplicationController

	before_filter :authorize, only: [:edit, :update]

	def index
		@posts = Post.order('created_at DESC')
	end

	def new
		@post = Post.new
		# @image = @post.images.new(params[:image])

		#what does this do again?
		respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end


	end

	def show
		@post = Post.find(params[:id])
		@user = User.find(@post.user_id)
	
	end

	def create
		@post = Post.create(params[:post])

		respond_to do |format|
	    format.html { redirect_to post_images_path(@post) }
	    format.xml  { render :head => :created }
	  end
		
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		puts @post.id 
		puts "*" * 300
		@post.update_attributes(params[:post])
		redirect_to post_images_path(@post)
	end

	def destroy
		if Post.find(params[:id]).destroy
			flash[:notice] = "Deleted successfully!"
      redirect_to posts_path
    else
      flash[:error] = "Unable to delete. Please try again."
    end

	end


	
end


