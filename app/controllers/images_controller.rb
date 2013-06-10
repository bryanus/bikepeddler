class ImagesController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
		@image = @post.images.new(params[:image])

		if @image.save
			render :nothing => true
		end
	end

	def destroy
	end


end
