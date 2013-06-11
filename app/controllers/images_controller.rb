class ImagesController < ApplicationController

	def index
		@post = Post.find(params[:post_id])
		@images = @post.images
		@image = Image.new

		respond_to do |format|
			format.html { }
			format.js { render layout: false }
		end
		
	end

	def new
    @image = Image.new
    @post = Post.find(params[:post_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @image }
    end
  end

  def show
  	@post = Post.find(params[:post_id])
  	@image = @post.images.find(params[:id])

  	respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @image }
    end
  end

  def create
  	@post = Post.find(params[:post_id])
    @image = @post.images.new(params[:image])

    if @image.save
      redirect_to post_images_path(@post)
    end

  end


  def destroy
    @image = Image.find(params[:id])
    @post = Post.find(params[:post_id])
    

    if @image.destroy
      redirect_to post_images_path(@post)
    end
    
  end


end

