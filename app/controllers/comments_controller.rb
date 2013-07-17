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
	    	format.html {render :new }
	    	format.json { render :json => @comment.errors }
	    	# puts @comment.errors.full_messages
	    	# puts "*" * 50
	  	end
	  end
	end

end
