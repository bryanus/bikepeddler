class CommentsController < ApplicationController

	def create
		@comment = Comment.new(params[:comment])
		@post = Post.find(params[:comment][:post_id])
		
		respond_to do |format|
	    if @comment.save
	    	#associate the logged in user id with the comment on creation
	    	@comment.update_attribute(:user_id, current_user.id)
	    	@comment.update_attribute(:post_id, @post.id)
	    	format.html { redirect_to post_path(@post) }
	    else
	    	format.html { render "/posts/show" }
	    	format.json { render :json => @comment.errors }
	    	# puts @comment.errors.full_messages
	    	# puts "*" * 50
	  	end
	  end
	end

	def edit
		puts params
		puts "*" * 50
		@comment = Comment.find(params[:id])
		# @post = Post.find(params[:comment][:post_id])
		puts @comment.id
	end

	def update
		@comment = Comment.find(params[:id])
		
		@comment.update_attributes(params[:comment])
		redirect_to post_path(@comment.post_id)
	end

	def destroy
		@comment = Comment.find(params[:id])

		if @comment.destroy
			flash[:notice] = "Deleted successfully!"
      redirect_to post_path(@comment.post_id)
    else
      flash[:error] = "Unable to delete. Please try again."
    end
	end

end
