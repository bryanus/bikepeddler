class PostsController < ApplicationController

	def index
		@posts = Post.all
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
		p params
		p "$" * 300
		
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
