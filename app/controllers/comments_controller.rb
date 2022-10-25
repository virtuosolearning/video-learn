class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.save
    flash[:notice] = @comment.persisted? ? "Successfully created Comment" : @comment.errors.full_messages.to_sentence
    redirect_to lesson_path(id: params[:lesson_id])
  end

  def update
    @comment = current_user.comments.find(params[:id])
    if params[:delete_comment]
      # we don't destroy the comments as we want to maintain any child comments
      # so we set a deleted_at and display that as the body in the view
      @comment.deleted_at = DateTime.now
      @comment.save
    else
      @comment.update(comment_params)
    end
    flash[:notice] = @comment.errors.present? ? @comment.errors.full_messages.to_sentence : "Successfully #{@comment.deleted_at ? "deleted" : "updated"} Comment"
    redirect_to lesson_path(id: params[:lesson_id])
  end

  def display_form
    # this method sets the variables for the form based on whether we are
    # creating a comment(POST) (a reply) or editing a comment(PATCH)
    # rendering the form via js when required seemed like the best way to deal with
    # having to have forms updating or editing each comment
    @comment = Comment.find(params[:comment_id])
    @new_or_edit_comment = request.request_method == "POST" ? Comment.new : @comment
    @commentable_object = request.request_method == "POST" ? @comment : @comment.commentable

    #if we had additional objects to comment on eg courses we could
    # set a different comment_root_object here
    if params[:lesson_id]
      @comment_root_object = Lesson.find(params[:lesson_id])
    end
    render :partial => 'comments/display_form'
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type)
  end
end
