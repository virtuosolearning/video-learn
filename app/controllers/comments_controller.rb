class CommentsController < ApplicationController
  
  def create
    if Comment.create(comment_params)
      redirect_to lesson_path(Lesson.find(comment_params[:lesson_id]))
    else
      flash[:error] = "Could not create comment"
    end
  end

private
  def comment_params
    params.require(:comment).permit(:user_id, :lesson_id, :comment)
  end
end
