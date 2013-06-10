class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def new
		@post = Post.create
		@image = @post.images.new(params[:image])
	end

	def show
		@post = Post.find(params[:id])
	end

	def create
		p params
		p "$" * 300
		# @post = Post.find_by_id(session[:post_id])
		# p "#{ session[:post_id] }"
		# p "$" * 300
		if @post
			 @image = @post.images.new(params[:image])

			@image.save
				flash[:notice] = "Created successfully!"
	      redirect_to post_path(@post)
    else
      flash[:error] = "Oops something went wrong. Please try again."
      render 'new'
    end  
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		p params
		p "$" * 300
		@post = Post.find_by_id(params[:id])
		# p "#{ session[:post_id] }"
		# p "$" * 300
		if @post
			 @image = @post.images.new(params[:image])
			 @post.update_attributes(params[:post])
			@post.save
			@image.save
				flash[:notice] = "Created successfully!"
	      redirect_to post_path(@post)
    else
      flash[:error] = "Oops something went wrong. Please try again."
      render 'new'
    end  
	end

	def destroy
		if Post.find(params[:id]).destroy
			flash[:notice] = "Deleted successfully!"
      redirect_to posts_path
    else
      flash[:error] = "Unable to delete. Please try again."
    end

	end


	def image_upload
		image = Image.create(params[:image])
		session[:images].push(image.id)
	end
end
