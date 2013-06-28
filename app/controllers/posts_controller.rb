class PostsController < ApplicationController

	before_filter :authorize, only: [:edit, :update]

	def index
		@posts = Post.order('created_at DESC')

		@forsale = Post.find_all_by_adtype 0
		@wanted = Post.find_all_by_adtype 1
		@trade = Post.find_all_by_adtype 2
	end

	def new
		@post = Post.new
		# @image = @post.images.new(params[:image])
		@categories = Category.all
		#what does this do again?
		respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
	end

	#can I put this into the model? how?
	def listing_type(id)
  	if id == 0
  		"For Sale"
  	elsif id == 1
  		"Wanted"
  	else 
  		"Trade"
  	end
  end


	def show
		@post = Post.find(params[:id])
		@user = User.find(@post.user_id)
		@category_name = Category.find(@post.category_id).name
		@adtype_name = listing_type(@post.adtype)
	end

	def create
		@post = Post.create(params[:post])
		#associate the logged in user id with the post on creation
		@post.update_attribute(:user_id, current_user.id)

		respond_to do |format|
	    format.html { redirect_to post_images_path(@post) }
	    format.xml  { render :head => :created }
	  end
	end

	def edit
		@post = Post.find(params[:id])
		@categories = Category.all
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


