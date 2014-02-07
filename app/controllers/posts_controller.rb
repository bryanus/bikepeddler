#!/bin/env ruby


class PostsController < ApplicationController

	before_action :authorize, only: [:edit, :update]

	# caches_page :index
	
	def index

		@post = Post.new
		@categories = Category.all
		@adtypes = Post.listing_types

		puts params

		if params[:tag]
			@posts = Post.tagged_with(params[:tag]).order('created_at DESC').paginate(:per_page => 20, :page => params[:page])
		elsif params[:search]
			@posts = Post.with_query('^' + params[:search]).order('created_at DESC').paginate(:per_page => 20, :page => params[:page])

		elsif params[:category]

			if params[:category][:id] !=""

				@posts = Post.where("category_id = ? AND adtype = ?", params[:category][:id].to_i, params[:adtype].to_i).order('created_at DESC').paginate(:per_page => 20, :page => params[:page])
				@category = Category.find(params[:category][:id])
			else params[:category][:id] ==""

				@posts = Post.where("adtype = ?", params[:adtype].to_i).order('created_at DESC').paginate(:per_page => 20, :page => params[:page])

			end

		else
			# only show For Sale (status=0) on initial page load if no params
			@posts = Post.where("status = 0").order('created_at DESC').paginate(:per_page => 20, :page => params[:page])
		end

		

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

		#@posts = Post.text_search(params[:search]).order('created_at DESC').paginate(:per_page => 16, :page => params[:page])

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
		@post = Post.new(post_params)
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
		
		@post.update(post_params)
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

	private

	def post_params
		params.permit(:description, :price, :zip, :size, :qty, :title, :images, :category_id, :adtype, :currency, :has_image, :user_id, :tag_list
  )
	end

end


