class CommentsController < ApplicationController
  
  def create
    if Comment.create(user_id: current_user.id, lesson_id: params[:comment][:lesson_id], comment: params[:comment][:comment])
      redirect_to lesson_path(Lesson.find(params[:comment][:lesson_id]))
    else
      flash[:error] = "Could not create comment"
    end
  end
end
