class ImagesController < ApplicationController

	def index
		@images = Post.find(params[:post_id]).images.all
		@post = Post.find(params[:post_id])
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

    else
      render :json => { "errors" => @image.errors } 
    end
  end


  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    respond_to do |format|
      format.html { redirect_to post_images_path(post.id) }
      format.json { head :no_content }
    end
  end


end

