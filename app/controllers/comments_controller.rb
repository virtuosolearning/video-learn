class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.save
    flash[:notice] = @comment.persisted? ? "Successfully created Comment" : @comment.errors.full_messages.to_sentence
    redirect_to lesson_path(id: params[:lesson_id], )
  end

  def update
    @comment = current_user.comments.find(params[:id])
    if params[:delete_comment]
      @comment.deleted_at = DateTime.now
      @comment.save
    else
      @comment.update(comment_params)
    end
    flash[:notice] = @comment.errors ? @comment.errors.full_messages.to_sentence : "Successfully #{@comment.deleted_at ? "deleted" : "updated"} Comment"
    redirect_to lesson_path(id: params[:lesson_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type)
  end
end
