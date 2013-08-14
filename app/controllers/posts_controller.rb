#!/bin/env ruby


class PostsController < ApplicationController

	before_filter :authorize, only: [:edit, :update]

	def index
		if params[:tag]
			@posts = Post.tagged_with(params[:tag]).order('created_at DESC').paginate(:per_page => 16, :page => params[:page])
		else
			@posts = Post.text_search(params[:search]).order('created_at DESC').paginate(:per_page => 16, :page => params[:page])
		end

		@forsale = Post.find_all_by_adtype 0
		@wanted = Post.find_all_by_adtype 1
		@trade = Post.find_all_by_adtype 2

		@category_bikes = Post.find_all_by_category_id 1

		respond_to do |format|
			format.html { }
			format.js { render layout: false }
		end

	end

	def new
		@post = Post.new
		# @image = @post.images.new(params[:image])
		@categories = Category.all
		
	end

	

	def show

		@posts = Post.text_search(params[:search]).order('created_at DESC').paginate(:per_page => 15, :page => params[:page])

		@post = Post.find(params[:id])
		@user = User.find(@post.user_id)
		@comment = Comment.new
		@comments = @post.comments
		@category_name = Category.find(@post.category_id).name
		@adtype_name = listing_type(@post.adtype)

		respond_to do |format|
			format.html { }
			format.js { redirect_to 'index' }
		end
	end

	def create
		@post = Post.new(params[:post])
		@categories = Category.all
		
		respond_to do |format|
	    if @post.save
	    	#associate the logged in user id with the post on creation
	    	@post.update_attribute(:user_id, current_user.id)
	    	format.html { redirect_to post_images_path(@post) }
	    else
	    	format.html {render :new }
	    	format.json { render :json => @post.errors }
	    	# puts @post.errors.full_messages
	    	# puts "*" * 50
	  	end
	  end
	end

	def edit
		@post = Post.find(params[:id])

		if @post
			@categories = Category.all
		else
			redirect_to new_post_path
		end
	end

	def update
		@post = Post.find(params[:id])
		
		@post.update_attributes(params[:post])
		redirect_to post_images_path(@post)
	end

	def destroy
		if Post.find(params[:id]).destroy
			flash[:notice] = "Deleted successfully!"
      redirect_to user_path(current_user.id)
    else
      flash[:error] = "Unable to delete. Please try again."
    end
	end

	def sold
		@post = Post.find(params[:id])
		
		@post.update_attribute(:status, params[:status])
		redirect_to user_path(current_user)
	end

end


