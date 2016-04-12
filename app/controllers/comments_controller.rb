class CommentsController < ApplicationController
  def create
  	@workout = Workout.find(params[:workout])
  	comment = @workout.comments.build(comment: params[:comment], user_id: current_user.id)
  	if comment.save
  		respond_to do |format|
	      
	      format.js { render file: "/app/views/users/workouts/comment.js.erb" }
    	end
  	else
  		respond_to do |format|
	  		flash.now[:warning] = "Comment could not be posted."
	      format.js {  render file: "/app/views/layouts/notice.js.erb" }
      end
  	end
  end

end
