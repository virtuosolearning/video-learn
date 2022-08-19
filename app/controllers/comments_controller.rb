class CommentsController < ApplicationController
  
  def create
    if Comment.create(comment_params)
      flash[:notice] = "Comment created successfuly"
    else
      flash[:error] = "Could not create comment"
    end

    redirect_to Lesson.find(comment_params[:lesson_id])
  end

private
  def comment_params
    params.require(:comment).permit(:user_id, :lesson_id, :comment)
  end
end
